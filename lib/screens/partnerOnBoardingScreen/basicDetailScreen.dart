import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import '../../generated/assets.dart';

class BasicDetailScreen extends StatefulWidget {
  const BasicDetailScreen({super.key});

  @override
  State<BasicDetailScreen> createState() => _BasicDetailScreenState();
}

class _BasicDetailScreenState extends State<BasicDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PartnerOnBoardingProvider pp = context.watch<PartnerOnBoardingProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Form(
        key: pp.basicDetailKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${pf.basicDetail!.title}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(5),
            Text(
              "${pf.basicDetail!.content}",
              style: TextStyle(
                color: Color(0xFFD7206A),
                fontSize: 16,
                fontWeight: FontWeight.w400,

              ),
            ),
            Gap(15),
            TextFieldCustom(
              hint: "",clt: pp.nameClt,
              title: getLabel(label: "NAME_LABEL", form: pf.basicDetail!),
              validator: (val){
                if (val!.isEmpty) {
                  return "Please Enter name";
                }
              },

            ),
            Gap(20),
            TextFieldCustom(
              hint: "",clt: pp.emailIDClt,
              title: getLabel(label: "EMAIL_LABEL", form: pf.basicDetail!),
              validator: (val){
                if (val!.isEmpty) {
                  return "Please Enter email";
                }
              },

            ),
            Gap(20),
            TextFieldCustom(
              hint: "",clt: pp.phoneNumberClt,
              title:  getLabel(label: "PHONE_NUMBER_LABEL", form: pf.basicDetail!),
              validator: (val){
                if (val!.isEmpty) {
                  return "Please Enter phone number";
                }
              },

            ),
            Gap(20),
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

              ],
            ),

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
                      contentPadding: EdgeInsets.only(top: 15,left: 15)
                  ),
                  iconStyleData: IconStyleData(
                      icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                  isExpanded: true,
                  hint: Text(
                    "Select",
                    style: TextStyle(color: Color(0xff5B6469), fontSize: 15,fontWeight: FontWeight.w400),
                  ),
                  items: pf.signupForm!.element.firstWhere((element) => element.key == "BUSSINESS_TYPE_PLACEHOLDER").list
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item.value??"",
                      style: TextStyle(color: Color(0xff5B6469),fontWeight: FontWeight.w400),
                    ),
                  ))
                      .toList(),
                  value: pp.selecteBasicdBusinessType,
                  onChanged: (value) {
                    pp.changeBAnsiBusinessType(value);
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
      ),
    );
  }
}
