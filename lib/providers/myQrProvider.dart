import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../config/appConfig.dart';
import '../modals/myQrCodeModal.dart';
import '../screens/authScreens/authProvider.dart';
import '../services/apiServices.dart';
import '../services/qrtoimageProvider.dart';

class MyQrProvider extends ChangeNotifier{
  MyQrCodeModal? qrData;
  bool loading = false;

  String qrpdf = "";
  String qr_image_path = "";

  changeLoading(val){
    loading = val;
    notifyListeners();
  }
  getQrData(BuildContext context){
    final AuthProvider ap = Provider.of(context,listen: false);
    if (qrData!=null) {
      qrData=null;
    }
    changeLoading(true);
    ApiServices().getData(myqr,tocken: ap.tokenn).then((response) {
      if(response!=null){
        qrData = myQrCodeModalFromJson(response.body);
        changeLoading(false);
      }else{
        changeLoading(false);
      }
    });
    notifyListeners();
  }
  getQr(BuildContext context){
    final AuthProvider ap = Provider.of(context,listen: false);
    final QrToImageProvider qp = Provider.of<QrToImageProvider>(context,listen: false);
    qrpdf = "";
    changeLoading(true);
    ApiServices().postData(verify_partners,{
      "partner_id":qrData!.parterId.toString(),
      "comment":qrData!.userData.name,
      "approve":"1",
    },context,header: true,he: ap.tokenn).then((response) {
      if(response!=null){
        qrpdf = json.decode(response.body)["qr_pdf"];
        qr_image_path = json.decode(response.body)["qr_image_path"];
        qp.splitPDF(qrpdf);
        changeLoading(false);
      }else{
        changeLoading(false);
      }
    });
    notifyListeners();
  }
}