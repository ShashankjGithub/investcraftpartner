import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';
import 'leadProvider.dart';

class CreateLeadScreen extends StatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
    ));
    final Size size = MediaQuery.of(context).size;
    final LeadProvider lp = context.watch<LeadProvider>();
    return  Scaffold(
     body: SafeArea(
       child: Container(
         padding: EdgeInsets.only(top: 40,left: 15,right: 15,bottom: 10),
         height: size.height,
         width: size.width,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               'Create Lead',
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 24,
                 fontWeight: FontWeight.w700,
               ),
             ),
             Gap(25),
             Container(
               alignment: Alignment.bottomCenter,
               height: 60.h,
               child: Container(
                 height: 54.h,
                 width: size.width,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: bordercolor)),
                 child: Row(
                   children: [
                     Expanded(
                       child: Container(
                         height: 60.h,
                         child: Stack(
                           alignment: Alignment.bottomCenter,
                           children: [
                             Container(
                               height: 40.h,
                               decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(100)),

                             ),
                             Positioned(
                               top: 0,
                               child: Container(
                                 height: 25.h,
                                 width: 25.w,
                                 decoration: BoxDecoration(color: mainColor,shape: BoxShape.circle),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         height: 60.h,
                         decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(100)),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         height: 60.h,
                         decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(100)),
                       ),
                     ),

                   ],
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
