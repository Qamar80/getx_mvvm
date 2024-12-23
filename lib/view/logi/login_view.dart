import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view/logi/widgets/input_email_widget.dart';
import 'package:getx_mvvm/view/logi/widgets/input_password_widget.dart';
import 'package:getx_mvvm/view/logi/widgets/login_button_widget.dart';
import 'package:getx_mvvm/view_model/login/login_view_model.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  final loginVM=Get.put(LoginViewModel());
  final _formkey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        centerTitle: true,
        backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Form(
              key: _formkey,
              child: Column(
                children: [
                 InputEmailWidget(),
                  const SizedBox(height: 20,),
                 InputPasswordWidget()
                ],
              ),
            ),
            const SizedBox(height: 40,),
          LoginButtonWidget(formkey: _formkey,)
          ],
        ),
      ),
    );
  }
}
