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

class BankAccountDetailScreen extends StatefulWidget {
  const BankAccountDetailScreen({super.key});

  @override
  State<BankAccountDetailScreen> createState() => _BankAccountDetailScreenState();
}

class _BankAccountDetailScreenState extends State<BankAccountDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PartnerOnBoardingProvider pp = context.watch<PartnerOnBoardingProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Form(
        key: pp.bankDetailKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${pf.bankDetails!.title}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(5),
            Text(
              "${pf.bankDetails!.content}",
              style: TextStyle(
                color: Color(0xFFD7206A),
                fontSize: 16,
                fontWeight: FontWeight.w400,

              ),
            ),
            Gap(15),
            TextFieldCustom(
              hint: "",clt: pp.bankAccountNumberClt,
              title: getLabel(label: "ACCOUNT_NUMBER_LABEL", form: pf.bankDetails!),

              validator: (val){
                if (val!.isEmpty) {
                  return "Please enter account number";
                }
              },
            ),
            Gap(20),
            TextFieldCustom(
              hint: "",clt: pp.bankIFSCClt,
              title: getLabel(label: "IFSC_CODE_LABEL", form: pf.bankDetails!),

              validator: (val){
                if (val!.isEmpty) {
                  return "Please enter IFSC code";
                }
              },
            ),

            Gap(25),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      getLabel(label: "BANK_NAME-_LABEL", form: pf.bankDetails!),
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
                      validator: (vv){
                        if (vv==null) {
                          return  "Please select bank";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 15,left: 15)
                      ),
                      iconStyleData: IconStyleData(
                          icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                      isExpanded: true,
                      hint: Text(
                        getPlaceHolder(label: "SELECT_BANK", form: pf.bankDetails!),
                        style: TextStyle(color: Color(0xff5B6469), fontSize: 15,fontWeight: FontWeight.w400),
                      ),
                      items: pf.bankDetails!.element.firstWhere((element) => element.key == "SELECT_BANK").list
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.value!,
                          style: TextStyle(color: Color(0xff5B6469),fontWeight: FontWeight.w400),
                        ),
                      ))
                          .toList(),
                      value: pp.selectedBankName,
                      onChanged: (value) {
                        pp.changeSelectBank(value);
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                        height: 40,

                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 40,

                      ),
                      dropdownStyleData: DropdownStyleData(width: 300,padding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
