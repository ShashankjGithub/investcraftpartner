import 'package:flutter/cupertino.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/services/apiServices.dart';
import 'package:provider/provider.dart';

import '../config/appConfig.dart';
import '../modals/leadDataModal.dart';

class LeadDataProvider extends ChangeNotifier{
  LeadDataModal? leadData;


  getLeadData(BuildContext context){
    final AuthProvider ap = Provider.of(context,listen: false);
    if (leadData!=null) {
      leadData = null;
    }
    ApiServices().getData(get_lead_data,tocken: ap.tokenn).then((response) {
      if(response!=null){
        leadData = leadDataModalFromJson(response.body);
        notifyListeners();
      }
    });
    notifyListeners();
  }
}