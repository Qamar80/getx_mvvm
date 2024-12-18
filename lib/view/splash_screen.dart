import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm/res/components/round_button.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('h'); /* Scaffold(
       appBar:  AppBar(
        // title: Text('email_hints'.tr),
         title: Text('xyz'),
       ),
      //body: InternetExceptionWidget(onPress: (){ },),
     // body: GeneralExceptionWidget(onPress: (){ },),
      body: Column(
        children: [
          RoundButton(title: 'Login', onPress: (){},width: 300,loading: false,),
          RoundButton(title: 'signUp', onPress: (){}),
        ],
      ),
      // body: const Image(image: AssetImage(ImageAssets.splashScreen)),
    );*/
  }
}
