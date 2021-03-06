

import 'package:api/domain/models/response_model.dart';

abstract class DomainRepository
{
  Future<ResponseModel> getData();

  Future<ResponseModel> getUsers(dynamic http);

  void saveValue(String key,String value);

  Future<String?> getValue(String key);

  void deleteAllValue();

  void saveLoginvalue(String key,String value);

  Future<String?> getLoginvalue(String key);

  void deleteLoginvalue(String key);
}
