import 'package:flutter/cupertino.dart';
import 'package:investcraftpartner/config/appConfig.dart';

import '../modals/partnerFromModal.dart';
import '../services/apiServices.dart';

class PartnerFromDataProvider extends ChangeNotifier{
  List<DatumPartnerFrom> data = [];

  DatumPartnerFrom? personalDetailFromData;
  DatumPartnerFrom? basicDetail;
  DatumPartnerFrom? businessDetails;
  DatumPartnerFrom? agreement;
  DatumPartnerFrom? kycDetail;
  DatumPartnerFrom? bankDetails;
  DatumPartnerFrom? congratulation;
  DatumPartnerFrom? leadFormPersonal;
  DatumPartnerFrom? leadFormEmployement;
  DatumPartnerFrom? leadFormDocumentUpload;
  DatumPartnerFrom? homePageForm;
  DatumPartnerFrom? subForm;
  DatumPartnerFrom? viewLeadForm;
  DatumPartnerFrom? signupForm;
  DatumPartnerFrom? loginForm;

  getPartnerModual(BuildContext context){
    ApiServices().postData(partner_from,{
      "module":partner
    },context,header: true,he: "").then((response) {
      if (response!=null) {
        data.addAll(partnerFromModalFromJson(response.body).data);
        setData();
      }
    });
  }

  setData(){
    personalDetailFromData = data.firstWhere((element) => element.form == "PERSONAL_DETAIL");
    agreement = data.firstWhere((element) => element.form == "AGREEMENT");
    basicDetail = data.firstWhere((element) => element.form == "BASIC_DETAILS");
    businessDetails = data.firstWhere((element) => element.form == "BUSSINESS_DETAIL");
    kycDetail = data.firstWhere((element) => element.form == "KYC_DETAIL");
    bankDetails = data.firstWhere((element) => element.form == "BANK_DETAILS");
    congratulation = data.firstWhere((element) => element.form == "CONGRATULATION");
    leadFormPersonal = data.firstWhere((element) => element.form == "LEAD_FORM_PERSONAL");
    leadFormEmployement = data.firstWhere((element) => element.form == "LEAD_FORM_EMPLOYEMNT");
    leadFormDocumentUpload = data.firstWhere((element) => element.form == "LEAD_FORM_DOCUMENT_UPLOAD");
    homePageForm = data.firstWhere((element) => element.form == "HOMEPAGE_FORM");
    subForm = data.firstWhere((element) => element.form == "SUB_FORM");
    viewLeadForm = data.firstWhere((element) => element.form == "VIEW_LEADS_FORM");
    signupForm = data.firstWhere((element) => element.form == "SIGNUP_FORM");
    loginForm = data.firstWhere((element) => element.form == "LOGIN_FORM");
    notifyListeners();
  }


}