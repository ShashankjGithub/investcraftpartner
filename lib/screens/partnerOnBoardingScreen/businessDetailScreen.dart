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

class BusinessDetailScreen extends StatelessWidget {
  const BusinessDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PartnerOnBoardingProvider pp = context.watch<PartnerOnBoardingProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Form(
        key: pp.businessDetailKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${pf.businessDetails!.title}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(5),
            Text(
              "${pf.businessDetails!.content}",
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
                      getLabel(label: "BUSSINESS_TYPE_LABEL", form: pf.businessDetails!),
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
                  padding: EdgeInsets.only(left: 10, right: 8,bottom: 10),
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
                      validator: (vv){
                        if (vv==null) {
                          return "Please select business type";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: pp.selectedBusinessType!=null?15:16,
                              left: pp.selectedBusinessType!=null?0:15)

                      ),
                      iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                      isExpanded: true,
                      hint: Text(
                        getPlaceHolder(label: "BUSSINESS_TYPE_PLACEHOLDER", form: pf.businessDetails!),
                        style: TextStyle(color: Color(0xff5B6469), fontSize: 15,fontWeight: FontWeight.w400),
                      ),
                      items: pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_TYPE_PLACEHOLDER").list
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.value!,
                          style: TextStyle(color: Color(0xff5B6469),fontWeight: FontWeight.w400),
                        ),
                      ))
                          .toList(),
                      value: pp.selectedBusinessType,
                      onChanged: (value) {
                         pp.changeBusinessType(value);
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
              title: getLabel(label: "BUSINESS_NAME_LABEL", form: pf.businessDetails!),

              validator: (val){
                if(val!.isEmpty){
                  return "Please enter business name";
                }
              },
            ),
            Gap(20),
            TextFieldCustom(
              hint: "",clt: pp.businessEmailClt,
              title: getLabel(label: "BUSINESS_EMAIL_LABEL", form: pf.businessDetails!),
              showRequried: false,
            ),
            Gap(20),
            TextFieldCustom(
              hint: "",clt: pp.businessWebsiteUrlClt,
              title: getLabel(label: "WEBSITE_URL_LABEL", form: pf.businessDetails!),
              showRequried: false,
            ),
            Gap(25),

            TextFieldCustom(
              hint: "",clt: pp.businessPhoneNumberClt,
              title: getLabel(label: "BUSINESS_NUMBER_LABEL", form: pf.businessDetails!),

              validator: (val){
                if(val!.isEmpty){
                  return "Please enter business phone number";
                }
              },
            ),
            Gap(25),
            Row(
              children: [
                Text(
                  getLabel(label: "GST_LABEL", form: pf.businessDetails!),
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
                  getLabel(label: "BUSSINESS_LABEL", form: pf.businessDetails!),
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
                itemCount: pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_AMOUNT_BUTTON").list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    mainAxisExtent: 65,
                    crossAxisCount: 2), itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  pp.changeSelectedMB(pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_AMOUNT_BUTTON").list[index].key);
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
                            shape: BoxShape.circle,color: pp.selectedMonthlyBusiness==pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_AMOUNT_BUTTON").list[index].key?mainColor:grayColor2),
                      child: Icon(Icons.check,size: 15,color: Colors.white,),

                      ),
                      Gap(20),
                      Text(
                        pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_AMOUNT_BUTTON").list[index].value.toString(),
                        style: TextStyle(
                          color: pp.selectedMonthlyBusiness==pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_AMOUNT_BUTTON").list[index].key?mainColor:Colors.black,
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
                  getLabel(label: "AREA_COVERED_LABEL", form: pf.businessDetails!),
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
                itemCount: pf.businessDetails!.element.firstWhere((element) => element.key == "ARED_COVERED_BUTTON").list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    mainAxisExtent: 65,
                    crossAxisCount: 2), itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  pp.changeAreaCovered(pf.businessDetails!.element.firstWhere((element) => element.key == "ARED_COVERED_BUTTON").list[index].key);
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
                            shape: BoxShape.circle,color: pp.selectedAreaCovered==pf.businessDetails!.element.firstWhere((element) => element.key == "ARED_COVERED_BUTTON").list[index].key?mainColor:grayColor2),
                        child: Icon(Icons.check,size: 15,color: Colors.white,),

                      ),
                      Gap(20),
                      Text(
                        pf.businessDetails!.element.firstWhere((element) => element.key == "ARED_COVERED_BUTTON").list[index].value.toString(),
                        style: TextStyle(
                          color: pp.selectedAreaCovered==pf.businessDetails!.element.firstWhere((element) => element.key == "ARED_COVERED_BUTTON").list[index].key?mainColor:Colors.black,
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
                  getLabel(label: "BUSSINESS_EXPERINCE_LABEL", form: pf.businessDetails!),
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
                itemCount: pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_EXPERINCE_BUTTON").list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    mainAxisExtent: 65,
                    crossAxisCount: 2), itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  pp.changeExperienceInBusiness(pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_EXPERINCE_BUTTON").list[index].key);
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
                            shape: BoxShape.circle,color: pp.selectedexperienceInBusiness==pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_EXPERINCE_BUTTON").list[index].key?mainColor:grayColor2),
                        child: Icon(Icons.check,size: 15,color: Colors.white,),

                      ),
                      Gap(10),
                      Text(
                        pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_EXPERINCE_BUTTON").list[index].value.toString(),
                        style: TextStyle(
                          color: pp.selectedexperienceInBusiness==pf.businessDetails!.element.firstWhere((element) => element.key == "BUSSINESS_EXPERINCE_BUTTON").list[index].key?mainColor:Colors.black,
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
              title: getLabel(label: "BUSSINESS_ADDRESS_LABEL", form: pf.businessDetails!),

              validator: (val){
                if(val!.isEmpty){
                  return "Please enter business address";
                }
              },
            ),
            Gap(25),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${getLabel(label: "STATE_LABEL", form: pf.businessDetails!)}",
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
                  padding: EdgeInsets.only(left: 10, right: 8,bottom: 10),
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
                      validator: (vv){
                        if (vv==null) {
                          return "Please select state";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: pp.selectedBusinessStateType!=null?15:16,
                              left: pp.selectedBusinessStateType!=null?0:15)

                      ),
                      iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                      isExpanded: true,
                      hint: Text(
                        getPlaceHolder(label: "STATE_PLACEHOLDER", form: pf.businessDetails!),
                        style: TextStyle(color: Color(0xff5B6469), fontSize: 15,fontWeight: FontWeight.w400),
                      ),
                      items: pf.businessDetails!.element.firstWhere((element) => element.key == "STATE_PLACEHOLDER").list
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.value!,
                          style: TextStyle(color: Color(0xff5B6469),fontWeight: FontWeight.w400),
                        ),
                      ))
                          .toList(),
                      value: pp.selectedBusinessStateType,
                      onChanged: (value) {
                          pp.changeBusinessState(value);
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
                      '${getLabel(label: "CITY_LABEL", form: pf.businessDetails!)}',
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
                  padding: EdgeInsets.only(left: 10, right: 8,bottom: 10),
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
                      validator: (vv){
                        if (vv==null) {
                          return "Please select city";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: pp.selectedBusinessCityType!=null?15:16,
                              left: pp.selectedBusinessCityType!=null?0:15)

                      ),
                      iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                      isExpanded: true,
                      hint: Text(
                        "${getPlaceHolder(label: "CITY_PLACEHOLDER", form: pf.businessDetails!)}",
                        style: TextStyle(color: Color(0xff5B6469), fontSize: 15,fontWeight: FontWeight.w400),
                      ),
                      items: pf.businessDetails!.element.firstWhere((element) => element.key == "CITY_PLACEHOLDER").list
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.value!,
                          style: TextStyle(color: Color(0xff5B6469),fontWeight: FontWeight.w400),
                        ),
                      ))
                          .toList(),
                      value: pp.selectedBusinessCityType,
                      onChanged: (value) {
                          pp.changeBusinessCity(value);
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 40,
                        width: 400,
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
              title: getLabel(label: "PIN_CODE", form: pf.businessDetails!),
              validator: (val){
                if (val!.isEmpty) {
                  return "Please enter pin code";
                }
              },

              type: TextInputType.number ,
            ),


          ],
        ),
      ),
    );
  }
}


