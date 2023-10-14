import 'package:flutter/cupertino.dart';

class LeadProvider extends ChangeNotifier{
  List titles = [
    "Personal Details",
    "Employment Details",
    "Upload Loan Documents",
  ];

  var selectedTitle = "Personal Details";
  changeSelectedTitle(value){
    selectedTitle = value;
    notifyListeners();
  }


  int createLeadIndex = 1;
  changeCreateLeadIndex(value){
    createLeadIndex = value;
    notifyListeners();
  }


}