import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/widgets/backgroundwidget.dart';
import 'package:investcraftpartner/widgets/lodingWidget.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import '../partnerOnBoardingScreen/widgets/customtextField.dart';
import 'authProvider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AuthProvider ap = context.watch<AuthProvider>();
    return  Scaffold(

      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              BackgroundWidget(
                topposition: 20.0,
                child: Form(
                  key: ap.forgotPasswordKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.2
                          ),
                        ),
                        Gap(100),
                        TextFieldCustom(
                          hint: "",clt: ap.forgotPasswordEmailClt,
                          title: "Enter your email",
                          validator: (val){
                            if (val!.isEmpty) {
                              return "Please enter email";
                            }
                          },
                        ),
                        Gap(25),
                        GestureDetector(
                          onTap: (){
                            ap.forgotPassword(context);
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
                                  "Send mail",
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
                      ],
                    ),
                  ),
                )),
              if(ap.loading)
                LoadingWidget()
            ],
          ),
        ),
      ),
    );
  }
}
