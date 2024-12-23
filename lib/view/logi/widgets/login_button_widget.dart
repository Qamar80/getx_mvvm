

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../res/components/round_button.dart';
import '../../../view_model/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formkey;
   LoginButtonWidget({super.key,required this.formkey});


  final loginVM=Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return   Obx(()=>RoundButton(
        width: 200,
        loading: loginVM.loading.value,
        title: 'login'.tr,
        onPress: (){
          if(formkey.currentState!.validate()){
            loginVM.loginApi();
          }
        }));
  }
}
