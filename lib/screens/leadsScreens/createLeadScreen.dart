import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:investcraftpartner/widgets/lodingWidget.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import '../../generated/assets.dart';
import '../../widgets/CustomizeDatePicker.dart';
import '../../widgets/dottedContainer.dart';
import '../partnerOnBoardingScreen/widgets/customRadioButton.dart';
import '../partnerOnBoardingScreen/widgets/customtextField.dart';
import '../partnerOnBoardingScreen/widgets/nextButton.dart';
import 'leadProvider.dart';

class CreateLeadScreen extends StatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
    ));
    final Size size = MediaQuery.of(context).size;
    final LeadProvider lp = context.watch<LeadProvider>();
    final PartnerFromDataProvider fp = context.watch<PartnerFromDataProvider>();

    return  WillPopScope(
      onWillPop: ()async{
        lp.clearTextFields();
        return true;
      },
      child: Scaffold(
       body: SafeArea(
         child: Container(
           padding: EdgeInsets.only(top: 40,bottom: 10),
           height: size.height,
           width: size.width,
           child: Stack(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20),
                     child: Text(
                       'Create Lead',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 24,
                         fontWeight: FontWeight.w700,
                       ),
                     ),
                   ),
                   Gap(25),
                   Container(
                     padding: EdgeInsets.only(left: 15,right: 15),
                     height: 70.h,
                     child: Stack(
                       alignment: Alignment.bottomCenter,
                       children: [
                         Container(
                           height: 54.h,
                           width: size.width,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: bordercolor)),
                           child: Row(
                             children: [
                               Expanded(
                                 child: Container(
                                   height: 70.h,
                                   child: Stack(
                                     alignment: Alignment.bottomCenter,
                                     children: [
                                       Container(
                                         alignment: Alignment.center,
                                         decoration: BoxDecoration(border:
                                         lp.submittedPersonalDetail==true?
                                         Border.all(color: mainColor):null,borderRadius: BorderRadius.circular(100)),
                                          child: Text("Personal\nDetails",textAlign: TextAlign.center,style: TextStyle(height: 1.2,color:lp.inPersonalDetail==true? mainColor:Colors.black),),
                                       ),

                                     ],
                                   ),
                                 ),
                               ),
                               Expanded(
                                 child: Container(
                                   alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                       border:
                                       lp.submittedEmployeeDetail==true?
                                       Border.all(color: mainColor):null,borderRadius: BorderRadius.circular(100)),
                                   child: Text("Employment\nDetails",textAlign: TextAlign.center,style: TextStyle(height: 1.2,color:lp.inEmployeeDetail==true? mainColor:Colors.black),),
                                 ),
                               ),
                               // Expanded(
                               //   child: Container(
                               //     alignment: Alignment.center,
                               //     height: 60.h,
                               //     decoration: BoxDecoration(border:
                               //     lp.submittedDocumentsUpload==true?
                               //     Border.all(color: mainColor):null,borderRadius: BorderRadius.circular(100)),
                               //     child: Text("Documents\nDetails",textAlign: TextAlign.center,style: TextStyle(height: 1.2,color:lp.inDocumentsUpload==true? mainColor:Colors.black),),
                               //   ),
                               // ),

                             ],
                           ),
                         ),
                         Positioned(
                           top: 0,
                           child: Container(
                             padding: EdgeInsets.only(left: 12,right: 15),
                             height: 25.h,
                             width: size.width,
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     alignment: Alignment.center,
                                     height: 25.h,
                                     width: 25.w,
                                     decoration: BoxDecoration(shape: BoxShape.circle,color: lp.inPersonalDetail==true?mainColor:dotGrayColor),
                                     child:  Text("01",style: TextStyle(color: lp.inPersonalDetail==true?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                                   ),
                                 ),
                                 Expanded(
                                   child: Container(
                                     alignment: Alignment.center,
                                     height: 25.h,
                                     width: 25.w,
                                     decoration: BoxDecoration(shape: BoxShape.circle,color: lp.inEmployeeDetail==true?mainColor:dotGrayColor),
                                     child:  Text("02",style: TextStyle(color: lp.inEmployeeDetail==true?Colors.white:Colors.black,fontWeight: FontWeight.bold),),


                                   ),
                                 ),
                                 // Expanded(
                                 //   child: Container(
                                 //     alignment: Alignment.center,
                                 //     height: 25.h,
                                 //     width: 25.w,
                                 //     decoration: BoxDecoration(shape: BoxShape.circle,color: lp.inDocumentsUpload==true?mainColor:dotGrayColor),
                                 //     child:  Text("03",style: TextStyle(color: lp.inDocumentsUpload==true?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
                                 //
                                 //   ),
                                 // ),




                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Gap(30),
                   Flexible(
                     child: PageView(
                       controller: lp.pageController,
                       physics: NeverScrollableScrollPhysics(),
                       children: [
                         PersonalDetailWidget(lp),
                         EmployeeDetailWidget(lp,size),
                         DocumentUploadeWidget(lp,size),
                       ],
                     ),
                   )
                 ],
               ),
               if(lp.loading==true)
                 LoadingWidget(),
             ],
           ),
         ),
       ),
      ),
    );
  }


  Widget PersonalDetailWidget(LeadProvider lp){
    final PartnerFromDataProvider fp = Provider.of<PartnerFromDataProvider>(context,listen: false);
    return SingleChildScrollView(
      child: Form(
        key: lp.personalDetailKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [
                  TextFieldCustom(
                    hint: "",clt: lp.nameClt,
                    title: getLabel(label: "NAME_LABEL", form: fp.leadFormPersonal!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (v){
                      if (v!.isEmpty) {
                        return getLabel(label: "NAME_LABEL", form: fp.leadFormPersonal!);
                      }
                    },
                  ),
                  Gap(25.h),
                  TextFieldCustom(
                    showRequried: false,
                    hint: "",clt: lp.lastnameClt,
                    title: "Last Name",

                    textCapitalization: TextCapitalization.characters,

                  ),
                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.mobileClt,
                    title: getLabel(label: "MOBILE_NUMBER_LABEL", form: fp.leadFormPersonal!),
                    type: TextInputType.number,
                    textCapitalization: TextCapitalization.characters,
                    validator: (v){
                      if (v!.isEmpty) {
                        return getLabel(label: "MOBILE_NUMBER_LABEL", form: fp.leadFormPersonal!);
                      }
                    },
                  ),
                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.emailClt,
                    title: getLabel(label: "EMAIL_LABEL", form: fp.leadFormPersonal!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (v){
                      if (v!.isEmpty) {
                        return getLabel(label: "EMAIL_LABEL", form: fp.leadFormPersonal!);
                      }
                    },
                  ),
                  Gap(25.h),
                  Row(
                    children: [
                      Text(
                        getLabel(label: "GENDER_LABEL", form: fp.leadFormPersonal!),
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
                      CustomRadioButton(title: "Male",color: lp.gender=="Male"?mainColor:grayColor2,onTap: (){
                        lp.changeGender("Male");
                      },
                        textColor: lp.gender=="Male"?mainColor:textgrayColor,
                      ),
                      CustomRadioButton(title: "Female",color: lp.gender=="Female"?mainColor:grayColor2,
                        onTap: (){
                          lp.changeGender("Female");
                        },
                        textColor: lp.gender=="Female"?mainColor:textgrayColor,),
                      CustomRadioButton(title: "Other",color: lp.gender=="Other"?mainColor:grayColor2,
                        onTap: (){
                          lp.changeGender("Other");
                        },
                        textColor: lp.gender=="Other"?mainColor:textgrayColor,),
                    ],
                  ),
                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.panCardClt,
                    title: getLabel(label: "PAN_NUMBER_LABEL", form: fp.leadFormPersonal!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (v){
                      if (v!.isEmpty) {
                        return "Pan Number";
                      }
                    },
                  ),
                  Gap(25.h),
                  CustomizeDatePicker(clt: lp.dobClt,text: getLabel(label: "DATE_OF_BIRTH", form: fp.leadFormPersonal!), validator: (v){
                    if (v!.isEmpty) {
                      return  getLabel(label: "DATE_OF_BIRTH", form: fp.leadFormPersonal!);
                    }
                  },),
                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.motherNameClt,
                    title:  getLabel(label: "MOTHER_NAME_LABEL", form: fp.leadFormPersonal!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (v){
                      if (v!.isEmpty) {
                        return getLabel(label: "MOTHER_NAME_LABEL", form: fp.leadFormPersonal!);
                      }
                    },
                  ),
                  Gap(25.h),
                ],
              ),
            ),
            CustomNextButton(
              onTap: (){
                if (lp.personalDetailKey.currentState!.validate()) {
                  lp.changeEmployeeDetailSumbiterd();
                }

              },
            )
          ],
        ),
      ),
    );
  }
  Widget EmployeeDetailWidget(LeadProvider lp,Size size){
    final PartnerFromDataProvider fp = Provider.of<PartnerFromDataProvider>(context,listen: false);
    return SingleChildScrollView(
      child: Form(
        key: lp.employeeDetailKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [

                  TextFieldCustom(
                    hint: "",clt: lp.companyName,
                    title: getLabel(label: "COMPANY_NAME_LABEL", form: fp.leadFormEmployement!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (v){
                      if (v!.isEmpty) {
                        return getLabel(label: "COMPANY_NAME_LABEL", form: fp.leadFormPersonal!);
                      }
                    },
                  ),

                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.companyType,
                    title: getLabel(label: "COMPANY_TYPE_LABEL", form: fp.leadFormEmployement!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (v){
                      if (v!.isEmpty) {
                        return getLabel(label: "COMPANY_TYPE_LABEL", form: fp.leadFormPersonal!);
                      }
                    },
                  ),

                  Gap(25.h),


                  Row(
                    children: [
                      Text(
                        'Employment type',
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
                      CustomRadioButton(title: "Salaried",color: lp.employeeType=="Salaried"?mainColor:grayColor2,onTap: (){
                        lp.changeGender("Salaried");
                      },
                        textColor: lp.employeeType=="Salaried"?mainColor:textgrayColor,
                      ),
                      CustomRadioButton(title: "Self-employed",color: lp.employeeType=="Self-employed"?mainColor:grayColor2,
                        onTap: (){
                          lp.changeGender("Self-employed");
                        },
                        textColor: lp.employeeType=="Self-employed"?mainColor:textgrayColor,),

                    ],
                  ),
                  Gap(25),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            getLabel(label: "STATE_LABEL", form: fp.leadFormEmployement!),
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
                            validator: (vv){
                              if(vv==null){
                              return  getLabel(label: "STATE_LABEL", form: fp.leadFormEmployement!);
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
                              getPlaceHolder(label: "STATE_PLACEHOLDER", form: fp.leadFormEmployement!),
                              style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                            ),
                            items: fp.leadFormEmployement!.element.firstWhere((element) => element.key == "STATE_PLACEHOLDER").list
                                .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item.key!,
                                style: TextStyle(color: Color(0xff5B6469)),
                              ),
                            ))
                                .toList(),
                            value: lp.selectedState,
                            onChanged: (value) {
                               lp.changeSelectedState(value);
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
                            getLabel(label: "CITY_LABEL", form: fp.leadFormEmployement!),
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
                            validator: (vv){
                              if(vv==null){
                                return getPlaceHolder(label: "CITY_PLACEHOLDER", form: fp.leadFormEmployement!);
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
                              getPlaceHolder(label: "CITY_PLACEHOLDER", form: fp.leadFormEmployement!),
                              style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                            ),
                            items: fp.leadFormEmployement!.element.firstWhere((element) => element.key == "CITY_PLACEHOLDER").list
                                .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item.key!,
                                style: TextStyle(color: Color(0xff5B6469)),
                              ),
                            ))
                                .toList(),
                            value: lp.selectedCity,
                            onChanged: (value) {
                             lp.changeSelectedCity(value);
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
                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.pinCodeClt,
                    title: getLabel(label: "PIN_CODE_LABEL", form: fp.leadFormEmployement!),
                    type: TextInputType.number,
                    textCapitalization: TextCapitalization.characters,
                    validator: (vv){
                      if(vv!.isEmpty){
                        return getLabel(label: "PIN_CODE_LABEL", form: fp.leadFormEmployement!);
                      }
                    },
                  ),
                  Gap(25.h),
                  Row(
                    children: [
                      Text(
                        getLabel(label: "RESIDENT_LABEL", form: fp.leadFormEmployement!),
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
                      CustomRadioButton(title: "Owned",color: lp.residentType=="Owned"?mainColor:grayColor2,onTap: (){
                        lp.changeGender("Owned");
                      },
                        textColor: lp.residentType=="Owned"?mainColor:textgrayColor,
                      ),
                      CustomRadioButton(title: "Rented",color: lp.residentType=="Rented"?mainColor:grayColor2,
                        onTap: (){
                          lp.changeGender("Rented");
                        },
                        textColor: lp.residentType=="Rented"?mainColor:textgrayColor,),

                    ],
                  ),


                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.requiredLoanAmountClt,
                    type: TextInputType.number,
                    title:   getLabel(label: "REQUIRED_LOAN_AMOUNT_LABEL", form: fp.leadFormEmployement!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (vv){
                      if(vv!.isEmpty){
                        return getLabel(label: "REQUIRED_LOAN_AMOUNT_LABEL", form: fp.leadFormEmployement!);
                      }
                    },
                  ),
                  Gap(25.h),
                  TextFieldCustom(
                    hint: "",clt: lp.monthlyIncomeClt,
                    type: TextInputType.number,
                    title: getLabel(label: "MONTHLY_INCOME_LABEL", form: fp.leadFormEmployement!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (vv){
                      if(vv!.isEmpty){
                        return getLabel(label: "MONTHLY_INCOME_LABEL", form: fp.leadFormEmployement!);
                      }
                    },
                  ),

                  Gap(25),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            getLabel(label: "LOAN_TYPE_LABEL", form: fp.leadFormEmployement!),
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
                            validator: (vv){
                              if(vv==null){
                                return getPlaceHolder(label: "LOAN_TYPE_PLACEHOLDER", form: fp.leadFormEmployement!);
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
                              getPlaceHolder(label: "LOAN_TYPE_PLACEHOLDER", form: fp.leadFormEmployement!),
                              style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                            ),
                            items: fp.leadFormEmployement!.element.firstWhere((element) => element.key == "LOAN_TYPE_PLACEHOLDER").list
                                .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item.key??"",
                                style: TextStyle(color: Color(0xff5B6469)),
                              ),
                            ))
                                .toList(),
                            value: lp.selectedLoanType,
                            onChanged: (value) {
                               lp.changeSelectedLoanType(value);
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


                  Gap(25.h),

                  TextFieldCustom(
                    hint: "",clt: lp.completeResidenceAddressClt,
                    showRequried: false,
                    title: getLabel(label: "COMPLETE_RESIDENCE_ADDRESS_LABEL", form: fp.leadFormEmployement!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (vv){
                      if(vv!.isEmpty){
                        return getLabel(label: "COMPLETE_RESIDENCE_ADDRESS_LABEL", form: fp.leadFormEmployement!);
                      }
                    },
                  ),
                  Gap(25.h),

                  TextFieldCustom(
                    hint: "",clt: lp.completeOfficeAddressClt,
                    showRequried: false,
                    title: getLabel(label: "COMPLETE_OFFICE_ADDRESS_LABEL", form: fp.leadFormEmployement!),
                    textCapitalization: TextCapitalization.characters,
                    validator: (vv){
                      if(vv!.isEmpty){
                        return getLabel(label: "COMPLETE_OFFICE_ADDRESS_LABEL", form: fp.leadFormEmployement!);
                      }
                    },
                  ),
                  Gap(25.h),
                ],
              ),
            ),
            CustomNextButton(
              title: getLabel(label: "NEXT_LABEL", form: fp.leadFormEmployement!),
              onTap: (){
                if(lp.employeeDetailKey.currentState!.validate()){
                  lp.createLead(context);
                }

              },
            )
          ],
        ),
      ),
    );
  }
  Widget DocumentUploadeWidget(LeadProvider lp,Size size){
    final PartnerFromDataProvider fp = Provider.of<PartnerFromDataProvider>(context,listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                Gap(15),
                DoteddedContainer2(label:
                getLabel(label: "UPLOAD_PAN_FILE", form: fp.leadFormDocumentUpload!),
                  placeholder:
                  lp.panCardFile!=null?lp.panCardFile!.files[0].name:
                  getPlaceHolder(label: "PANFILE_PLACEHOLDER", form: fp.leadFormDocumentUpload!),onTap: (){
                  lp.choosePanFile();
                },fotter: "",),

                DoteddedContainer2(label:

                getLabel(label: "UPLOAD_AADHAR_FILE", form: fp.leadFormDocumentUpload!),
                  placeholder:
                  lp.aadhar_front_file!=null?lp.aadhar_front_file!.files[0].name:
                  getPlaceHolder(label: "UPLOAD_AADHAR_FIEL_PLACEHOLDER", form: fp.leadFormDocumentUpload!),onTap: (){
                  lp.chooseaadharFrontFile();
                },fotter: "",),

                DoteddedContainer2(label:

                getLabel(label: "UPLOAD_AADHAR_FILE", form: fp.leadFormDocumentUpload!), placeholder:
                lp.aadhar_back_file!=null?lp.aadhar_back_file!.files[0].name:
                getPlaceHolder(label: "UPLOAD_AADHAR_FIEL_PLACEHOLDER", form: fp.leadFormDocumentUpload!),onTap: (){
                  lp.chooseaadharBackFile();
                },fotter: "",),

                DoteddedContainer2(label:"Current Address proof", placeholder:
                lp.current_address_proof!=null?lp.current_address_proof!.files[0].name:
                "Upload file",onTap: (){
                  lp.chooseCurrentAddress();
                },fotter: "",),
                Row(
                  children: [
                    Text(
                      getLabel(label: "IS_CURRENT_ADDRESS_LABEL", form: fp.leadFormDocumentUpload!),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    CustomRadioButton(title: "Yes",color: lp.isYourCurrentAddress=="Yes"?mainColor:grayColor2,onTap: (){
                      lp.changeGender("Yes");
                    },
                      textColor: lp.isYourCurrentAddress=="Yes"?mainColor:textgrayColor,
                    ),
                    CustomRadioButton(title: "No",color: lp.isYourCurrentAddress=="No"?mainColor:grayColor2,
                      onTap: (){
                        lp.changeGender("No");
                      },
                      textColor: lp.isYourCurrentAddress=="No"?mainColor:textgrayColor,),

                  ],
                ),

                Gap(25.h),

                DoteddedContainer2(label:

                getLabel(label: "INCOME_PROFF_LABEL", form: fp.leadFormDocumentUpload!), placeholder:
                lp.income_proof!=null?lp.income_proof!.files[0].name:
                getPlaceHolder(label: "INCOME_PROFF_PLACEHOLDER", form: fp.leadFormDocumentUpload!),onTap: (){
                  lp.chooseIncomeProofe();
                },fotter: "",),

                Gap(25.h),
                DoteddedContainer2(label:
                lp.bank_statement!=null?lp.bank_statement!.files[0].name:
                getLabel(label: "BANK_STATEMENT_LABEL", form: fp.leadFormDocumentUpload!), placeholder:
                lp.bank_statement!=null?lp.bank_statement!.files[0].name:
                getPlaceHolder(label: "BANK_STATEMENT_LABEL", form: fp.leadFormDocumentUpload!),onTap: (){
                  lp.choosebankStatement();
                },fotter: getLabel(label: "LAST_YEAR_INCOME_PROFF_LABEL", form: fp.leadFormDocumentUpload!),),


                Gap(25.h),

                Gap(25.h),
                DoteddedContainer2(label:

                "Business registration proof", placeholder:
                lp.business_registration_proof!=null?lp.bank_statement!.files[0].name:
                "Upload Business registration proof",onTap: (){
                  lp.choosebusinessRegistationProof();
                }, fotter: '',),


                Row(
                  children: [
                    Text(
                      getLabel(label: "BUSSINESS_RAGISTRATION_LABEL", form: fp.leadFormDocumentUpload!),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                ),
                Gap(40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRadioButton(title: "GST Certificate",color: lp.bRP=="GST Certificate"?mainColor:grayColor2,onTap: (){
                      lp.changeBRPType("GST Certificate");
                    },
                      textColor: lp.bRP=="GST Certificate"?mainColor:textgrayColor,
                    ),
                    CustomRadioButton(title: "Sales and income tax returns",color: lp.bRP=="Sales and income tax returns"?mainColor:grayColor2,
                      onTap: (){
                        lp.changeBRPType("Sales and income tax returns");
                      },
                      textColor: lp.bRP=="Sales and income tax returns"?mainColor:textgrayColor,),

                  ],
                ),
              ],
            ),
          ),
          CustomNextButton(
            title: getLabel(label: "SUBMIT_BUTTON_LABEL", form: fp.leadFormDocumentUpload!),
            onTap: (){
              log(lp.leadId);
              lp.uploadLeadDocument(context);
             // lp.changeDocumentUploadSumbiterd();
            },
          )
        ],
      ),
    );
  }


}
class DoteddedContainer2 extends StatelessWidget {
  DoteddedContainer2({
    super.key,
    required this.label,
    required this.fotter,
    required this.placeholder, required this.onTap,
    this.file
  });
  String label;
  String placeholder;
  String fotter;
  GestureTapCallback onTap;
  FilePickerResult? file;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$label',
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
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60.h,
            width: size.width,
            child: DottedBorder(
                color: Color(0xff66707F),
                dashPattern: [10,3],
                borderType: BorderType.RRect,
                radius: Radius.circular(100),
                padding: EdgeInsets.all(6),
                child: Padding(
                  padding:  EdgeInsets.only(left: 10,right: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            file!=null?file!.files[0].name:
                            placeholder,
                            maxLines: 2,
                            style: TextStyle(color: Color(0xff66707F),fontSize: 16.sp),
                          ),
                        ),
                        SvgPicture.asset(Assets.assetsUploadIcon,height: 30.h,width: 30.w,),

                      ],
                    ),
                  ),
                )
            ),
          ),
        ),
        Gap(20),
        Text("$fotter",style: TextStyle(fontSize: 12.sp,color: Color(0xff8E8E8E)),)
      ],
    );
  }
}