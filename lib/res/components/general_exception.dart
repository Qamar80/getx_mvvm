import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';



class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;

  const GeneralExceptionWidget({super.key,required this.onPress});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {

    final height=MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height *.15,),
          Icon(Icons.cloud_off, color: AppColors.redColor,size: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('general_exception'.tr,textAlign: TextAlign.center,)),
          ),
          SizedBox(height: height *.15,),
          InkWell(
            onTap: (){
              widget.onPress;
            },
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Center(child: Text('Retry',style: Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.white),)),
            ),
          )
        ],
      ),
    );

  }
}