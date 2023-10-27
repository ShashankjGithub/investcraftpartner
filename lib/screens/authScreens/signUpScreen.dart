import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/screens/authScreens/loginScreen.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:investcraftpartner/widgets/backgroundwidget.dart';
import 'package:investcraftpartner/widgets/lodingWidget.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import '../../generated/assets.dart';
import '../partnerOnBoardingScreen/widgets/customtextField.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
    ));
    final AuthProvider ap = context.watch<AuthProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    return  Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              child: BackgroundWidget(
                topposition: 20.0,
                child:
                pf.signupForm==null?Center(child: CircularProgressIndicator(color: mainColor,),):
                Form(
                  key: ap.signUpKey,
                  child: ListView(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                    children: [
                      Gap(50),
                      Text(
                       getLabel(label: "BFSI_SINGUP_LABEL", form: pf.signupForm!),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5

                        ),
                      ),
                      Gap(8),
                      Text(
                        getLabel(label: "Revenue_SINGUP_LABEL", form: pf.signupForm!),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.2
                        ),
                      ),
                      Gap(40),
                      TextFieldCustom(
                        hint: "",clt: ap.nameClt,
                        title: getLabel(label: "NAME_LABEL", form: pf.signupForm!),
                        textCapitalization: TextCapitalization.characters,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter name";
                          }
                        },
                      ),
                      Gap(30),
                      TextFieldCustom(
                        hint: "",clt: ap.emailIdClt,
                        title: getLabel(label: "EMAIL_LABEL", form: pf.signupForm!),
                        textCapitalization: TextCapitalization.characters,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter email";
                          }
                        },
                      ),
                      Gap(30),
                      TextFieldCustom(
                        hint: "",clt: ap.phoneNumberClt,
                        title: getLabel(label: "PHONE_LABEL", form: pf.signupForm!),
                        textCapitalization: TextCapitalization.characters,
                        type: TextInputType.number,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter phone number";
                          }
                        },
                      ),
                      Gap(30),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                getLabel(label: "BUSSINESS_LABEL", form: pf.signupForm!),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Gap(5),

                              Text("*",style: TextStyle(color: mainColor,fontSize: 16.sp),)
                            ],
                          ),
                          Gap(15.h),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 8),
                            height: 60.h,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100.r)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField2(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (val){
                                  if (val == null) {
                                    return "Please select business type";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 15)
                                ),
                                iconStyleData: IconStyleData(
                                    icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                                isExpanded: true,
                                hint: Text(
                                  "Select",
                                  style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                                ),
                                items: pf.signupForm!.element.firstWhere((element) => element.key == "BUSSINESS_TYPE_PLACEHOLDER").list
                                    .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item.key??"",
                                    style: TextStyle(color: Color(0xff5B6469)),
                                  ),
                                ))
                                    .toList(),
                                value: ap.selectedBusinessType,
                                onChanged: (value) {

                                  ap.changeSelectedBusinessType(value);
                                  print( ap.selectedBusinessType.value);
                                },
                                buttonStyleData: ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  height: 40,
                                  width: 200,
                                ),
                                menuItemStyleData: MenuItemStyleData(
                                  height: 40,
                                ),
                                dropdownStyleData: DropdownStyleData(width: 200),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(30),
                      TextFieldCustom(
                        hint: "",clt: ap.passwordSignClt,
                        title: getLabel(label: "PASSWORD_LABEL", form: pf.signupForm!),
                        textCapitalization: TextCapitalization.characters,
                        type: TextInputType.number,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter password";
                          }
                        },
                      ),
                      Gap(30),
                      TextFieldCustom(
                        hint: "",clt: ap.confirmPasswordClt,
                        title: getLabel(label: "CONFIRM_PASSWORD_LABEL", form: pf.signupForm!),
                        textCapitalization: TextCapitalization.characters,
                        type: TextInputType.number,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter conform password";
                          } else if (ap.passwordSignClt.text != ap.confirmPasswordClt.text) {
                            return "Password does not match";
                          }
                        },

                      ),
                      Gap(25),
                      GestureDetector(
                        onTap: (){
                          ap.register(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                getLabel(label: "JOIN_INVESTKRAFT_LABEL", form: pf.signupForm!),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Gap(5),
                              Icon(Icons.arrow_circle_right,color: Colors.white,size: 18,)
                            ],
                          ),
                        ),
                      ),
                      Gap(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:    getLabel(label: "ALREDAY_HAVE_ACCOUNT_LABEL", form: pf.signupForm!),
                                  style: TextStyle(
                                    color: Color(0xFF66707F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap =(){
                                    Get.offAll(LoginScreen());
                                  },
                                  text:  getLabel(label: "SIGN_IN_LABEL", form: pf.signupForm!),
                                  style: TextStyle(
                                    color: Color(0xFFD7206A),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),),
            ),
          ),
          if(ap.loading)
            LoadingWidget()
        ],
      ),
    );
  }
}
