import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customRadioButton.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';

class PersonalDetailScreen extends StatelessWidget {
  const PersonalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PartnerOnBoardingProvider pp = context.watch<PartnerOnBoardingProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            'Fill and save all personal details to add a partner',
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),
          Gap(15),
          TextFieldCustom(
            hint: "",clt: pp.panCardNumberClt,
            title: "PAN Card Number",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.aadhaarCardNumberClt,
            title: "Aadhaar Card Number",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          Row(
            children: [
              Text(
                'Gender',
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
          Gap(20),
          Row(
            children: [
              CustomRadioButton(title: "Male",color: pp.gender=="Male"?mainColor:grayColor2,onTap: (){
                pp.changeGender("Male");
              },
                textColor: pp.gender=="Male"?mainColor:textgrayColor,
              ),
              CustomRadioButton(title: "Female",color: pp.gender=="Female"?mainColor:grayColor2,
                onTap: (){
                  pp.changeGender("Female");
                },
                textColor: pp.gender=="Male"?mainColor:textgrayColor,),
              CustomRadioButton(title: "Other",color: pp.gender=="Other"?mainColor:grayColor2,
                onTap: (){
                  pp.changeGender("Other");
                },
                textColor: pp.gender=="Male"?mainColor:textgrayColor,),
            ],
          ),


        ],
      ),
    );
  }
}


