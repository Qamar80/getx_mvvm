import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/home/home_vew_model.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

import '../../data/response/status.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  UserPreference userPreference=UserPreference();

  final homeController=Get.put(HomeViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value){
              Get.toNamed(RoutesName.loginView);
            });

          }, icon: Icon(Icons.logout))
        ],
      ),

      body: Obx((){

        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
          return const Center(child: CircularProgressIndicator(),);
           case Status.ERROR:
             if(homeController.error.value =='No internet'){
               return InterNetExceptionWidget(onPress: () {
                 homeController.refreshApi();
               },);
             }else {
               return GeneralExceptionWidget(onPress: (){
                 homeController.refreshApi();
               });
             }

           case Status.COMPLETED:
          return ListView.builder(
            itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context,index){
              print(homeController.userList.value.data![index].email);
                return Card(
                  child:  ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                  ),
                    title: Text( homeController.userList.value.data![index].firstName.toString()),
                    subtitle: Text( homeController.userList.value.data![index].email.toString()),
                  ),
                );
              });

        }
        return SizedBox();
      }),
    );
  }
}
