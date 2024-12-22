


import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeViewModel extends GetxController{

  final rxRequestStatus=Status.LOADING.obs;
  final userList=UserListModel().obs;

  //handle error in app
  RxString error=''.obs;

  void setRxRequestStatus(Status _value)=> rxRequestStatus.value=_value;
  void setUserList(UserListModel _value)=> userList.value=_value;
  void setError(String _value)=> error.value=_value;


  final _api=HomeRepository();

  void userListApi(){
    //setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);


    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  //show loading in retry button
  void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);


    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}