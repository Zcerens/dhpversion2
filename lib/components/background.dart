import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String? title;
  const Background({
    Key? key,
    required this.child,
    required this.title,
    this.topImage = "assets/logo/logodhp2.PNG",
    this.bottomImage = "assets/images/image4.png",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${title}',
          style: TextStyle(color: kPrimaryColor),
        ),
        backgroundColor: kPrimaryLightColor,
      ),
      // bottomNavigationBar:
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
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
    );
  }
}
