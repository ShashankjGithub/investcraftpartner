import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customRadioButton.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
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
          Gap(30),
          CustomizeDatePicker(clt: pp.dobClt,text: "Date Of Birth"),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.permanentHomeAddressClt,
            title: "Permanent Home address",
            textCapitalization: TextCapitalization.characters,
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
                  'Permanent address same as Current address',
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
          TextFieldCustom(
            hint: "",clt: pp.presentAddressClt,
            title: "Present address",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(25),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'State',
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
                      "Select State",
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
                    value: pp.selectedState,
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
          Gap(25),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'City',
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
                      "Select City",
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
                    value: pp.selectedCity,
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
          Gap(25),
          TextFieldCustom(
            hint: "",clt: pp.pinCodeClt,
            type: TextInputType.number,
            title: "Pin Code",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(25),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Education Qualification',
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
                      "Select Qualification",
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
                    value: pp.selectedQualificaion,
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

        ],
      ),
    );
  }
}


