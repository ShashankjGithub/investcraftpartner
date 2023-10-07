import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/screens/splashScreen.dart';

import 'config/themeConfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          builder: (BuildContext context,child){
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),child: child!);
          },

          debugShowCheckedModeBanner: false,
          home: child,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: "Poppins",
              appBarTheme: AppBarTheme(backgroundColor: mainColor,titleTextStyle: TextStyle(fontSize: 15.sp),iconTheme: IconThemeData(size: 24,color: Colors.white))),
        );
      },
      child: SplashScreen(),
    );
  }
}

