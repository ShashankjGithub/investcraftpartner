

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as  http;
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/services/downloadeScrvice.dart';
import 'package:investcraftpartner/services/filePicker.dart';
import 'package:provider/provider.dart';
import '../../../config/appConfig.dart';
import '../../../services/apiServices.dart';
import '../../../widgets/pdfViewScreen.dart';

class PartnerOnBoardingProvider extends ChangeNotifier{


  PartnerOnBoardingProvider(){
    pageController = PageController();
  }



  int persent = 10;
  var w =10;
  dynamic currentStep = 1;
  String currentForm = "Basic Details";
  PageController pageController = PageController();

  bool loading = false;
  changeLoading(val){
    loading = val;
    notifyListeners();
  }

  changeForm({required int currentstep, required int perse, required String formName}){
    currentStep = currentstep;
    persent = perse;
    currentForm = formName;
    w = (persent==10?10:persent==20?6:persent==30?4:persent==40?2.5:persent==50?2:persent==60?1.7:persent==70?1.5:persent==80?1.3:persent==90?1.1:1).toInt();
    pageController.animateToPage(currentstep-1, duration: Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }
  String status = "";
  changeStatus(value){
    status = value;
    nextButtonPressed();
    notifyListeners();
  }
  nextButtonPressed(){
    switch(status){
      case PERSONAL:
        changeForm(currentstep: 2, perse: 20, formName: "Personal Detail");
        break;
      case BUSINESS:
        changeForm(currentstep: 3, perse: 30, formName: "Business Detail");
        break;
      case BANK:
        changeForm(currentstep: 4, perse: 40, formName: "Bank Account Detail");
        break;
      case KYC_DOC:
        changeForm(currentstep: 5, perse: 50, formName: "KYC Detail");
        break;
      case AGREEMENT_SEND:
        changeForm(currentstep: 6, perse: 60, formName: "Agreement");
        break;
      case Go_Final_Page_Agreement:
        changeForm(currentstep: 7, perse: 70, formName: "Agreement");
        break;
      default:
        changeForm(currentstep: 1, perse: 10, formName: "Basic Detail");
    }
  }
  previousButtonPressed(){
    switch(status){
      case PERSONAL:
        changeForm(currentstep: 2, perse: 20, formName: "Personal Detail");
      case BUSINESS:
        changeForm(currentstep: 3, perse: 30, formName: "Business Detail");
        break;
      case BANK:
        changeForm(currentstep: 4, perse: 40, formName: "Bank Account Detail");
        break;
      case KYC_DOC:
        changeForm(currentstep: 5, perse: 50, formName: "KYC Detail");
        break;
      case AGREEMENT_SEND:
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
  final personalDetailKey = GlobalKey<FormState>();
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
    if(pasaca==true){
      presentAddressClt.text = permanentHomeAddressClt.text;
    }else{
      presentAddressClt.clear();
    }
    notifyListeners();
  }
  var selectedState;
  var selectedCity;
  var selectedQualificaion;

  changeSelectState(value){
    selectedState = value;
    notifyListeners();
  }
  changeSelectCity(value){
    selectedCity = value;
    notifyListeners();
  }
  changeSelectQulification(value){
    selectedQualificaion = value;
    notifyListeners();
  }



  /////////////////////////////////////// Business Detail //////////////////////
  final businessDetailKey = GlobalKey<FormState>();
  TextEditingController businessNameClt = TextEditingController();
  TextEditingController businessEmailClt = TextEditingController();
  TextEditingController businessWebsiteUrlClt = TextEditingController();
  TextEditingController businessPhoneNumberClt = TextEditingController();
  TextEditingController businessAddressClt = TextEditingController();
  TextEditingController businessPinCodeClt = TextEditingController();
  TextEditingController businessGstNoClt = TextEditingController();

  var selecteBasicdBusinessType;
  var selectedBusinessType;
  var selectedBusinessStateType;
  var selectedBusinessCityType;
  changeBAnsiBusinessType(value){
    selecteBasicdBusinessType = value;
    notifyListeners();
  }
  changeBusinessType(value){
    selectedBusinessType = value;
    notifyListeners();
  }
  changeBusinessState(value){
    selectedBusinessStateType = value;
    notifyListeners();
  }
  changeBusinessCity(value){
    selectedBusinessCityType = value;
    notifyListeners();
  }



  String selectedGSTAvailable = "Yes";
  changeSelectedGSTAvailable(value){
    selectedGSTAvailable = value;
    notifyListeners();
  }

  String selectedMonthlyBusiness = "";
  changeSelectedMB(value){
    selectedMonthlyBusiness = value;
    notifyListeners();
  }


  String selectedAreaCovered = "";
  changeAreaCovered(value){
    selectedAreaCovered = value;
    notifyListeners();
  }

  String selectedexperienceInBusiness = "";
  changeExperienceInBusiness(value){
    selectedexperienceInBusiness = value;
    notifyListeners();
  }
///////////////////////////////////////////////////////////////////////////
////////////////////// Bank Account Details //////////////////////////////
  final bankDetailKey = GlobalKey<FormState>();
  TextEditingController bankAccountNumberClt = TextEditingController();
  TextEditingController bankIFSCClt  = TextEditingController();
  var selectedBankName;
  List bankList = [];
  changeSelectBank(value){
    selectedBankName = value;
    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////////////
////////////////////////// KYC Details/////////////////////////
  FilePickerResult? panCardFile;
  FilePickerResult? aadhaarCardFile;
  FilePickerResult? passportCardFile;
  FilePickerResult? businessCardFile;

  choosePanFile()async{
    panCardFile = await pickFile();
    notifyListeners();
  }
  chooseaadharFile()async{
    aadhaarCardFile = await pickFile();
    notifyListeners();
  }
  choosepassportFile()async{
    passportCardFile = await pickFile();
    notifyListeners();
  }
  chooseBusinessFile()async{
    businessCardFile = await pickFile();
    notifyListeners();
  }






  ////////////////////////////////////////
  final basicDetailKey = GlobalKey<FormState>();
  saveBasicDetail(BuildContext context){
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    changeLoading(true);
    ApiServices().postData(save_basic_details,{
      "name":nameClt.text,
      "business_type":selecteBasicdBusinessType.value??"",
    },context,he: ap.tokenn,header: true).then((response) {
      if (response!=null) {
        Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
        changeLoading(false);
        changeStatus("${json.decode(response.body)["next"]}");
      }else{
        changeLoading(false);
      }
    });
  }
  savePersonalDetail(BuildContext context){
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    if(personalDetailKey.currentState!.validate()){
      changeLoading(true);
      ApiServices().postData(save_personal_details,{
        "pan":panCardNumberClt.text,
        "aadhar":aadhaarCardNumberClt.text,
        "gender":gender,
        "dob":dobClt.text,
        "permanent_address":permanentHomeAddressClt.text,
        "present_address":presentAddressClt.text,
        "state":selectedState.value,
        "city":selectedCity.value,
        "pin":pinCodeClt.text,
        "education":selectedQualificaion.value,
      },context,he: ap.tokenn,header: true).then((response) {
        if (response!=null) {
          Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
          changeLoading(false);
          changeStatus("${json.decode(response.body)["next"]}");
        }else{
          changeLoading(false);
        }
      });
    }
  }
  saveBusinessDetail(BuildContext context){
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    if(businessDetailKey.currentState!.validate()){
      if(selectedMonthlyBusiness==""){
        Fluttertoast.showToast(msg: "Please select Monthly Business");
      }else if (selectedAreaCovered=="") {
        Fluttertoast.showToast(msg: "Please select area coverd");
      }  else if (selectedexperienceInBusiness == "") {
        Fluttertoast.showToast(msg: "Please select experience in business");
      }  else{
        changeLoading(true);
        ApiServices().postData(save_bussiness_detail,{
          "type":selectedBusinessType.value,
          "name":businessNameClt.text,
          "email":businessEmailClt.text,
          "website":businessWebsiteUrlClt.text,
          "phone":businessPhoneNumberClt.text,
          "gst_available":selectedGSTAvailable,
          "gst_number":businessGstNoClt.text,
          "monthly_business":selectedMonthlyBusiness,
          "business_area":selectedAreaCovered,
          "experience":selectedexperienceInBusiness,
          "address":businessAddressClt.text,
          "state" :selectedBusinessStateType.value,
          "city":selectedBusinessCityType.value,
          "pin":businessPinCodeClt.text,
        },context,he: ap.tokenn,header: true).then((response) {
          if (response!=null) {
            Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
            changeStatus("${json.decode(response.body)["next"]}");
            changeLoading(false);
          }else{
            changeLoading(false);
          }
        });
      }

    }
  }

  saveBankDetail(BuildContext context){
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    if(bankDetailKey.currentState!.validate()){
      changeLoading(true);
      ApiServices().postData(save_bank_detail,{
        "account_number":bankAccountNumberClt.text,
        "ifsc_code":bankIFSCClt.text,
        "bank_name":selectedBankName.value,
      },context,he: ap.tokenn,header: true).then((response) {
        if (response!=null) {
          Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
          changeStatus("${json.decode(response.body)["next"]}");
          changeLoading(false);
        }else{
          changeLoading(false);
        }
      });
    }
  }


  Future saveKycDetails(BuildContext context)async{
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    try {
      changeLoading(true);
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(baseUrl+save_kyc_detail)); // your server url
      request.headers.addAll({
        "Authorization": "Bearer "+ap.tokenn!
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
        changeLoading(false);
        changeStatus("${json.decode(res.body)["next"]}");
      }else{
        Fluttertoast.showToast(msg: json.decode(res.body)["message"]);
        changeLoading(false);

      }
    } catch (e) {
      changeLoading(false);
      print("error in partnerOnBoardFile  uploade kyc ${e.toString()}");
    }

  }


  saveAgreement(BuildContext context){
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    changeLoading(true);
    ApiServices().postData(save_aggreement,{},context,he: ap.tokenn,header: true).then((response) {
      if (response!=null) {
        Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
        changeLoading(false);
        changeStatus("${json.decode(response.body)["next"]}");
      }else{
        changeLoading(false);
      }
    });
  }
  downloadeAggreement(BuildContext context){
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    final DownloadeProvider dp = Provider.of<DownloadeProvider>(context,listen: false);
    changeLoading(true);
    ApiServices().getData(aggreement_link,tocken: ap.tokenn).then((response) {
      if (response!=null) {
        Fluttertoast.showToast(msg: "${json.decode(response.body)["status"]}");
        Get.to(()=>PdfViewScreen(url: "${json.decode(response.body)["url"]}",));
        changeLoading(false);
      }else{
        changeLoading(false);
      }
    });
  }
}