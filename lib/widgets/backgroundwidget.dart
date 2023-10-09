import 'package:flutter/material.dart';

import '../generated/assets.dart';

class BackgroundWidget extends StatelessWidget {
 final Widget child;
 final dynamic topposition;
 final Widget? secoundImage;
  const BackgroundWidget({super.key, required this.child, this.topposition, this.secoundImage});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Stack(
          children: [
            Positioned(
                right: 0,
                top: topposition??20,

                child: Image.asset(Assets.assetsBackbox)),
            Positioned(
                right: 0,
                top: topposition??160,

                child: secoundImage??SizedBox()),
            child
          ],
        ),
      ],
    );
  }
}
