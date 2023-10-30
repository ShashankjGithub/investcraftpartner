import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/generated/assets.dart';
import 'package:investcraftpartner/screens/leadsScreens/leadProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../config/themeConfig.dart';
import 'leadDetailScreen.dart';

class ViewLeadScreen extends StatefulWidget {
  const ViewLeadScreen({super.key});

  @override
  State<ViewLeadScreen> createState() => _ViewLeadScreenState();
}

class _ViewLeadScreenState extends State<ViewLeadScreen> {
  int _currentIndex = 0;


  ValueNotifier currentIndex = ValueNotifier(-1);
  changeCurrentIndex(value){
    currentIndex.value = value;
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
    ));
    final LeadProvider lp = context.watch<LeadProvider>();
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(25.h),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View Leads',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,

                      fontWeight: FontWeight.w700,

                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsFilter),
                      Gap(10),
                      Text(
                        'Filter',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
              child: Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                height: 56.h,
                width: size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color:Color(0xFF66707F) )),
               child:  Row(
                 children: [
                   SvgPicture.asset(Assets.assetsSearchIcon),
                   Gap(10),
                   Expanded(child: TextFormField(
                     decoration: InputDecoration(
                       hintStyle: TextStyle(
                         fontSize: 15
                       ),
                       hintText: "Search lead via id, name, mobile number etc.",
                       border: InputBorder.none,
                     ),
                   )),
                 ],
               ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
                child:
                lp.noLeadList==true?Center(child: Text("No Lead Found"),):
                    lp.leadsList.isEmpty?Center(child: CircularProgressIndicator(color: mainColor,),):

                ValueListenableBuilder(
                    valueListenable: currentIndex,
                    builder: (context,value,_) {
                      return Container(
                          padding: EdgeInsets.only(top: 20,),
                          decoration: BoxDecoration(border: Border.all(color: bordercolor),borderRadius: BorderRadius.circular(30)),
                          child: ListView(
                            children: List.generate(
                                lp.leadsList.length, (index) {

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'App ID',
                                                      style: TextStyle(
                                                        color: Color(0xFF66707F),
                                                        fontSize: 15,

                                                        fontWeight: FontWeight.w400,

                                                      ),
                                                    ),
                                                    Gap(8),
                                                    Text(
                                                      '${lp.leadsList[index].leadNumber}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,

                                                        fontWeight: FontWeight.w600,

                                                      ),
                                                    ),
                                                  ],),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'App.Status',
                                                      style: TextStyle(
                                                        color: Color(0xFF66707F),
                                                        fontSize: 15,

                                                        fontWeight: FontWeight.w400,

                                                      ),
                                                    ),
                                                    Gap(8),
                                                    Text(
                                                      '${lp.leadsList[index].leadStatus}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w600,

                                                      ),
                                                    ),
                                                  ],),
                                                InkWell(
                                                  onTap: (){
                                                    if(value==index){
                                                      changeCurrentIndex(-1);
                                                    }else{
                                                      changeCurrentIndex(index);
                                                    }
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 25.h,
                                                    width: 25.w,
                                                    decoration: BoxDecoration(shape: BoxShape.circle,color: value==index?mainColor:Colors.black),
                                                    child:
                                                    value==index?
                                                    Icon(Icons.remove,size: 18,color: Colors.white,):Icon(Icons.add,size: 18,color: Colors.white,),
                                                  ),
                                                ),

                                              ],
                                            ),
                                            if (value==index)
                                              Column(
                                                children: [
                                                  Gap(25.h),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Name',
                                                            style: TextStyle(
                                                              color: Color(0xFF66707F),
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,

                                                            ),
                                                          ),
                                                          Gap(8),
                                                          Text(
                                                            '${lp.leadsList[index].firstName}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],),
                                                      Gap(58.w),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Request Date',
                                                            style: TextStyle(
                                                              color: Color(0xFF66707F),
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,

                                                            ),
                                                          ),
                                                          Gap(8),
                                                          Text(
                                                            '${DateFormat("dd MMM yy").format(lp.leadsList[index].createdAt)}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],),

                                                    ],
                                                  ),
                                                  Gap(20.h),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Loan Amount',
                                                            style: TextStyle(
                                                              color: Color(0xFF66707F),
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,

                                                            ),
                                                          ),
                                                          Gap(8),
                                                          Text(
                                                            "${lp.leadsList[index].loanAmount}",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],),
                                                      Gap(60.w),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Action',
                                                            style: TextStyle(
                                                              color: Color(0xFF66707F),
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,

                                                            ),
                                                          ),
                                                          Gap(8),
                                                          InkWell(
                                                            onTap:(){
                                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                                return LeadDetailScreen(data: lp.leadsList[index],);
                                                              }));

                                                            },
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'View Detail',
                                                                  style: TextStyle(
                                                                    color: mainColor,
                                                                    fontSize: 14.sp,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                                Gap(3),
                                                                Icon(Icons.arrow_forward_ios_sharp,color: mainColor,size: 15,)
                                                              ],
                                                            ),
                                                          ),
                                                        ],),

                                                    ],
                                                  ),
                                                ],
                                              )
                                          ],
                                        ),
                                      ),
                                      if(index != 3)
                                        Divider(thickness: 1,)
                                    ],
                                  ),
                                ),
                              );
                            }),
                          )
                      );
                    }
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
