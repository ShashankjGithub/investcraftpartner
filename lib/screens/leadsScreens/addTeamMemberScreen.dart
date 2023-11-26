import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/providers/teamProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:investcraftpartner/widgets/lodingWidget.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import '../../generated/assets.dart';
import '../partnerOnBoardingScreen/widgets/nextButton.dart';
import 'leadProvider.dart';

class AddTeamMemberScreen extends StatefulWidget {
  const AddTeamMemberScreen({super.key});

  @override
  State<AddTeamMemberScreen> createState() => _AddTeamMemberScreenState();
}

class _AddTeamMemberScreenState extends State<AddTeamMemberScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    final TeamProvider pp = context.watch<TeamProvider>();
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: pp.teamCreateKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Team Member",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Gap(5),
                          Text(
                            "Fill basic Detail",
                            style: TextStyle(
                              color: Color(0xFFD7206A),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                          Gap(15),
                          TextFieldCustom(
                            hint: "",clt: pp.nameteamClt,
                            title: getLabel(label: "NAME_LABEL", form: pf.basicDetail!),

                            validator: (val){
                              if (val!.isEmpty) {
                                return getLabel(label: "NAME_LABEL", form: pf.basicDetail!);
                              }
                            },
                          ),
                          Gap(20),
                          TextFieldCustom(
                            hint: "",clt: pp.emailIDClt,
                            title: getLabel(label: "EMAIL_LABEL", form: pf.basicDetail!),

                            validator: (val){
                              if (val!.isEmpty) {
                                return getLabel(label: "EMAIL_LABEL", form: pf.basicDetail!);
                              }
                            },
                          ),
                          Gap(20),
                          TextFieldCustom(
                            hint: "",clt: pp.phoneNumberClt,
                            title:  getLabel(label: "PHONE_NUMBER_LABEL", form: pf.basicDetail!),

                            validator: (val){
                              if (val!.isEmpty) {
                                return getLabel(label: "PHONE_NUMBER_LABEL", form: pf.basicDetail!);
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
                                    value: pp.selectedBusinessType,
                                    onChanged: (value) {

                                      pp.changeSelectedBusinessType(value);
                                      print( pp.selectedBusinessType.value);
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

                        ],
                      ),
                    ),
                    CustomNextButton(
                      onTap: (){
                       pp.saveBasicDetail(context);
                      },
                      title: "Save"
                    )
                  ],
                ),
              ),
            ),
          ),
          if(pp.loading)
            LoadingWidget()
        ],
      ),
    );
  }
}
