import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customRadioButton.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../config/themeConfig.dart';
import '../../generated/assets.dart';
import '../../widgets/CustomizeDatePicker.dart';

class PersonalDetailScreen extends StatelessWidget {
  const PersonalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PartnerOnBoardingProvider pp = context.watch<PartnerOnBoardingProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Form(
        key: pp.personalDetailKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${pf.personalDetailFromData!.title}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(5),
            Text(
              '${pf.personalDetailFromData!.content}',
              style: TextStyle(
                color: Color(0xFFD7206A),
                fontSize: 16,
                fontWeight: FontWeight.w400,

              ),
            ),
            Gap(15),
            TextFieldCustom(
              hint: "",clt: pp.panCardNumberClt,
              title: getLabel(label: "PAN_CARD_LABEL", form: pf.personalDetailFromData!),
              textCapitalization: TextCapitalization.characters,
              validator: (val){
                if(val!.isEmpty){
                  return "Please enter pan card number";
                }
              },
            ),
            Gap(20),
            TextFieldCustom(
              hint: "",clt: pp.aadhaarCardNumberClt,
              title: getLabel(label: "AADHAR_CARD_LABEL", form: pf.personalDetailFromData!),

              type: TextInputType.number,
              validator: (val){
                if(val!.isEmpty){
                  return "Please enter addhar card number";
                }
              },
            ),
            Gap(20),
            Row(
              children: [
                Text(
                  getLabel(label: "GENDER_LABEL", form: pf.personalDetailFromData!),
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
            Gap(30),
            CustomizeDatePicker(

              clt: pp.dobClt,text: getLabel(label: "DATE_OF_BIRTH", form: pf.personalDetailFromData!),
              validator: (val){
                if(val!.isEmpty){
                  return "Please enter DOB";
                }
              },
            ),
            Gap(20),
            TextFieldCustom(
              hint: "",clt: pp.permanentHomeAddressClt,
              title: getLabel(label: "PERMANENT_HOME_ADDRESS_LABEL", form: pf.personalDetailFromData!),

              validator: (val){
                if(val!.isEmpty){
                  return "Please enter permanent address";
                }
              },
            ),
            Gap(25),
            InkWell(
              onTap: (){
                pp.changePASACA();
              },
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                   height: 18.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: bordercolor),
                      color: pp.pasaca==true?mainColor:Colors.white,
                    ),
                    child:
                    pp.pasaca==false?SizedBox():
                    Icon(Icons.check,size: 15,color: Colors.white,),
                  ),
                  Gap(15),
                  Text(
                    getLabel(label: "CHEKC_BOX_BUTTON", form: pf.personalDetailFromData!),
                    style: TextStyle(
                      color: Color(0xFF66707F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Gap(25),
            pp.pasaca==true?SizedBox():
            TextFieldCustom(
              hint: "",clt: pp.presentAddressClt,
              title:getLabel(label: "PERSENT_ADDRESS_LABEL", form: pf.personalDetailFromData!),

              validator: (val){
                if(pp.pasaca==false&&val!.isEmpty){
                  return "Please enter present address";
                }
              },
            ),
            Gap(25),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      getLabel(label: "STATE_LABEL", form: pf.personalDetailFromData!),
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
                        if(val==null){
                          return "Please select state";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 15,left: 10)
                      ),
                      iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                      isExpanded: true,
                      hint: Text(
                        "${pf.personalDetailFromData!.element.firstWhere((element) => element.key == "STATE_PLACEHOLDER").elementType}",
                        style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                      ),
                      items: pf.personalDetailFromData!.element.firstWhere((element) => element.key == "STATE_PLACEHOLDER").list
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.value!,
                          style: TextStyle(color: Color(0xff5B6469)),
                        ),
                      ))
                          .toList(),
                      value: pp.selectedState,
                      onChanged: (value) {
                       pp.changeSelectState(value);
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
            Gap(25),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      getLabel(label: "CITY_LABEL", form: pf.personalDetailFromData!),
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
                        if(val==null){
                          return "Please select city";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 15,left: 10)
                      ),
                      iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                      isExpanded: true,
                      hint: Text(
                        "${pf.personalDetailFromData!.element.firstWhere((element) => element.key == "CITY_PLACEHOLDER").elementType}",
                        style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                      ),
                      items: pf.personalDetailFromData!.element.firstWhere((element) => element.key == "CITY_PLACEHOLDER").list
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.value!,
                          style: TextStyle(color: Color(0xff5B6469)),
                        ),
                      ))
                          .toList(),
                      value: pp.selectedCity,
                      onChanged: (value) {
                        pp.changeSelectCity(value);
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
            Gap(25),
            TextFieldCustom(
              hint: "",clt: pp.pinCodeClt,
              type: TextInputType.number,
              title: getLabel(label: "PIN_CODE", form: pf.personalDetailFromData!),

              validator: (val){
                if(val!.isEmpty){
                  return "Please enter pin code";
                }
              },
            ),
            Gap(25),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      getLabel(label: "EDUCATION_QUALIFICATION", form: pf.personalDetailFromData!),
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
                        if(val==null){
                          return "Please select eduction qualification";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 15,left: 10)
                      ),
                      iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                      isExpanded: true,
                      hint: Text(
                        "${pf.personalDetailFromData!.element.firstWhere((element) => element.key == "EDUCATION_QUALIFICATION_SELECT").elementType}",
                        style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                      ),
                      items: pf.personalDetailFromData!.element.firstWhere((element) => element.key == "EDUCATION_QUALIFICATION_SELECT").list
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.value!,
                          style: TextStyle(color: Color(0xff5B6469)),
                        ),
                      ))
                          .toList(),
                      value: pp.selectedQualificaion,
                      onChanged: (value) {
                          pp.changeSelectQulification(value);
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
    );
  }
}


