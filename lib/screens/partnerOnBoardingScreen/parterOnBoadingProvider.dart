

import 'package:flutter/material.dart';

class PartnerOnBoardingProvider extends ChangeNotifier{
  int persent = 10;
  var w =10;
  dynamic currentStep = 1;
  String currentForm = "Basic Details";
  PageController pageController = PageController();

  changeForm({required int currentstep, required int perse, required String formName}){
    currentStep = currentstep;
    persent = perse;
    currentForm = formName;
    w = (persent==10?10:persent==20?6:persent==30?4:persent==40?2.5:persent==50?2:persent==60?1.7:persent==70?1.5:persent==80?1.3:persent==90?1.1:1).toInt();
    pageController.animateToPage(currentstep-1, duration: Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }

  nextButtonPressed(){
    switch(currentStep){
      case 1:
        changeForm(currentstep: 2, perse: 20, formName: "Personal Detail");
        break;
      case 2:
        changeForm(currentstep: 3, perse: 30, formName: "Business Detail");
        break;
      case 3:
        changeForm(currentstep: 4, perse: 40, formName: "Bank Account Detail");
        break;
      case 4:
        changeForm(currentstep: 5, perse: 50, formName: "KYC Detail");
        break;
      case 5:
        changeForm(currentstep: 6, perse: 60, formName: "Agreement");
        break;
      case 6:
        changeForm(currentstep: 7, perse: 70, formName: "Congratulation");
        break;
      default:
        changeForm(currentstep: 1, perse: 10, formName: "Basic Detail");
    }
  }
  previousButtonPressed(){
    switch(currentStep){
      case 3:
        changeForm(currentstep: 2, perse: 20, formName: "Personal Detail");
      case 4:
        changeForm(currentstep: 3, perse: 30, formName: "Business Detail");
        break;
      case 5:
        changeForm(currentstep: 4, perse: 40, formName: "Bank Account Detail");
        break;
      case 6:
        changeForm(currentstep: 5, perse: 50, formName: "KYC Detail");
        break;
      case 7:
        changeForm(currentstep: 6, perse: 60, formName: "Agreement");
        break;
        default:
        changeForm(currentstep: 1, perse: 10, formName: "Basic Detail");
    }
  }


  //////////////////////// Basic Detail ///////////////////////////////////////////////////////
  TextEditingController nameClt = TextEditingController();
  TextEditingController emailIDClt = TextEditingController();
  TextEditingController phoneNumberClt = TextEditingController();
  TextEditingController businessTypeClt = TextEditingController();
  ////////////////////// Personal Detail ////////////////////////////////////////////////////
  TextEditingController panCardNumberClt = TextEditingController();
  TextEditingController aadhaarCardNumberClt = TextEditingController();
  TextEditingController dobClt = TextEditingController();
  TextEditingController permanentHomeAddressClt = TextEditingController();
  TextEditingController presentAddressClt = TextEditingController();
  TextEditingController pinCodeClt = TextEditingController();
  String gender = "Male";
  changeGender(value){
    gender = value;
    notifyListeners();
  }

}