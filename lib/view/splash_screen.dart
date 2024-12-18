import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
        // title: Text('email_hints'.tr),
       ),
      body: Image(image: AssetImage(ImageAssets.splashScreen)),
    );
  }
}
