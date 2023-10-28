

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as  http;
import '../../../config/appConfig.dart';
import '../../../services/apiServices.dart';

class PartnerOnBoardingProvider extends ChangeNotifier{
  int persent = 10;
  var w =10;
  dynamic currentStep = 1;
  String currentForm = "Basic Details";
  PageController pageController = PageController();

  changeForm({required int currentstep, required int perse, required String formName}){
    currentStep = currentstep;
    persent = perse;
    currentForm = formName;
    w = (persent==10?10:persent==20?6:persent==30?4:persent==40?2.5:persent==50?2:persent==60?1.7:persent==70?1.5:persent==80?1.3:persent==90?1.1:1).toInt();
    pageController.animateToPage(currentstep-1, duration: Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }

  nextButtonPressed(){
    switch(currentStep){
      case 1:
        changeForm(currentstep: 2, perse: 20, formName: "Personal Detail");
        break;
      case 2:
        changeForm(currentstep: 3, perse: 30, formName: "Business Detail");
        break;
      case 3:
        changeForm(currentstep: 4, perse: 40, formName: "Bank Account Detail");
        break;
      case 4:
        changeForm(currentstep: 5, perse: 50, formName: "KYC Detail");
        break;
      case 5:
        changeForm(currentstep: 6, perse: 60, formName: "Agreement");
        break;
      case 6:
        changeForm(currentstep: 7, perse: 70, formName: "Congratulation");
        break;
      default:
        changeForm(currentstep: 1, perse: 10, formName: "Basic Detail");
    }
  }
  previousButtonPressed(){
    switch(currentStep){
      case 3:
        changeForm(currentstep: 2, perse: 20, formName: "Personal Detail");
      case 4:
        changeForm(currentstep: 3, perse: 30, formName: "Business Detail");
        break;
      case 5:
        changeForm(currentstep: 4, perse: 40, formName: "Bank Account Detail");
        break;
      case 6:
        changeForm(currentstep: 5, perse: 50, formName: "KYC Detail");
        break;
      case 7:
        changeForm(currentstep: 6, perse: 60, formName: "Agreement");
        break;
        default:
        changeForm(currentstep: 1, perse: 10, formName: "Basic Detail");
    }
  }


  //////////////////////// Basic Detail ///////////////////////////////////////////////////////
  TextEditingController nameClt = TextEditingController();
  TextEditingController emailIDClt = TextEditingController();
  TextEditingController phoneNumberClt = TextEditingController();
  TextEditingController businessTypeClt = TextEditingController();
  ////////////////////// Personal Detail ////////////////////////////////////////////////////
  TextEditingController panCardNumberClt = TextEditingController();
  TextEditingController aadhaarCardNumberClt = TextEditingController();
  TextEditingController dobClt = TextEditingController();
  TextEditingController permanentHomeAddressClt = TextEditingController();
  TextEditingController presentAddressClt = TextEditingController();
  TextEditingController pinCodeClt = TextEditingController();
  String gender = "Male";
  bool pasaca = false;
  changeGender(value){
    gender = value;
    notifyListeners();
  }

  changePASACA(){
    pasaca = !pasaca;
    notifyListeners();
  }
  var selectedState;
  var selectedCity;
  var selectedQualificaion;



  /////////////////////////////////////// Business Detail //////////////////////
  TextEditingController businessNameClt = TextEditingController();
  TextEditingController businessEmailClt = TextEditingController();
  TextEditingController businessWebsiteUrlClt = TextEditingController();
  TextEditingController businessPhoneNumberClt = TextEditingController();
  TextEditingController businessAddressClt = TextEditingController();
  TextEditingController businessPinCodeClt = TextEditingController();
  TextEditingController businessGstNoClt = TextEditingController();

  var selectedBusinessType;
  var selectedBusinessStateType;
  var selectedBusinessCityType;

  String selectedGSTAvailable = "Yes";
  changeSelectedGSTAvailable(value){
    selectedGSTAvailable = value;
    notifyListeners();
  }

  String selectedMonthlyBusiness = "0-5 Lakhs";
  changeSelectedMB(value){
    selectedMonthlyBusiness = value;
    notifyListeners();
  }


  String selectedAreaCovered = "PAN India";
  changeAreaCovered(value){
    selectedAreaCovered = value;
    notifyListeners();
  }

  String selectedexperienceInBusiness = "0-6 Months";
  changeExperienceInBusiness(value){
    selectedexperienceInBusiness = value;
    notifyListeners();
  }
///////////////////////////////////////////////////////////////////////////
////////////////////// Bank Account Details //////////////////////////////

  TextEditingController bankAccountNumberClt = TextEditingController();
  TextEditingController bankIFSCClt  = TextEditingController();
  var selectedBankName;
  List bankList = [];

  ///////////////////////////////////////////////////////////////////////
////////////////////////// KYC Details/////////////////////////
  FilePickerResult? panCardFile;
  FilePickerResult? aadhaarCardFile;
  FilePickerResult? passportCardFile;
  FilePickerResult? businessCardFile;
  ////////////////////////////////////////

  savePersonalDetail(BuildContext context){
    ApiServices().postData(save_personal_details,{
      "pan":panCardNumberClt.text,
      "aadhar":aadhaarCardNumberClt.text,
      "gender":gender,
      "dob":dobClt.text,
      "permanent_address":permanentHomeAddressClt.value,
      "present_address":presentAddressClt.text,
      "state":selectedState.value,
      "city":selectedCity.value,
      "pin":pinCodeClt.text,
      "education":selectedQualificaion.value,
    },context,he: "").then((response) {
      if (response!=null) {
        Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");

      }else{

      }
    });
  }
  saveBusinessDetail(BuildContext context){
    ApiServices().postData(save_bussiness_detail,{
      "type":selectedBusinessType.value,
      "name":businessNameClt.text,
      "email":businessEmailClt.text,
      "website":businessWebsiteUrlClt.text,
      "phone":businessPhoneNumberClt.value,
      "gst_available":selectedGSTAvailable,
      "gst_number":businessGstNoClt.text,
      "monthly_business":selectedMonthlyBusiness,
      "business_area":selectedAreaCovered,
      "experience":selectedexperienceInBusiness,
      "address":businessAddressClt.text,
      "state" :selectedBusinessStateType.value,
      "city":selectedBusinessCityType.value,
      "pin":businessPinCodeClt.value,
    },context,he: "").then((response) {
      if (response!=null) {
        Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");

      }else{

      }
    });
  }

  saveBankDetail(BuildContext context){
    ApiServices().postData(save_bank_detail,{
      "account_number":bankAccountNumberClt.text,
      "ifsc_code":bankIFSCClt.text,
      "bank_name":selectedBankName.value,
    },context,he: "").then((response) {
      if (response!=null) {
        Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");

      }else{

      }
    });
  }


  Future saveKycDetails(BuildContext context,id)async{

    try {

      var request = http.MultipartRequest(
          'POST',
          Uri.parse(baseUrl+save_kyc_detail)); // your server url
      request.headers.addAll({
        //"Authorization": "Bearer "+up.userData.token,

      });

      if(panCardFile!=null){
        request.files
            .add(await http.MultipartFile.fromPath('pan_file', panCardFile!.paths[0]!));
      }else{
        request.files
            .add(await http.MultipartFile.fromString('pan_file', ""));
      }
      if(aadhaarCardFile!=null){
        request.files
            .add(await http.MultipartFile.fromPath('aadhar_file', aadhaarCardFile!.paths[0]!));
      }else{
        request.files
            .add(await http.MultipartFile.fromString('aadhar_file', ""));
      }
      if(passportCardFile!=null){
        request.files
            .add(await http.MultipartFile.fromPath('photo_file', passportCardFile!.paths[0]!));
      }else{
        request.files
            .add(await http.MultipartFile.fromString('photo_file', ""));
      }
      if(businessCardFile!=null){
        request.files
            .add(await http.MultipartFile.fromPath('business_file', businessCardFile!.paths[0]!));
      }else{
        request.files
            .add(await http.MultipartFile.fromString('business_file', ""));
      }



      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      final res = await http.Response.fromStream(response);
      print(res.body);
      if (response.statusCode == 200) {

        Fluttertoast.showToast(msg: json.decode(res.body)["message"]);
        return "${json.decode(res.body)["Message"]}";
      }else{
        Fluttertoast.showToast(msg: json.decode(res.body)["message"]);

      }
    } catch (e) {

      print("error in partnerOnBoardFile  uploade kyc ${e.toString()}");
    }

  }

}