import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:provider/provider.dart';

import '../../../config/themeConfig.dart';
import '../../../generated/assets.dart';



class Agreement2Screen extends StatefulWidget {
  const Agreement2Screen({super.key});

  @override
  State<Agreement2Screen> createState() => _Agreement2ScreenState();
}

class _Agreement2ScreenState extends State<Agreement2Screen> {
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
            '${pf.agreement!.title}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            "${pf.agreement!.content}",
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),
          Gap(10),

          Gap(20.h),
          Text(
            'Contract sign link has been sent your registered email and mobile number. \n\nPlease sign digitally. After signing contract we will proceed you next level.',
            style: TextStyle(
              color: Color(0xFF5B6469),
              fontSize: 16,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          Gap(20.h),
          Container(
            padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
            decoration: ShapeDecoration(
              color: Color(0x47FFF0CC),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFDDDDDD)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline,size: 20,),
                Gap(10),
                Expanded(
                  child : Text(
                    'You Will Receive the Partner Application Status on your both Whats App Number and Email Id within 24 to 48 hours.',
                    style: TextStyle(
                      color: Color(0xFF66707F),
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
