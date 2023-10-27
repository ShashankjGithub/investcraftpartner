import 'package:flutter/material.dart';
import 'package:investcraftpartner/config/themeConfig.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
      child: Center(child: CircularProgressIndicator(color: mainColor,),),
    );
  }
}
