import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/screens/authScreens/loginScreen.dart';
import 'package:investcraftpartner/widgets/backgroundwidget.dart';
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
                  hint: "",clt: ap.nameClt,
                  title: "Name (as per pan card)",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(30),
                TextFieldCustom(
                  hint: "",clt: ap.emailIdClt,
                  title: "Email ID",
                  textCapitalization: TextCapitalization.characters,

                ),
                Gap(30),
                TextFieldCustom(
                  hint: "",clt: ap.phoneNumberClt,
                  title: "Phone Number",
                  textCapitalization: TextCapitalization.characters,
                  type: TextInputType.number,

                ),
                Gap(30),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Business Type',
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
                          validator: (vv){},
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
                          items: []
                              .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(color: Color(0xff5B6469)),
                            ),
                          ))
                              .toList(),
                          value: ap.selectedBusinessType,
                          onChanged: (value) {

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
                  title: "Password",
                  textCapitalization: TextCapitalization.characters,
                  type: TextInputType.number,

                ),
                Gap(30),
                TextFieldCustom(
                  hint: "",clt: ap.confirmPasswordClt,
                  title: "Confirm Password",
                  textCapitalization: TextCapitalization.characters,
                  type: TextInputType.number,

                ),
                Gap(25),
                GestureDetector(
                  onTap: (){},
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
                          'Create your account',
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
                            text:  "Already have an Account?",
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
                            text: 'Sign In',
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
