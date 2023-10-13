import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();
  bool loading = false;
  changeLoading(value){
    loading = value;
    notifyListeners();
  }

  TextEditingController nameClt = TextEditingController();
  TextEditingController emailIdClt = TextEditingController();
  TextEditingController phoneNumberClt = TextEditingController();
  TextEditingController passwordSignClt = TextEditingController();
  TextEditingController confirmPasswordClt = TextEditingController();
  var selectedBusinessType;

}