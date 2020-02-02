import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valuu_teste/app/models/UserModel.dart';
import 'package:valuu_teste/app/shared/login_local_storage.dart';
import 'package:valuu_teste/app/shared/user_data.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final LoginLocalStorage loginLocalStorage = Modular.get<LoginLocalStorage>();
  UserData userData = Modular.get<UserData>();

  @override
  void initState() {
    super.initState();

    this.loginLocalStorage.getData('user_info')
    .then((x) {
      if(x != null) {
        userData.actualUser = UserModel.fromJson(jsonDecode(x));
        Modular.to.pushReplacementNamed('/home');
      }else {
        Modular.to.pushReplacementNamed('/login');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}