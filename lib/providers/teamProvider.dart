import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:provider/provider.dart';

import '../config/appConfig.dart';
import '../modals/teamMemberListModal.dart';
import '../services/apiServices.dart';

class TeamProvider extends ChangeNotifier{
  List<DatumTeam> dataTeam =[];
  bool noTeamMember = false;
  bool loading = false;
  changeLoading(value){
    loading = value;
    notifyListeners();
  }

  TextEditingController nameteamClt = TextEditingController();
  TextEditingController emailIDClt = TextEditingController();
  TextEditingController phoneNumberClt = TextEditingController();
  TextEditingController businessTypeClt = TextEditingController();

  getTeamMembers(BuildContext context){
    dataTeam.clear();
    noTeamMember = false;
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    ApiServices().getData(team_member_list,tocken: ap.tokenn).then((response) {
        if (response!=null&&response.statusCode==200) {
           dataTeam.addAll(teamMemberListModalFromJson(response.body).data);
            if (dataTeam.isEmpty) {
              noTeamMember = true;
            }
         notifyListeners();
        }else{
          noTeamMember = true;
        }
      });
  notifyListeners();
  }
  final teamCreateKey = GlobalKey<FormState>();

  saveBasicDetail(BuildContext context){
    final AuthProvider ap = Provider.of<AuthProvider>(context,listen: false);
    if(teamCreateKey.currentState!.validate()){
      changeLoading(true);
      ApiServices().postData(save_team_member,{
        "name":nameteamClt.text,
        "email":emailIDClt.text,
        "mobile":phoneNumberClt.text,
        "business_type":businessTypeClt.text,
      },context,he: ap.tokenn,header: true).then((response) {
        if (response!=null) {
          Fluttertoast.showToast(msg: "${json.decode(response.body)["message"]}");
          changeLoading(false);
          getTeamMembers(context);
          Get.back();
        }else{
          changeLoading(false);
        }
      });
    }
  }



}