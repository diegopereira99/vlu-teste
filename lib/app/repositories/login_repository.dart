import 'package:dio/dio.dart';
import 'package:valuu_teste/app/models/UserModel.dart';

class LoginRepository {
  final Dio dio;
  final api = "http://valuuplus-homologacao.us-east-2.elasticbeanstalk.com/api/v1/Account/Login";

  LoginRepository(this.dio);

  login({email, password}) async {
    var response = await dio.post(
      api,
      data: {
        "email": email,
        "password": password,
        "grant_type": "password"
      }
    );
    return UserModel.fromJson(
      response.data as Map<String, dynamic>
    );
  }





  
}