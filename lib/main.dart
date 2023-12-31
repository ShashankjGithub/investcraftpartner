import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investcraftpartner/providers/leadDataProvider.dart';
import 'package:investcraftpartner/providers/myQrProvider.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/providers/teamProvider.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:investcraftpartner/screens/leadsScreens/leadProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/splashScreen.dart';
import 'package:investcraftpartner/services/downloadeScrvice.dart';
import 'package:investcraftpartner/services/qrtoimageProvider.dart';
import 'package:provider/provider.dart';

import 'config/themeConfig.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: mainColor,

    // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<PartnerOnBoardingProvider>(create: (context) => PartnerOnBoardingProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<LeadProvider>(create: (context) => LeadProvider()),
        ChangeNotifierProvider<LeadDataProvider>(create: (context) => LeadDataProvider()),
        ChangeNotifierProvider<MyQrProvider>(create: (context) => MyQrProvider()),
        ChangeNotifierProvider<TeamProvider>(create: (context) => TeamProvider()),
        ChangeNotifierProvider<DownloadeProvider>(create: (context) => DownloadeProvider()),
        ChangeNotifierProvider<QrToImageProvider>(create: (context) => QrToImageProvider()),

        ChangeNotifierProvider<PartnerFromDataProvider>(create: (context) => PartnerFromDataProvider()),
      ],
      child: ScreenUtilInit(
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
      ),
    );
  }
}

