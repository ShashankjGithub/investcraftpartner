import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/themeConfig.dart';
import '../generated/assets.dart';
import '../widgets/bottomBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getData();
    super.initState();
  }
  getData(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _afterSplash();
    });
  }

  _afterSplash(){
    Future.delayed(Duration(seconds: 3)).then((value) {
     Get.offAll(BottomBarScreen());
    });
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return  Scaffold(
      bottomSheet: Container(
        alignment: Alignment.center,
        height: 90.h,
        color: Colors.white,
        child: CupertinoActivityIndicator(radius: 25,color: mainColor,),
      ),
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Image.asset(Assets.assetsSplashlogo,width: 318.h,),
      ),
    );
  }
}
