import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:investcraftpartner/config/appConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/apiServices.dart';

class AuthProvider extends ChangeNotifier{

  AuthProvider(){
    getUserData();
  }


  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();



  String? tokenn;
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
    changeLoading(true);
    ApiServices().postData(login,{
      "email":emailClt.text,
      "password":passwordClt.text,
    },context,he: "").then((response) {
      if (response!=null) {
        saveUserData(json.decode(response.body)["token"]);
        changeLoading(false);
      }else{
        changeLoading(false);
      }
    });
  }
  register(BuildContext context){
    changeLoading(true);
    ApiServices().postData(login,{
      "name":nameClt.text,
      "email":emailIdClt.text,
      "mobile":phoneNumberClt.text,
      "business_type":"partner",
      "password":passwordClt.text,
    },context,he: "").then((response) {
      if (response!=null) {
        saveUserData(json.decode(response.body)["token"]);
        changeLoading(false);
      }else{
        changeLoading(false);
      }
    });
  }


  saveUserData(token)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    tokenn = token;
    await sp.setString("token", token);
    await sp.setBool("isLogin", true);
    notifyListeners();
  }

  getUserData()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    tokenn = sp.getString("token");
    alreadyLogin = sp.getBool("isLogin")??false;
    notifyListeners();
  }


}