import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:provider/provider.dart';

class BasicDetailScreen extends StatefulWidget {
  const BasicDetailScreen({super.key});

  @override
  State<BasicDetailScreen> createState() => _BasicDetailScreenState();
}

class _BasicDetailScreenState extends State<BasicDetailScreen> {
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
            "${pf.basicDetail!.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            "${pf.basicDetail!.content}",
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),
          Gap(15),
          TextFieldCustom(
            hint: "",clt: pp.nameClt,
            title: getLabel(label: "NAME_LABEL", form: pf.basicDetail!),
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.emailIDClt,
            title: getLabel(label: "EMAIL_LABEL", form: pf.basicDetail!),
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.phoneNumberClt,
            title:  getLabel(label: "PHONE_NUMBER_LABEL", form: pf.basicDetail!),
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.businessTypeClt,
            title: getLabel(label: "BUSSINESS_TYPE_LABEL", form: pf.basicDetail!),
            textCapitalization: TextCapitalization.characters,
          ),
        ],
      ),
    );
  }
}
