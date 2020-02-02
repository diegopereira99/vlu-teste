import 'TeamModel.dart';

class UserModel {

  String id;
  String fullName;
  String photo;
  String acessToken;
  List<TeamModel> teams = List();

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.fullName = json["fullName"];
    this.photo = json["photo"];
    for (var item in json["teams"]) {
      this.teams.add(TeamModel.fromJson(item));
    }
    this.acessToken = json["accesToken"];
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] =  this.id;
    data['fullName'] = this.fullName;
    data['photo'] = this.photo;
    data['acessToken'] = this.acessToken;
    data['teams'] = this.teams.map((t) => t.toJson()).toList();
    return data;
  }

}


