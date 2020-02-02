import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:valuu_teste/app/models/UserModel.dart';
import 'package:valuu_teste/app/repositories/login_repository.dart';
import 'package:valuu_teste/app/shared/login_local_storage.dart';
import 'package:valuu_teste/app/shared/user_data.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {

  final LoginRepository loginRepository;
  UserModel userLogged;
  final LoginLocalStorage loginLocalStorage = Modular.get<LoginLocalStorage>();
  UserData userData;
  _LoginBase(this.loginRepository);

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  changeEmail(String text)=> email = text;

  @action
  changePassword(String text)=> password = text;

  @computed
  bool get checkForm => password.isNotEmpty && email.contains("@") && password.length > 6;

  login() async{
    try {
      UserModel user =  await this.loginRepository.login(email: email, password: password);
      if(user != null) {
        await this.loginLocalStorage.store('user_info', jsonEncode(user.toJson())); 
        this.userData = Modular.get<UserData>();
        this.userData.actualUser = user;
      }else {
        throw("error");
      }
    } catch (e) {
      throw("error");
    }
  }

}
  