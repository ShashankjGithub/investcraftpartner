import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PartnerOnBoardingProvider pp = context.watch<PartnerOnBoardingProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${pf.congratulation!.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            "${pf.congratulation!.content}",
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),

          Container(
            height: 430.h,
            width: size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 390.h,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFCA377),
                        Color(0xffDC6BB1),
                        Color(0xffD868BB),
                        Color(0xff6B7DAE),
                      ]
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aayush Sharma',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,

                        ),
                      ),
                      Gap(15),
                      Container(
                        width: 286,
                        height: 262,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(
                            Assets.assetsQr
                          ))
                        ),
                      ),
                      Gap(15),
                      Text(
                        'Scan to Get Insta Loan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(Assets.assetsCon),

                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
