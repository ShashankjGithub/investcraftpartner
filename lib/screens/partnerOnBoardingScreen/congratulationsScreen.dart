import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_svg/svg.dart';
import 'package:investcraftpartner/services/downloadeScrvice.dart';
import 'package:investcraftpartner/widgets/lodingWidget.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:investcraftpartner/providers/myQrProvider.dart';
import 'package:investcraftpartner/providers/partnerFromDataProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/provider/parterOnBoadingProvider.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/customtextField.dart';
import 'package:investcraftpartner/screens/partnerOnBoardingScreen/widgets/nextButton.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../config/appConfig.dart';
import '../../config/themeConfig.dart';
import '../../generated/assets.dart';
import '../../services/qrtoimageProvider.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {

  @override
  void initState() {
    getQR();
    super.initState();
  }
  getQR(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MyQrProvider>().getQr(context);
    });
  }

















  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final MyQrProvider pp = context.watch<MyQrProvider>();
    final QrToImageProvider qq = context.watch<QrToImageProvider>();
    final PartnerFromDataProvider pf = context.watch<PartnerFromDataProvider>();
    final DownloadeProvider dp = context.watch<DownloadeProvider>();
    return Stack(
      children: [
        SafeArea(
          child:
          pp.loading?Center(child: CircularProgressIndicator(color: mainColor,),):
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BackButton(),
                      Gap(10),
                      Text(
                        "${pf.congratulation!.title}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Gap(5),
                  Text(
                    "${pf.congratulation!.content}",
                    style: TextStyle(
                      color: Color(0xFFD7206A),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,

                    ),
                  ),

                  Container(
                    height: 430.h,
                    width: size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 390.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffFCA377),
                                Color(0xffDC6BB1),
                                Color(0xffD868BB),
                                Color(0xff6B7DAE),
                              ]
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${pp.qrData!.userData.name}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,

                                ),
                              ),
                              Gap(15),
                              // qq.imageFile.isEmpty?Container(
                              //   width: 286,
                              //   height: 262,
                              //   child: Center(child: CircularProgressIndicator(color: mainColor,),),
                              // ):
                              Container(
                                width: 286,
                                height: 262,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: NetworkImage(pp.qr_image_path))
                                ),
                              ),
                              Gap(15),
                              Text(
                                'Scan to Get Insta Loan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Container(
                              height: 70.h,
                              width: 70.w,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                baseUrlImage+pp.qrData!.personalDetail.photoUrl,fit: BoxFit.cover,
                                errorBuilder: (context,_,__){
                                  return SvgPicture.asset(Assets.assetsProfile);
                                },
                              )

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(15),
                  GestureDetector(
                    onTap: (){
                      dp.saveFile(pp.qrpdf, "${pp.qrData!.userData.name}_Qr");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 58.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Download QR Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(5),

                        ],
                      ),
                    ),
                  ),
                  Gap(15),
                  GestureDetector(
                    onTap: (){
                       Share.shareXFiles([XFile(qq.imageFile[0])]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 58.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: mainColor),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Share QR Code",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(5),

                        ],
                      ),
                    ),
                  ),
                  Gap(15),

                ],
              ),
            ),
          ),
        ),
        if (dp.loading)
          LoadingWidget(),
      ],
    );
  }
}
