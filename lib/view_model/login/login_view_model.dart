

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_epository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController{

  //attach repo
  final _api=LoginRepository();

  UserPreference userPreference=UserPreference();

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;

  final emailFocusNode=FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;

  RxBool loading=false.obs;

  void loginApi(){
    loading.value=true;
    Map<String, dynamic> data={
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
   // String jsonString = jsonEncode(data);





    _api.loginApi(data).then((value){
      print('API Response.........: $value');
      loading.value=false;


      UserModel userModel=UserModel(
        token: value['token'],
        isLogin: true
      );
        userPreference.saveUser(userModel).then((value){

            Get.delete<LoginViewModel>();

          Get.toNamed(RoutesName.homeView)!.then((value){});//go and free ram
        }).onError((error, StackTrace){
        });
        Utils.snackBar('Login', 'Login successfully');





    }).onError((error,stackTrace){
      print('...............$error');
      Utils.snackBar('Error', error.toString());
      loading.value=false;
    });
  }

}