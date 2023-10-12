import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:provider/provider.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Congratulations!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            'Your QR code is Generated\n',
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),
          Gap(15),
          TextFieldCustom(
            hint: "",clt: pp.nameClt,
            title: "Name (as per pan card )",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.emailIDClt,
            title: "Email ID",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.phoneNumberClt,
            title: "Phone Number",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.businessTypeClt,
            title: "Business Type",
            textCapitalization: TextCapitalization.characters,
          ),
        ],
      ),
    );
  }
}
