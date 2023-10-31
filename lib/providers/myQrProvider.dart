import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../config/appConfig.dart';
import '../modals/myQrCodeModal.dart';
import '../screens/authScreens/authProvider.dart';
import '../services/apiServices.dart';

class MyQrProvider extends ChangeNotifier{
  UserDataQr? qrData;
  getQrData(BuildContext context){
    final AuthProvider ap = Provider.of(context,listen: false);
    if (qrData!=null) {
      qrData=null;
    }
    ApiServices().getData(myqr,tocken: ap.tokenn).then((response) {
      if(response!=null){
        qrData = myQrCodeModalFromJson(response.body).userData;
        notifyListeners();
      }
    });
    notifyListeners();
  }
}