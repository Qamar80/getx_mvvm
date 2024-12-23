



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/utils.dart';
import '../../../view_model/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
   InputPasswordWidget({super.key});

  final loginVM=Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Password', 'Enter password');
        }
        return null;
      },
      onFieldSubmitted: (value){
      },
      decoration: InputDecoration(
          hintText: 'password_hint'.tr,
          border: const OutlineInputBorder()
      ),
    );
  }
}
