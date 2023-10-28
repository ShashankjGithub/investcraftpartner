import 'package:flutter/cupertino.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/services/apiServices.dart';
import 'package:provider/provider.dart';

import '../../config/appConfig.dart';
import '../../modals/leadmodal.dart';

class LeadProvider extends ChangeNotifier{
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


  changeEmployeeDetailSumbiterd(){
    inEmployeeDetail = true;
    submittedEmployeeDetail = true;
    submittedPersonalDetail = false;
    pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }
  changeDocumentUploadSumbiterd(){
    inDocumentsUpload = true;
    submittedDocumentsUpload= true;
    submittedEmployeeDetail = false;
    pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }

  PageController pageController = PageController();

  ///////////////////// Personal Detail fields///////////////////

  TextEditingController nameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController mobileClt = TextEditingController();
  TextEditingController panCardClt = TextEditingController();
  TextEditingController dobClt = TextEditingController();
  TextEditingController motherNameClt = TextEditingController();
  String gender = "Male";

  changeGender(value){
    gender = value;
    notifyListeners();
  }

  ///////////////////////// Employee Detail ////////////////////////

  String employeeType = "Salaried";

  changeEmployeeType(value){
    employeeType = value;
    notifyListeners();
  }
  String residentType = "Owned";

  changeResidentType(value){
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

  String isYourCurrentAddress = "Yes";

  changeIsYourCurrentAddressType(value){
    isYourCurrentAddress = value;
    notifyListeners();
  }

  String bRP = "GST Certificate";

  changeBRPType(value){
    bRP = value;
    notifyListeners();
  }

  clearTextFields(){
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
  getLead(BuildContext context){
    noLeadList = false;
    leadsList.clear();
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    ApiServices().getData(leads_view,tocken: ap.tokenn).then((response) {
      if (response!=null) {
        if (response.statusCode == 200) {
          leadsList.addAll(leadModalFromJson(response.body).leads);
          if(leadsList.isEmpty){
            noLeadList = true;
          }
        }else{
          noLeadList = true;
        }
      }else{
        noLeadList = true;
      }
    });
    notifyListeners();
  }

  createLead(BuildContext co){}


}