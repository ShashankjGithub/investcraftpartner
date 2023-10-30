import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/config/themeConfig.dart';
import 'package:investcraftpartner/generated/assets.dart';

import '../leadsScreens/createLeadScreen.dart';
import '../partnerOnBoardingScreen/basicDetailOnboardingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              height: 230.h,
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 210.h,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 50),
                        child: SafeArea(
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 23.r,
                                        backgroundColor: Colors.grey[200],
                                        child: Image.asset(Assets.assetsKapil),
                                      ),
                                      Gap(17),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hi, Kapil',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Gap(10),
                                          Text(
                                            '55 Total Cases',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Earnings',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Gap(5),
                                    Text(
                                      '₹ 1,25,000',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return CreateLeadScreen();
                              }));
                              // Navigator.push(context, MaterialPageRoute(builder: (context){
                              //   return PartnerOnboardingScreen();
                              // }));
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: 51.h,
                              decoration: BoxDecoration(
                                color: Color(0xffFABF4C),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Create Lead',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SvgPicture.asset(Assets.assetsPluseIcon)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Gap(15),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 51.h,
                            decoration: BoxDecoration(
                              color: Color(0xffFFE4AE),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Add Team',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SvgPicture.asset(Assets.assetsPluseIcon)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 20, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DecoractionContainer(
                          number: "15",
                          title: "In Progress",
                        ),
                        Gap(20),
                        DecoractionContainer(
                          number: "12",
                          title: "Disburesed",
                        ),
                        Gap(20),
                        DecoractionContainer(
                          number: "35",
                          title: "Submitted",
                        ),
                      ],
                    ),
                    Gap(20.h),
                    Container(
                      padding: EdgeInsets.only(top: 19,bottom: 19,left: 10,right: 10),
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Color(0xCFFDF8F2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello Investor',
                                  style: TextStyle(
                                    color: Color(0xFFFA7038),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Gap(10),
                                Text(
                                  'Refer Business or Property Loan and earn up to ₹1 Lakh per case!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5
                                  ),
                                ),
                                Gap(10),
                                Container(
                                  alignment: Alignment.center,
                                  height: 26.h,
                                  width: 81.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color(0xFFFA7038)),
                                  child: Text(
                                    'Refer Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(10),
                          SvgPicture.asset(Assets.assetsReferal1)
                        ],
                      ),
                    ),
                    Gap(25.h),
                    Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                      width: size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: bordercolor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Products',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,

                            ),
                          ),
                          Gap(15.h),
                          Row(
                            children: [
                              OurProductContainer(showOffer: false,title: "Personal\nLoan",imageUrl: Assets.assetsPersonaLoan,),
                              OurProductContainer(showOffer: true,title: "Insurance\nProduct",imageUrl: Assets.assetsInsuranceProduct,),
                              OurProductContainer(showOffer: false,title: "Credit\nCard",imageUrl: Assets.assetsCreditCard,),
                              OurProductContainer(showOffer: false,title: "View\nMore",imageUrl: Assets.assetsViewAll,),

                            ],
                          ),

                        ],
                      ),
                    ),
                    Gap(25.h),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class OurProductContainer extends StatelessWidget {
  const OurProductContainer({
    super.key, required this.showOffer, required this.title, required this.imageUrl,
  });
  final bool showOffer;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          showOffer==false?SizedBox():
          Container(
            width: 42.w,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 2,bottom: 2,left: 5,right: 5),
            decoration: BoxDecoration(color: Color(0xFFFABF4C),borderRadius: BorderRadius.circular(100)),
            child: Text(
              'Offers',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 8.h,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Gap(8),
          SvgPicture.asset(imageUrl),
          Gap(8),
          Text(
            '$title',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class DecoractionContainer extends StatelessWidget {
  const DecoractionContainer({
    super.key,
    required this.number,
    required this.title,
  });

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        height: 92.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: bordercolor)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  Assets.assetsFinalLogo,
                  height: 10,
                  width: 9,
                )
              ],
            ),
            Text(
              '$number',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mainColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(5.h),
            Text(
              '$title',
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
