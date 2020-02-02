import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalStorage {

  Completer<SharedPreferences> _sharePreference = Completer<SharedPreferences>();

  LoginLocalStorage() {
    this._init();
  }

  _init() async {
    this._sharePreference.complete(await SharedPreferences.getInstance());
  }

  Future store(key, data) async {
    try {
      var shared = await this._sharePreference.future;
      shared.setString(key, data);  
    } catch (e) {
      print(e);
    }
    
  }

  Future getData(key) async {
    try {
      var shared = await this._sharePreference.future;
      return shared.getString(key); 
    } catch (e) {
      print(e);
    }
  }


  Future removeData(key) async {
    try {
      var shared = await this._sharePreference.future;
      shared.remove(key);
    } catch (e) {
      print(e);
    }
  }

  
}