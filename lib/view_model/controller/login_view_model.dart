

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/login_epository/login_repository.dart';
import 'package:getx_mvvm/utils/utils.dart';

class LoginViewModel extends GetxController{

  //attach repo
  final _api=LoginRepository();

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;

  final emailFocusNode=FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;

  RxBool loading=false.obs;

  void loginApi(){
    loading.value=true;
    Map<String, dynamic>data={
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    String jsonString = jsonEncode(data);

    _api.loginApi(jsonString).then((value){
      print('API Response.........: $value');
      loading.value=false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        Utils.snackBar('Login', 'Login successfully');
      }




    }).onError((error,stackTrace){
      print('...............$error');
      Utils.snackBar('Error', error.toString());
      loading.value=false;
    });
  }

}