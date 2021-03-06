import 'package:api/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserviewWidget extends StatelessWidget {
   UserviewWidget({Key? key}) : super(key: key);

  final keys='Meher';
  @override
  Widget build(BuildContext context) =>
      GetBuilder<UserController>(
        builder: (_userController) =>
            Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://freedesignfile.com/upload/2014/05/Dynamic-feather-with-background-vector-set-09.jpg'),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar:AppBar(
                title: const Text('List Of Users'),
                backgroundColor: Colors.indigo,
                leading: IconButton(
                  onPressed: (){
                    _userController.deleteAllValue();
                    _userController.getValue(keys);
                    RouteManagement.goToLogin();
                  },
                  icon: const Icon(Icons.arrow_back),),
              ),
              body: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount:_userController.listUser.length,
                      itemBuilder: (context, index) =>
                          Card(
                          child: ListTile(
                            leading: Container(
                              height: 80,
                              width: 70,
                              decoration: BoxDecoration(
                                //border: Border.all(color: Colors.indigo),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(_userController.listUser[index].avatar.toString()),
                                ),
                              ),
                            ),
                            title: Text('${_userController.listUser[index].firstName!} ${_userController.listUser[index].lastName}'),
                            subtitle: Text(_userController.listUser[index].email.toString()),
                            trailing: Text(_userController.listUser[index].id.toString(),
                              style: const TextStyle(
                                color: Colors.red,
                              ),),
                            onTap:()
                            {
                              _userController.saveValue(keys, '${_userController.listUser[index].firstName!} ${_userController.listUser[index].lastName}');
                              _userController.getValue(keys);
                              RouteManagement.goToHome(index);
                            },
                          ),
                        )
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 50),
                      //maximumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.indigo,
                    ),
                    onPressed: ()
                    {
                      _userController.deleteLoginvalue('email');
                      _userController.deleteLoginvalue('pass');
                      _userController.getLoginvalue('email');
                      _userController.getLoginvalue('pass');

                    },
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ),
          )
    );
}
