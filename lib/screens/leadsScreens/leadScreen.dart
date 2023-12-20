import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/teamProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../config/themeConfig.dart';

class LeadScreen extends StatefulWidget {
  const LeadScreen({super.key});

  @override
  State<LeadScreen> createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
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
    final TeamProvider tp = context.watch<TeamProvider>();
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(25.h),
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
                child: Text(
                  'My Team',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
                child: ValueListenableBuilder(
                    valueListenable: currentIndex,
                    builder: (context,value,_) {
                      return
                        tp.noTeamMember==true?Center(child: Text("No Team Member Found"),):
                            tp.dataTeam.isEmpty?Center(child: CircularProgressIndicator(),):
                        RefreshIndicator(
                          onRefresh: ()async{
                            tp.getTeamMembers(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20,),
                            decoration: BoxDecoration(border: Border.all(color: bordercolor),borderRadius: BorderRadius.circular(30)),
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: List.generate(tp.dataTeam.length, (index) {
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
                                                    Container(

                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Partner ID',
                                                            style: TextStyle(
                                                              color: Color(0xFF66707F),
                                                              fontSize: 15,

                                                              fontWeight: FontWeight.w400,

                                                            ),
                                                          ),
                                                          Gap(8),
                                                          Text(
                                                            '${tp.dataTeam[index].partnerId??""}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14.sp,

                                                              fontWeight: FontWeight.w600,

                                                            ),
                                                          ),
                                                        ],),
                                                      width: size.width/5,
                                                    ),
                                                    Container(
                                                      width: size.width/5,
                                                      child: Column(
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
                                                            '${tp.dataTeam[index].name}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w600,

                                                            ),
                                                          ),
                                                        ],),
                                                    ),
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
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            width: size.width/5,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  'Phone',
                                                                  style: TextStyle(
                                                                    color: Color(0xFF66707F),
                                                                    fontSize: 15,
                                                                    fontWeight: FontWeight.w400,

                                                                  ),
                                                                ),
                                                                Gap(8),
                                                                Text(
                                                                  '${tp.dataTeam[index].mobile}',
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ],),
                                                          ),
                                                          Container(
                                                            width: size.width/5,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  'Business',
                                                                  style: TextStyle(
                                                                    color: Color(0xFF66707F),
                                                                    fontSize: 15,
                                                                    fontWeight: FontWeight.w400,

                                                                  ),
                                                                ),
                                                                Gap(8),
                                                                Text(
                                                                  'Solo Proprietorship',
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ],),
                                                          ),
                                                          InkWell(

                                                            child: Container(
                                                              alignment: Alignment.center,
                                                              height: 25.h,
                                                              width: 25.w,

                                                            ),
                                                          ),


                                                        ],
                                                      ),
                                                      Gap(20.h),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  'Date',
                                                                  style: TextStyle(
                                                                    color: Color(0xFF66707F),
                                                                    fontSize: 15,
                                                                    fontWeight: FontWeight.w400,

                                                                  ),
                                                                ),
                                                                Gap(8),
                                                                Text(
                                                                  "${DateFormat("dd-MM-yyyy").format(tp.dataTeam[index].createdAt)}",
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ],),
                                                          ),

                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                // Text(
                                                                //   'Action',
                                                                //   style: TextStyle(
                                                                //     color: Color(0xFF66707F),
                                                                //     fontSize: 15,
                                                                //     fontWeight: FontWeight.w400,
                                                                //
                                                                //   ),
                                                                // ),
                                                                // Gap(8),
                                                                // InkWell(
                                                                //   onTap:(){
                                                                //
                                                                //   },
                                                                //   child: Row(
                                                                //     children: [
                                                                //       Text(
                                                                //         'View Detail',
                                                                //         style: TextStyle(
                                                                //           color: mainColor,
                                                                //           fontSize: 14.sp,
                                                                //           fontWeight: FontWeight.w500,
                                                                //         ),
                                                                //       ),
                                                                //       Gap(3),
                                                                //       Icon(Icons.arrow_forward_ios_sharp,color: mainColor,size: 15,)
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                              ],),
                                                          ),

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
                              ),
                            )
                      ),
                        );
                    }
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
