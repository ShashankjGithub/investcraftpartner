import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/screens/leadsScreens/leadProvider.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';

class LeadDetailScreen extends StatefulWidget {
  const LeadDetailScreen({super.key});

  @override
  State<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends State<LeadDetailScreen> with SingleTickerProviderStateMixin{

  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

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
          padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 20),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(
                'IVK001',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(10),
              Text(
                'Lead Application Details',
                style: TextStyle(
                  color: Color(0xFFD7206A),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,

                ),
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 15),
                      height: 101.h,
                      decoration: BoxDecoration(border: Border.all(color: bordercolor),borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: mainColor)),
                          ),
                          Gap(8),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'App Status',
                                     style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                                Gap(8),
                                Text(
                                  'Partial docs received',
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 15),
                      height: 101.h,
                      decoration: BoxDecoration(border: Border.all(color: bordercolor),borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: mainColor)),
                          ),
                          Gap(8),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Assigned Agent',
                                     style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,

                                  ),
                                ),
                                Gap(8),
                                Text(
                                  'Saurav Kumar',
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Expanded(
                  child:Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: mainColor,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: mainColor,
                        controller: controller,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: List.generate(lp.titles.length, (index) {
                          return Tab(text: lp.titles[index],);
                        }),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: controller,
                            children: [
                              PersonalDetailWidget(),
                              PersonalDetailWidget(),
                              UploadeDocumentDetailWidget(),
                        ]),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
  
  Widget PersonalDetailWidget(){
    return ListView(
      padding: EdgeInsets.only(left: 20,top: 20,right: 10,bottom: 15),
      children: [
        Row(
          children: [
            Expanded(
                child: LeadDetailContainer(title: "Full Name",data: "Manjit Singh",)),
            Gap(15),
            Expanded(
                child: LeadDetailContainer(title: "Mother's Name",data: "Shanti Devi",)),
          ],
        ),
        Gap(30),
        Row(
          children: [
            Expanded(
                child: LeadDetailContainer(title: "Phone",data: "(+91) 1234567890",)),
            Gap(15),
            Expanded(
                child: LeadDetailContainer(title: "State",data: "Rajasthan",),),
          ],
        ),
        Gap(30),
        Row(
          children: [
            Expanded(
                child: LeadDetailContainer(title: "Email",data: "manjit.dh81@gmail.com",)),
            Gap(15),
            Expanded(
                child: LeadDetailContainer(title: "Pin Code",data: "213407",)),
          ],
        ),
        Gap(30),
        Row(
          children: [
            Expanded(
                child: LeadDetailContainer(title: "Address",data: "Street 110-B Kalians Bag, Dewan,Gorakhpur. Uttar Predesh",)),

          ],
        ),
      ],
    );
  }
  Widget UploadeDocumentDetailWidget(){
    return ListView(
      padding: EdgeInsets.only(left: 20,top: 20,right: 10,bottom: 15),
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
                  height: 113.h,
                  decoration: BoxDecoration(border: Border.all(color: bordercolor),borderRadius: BorderRadius.circular(10)),
                )),
            Gap(15),
            Expanded(
                child: Container(
                  height: 113.h,
                  decoration: BoxDecoration(border: Border.all(color: bordercolor),borderRadius: BorderRadius.circular(10)),
                )),
          ],
        ),

      ],
    );
  }
}

class LeadDetailContainer extends StatelessWidget {
  const LeadDetailContainer({
    super.key, required this.title, required this.data,
  });
  final String title;
  final String data;


  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    Text("$title",style: TextStyle(fontSize: 14,color: Colors.black),),
    Gap(5),
    Text("$data",style: TextStyle(fontSize: 14,color: mainColor),),
              ],
      crossAxisAlignment: CrossAxisAlignment.start,
            );
  }
}
