import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/personalDetailScreen.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/agreementScreen2.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/nextButton.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:investcraftpartner/widgets/backgroundwidget.dart';
import 'package:investcraftpartner/widgets/lodingWidget.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import 'agreementScreen.dart';
import 'bankAccountDetailsScreens.dart';
import 'basicDetailScreen.dart';
import 'businessDetailScreen.dart';
import 'congratulationsScreen.dart';
import 'kycDetailsScreen.dart';

class PartnerOnboardingScreen extends StatefulWidget {
  final String status;
  const PartnerOnboardingScreen({super.key, required this.status});

  @override
  State<PartnerOnboardingScreen> createState() => _PartnerOnboardingScreenState();
}

class _PartnerOnboardingScreenState extends State<PartnerOnboardingScreen> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PartnerOnBoardingProvider>().changeStatus(widget.status);

    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
    ));
    final PartnerOnBoardingProvider pp = context.watch<PartnerOnBoardingProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    return  Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  alignment: Alignment.center,
                  height: 128.h,
                  width: size.width,
                  decoration: BoxDecoration(color: mainColor,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        pp.currentStep == 1?
                        Container(
                          padding: EdgeInsets.only(left: 5,right: 5),
                          alignment: Alignment.center,
                          height: 22.h,
                          width: 75.w,

                        ):
                        InkWell(
                          onTap: (){
                            pp.previousButtonPressed();
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 5,right: 5),
                            alignment: Alignment.center,
                            height: 22.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                                color: Color(0xFFAE0E4F),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back_ios,size: 10,color: Colors.white,),
                                Gap(10),
                                Text(
                                  'Previous',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            DottedBorder(
                              color: Colors.white,
                              strokeWidth: 1,
                              padding: EdgeInsets.all(8),
                              radius: Radius.circular(500),
                              borderType: BorderType.Circle,
                              child:   Text(
                                '0${pp.currentStep}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                            Gap(10),
                            Text(
                              '${pp.currentForm}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        pp.currentStep == 7?Container(
                          padding: EdgeInsets.only(left: 5,right: 5),
                          alignment: Alignment.center,
                          height: 22.h,
                          width: 75.w,

                        ):
                        InkWell(
                          onTap: (){
                            pp.nextButtonPressed();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 22.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                              color: Color(0xFFAE0E4F),
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                Gap(10),
                                Icon(Icons.arrow_forward_ios_sharp,size: 10,color: Colors.white,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child:
                BackgroundWidget(
                  topposition: 90.0,
                  child: Consumer<PartnerOnBoardingProvider>
                    (builder: (context,value,_){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25,left: 8,right: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap:()async{

                                      },
                                      child: Text("In Progress : ",style: TextStyle(color: textgrayColor,fontSize: 15.sp,fontWeight: FontWeight.w400),)),
                                  Text("${value.persent}%",style: TextStyle(color: mainColor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Gap(15.h),
                              Container(
                                  height: 15.h,
                                  width: size.width,
                                  decoration: BoxDecoration(color: Color(0xfff4f4f4),borderRadius: BorderRadius.circular(100)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            curve: Curves.linear,
                                            height: 12.h,
                                            width: size.width/value.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xffD144AE),
                                                      Color(0xffF96434),

                                                    ]
                                                )
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            curve: Curves.linear,
                                            height: 12.h,
                                            width: size.width/value.w,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: List.generate(value.currentStep, (i) {
                                                return AnimatedContainer(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.linear,
                                                  height: 6.h,
                                                  width: 6.w,
                                                  decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                                                );
                                              }),
                                            ),
                                          )

                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),

                        Flexible(
                          fit: FlexFit.loose,
                          child: PageView(
                            allowImplicitScrolling: true,
                            controller: value.pageController,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    BasicDetailScreen(),
                                    Gap(15),
                                    CustomNextButton(
                                      onTap: (){
                                        pp.saveBasicDetail(context);
                                      },
                                      title: getLabel(label: "NEXT", form: pf.basicDetail!),
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    PersonalDetailScreen(),
                                    Gap(15),
                                    CustomNextButton(
                                      onTap: (){
                                        pp.savePersonalDetail(context);
                                      },
                                      title:  getLabel(label: "NEXT", form: pf.personalDetailFromData!),
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    BusinessDetailScreen(),
                                    Gap(15),
                                    CustomNextButton(
                                      onTap: (){
                                        pp.saveBusinessDetail(context);
                                      },
                                      title:  getLabel(label: "NEXT", form: pf.businessDetails!),
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    BankAccountDetailScreen(),
                                    Gap(15),
                                    CustomNextButton(
                                      onTap: (){
                                        pp.saveBankDetail(context);
                                      },
                                      title:  getLabel(label: "NEXT", form: pf.bankDetails!),
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    KycDetailsScreen(),
                                    Gap(15),
                                    CustomNextButton(
                                      onTap: (){
                                        if(pp.panCardFile==null){
                                          Fluttertoast.showToast(msg: "Choose Pan Card");
                                        }else if (pp.aadhaarCardFile==null) {
                                          Fluttertoast.showToast(msg: "Choose Aadhar Card");
                                        }  else if (pp.passportCardFile==null) {
                                          Fluttertoast.showToast(msg: "Choose Passport Card");
                                        }else if (pp.businessCardFile==null) {
                                          Fluttertoast.showToast(msg: "Choose Business photo");
                                        }else{
                                          pp.saveKycDetails(context);
                                        }

                                      },
                                      title:  getLabel(label: "NEXT", form: pf.kycDetail!),
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    AgreementScreen(),
                                    Gap(15),
                                    CustomNextButton(
                                      title: "Send Agreement E-sign Link",
                                      onTap: (){
                                        pp.saveAgreement(context);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Agreement2Screen(),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    );
                  }),
                )),
              ],
            ),
            if(pp.loading)
            LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
