import 'package:api/domain/domain.dart';
import 'package:http/http.dart' as http;

class HomePresenter
{
  HomePresenter(this._authUseCase);
  late final AuthUseCase _authUseCase;

  // Future<User> getData()
  // async
  // {
  //   var user=await _authUseCase.getData();
  //   return user;
  // }

Future<ListUser> getUsers(dynamic http)
async{
   var listUser=await _authUseCase.getUsers(http);
   //print(listUser.data?.first.email);
   return listUser;
}


}