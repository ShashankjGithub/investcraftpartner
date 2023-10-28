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

class KycDetailsScreen extends StatefulWidget {
  const KycDetailsScreen({super.key});

  @override
  State<KycDetailsScreen> createState() => _KycDetailsScreenState();
}

class _KycDetailsScreenState extends State<KycDetailsScreen> {
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
            '${pf.kycDetail!.title}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            pf.kycDetail!.content.toString(),
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),
          Gap(15),
          DoteddedContainer(label: getLabel(label: "UPLOAD_PAN_FILE", form: pf.kycDetail!), placeholder: getPlaceHolder(label: "PANFILE_PLACEHOLDER", form: pf.kycDetail!),onTap: (){},),
          Gap(15),
          DoteddedContainer(label: getLabel(label: "UPLOAD_AADHAR_FILE", form: pf.kycDetail!), placeholder: getPlaceHolder(label: "UPLOAD_AADHAR_FIEL_PLACEHOLDER", form: pf.kycDetail!),onTap: (){},),
          Gap(15),
          DoteddedContainer(label: getLabel(label: "UPLOAD_PASSPORT_SIZE_FILE", form: pf.kycDetail!), placeholder: getPlaceHolder(label: "UPLOAD_PASSPORT_SIZE_PHOTO_PLACEHOLDER", form: pf.kycDetail!),onTap: (){},),
          Gap(15),
          DoteddedContainer(label: getLabel(label: "UPLOAD_BUSSINESS_PHOTO_LABEL", form: pf.kycDetail!), placeholder: getPlaceHolder(label: "UPLOAD_BUSSINESS_PHOTO_PLACEHOLDER", form: pf.kycDetail!),onTap: (){},),
        ],
      ),
    );
  }
}
