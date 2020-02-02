import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valuu_teste/app/modules/login/login_controller.dart';
import 'package:valuu_teste/app/modules/login/login_page.dart';
import 'package:valuu_teste/app/repositories/login_repository.dart';
import 'package:valuu_teste/app/shared/login_local_storage.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i)=> LoginController(i.get<LoginRepository>())),
    Bind((i)=> LoginRepository(i.get<Dio>())),
    Bind((i)=> LoginLocalStorage()),
    Bind((i)=> Dio())
  ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
