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

class BusinessDetailScreen extends StatelessWidget {
  const BusinessDetailScreen({super.key});

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
            'Business Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            'Enter detail of your business',
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),
          Gap(25),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Business type',
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
                      "Select Business type",
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
                    value: pp.selectedBusinessType,
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
            hint: "",clt: pp.businessNameClt,
            title: "Business Name",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.businessEmailClt,
            title: "Business Email",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.businessWebsiteUrlClt,
            title: "Website URL",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(25),

          TextFieldCustom(
            hint: "",clt: pp.businessPhoneNumberClt,
            title: "Business Phone Number",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(25),
          Row(
            children: [
              Text(
                'GST Available',
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
              CustomRadioButton(title: "Yes",color: pp.selectedGSTAvailable=="Yes"?mainColor:grayColor2,onTap: (){
                pp.changeSelectedGSTAvailable("Yes");
              },
                textColor: pp.selectedGSTAvailable=="Yes"?mainColor:textgrayColor,
              ),
              CustomRadioButton(title: "No",color: pp.selectedGSTAvailable=="No"?mainColor:grayColor2,
                onTap: (){
                  pp.changeSelectedGSTAvailable("No");
                },
                textColor: pp.selectedGSTAvailable=="No"?mainColor:textgrayColor,),

            ],
          ),
          Gap(35),
          Row(
            children: [
              Text(
                'Monthly Business',
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
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pp.monthlyBusinessList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  mainAxisExtent: 65,
                  crossAxisCount: 2), itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                pp.changeSelectedMB(pp.monthlyBusinessList[index]);
              },
              child: Container(
                alignment:Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 8),
                height: 65.h,
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
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 18.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: bordercolor),
                          shape: BoxShape.circle,color: pp.selectedMonthlyBusiness==pp.monthlyBusinessList[index]?mainColor:grayColor2),
                    child: Icon(Icons.check,size: 15,color: Colors.white,),

                    ),
                    Gap(20),
                    Text(
                      pp.monthlyBusinessList[index],
                      style: TextStyle(
                        color: pp.selectedMonthlyBusiness==pp.monthlyBusinessList[index]?mainColor:Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Gap(35),
          Row(
            children: [
              Text(
                'Area Covered',
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
          GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pp.areaCoveredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  mainAxisExtent: 65,
                  crossAxisCount: 2), itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                pp.changeAreaCovered(pp.areaCoveredList[index]);
              },
              child: Container(
                alignment:Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 8),
                height: 65.h,
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
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 18.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: bordercolor),
                          shape: BoxShape.circle,color: pp.selectedAreaCovered==pp.areaCoveredList[index]?mainColor:grayColor2),
                      child: Icon(Icons.check,size: 15,color: Colors.white,),

                    ),
                    Gap(20),
                    Text(
                      pp.areaCoveredList[index],
                      style: TextStyle(
                        color: pp.selectedAreaCovered==pp.areaCoveredList[index]?mainColor:Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Gap(35),
          Row(
            children: [
              Text(
                'Experience in Business',
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
          GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pp.experienceInBusinessList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  mainAxisExtent: 65,
                  crossAxisCount: 2), itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                pp.changeExperienceInBusiness(pp.experienceInBusinessList[index]);
              },
              child: Container(
                alignment:Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 8),
                height: 65.h,
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
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 18.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: bordercolor),
                          shape: BoxShape.circle,color: pp.selectedexperienceInBusiness==pp.experienceInBusinessList[index]?mainColor:grayColor2),
                      child: Icon(Icons.check,size: 15,color: Colors.white,),

                    ),
                    Gap(10),
                    Text(
                      pp.experienceInBusinessList[index],
                      style: TextStyle(
                        color: pp.selectedexperienceInBusiness==pp.experienceInBusinessList[index]?mainColor:Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Gap(25),
          TextFieldCustom(
            hint: "",clt: pp.businessAddressClt,
            title: "Business Address",
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
                    value: pp.selectedBusinessStateType,
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
                    value: pp.selectedBusinessCityType,
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
            hint: "",clt: pp.businessPinCodeClt,
            title: "PIN Code",
            textCapitalization: TextCapitalization.characters,
          ),


        ],
      ),
    );
  }
}


