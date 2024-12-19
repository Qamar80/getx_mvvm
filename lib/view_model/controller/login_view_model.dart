

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController{


  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  final emailFocusNode=FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;

}