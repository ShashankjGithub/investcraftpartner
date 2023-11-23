import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/config/appConfig.dart';
import 'package:investcraftpartner/screens/authScreens/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/apiServices.dart';
import '../../widgets/bottomBar.dart';
import '../partnerOnBoardingScreen/basicDetailOnboardingScreen.dart';
import '../partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';

class AuthProvider extends ChangeNotifier{

  AuthProvider(){
    getUserData();
  }


  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();



  String? tokenn;
  String? status;
  var alreadyLogin = false;

  bool loading = false;
  changeLoading(value){
    loading = value;
    notifyListeners();
  }

  TextEditingController nameClt = TextEditingController();
  TextEditingController emailIdClt = TextEditingController();
  TextEditingController phoneNumberClt = TextEditingController();
  TextEditingController passwordSignClt = TextEditingController();
  TextEditingController confirmPasswordClt = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  final loginKey = GlobalKey<FormState>();

  List businessType = [
    "Individual",
    "Partnership",
    "Sole Proprietorship",
    "Private Limited Company"
  ];

  var selectedBusinessType;
  changeSelectedBusinessType(val){
    selectedBusinessType = val;
    notifyListeners();
  }



  logine(BuildContext context){
    if(loginKey.currentState!.validate()){
      changeLoading(true);
      ApiServices().postData(login,{
        "email":emailClt.text,
        "password":passwordClt.text,
      },context,he: "").then((response) {
        if (response!=null) {
          if (json.decode(response.body)["token"]!=null) {
              saveUserData(json.decode(response.body)["token"],json.decode(response.body)["message"]);
              changeLoading(false);
          }  else{
            Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
            changeLoading(false);
          }
        }else{
          changeLoading(false);
        }
      });
    }
  }

  
  checkStatus()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    changeLoading(true);
      ApiServices().getData(check_status,tocken: tokenn).then((response) {
        if (response!=null) {
          if (json.decode(response.body)["status"]=="success") {
            status = json.decode(response.body)["next"];
            sp.setString("status", json.decode(response.body)["next"]);
            notifyListeners();

            if(status==HOME_PAGE){
              Get.offAll(BottomBarScreen());
            }else{
              Get.offAll(PartnerOnboardingScreen(status: status!,));
            }

            changeLoading(false);
          }  else{
            Fluttertoast.showToast(msg: "${json.decode(response.body)["status"]}");
            changeLoading(false);
          }
        }else{
          changeLoading(false);
        }
      });

  }



  register(BuildContext context){
    if(signUpKey.currentState!.validate()){
      changeLoading(true);
      ApiServices().postData(sign_up,{
        "name":nameClt.text,
        "email":emailIdClt.text,
        "mobile":phoneNumberClt.text,
        "business_type":selectedBusinessType.value,
        "password":passwordSignClt.text,
      },context,he: "").then((response) {
        if (response!=null) {
          Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
          changeLoading(false);
          clearSignupTextField();
          Get.back();
        }else{
          changeLoading(false);
        }
      });
    }
  }


  logoutUser()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    changeLoading(true);
    ApiServices().getData(logoutApi,tocken: tokenn).then((response) {
      if (response!=null) {
        if (json.decode(response.body)["status"]=="success") {

        }  else{
          Fluttertoast.showToast(msg: "${json.decode(response.body)["status"]}");
          changeLoading(false);
        }
      }else{
        changeLoading(false);
      }
    });

  }


  saveUserData(token,next)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    tokenn = token;
    await sp.setString("token", token);
    await sp.setBool("isLogin", true);
    if(next=="go to onboard"){
      checkStatus();
    }else{
      Get.offAll(()=>BottomBarScreen());
    }


    notifyListeners();
  }

  getUserData()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    tokenn = sp.getString("token");
    status = sp.getString("status");
    alreadyLogin = sp.getBool("isLogin")??false;
    notifyListeners();
  }


  deleteUserData(BuildContext context)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    ApiServices().postData(logoutApi, "", context,header: true,he: tokenn).then((value) async{
      sp.clear();
      tokenn = null;
      alreadyLogin = false;
      Get.offAll(()=>LoginScreen());
    });
    notifyListeners();
  }

  clearSignupTextField(){
     nameClt.clear();
     emailIdClt.clear();
     phoneNumberClt.clear();
     passwordSignClt.clear();
     confirmPasswordClt.clear();
     notifyListeners();
  }





}