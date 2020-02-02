import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:valuu_teste/app/shared/login_local_storage.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  LoginLocalStorage loginLocalStorage = Modular.get<LoginLocalStorage>();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
