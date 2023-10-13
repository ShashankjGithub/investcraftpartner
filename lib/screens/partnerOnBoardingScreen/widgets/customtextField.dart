
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/themeConfig.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key, required this.hint, this.readonly, this.suffixIcon, this.maxLine, this.height, this.alignment, this.topAliment,  this.clt, this.type, this.textCapitalization, this.focusNode, this.onChanged, this.validator, this.showRequried, required this.title, this.obscureText,

  });
  final TextEditingController? clt;
  final String hint;
  final bool? readonly;
  final Widget? suffixIcon;
  final int? maxLine;
  final double? height;
  final AlignmentGeometry? alignment;
  final double? topAliment;
  final TextInputType? type;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? showRequried;
  final String title;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$title',
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
          alignment: alignment??Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 8,top: topAliment??0),
          height: height??60.h,
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
          child: TextFormField(
            obscureText: obscureText??false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            onChanged: onChanged,
            focusNode: focusNode,
            textCapitalization: textCapitalization??TextCapitalization.none,
            keyboardType: type,
            controller: clt,
            maxLines: maxLine==null?1:null,
            readOnly: readonly??false,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: Color(0xff5B6469)),
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.fromLTRB(0, suffixIcon!=null?15:0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }
}