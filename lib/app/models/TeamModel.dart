class TeamModel {
  String id;
  String name;
  String organizationName;
  String image;


  TeamModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.organizationName = json["organizationName"];
    this.image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["organizationName"] = this.organizationName;
    data["image"] = this.image;
    return data;

  }


}

