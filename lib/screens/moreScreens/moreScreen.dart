import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/themeConfig.dart';
import '../../generated/assets.dart';
import '../../providers/myQrProvider.dart';
import '../../widgets/lodingWidget.dart';
import '../partnerOnBoardingScreen/congratulationsScreen.dart';


class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {




  @override
  Widget build(BuildContext context) {
   final AuthProvider ap = context.watch<AuthProvider>();
   final MyQrProvider mq = context.watch<MyQrProvider>();
    return  Scaffold(
      backgroundColor: Color(0xfff7f9f9),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 39.1,left: 28,right: 28,bottom: 55),
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 16,right: 16),
                  height: 95.9.h,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.assetsProfile,height: 50.h,width: 50.w,),
                            Gap(12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 130.w,
                                    child: Text("${mq.qrData!=null?mq.qrData!.userData.name:"User"}",style: TextStyle(fontSize: 17.sp,color: mainColor),overflow: TextOverflow.ellipsis,)),
                                Gap(10.h),

                              ],
                            ),

                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Edit Profile",style: TextStyle(fontSize: 13.sp,color: Color(0xff66707f)),),
                          Gap(2.w),
                          SvgPicture.asset(Assets.assetsEdit,height: 10.h,width: 10.w,)
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(10),

                Gap(12.h),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 16,right: 16,top: 33,bottom: 33),

                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),),
                  child: Column(
                    children: [

                      ProfileContainer(title: "My QR Code",imageUrl: Assets.profileQr,onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CongratulationsScreen();
                        }));
                      },),
                      Gap(23.h),
                      InkWell(
                        onHover: (f){
                          print("hower");
                        },
                        onTap: (){
                          ap.deleteUserData(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [

                                Icon(Icons.logout,color: mainColor,),
                                Gap(14.w),
                                Text("Logout",style: TextStyle(fontSize: 15.sp,color: Colors.black),),
                              ],
                            ),
                            SvgPicture.asset(Assets.profileProfileArrow)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            //LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key, required this.imageUrl, required this.title, required this.onTap,
  });
  final String imageUrl;
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(imageUrl,height: 20.h,width: 20.w,),
              Gap(14.w),
              Text("${title}",style: TextStyle(fontSize: 15.sp,color: Colors.black),),
            ],
          ),
          SvgPicture.asset(Assets.profileProfileArrow)
        ],
      ),
    );
  }
}
