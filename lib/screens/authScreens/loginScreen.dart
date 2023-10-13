import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/screens/authScreens/signUpScreen.dart';
import 'package:investcraftpartner/widgets/backgroundwidget.dart';
import 'package:investcraftpartner/widgets/bottomBar.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
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
    return  Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: BackgroundWidget(
            topposition: 20.0,
            child: ListView(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              children: [
                Gap(50),
                Text(
                  'Start selling all BFSI and create a lifetime source of income with zero risk and zero investment.\n',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.5

                  ),
                ),
                Gap(8),
                Text(
                  'Increase your Revenue By 3X with Investkraft',
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
                  title: "Email ID",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(30),
                TextFieldCustom(
                  hint: "",clt: ap.passwordClt,
                  title: "Password",
                  textCapitalization: TextCapitalization.characters,
                  obscureText: true,
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgotten Password?',
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
                    Get.offAll(()=>BottomBarScreen());
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
                          'Login Now',
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
              text:  "Don't have an Account?",
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
            text: 'Sign Up',
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
            ),),
        ),
      ),
    );
  }
}
