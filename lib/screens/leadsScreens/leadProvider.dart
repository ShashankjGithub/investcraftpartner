import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/services/apiServices.dart';
import 'package:investcraftpartner/widgets/bottomBar.dart';
import 'package:provider/provider.dart';

import '../../config/appConfig.dart';
import '../../modals/leadmodal.dart';
import '../../services/filePicker.dart';

class LeadProvider extends ChangeNotifier {
  List titles = [
    "Personal Details",
    "Employment Details",
    "Upload Loan Documents",
  ];

  bool inPersonalDetail = true;
  bool inEmployeeDetail = false;
  bool inDocumentsUpload = false;

  bool submittedPersonalDetail = true;
  bool submittedEmployeeDetail = false;
  bool submittedDocumentsUpload = false;




  bool loading = false;
  changeLoading(val){
    loading = val;
    notifyListeners();
  }

  changeEmployeeDetailSumbiterd() {
    inEmployeeDetail = true;
    submittedEmployeeDetail = true;
    submittedPersonalDetail = false;
    pageController.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }

  changeDocumentUploadSumbiterd() {
    inDocumentsUpload = true;
    submittedDocumentsUpload = true;
    submittedEmployeeDetail = false;
    pageController.animateToPage(2,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }

  PageController pageController = PageController();

  ///////////////////// Personal Detail fields///////////////////
  final personalDetailKey = GlobalKey<FormState>();
  TextEditingController nameClt = TextEditingController();
  TextEditingController lastnameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController mobileClt = TextEditingController();
  TextEditingController panCardClt = TextEditingController();
  TextEditingController dobClt = TextEditingController();
  TextEditingController motherNameClt = TextEditingController();
  String gender = "Male";

  changeGender(value) {
    gender = value;
    notifyListeners();
  }

  ///////////////////////// Employee Detail ////////////////////////
  final  employeeDetailKey = GlobalKey<FormState>();
  String employeeType = "Salaried";

  changeEmployeeType(value) {
    employeeType = value;
    notifyListeners();
  }

  String residentType = "Owned";

  changeResidentType(value) {
    residentType = value;
    notifyListeners();
  }

  var selectedState;
  var selectedCity;
  var selectedLoanType;

  changeSelectedState(value){
    selectedState = value;
    notifyListeners();
  }
  changeSelectedCity(value){
    selectedCity = value;
    notifyListeners();
  }
  changeSelectedLoanType(value){
    selectedLoanType = value;
    notifyListeners();
  }

  TextEditingController pinCodeClt = TextEditingController();
  TextEditingController requiredLoanAmountClt = TextEditingController();
  TextEditingController monthlyIncomeClt = TextEditingController();
  TextEditingController completeResidenceAddressClt = TextEditingController();
  TextEditingController completeOfficeAddressClt = TextEditingController();
  TextEditingController loanAmountClt = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyType = TextEditingController();

/////////////////////////////////////////////////////////////
  ////////////////Document Uploade //////////////
  FilePickerResult? panCardFile;
  FilePickerResult? aadhar_front_file;
  FilePickerResult? aadhar_back_file;
  FilePickerResult? current_address_proof;
  FilePickerResult? income_proof;
  FilePickerResult? business_registration_proof;
  FilePickerResult? bank_statement;

  choosePanFile()async{
    panCardFile = await pickFile();
    notifyListeners();
  }
  chooseaadharFrontFile()async{
    aadhar_front_file = await pickFile();
    notifyListeners();
  }
  chooseaadharBackFile()async{
    aadhar_back_file = await pickFile();
    notifyListeners();
  }
  chooseCurrentAddress()async{
    current_address_proof = await pickFile();
    notifyListeners();
  }
  chooseIncomeProofe()async{
    income_proof = await pickFile();
    notifyListeners();
  }
  choosebankStatement()async{
    bank_statement = await pickFile();
    notifyListeners();
  }
  choosebusinessRegistationProof()async{
    business_registration_proof = await pickFile();
    notifyListeners();
  }








  String isYourCurrentAddress = "Yes";

  changeIsYourCurrentAddressType(value) {
    isYourCurrentAddress = value;
    notifyListeners();
  }

  String bRP = "GST Certificate";

  changeBRPType(value) {
    bRP = value;
    notifyListeners();
  }

  clearTextFields() {
    nameClt.clear();
    emailClt.clear();
    mobileClt.clear();
    panCardClt.clear();
    dobClt.clear();
    motherNameClt.clear();
    pinCodeClt.clear();
    requiredLoanAmountClt.clear();
    monthlyIncomeClt.clear();
    completeResidenceAddressClt.clear();
    completeOfficeAddressClt.clear();
    selectedState = null;
    selectedCity = null;
    selectedLoanType = null;
    inPersonalDetail = true;
    inEmployeeDetail = false;
    inDocumentsUpload = false;
    submittedPersonalDetail = true;
    submittedEmployeeDetail = false;
    submittedDocumentsUpload = false;
    notifyListeners();
  }

  bool noLeadList = false;
  List<Lead> leadsList = [];

  getLead(BuildContext context) {
    noLeadList = false;
    leadsList.clear();
    final AuthProvider ap = Provider.of<AuthProvider>(context, listen: false);
    ApiServices().getData(leads_view, tocken: ap.tokenn).then((response) {
      if (response != null) {
        if (response.statusCode == 200) {
          leadsList.addAll(leadModalFromJson(response.body).leads);
          if (leadsList.isEmpty) {
            noLeadList = true;
          }
          notifyListeners();
        } else {
          noLeadList = true;
        }
      } else {
        noLeadList = true;
      }
    });
    notifyListeners();
  }
  String leadId = "";






  createLead(BuildContext context) {
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    changeLoading(true);
    ApiServices().postData(save_lead,
        {
              "first_name": nameClt.text,
              // "last_name": lastnameClt.text,
              "mobile": mobileClt.text,
              "email": emailClt.text,
              "gender": gender,
              "pan": panCardClt.text,
              "dob": dobClt.text,
              "mother_name": motherNameClt.text,
              "employment_type": employeeType,
              "company_name": companyName.text,
              "company_type": companyType.text,
              "state": selectedState.value,
              "city": selectedCity.value,
              "pincode": pinCodeClt.text,
               "monthly_income":monthlyIncomeClt.text,
              "residence_type": residentType,
              "loan_amount": requiredLoanAmountClt.text,
              "product_type": selectedLoanType.value,
              "applyfor_product": selectedLoanType.value,
              "residence_address": completeResidenceAddressClt.text,
              "office_address": completeOfficeAddressClt.text
            },
            context,
            header: true,
            he: ap.tokenn)
        .then((response) {
      if (response != null) {
        Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
        leadId = "${json.decode(response.body)["lead_id"]}";
        changeLoading(false);

        Get.offAll(()=>BottomBarScreen());
      } else {
        changeLoading(false);
      }
    });
  }

  uploadLeadDocument(BuildContext context) async {
    if(panCardFile==null){
      Fluttertoast.showToast(msg: "Please select pancard");
    }else if(aadhar_front_file==null){
      Fluttertoast.showToast(msg: "Please select aadhar front file");
    }else if(aadhar_back_file==null){
      Fluttertoast.showToast(msg: "Please select aadhar back file");
    }else if(current_address_proof==null){
      Fluttertoast.showToast(msg: "Please select current address file");
    }else if(income_proof==null){
      Fluttertoast.showToast(msg: "Please select income proof");
    }else if(business_registration_proof==null){
      Fluttertoast.showToast(msg: "Please select business registration proof proof");
    }

    else{
      final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
      try {
        changeLoading(true);
        var request = http.MultipartRequest(
            'POST', Uri.parse(baseUrl + save_lead_docs)); // your server url
        request.headers.addAll({
          "Authorization": "Bearer "+ap.tokenn.toString(),
        });
        request.fields.addAll({"lead_id": leadId.toString()});

          request.files.add(await http.MultipartFile.fromPath(
              'pan_file', panCardFile!.paths[0]!));


          request.files.add(await http.MultipartFile.fromPath(
              'aadhar_front_file', aadhar_front_file!.paths[0]!));


          request.files.add(await http.MultipartFile.fromPath(
              'aadhar_back_file', aadhar_back_file!.paths[0]!));

          request.files.add(await http.MultipartFile.fromPath(
              'current_address_proof', current_address_proof!.paths[0]!));


          request.files.add(await http.MultipartFile.fromPath(
              'income_proof', income_proof!.paths[0]!));


          request.files.add(await http.MultipartFile.fromPath(
              'bank_statement', bank_statement!.paths[0]!));

        request.files.add(await http.MultipartFile.fromPath(
            'business_registration_proof', business_registration_proof!.paths[0]!));


        http.StreamedResponse response = await request.send();
        print(response.statusCode);
        final res = await http.Response.fromStream(response);
        print(res.body);
        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: json.decode(res.body)["message"]);
          changeLoading(false);
          Get.offAll(()=>BottomBarScreen());
          return "${json.decode(res.body)["Message"]}";
        } else {
          changeLoading(false);
          Fluttertoast.showToast(msg: json.decode(res.body)["message"]);
        }
      } catch (e) {
        changeLoading(false);
        print("error in partnerOnBoardFile  uploade kyc ${e.toString()}");
      }
    }





  }
}
