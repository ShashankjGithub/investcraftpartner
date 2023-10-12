import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../config/themeConfig.dart';
import '../generated/assets.dart';

class DoteddedContainer extends StatelessWidget {
  DoteddedContainer({
    super.key, required this.label, required this.placeholder, required this.onTap,
    this.file
  });
  String label;
  String placeholder;
  GestureTapCallback onTap;
  FilePickerResult? file;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$label',
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
        Gap(20),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60.h,
            width: size.width,
            child: DottedBorder(
                color: Color(0xff66707F),
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
                            file!=null?file!.files[0].name:
                            placeholder,
                            maxLines: 2,
                            style: TextStyle(color: Color(0xff66707F),fontSize: 16.sp),
                          ),
                        ),
                        SvgPicture.asset(Assets.assetsUploadIcon,height: 30.h,width: 30.w,),

                      ],
                    ),
                  ),
                )
            ),
          ),
        ),
        Gap(20),
        Text("File must be JPG, GIF or PNG less than 1MB.",style: TextStyle(fontSize: 12.sp,color: Color(0xff8E8E8E)),)
      ],
    );
  }
}