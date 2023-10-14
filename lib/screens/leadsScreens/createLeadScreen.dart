import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
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
           child: Column(
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
                           Expanded(
                             child: Container(
                               alignment: Alignment.center,
                               height: 60.h,
                               decoration: BoxDecoration(border:
                               lp.submittedDocumentsUpload==true?
                               Border.all(color: mainColor):null,borderRadius: BorderRadius.circular(100)),
                               child: Text("Documents\nDetails",textAlign: TextAlign.center,style: TextStyle(height: 1.2,color:lp.inDocumentsUpload==true? mainColor:Colors.black),),
                             ),
                           ),

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
                             Expanded(
                               child: Container(
                                 alignment: Alignment.center,
                                 height: 25.h,
                                 width: 25.w,
                                 decoration: BoxDecoration(shape: BoxShape.circle,color: lp.inDocumentsUpload==true?mainColor:dotGrayColor),
                                 child:  Text("03",style: TextStyle(color: lp.inDocumentsUpload==true?Colors.white:Colors.black,fontWeight: FontWeight.bold),),

                               ),
                             ),




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
         ),
       ),
      ),
    );
  }


  Widget PersonalDetailWidget(LeadProvider lp){
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                TextFieldCustom(
                  hint: "",clt: lp.nameClt,
                  title: "Name",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
                TextFieldCustom(
                  hint: "",clt: lp.mobileClt,
                  title: "Mobile Number",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
                TextFieldCustom(
                  hint: "",clt: lp.emailClt,
                  title: "Email",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
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
                  title: "PAN Number",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
                CustomizeDatePicker(clt: lp.dobClt,text: "Date Of Birth"),
                Gap(25.h),
                TextFieldCustom(
                  hint: "",clt: lp.motherNameClt,
                  title: "Mother's Name",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
              ],
            ),
          ),
          CustomNextButton(
            onTap: (){
              lp.changeEmployeeDetailSumbiterd();
            },
          )
        ],
      ),
    );
  }
  Widget EmployeeDetailWidget(LeadProvider lp,Size size){
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
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
                    CustomRadioButton(title: "Salaried",color: lp.gender=="Salaried"?mainColor:grayColor2,onTap: (){
                      lp.changeGender("Salaried");
                    },
                      textColor: lp.gender=="Salaried"?mainColor:textgrayColor,
                    ),
                    CustomRadioButton(title: "Self-employed",color: lp.gender=="Self-employed"?mainColor:grayColor2,
                      onTap: (){
                        lp.changeGender("Self-employed");
                      },
                      textColor: lp.gender=="Self-employed"?mainColor:textgrayColor,),

                  ],
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
                          value: lp.selectedState,
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
                          value: lp.selectedCity,
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
                Gap(25.h),
                TextFieldCustom(
                  hint: "",clt: lp.pinCodeClt,
                  title: "PIN Code",
                  type: TextInputType.number,
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
                Row(
                  children: [
                    Text(
                      'Residence type',
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
                    CustomRadioButton(title: "Owned",color: lp.gender=="Owned"?mainColor:grayColor2,onTap: (){
                      lp.changeGender("Owned");
                    },
                      textColor: lp.gender=="Owned"?mainColor:textgrayColor,
                    ),
                    CustomRadioButton(title: "Rented",color: lp.gender=="Rented"?mainColor:grayColor2,
                      onTap: (){
                        lp.changeGender("Rented");
                      },
                      textColor: lp.gender=="Rented"?mainColor:textgrayColor,),

                  ],
                ),


                Gap(25.h),
                TextFieldCustom(
                  hint: "",clt: lp.requiredLoanAmountClt,
                  title: "Required Loan amount",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
                TextFieldCustom(
                  hint: "",clt: lp.monthlyIncomeClt,
                  title: "Monthly Income",
                  textCapitalization: TextCapitalization.characters,
                ),

                Gap(25),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Loan Type',
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
                          value: lp.selectedLoanType,
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


                Gap(25.h),

                TextFieldCustom(
                  hint: "",clt: lp.completeResidenceAddressClt,
                  showRequried: false,
                  title: "Complete Residence address",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),

                TextFieldCustom(
                  hint: "",clt: lp.completeOfficeAddressClt,
                  showRequried: false,
                  title: "Complete office address",
                  textCapitalization: TextCapitalization.characters,
                ),
                Gap(25.h),
              ],
            ),
          ),
          CustomNextButton(
            onTap: (){
              lp.changeDocumentUploadSumbiterd();
            },
          )
        ],
      ),
    );
  }
  Widget DocumentUploadeWidget(LeadProvider lp,Size size){
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                Gap(15),
                DoteddedContainer2(label: 'Upload PAN Card', placeholder: 'Choose File',onTap: (){},fotter: "",),

                DoteddedContainer2(label: 'Upload Aadhaar Card', placeholder: 'Choose File',onTap: (){},fotter: "",),
                Row(
                  children: [
                    Text(
                      'Is this your current address?',
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
                    CustomRadioButton(title: "Yes",color: lp.gender=="Yes"?mainColor:grayColor2,onTap: (){
                      lp.changeGender("Yes");
                    },
                      textColor: lp.gender=="Yes"?mainColor:textgrayColor,
                    ),
                    CustomRadioButton(title: "No",color: lp.gender=="No"?mainColor:grayColor2,
                      onTap: (){
                        lp.changeGender("No");
                      },
                      textColor: lp.gender=="No"?mainColor:textgrayColor,),

                  ],
                ),

                Gap(25.h),

                DoteddedContainer2(label: 'Income Proof', placeholder: 'Choose File',onTap: (){},fotter: "Last 2 yrs ITR or 3 Months Payslip",),

                Gap(25.h),
                DoteddedContainer2(label: 'Bank Statement', placeholder: 'Choose File',onTap: (){},fotter: "1 year Statement or 6 Months Statement",),


                Gap(25.h),


                Row(
                  children: [
                    Text(
                      'Business Registration Proof',
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
                    CustomRadioButton(title: "GST Certificate",color: lp.gender=="GST Certificate"?mainColor:grayColor2,onTap: (){
                      lp.changeBRPType("GST Certificate");
                    },
                      textColor: lp.gender=="GST Certificate"?mainColor:textgrayColor,
                    ),
                    CustomRadioButton(title: "Sales and income tax returns",color: lp.gender=="Sales and income tax returns"?mainColor:grayColor2,
                      onTap: (){
                        lp.changeBRPType("Sales and income tax returns");
                      },
                      textColor: lp.gender=="Sales and income tax returns"?mainColor:textgrayColor,),

                  ],
                ),
              ],
            ),
          ),
          CustomNextButton(
            onTap: (){
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