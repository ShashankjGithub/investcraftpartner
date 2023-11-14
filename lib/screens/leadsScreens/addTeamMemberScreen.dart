import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/providers/teamProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:investcraftpartner/services/getLabels.dart';
import 'package:investcraftpartner/widgets/lodingWidget.dart';
import 'package:provider/provider.dart';

import '../partnerOnBoardingScreen/widgets/nextButton.dart';
import 'leadProvider.dart';

class AddTeamMemberScreen extends StatefulWidget {
  const AddTeamMemberScreen({super.key});

  @override
  State<AddTeamMemberScreen> createState() => _AddTeamMemberScreenState();
}

class _AddTeamMemberScreenState extends State<AddTeamMemberScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    final TeamProvider pp = context.watch<TeamProvider>();
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: pp.teamCreateKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Team Member",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Gap(5),
                          Text(
                            "Fill basic Detail",
                            style: TextStyle(
                              color: Color(0xFFD7206A),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                          Gap(15),
                          TextFieldCustom(
                            hint: "",clt: pp.nameteamClt,
                            title: getLabel(label: "NAME_LABEL", form: pf.basicDetail!),
                            textCapitalization: TextCapitalization.characters,
                            validator: (val){
                              if (val!.isEmpty) {
                                return getLabel(label: "NAME_LABEL", form: pf.basicDetail!);
                              }
                            },
                          ),
                          Gap(20),
                          TextFieldCustom(
                            hint: "",clt: pp.emailIDClt,
                            title: getLabel(label: "EMAIL_LABEL", form: pf.basicDetail!),
                            textCapitalization: TextCapitalization.characters,
                            validator: (val){
                              if (val!.isEmpty) {
                                return getLabel(label: "EMAIL_LABEL", form: pf.basicDetail!);
                              }
                            },
                          ),
                          Gap(20),
                          TextFieldCustom(
                            hint: "",clt: pp.phoneNumberClt,
                            title:  getLabel(label: "PHONE_NUMBER_LABEL", form: pf.basicDetail!),
                            textCapitalization: TextCapitalization.characters,
                            validator: (val){
                              if (val!.isEmpty) {
                                return getLabel(label: "PHONE_NUMBER_LABEL", form: pf.basicDetail!);
                              }
                            },
                          ),
                          Gap(20),
                          TextFieldCustom(
                            hint: "",clt: pp.businessTypeClt,
                            title: getLabel(label: "BUSSINESS_TYPE_LABEL", form: pf.basicDetail!),
                            textCapitalization: TextCapitalization.characters,
                            validator: (val){
                              if (val!.isEmpty) {
                                return getLabel(label: "BUSSINESS_TYPE_LABEL", form: pf.basicDetail!);
                              }
                            },
                          ),

                        ],
                      ),
                    ),
                    CustomNextButton(
                      onTap: (){
                       pp.saveBasicDetail(context);
                      },
                      title: "Save"
                    )
                  ],
                ),
              ),
            ),
          ),
          if(pp.loading)
            LoadingWidget()
        ],
      ),
    );
  }
}
