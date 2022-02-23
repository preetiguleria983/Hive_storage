
import 'package:hive_flutter/hive_flutter.dart';
import 'package:api/domain/models/response_model.dart';
import 'package:api/domain/repositories/domain_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../app/utils/strings/string_constants.dart';


class DeviceRepository extends DomainRepository
{
  final _storage= const FlutterSecureStorage();
  @override
  Future<ResponseModel> getData() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getUsers() {
    throw UnimplementedError();
  }

//SAVE VALUE IN LOCAL STORAGE WITH SECURE STORAGE
  @override
  void saveValue(String key,String value) {
     _storage.write(key: key, value:value);
  }

//READ VALUE FROM LOCAL STORAGE WITH SECURE STORAGE
  @override
  Future<String?> getValue(String key)
  async{
      var value=await _storage.read(key: key);
      return value;
  }

  //DELETE VALUES STORED IN LOCAL STORAGE
  @override
  void deleteAllValue() {
    _storage.deleteAll();
  }

  //Save value of login with Hive

  Future<void>init()
  async {
      await Hive.initFlutter();
     await Hive.openBox<dynamic>(StringConstants.login);
}
//Instance of openBox
   Box _getBox() {
      return Hive.box<dynamic>(StringConstants.login);
   }

   //To save login Value
  @override
   void saveLoginvalue(String key,dynamic value){
      _getBox().put(key, value);
      // print(key);
     // print(value);
     _getBox().put(key,value);
  }

  @override
  Future<String?> getLoginvalue(String key)
  async{
     var box= _getBox();
     var value= await box.get(key);
     //print(value);
     return value;
  }

  @override
  void deleteLoginvalue(String key) {
    //print('Rahul: $key');
    _getBox().delete(key);
  }
}