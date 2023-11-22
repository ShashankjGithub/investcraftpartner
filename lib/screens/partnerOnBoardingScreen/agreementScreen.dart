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

import '../../config/themeConfig.dart';
import '../../generated/assets.dart';
import '../../widgets/dottedContainer.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
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
          GestureDetector(
            onTap: (){
              pp.downloadeAggreement(context);
            },
            child: Container(
              height: 60.h,
              width: size.width,
              child: DottedBorder(
                  color: mainColor,
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
                              getPlaceHolder(label: "VIEW_AGGREMENT_PLACEHOLDER", form: pf.agreement!),
                              maxLines: 2,
                              style: TextStyle(color: mainColor,fontSize: 16.sp),
                            ),
                          ),
                          SvgPicture.asset(Assets.assetsEve,height: 30.h,width: 30.w,),

                        ],
                      ),
                    ),
                  )
              ),
            ),
          ),
          Gap(20.h),
          Divider(thickness: 2,),
          Text(
            'View the sign agreement and click on the button to get the e-sign link.',
            style: TextStyle(
              color: Color(0xFF8E8E8E),
              fontSize: 13,
              height: 1.5,
              fontWeight: FontWeight.w400,

            ),
          ),
        ],
      ),
    );
  }
}
