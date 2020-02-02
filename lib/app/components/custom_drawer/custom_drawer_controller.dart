import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valuu_teste/app/shared/login_local_storage.dart';
part 'custom_drawer_controller.g.dart';

class CustomDrawerController = _CustomDrawerBase with _$CustomDrawerController;

abstract class _CustomDrawerBase with Store {
  LoginLocalStorage loginLocalStorage;
  _CustomDrawerBase(loginLocalStorage) {
    this.loginLocalStorage = loginLocalStorage;
    _getTeams();
  }

  @observable
  ObservableList<String> teamsList = ObservableList.of([]);
  
  _getTeams() async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    teamsList = shared.getStringList('teams').asObservable();
  }

  @action
  removeTeam(id) async {
    int index = teamsList.indexOf(id);
    teamsList.removeAt(index);
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setStringList('teams', teamsList);
  }
  
  @action
  addTeam(id) async{
    teamsList.add(id);
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setStringList('teams', teamsList);
  }

  logOut() async {
    try {
      this.loginLocalStorage.removeData('user_info');
    } catch (e) {
    }
  }
}
