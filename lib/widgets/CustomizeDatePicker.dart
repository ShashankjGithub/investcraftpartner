import 'package:date_time_picker/date_time_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/themeConfig.dart';

Widget CustomizeDatePicker(
    {required TextEditingController clt,
    required String text,
      DateTime?intialDate,
      bool? showRequried,
    String? Function(String?)? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            '$text',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(5),
          if(showRequried==null)
            Text("*",style: TextStyle(color: mainColor,fontSize: 16.sp),)
        ],
      ),
      Gap(15.h),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 20, right: 8,),
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(100)),
        child: DateTimePicker(
          dateMask: "dd/MM/yyyy",
          controller: clt,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xff5B6469)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
              border: InputBorder.none,
              ),
          firstDate: DateTime(-21000),
          initialDate: intialDate??DateTime.now(),
          lastDate: DateTime(20000),
          onChanged: (val) {},
          autovalidate: true,
          validator: validator,
          onSaved: (val) {},
        ),
      ),
    ],
  );
}
