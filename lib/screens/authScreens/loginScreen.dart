import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/screens/authScreens/signUpScreen.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:investcraftpartner/widgets/backgroundwidget.dart';
import 'package:investcraftpartner/widgets/bottomBar.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import '../../widgets/lodingWidget.dart';
import '../partnerOnBoardingScreen/widgets/customtextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                pf.loginForm==null?Center(child: CircularProgressIndicator(color: mainColor,),):
                Form(
                  key: ap.loginKey,
                  child: ListView(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                    children: [
                      Gap(50),
                      Text(
                        getLabel(label: "BFSI_LABEL", form: pf.loginForm!),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5

                        ),
                      ),
                      Gap(8),
                      Text(
                        getLabel(label: "Revenue_LABEL", form: pf.loginForm!),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2
                        ),
                      ),
                      Gap(40),
                      TextFieldCustom(
                        hint: "",clt: ap.emailClt,
                        title: getLabel(label: "EMAIL_LABEL", form: pf.loginForm!),
                        textCapitalization: TextCapitalization.characters,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter email";
                          }
                        },
                      ),
                      Gap(30),
                      TextFieldCustom(
                        hint: "",clt: ap.passwordClt,
                        title: getLabel(label: "PASSWORD_LABEL", form: pf.loginForm!),
                        textCapitalization: TextCapitalization.characters,
                        obscureText: true,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "Please enter password";
                          }
                        },
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            getLabel(label: "FORGET_PASSWORD_LABEL", form: pf.loginForm!),
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      Gap(25),
                      GestureDetector(
                        onTap: (){
                           ap.logine(context);
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
                                getLabel(label: "LOGIN_LABEL", form: pf.loginForm!),
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
                    text:  getLabel(label: "DONT_HAVE_ACCOUNT_LABEL", form: pf.loginForm!),
                    style: TextStyle(
                    color: Color(0xFF66707F),
                    fontSize: 15,
                          fontWeight: FontWeight.w400,

                  ),
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Get.to(()=>SignUpScreen());
                  },
                  text: getLabel(label: "SIGN_UP_LABEL", form: pf.loginForm!),
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
