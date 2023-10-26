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
  DatumPartnerFrom? leadForm1;

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
    basicDetail = data.firstWhere((element) => element.form == "BASIC_DETAILS");
    businessDetails = data.firstWhere((element) => element.form == "BUSSINESS_DETAIL");
    kycDetail = data.firstWhere((element) => element.form == "KYC_DETAIL");
    bankDetails = data.firstWhere((element) => element.form == "BANK_DETAILS");
    congratulation = data.firstWhere((element) => element.form == "CONGRATULATION");
    leadForm1 = data.firstWhere((element) => element.form == "LEAD_FORM");
  }


}