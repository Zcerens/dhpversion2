import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage = "assets/logo/logodhp.png",
    this.bottomImage = "assets/images/image4.png",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              child: Image.asset(
                topImage,
              ),
              width: 90,
            ),
            // Positioned(
            //   top: MediaQuery.of(context).size.height * 0.05,
            //   left: MediaQuery.of(context).size.width * 0.6,
            //   child: Image.asset(
            //     "assets/images/image3.png",
            //   ),
            //   width: 200,
            // ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset(
                bottomImage,
              ),
              width: 1000,
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
