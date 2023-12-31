import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/themeConfig.dart';

class CustomNextButton extends StatelessWidget {
   CustomNextButton({super.key, this.onTap, this.title, this.showArrow});
 final Function()? onTap;
 final String?title;
 final bool? showArrow;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title??'Next',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  ),
              ),
              Gap(5),
              if(showArrow==null)
              Icon(Icons.arrow_circle_right,color: Colors.white,size: 18,)
            ],
          ),
        ),
      ),
    );
  }
}
