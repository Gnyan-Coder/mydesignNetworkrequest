import 'dart:async';

import 'package:mydesign/Data/Network/network_api_services.dart';
import 'package:mydesign/Data/model.dart';

class Repository{
  final _services=NetworkApiServices();

  Future<UserModel> getData()async{
    Completer<UserModel> completer=Completer();
    await _services.getApi("https://reqres.in/api/users?page=2").then((value){
      print(value);
      return completer.complete(UserModel.fromJson(value));
    }).onError((error, stackTrace) {
      completer.completeError(error.toString());
    });
    return completer.future;
  }
}