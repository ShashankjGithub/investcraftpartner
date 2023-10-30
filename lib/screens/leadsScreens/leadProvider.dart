import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/services/apiServices.dart';
import 'package:provider/provider.dart';

import '../../config/appConfig.dart';
import '../../modals/leadmodal.dart';

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

  TextEditingController pinCodeClt = TextEditingController();
  TextEditingController requiredLoanAmountClt = TextEditingController();
  TextEditingController monthlyIncomeClt = TextEditingController();
  TextEditingController completeResidenceAddressClt = TextEditingController();
  TextEditingController completeOfficeAddressClt = TextEditingController();

/////////////////////////////////////////////////////////////
  ////////////////Document Uploade //////////////
  FilePickerResult? panCardFile;
  FilePickerResult? aadhar_front_file;
  FilePickerResult? aadhar_back_file;
  FilePickerResult? current_address_proof;
  FilePickerResult? income_proof;
  FilePickerResult? bank_statement;

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

  createLead(BuildContext context) {
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    ApiServices().postData(save_lead,
        {
              "first_name": nameClt.text,
              "last_name": lastnameClt.text,
              "mobile": mobileClt.text,
              "email": emailClt.text,
              "gender": gender,
              "pan": panCardClt.text,
              "dob": dobClt.text,
              "mother_name": motherNameClt.text,
              "employment_type": employeeType,
              "company_name": "",
              "company_type": "",
              "state": selectedState.value,
              "city": selectedCity.value,
              "pincode": pinCodeClt.text,
              "residence_type": residentType,
              "loan_amount": "",
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

      } else {}
    });
  }

  uploadLeadDocument(BuildContext context, leadId) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(baseUrl + save_lead_docs)); // your server url
      request.headers.addAll({
        //"Authorization": "Bearer "+up.userData.token,
      });
      request.fields.addAll({"lead_id": leadId.toString()});
      if (panCardFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'pan_file', panCardFile!.paths[0]!));
      } else {
        request.files.add(await http.MultipartFile.fromString('pan_file', ""));
      }
      if (aadhar_front_file != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'aadhar_front_file', aadhar_front_file!.paths[0]!));
      } else {
        request.files
            .add(await http.MultipartFile.fromString('aadhar_front_file', ""));
      }
      if (aadhar_back_file != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'aadhar_back_file', aadhar_back_file!.paths[0]!));
      } else {
        request.files
            .add(await http.MultipartFile.fromString('aadhar_back_file', ""));
      }
      if (current_address_proof != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'current_address_proof', current_address_proof!.paths[0]!));
      } else {
        request.files.add(
            await http.MultipartFile.fromString('current_address_proof', ""));
      }
      if (income_proof != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'income_proof', income_proof!.paths[0]!));
      } else {
        request.files
            .add(await http.MultipartFile.fromString('income_proof', ""));
      }
      if (bank_statement != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'bank_statement', bank_statement!.paths[0]!));
      } else {
        request.files
            .add(await http.MultipartFile.fromString('bank_statement', ""));
      }

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      final res = await http.Response.fromStream(response);
      print(res.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: json.decode(res.body)["message"]);
        return "${json.decode(res.body)["Message"]}";
      } else {
        Fluttertoast.showToast(msg: json.decode(res.body)["message"]);
      }
    } catch (e) {
      print("error in partnerOnBoardFile  uploade kyc ${e.toString()}");
    }
  }
}
