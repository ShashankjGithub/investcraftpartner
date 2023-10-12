import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bank Account Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(5),
          Text(
            'Verify you bank account details\n',
            style: TextStyle(
              color: Color(0xFFD7206A),
              fontSize: 16,
              fontWeight: FontWeight.w400,

            ),
          ),
          Gap(15),
          TextFieldCustom(
            hint: "",clt: pp.bankAccountNumberClt,
            title: "Account Number",
            textCapitalization: TextCapitalization.characters,
          ),
          Gap(20),
          TextFieldCustom(
            hint: "",clt: pp.bankIFSCClt,
            title: "IFSC Code",
            textCapitalization: TextCapitalization.characters,
          ),

          Gap(25),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Bank Name',
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
                    validator: (vv){},
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 15)
                    ),
                    iconStyleData: IconStyleData(
                        icon: SvgPicture.asset(Assets.assetsDropdownicon)),
                    isExpanded: true,
                    hint: Text(
                      "Select bank name",
                      style: TextStyle(color: Color(0xff5B6469), fontSize: 15),
                    ),
                    items: []
                        .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(color: Color(0xff5B6469)),
                      ),
                    ))
                        .toList(),
                    value: pp.selectedBankName,
                    onChanged: (value) {

                    },
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      width: 200,
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownStyleData: DropdownStyleData(width: 200),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
