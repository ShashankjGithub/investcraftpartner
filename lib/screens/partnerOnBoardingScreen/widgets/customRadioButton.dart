import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key, required this.title, this.onTap, required this.color, required this.textColor,

  });

  final String title;
  final Function()? onTap;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap:onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 18.h,
                width: 18.w,
                decoration: BoxDecoration(color: color,shape: BoxShape.circle),
                child: Icon(Icons.check,size: 15,color: Colors.white,),
              ),
              Gap(10),
              Expanded(
                child: Text(
                  '$title',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}