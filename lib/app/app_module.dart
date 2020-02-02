import 'package:valuu_teste/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:valuu_teste/app/app_widget.dart';
import 'package:valuu_teste/app/components/custom_drawer/custom_drawer_controller.dart';
import 'package:valuu_teste/app/modules/home/home_page.dart';
import 'package:valuu_teste/app/modules/login/login_module.dart';
import 'package:valuu_teste/app/pages/SplashPage.dart';
import 'package:valuu_teste/app/shared/login_local_storage.dart';
import 'package:valuu_teste/app/shared/user_data.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginLocalStorage()),
        Bind((i) => UserData()),
        Bind((i) => CustomDrawerController(i.get<LoginLocalStorage>())),
      ];

  @override
  List<Router> get routers => [
        Router('/home', child: (_, args)=> HomePage()),
        Router('/', child: (_, args)=> SplashPage()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
