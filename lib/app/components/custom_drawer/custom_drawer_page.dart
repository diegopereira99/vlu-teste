import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valuu_teste/app/components/custom_drawer/custom_drawer_controller.dart';
import 'package:valuu_teste/app/shared/user_data.dart';

class CustomDrawerPage extends StatefulWidget {
  @override
  _CustomDrawerPageState createState() => _CustomDrawerPageState();
}

class _CustomDrawerPageState extends State<CustomDrawerPage> {

  final CustomDrawerController controller = Modular.get<CustomDrawerController>();
  UserData user = Modular.get<UserData>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async{
                  await controller.logOut();
                  Modular.to.pushReplacementNamed('/login');
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Config"),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Avisos"),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(height: 1),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Times",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Observer(
                    builder: (_) {
                      return Column(
                        children: this.user.actualUser.teams.map((team) {
                            return CheckboxListTile(
                              key: GlobalKey(),
                              onChanged: (status) {
                                if(status) {
                                  controller.addTeam(team.id);
                                }else {
                                  controller.removeTeam(team.id);
                                } 
                              },
                              secondary: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      team.image != null ? team.image :
                                      "https://mccoyderek.files.wordpress.com/2016/07/team.jpg"
                                    )
                                  )
                                )
                              ),
                              checkColor: Colors.white,
                              activeColor: Colors.purple,
                              value: controller.teamsList.contains(team.id) ? true : false,
                              subtitle: Text(
                                team.organizationName
                              ),
                              title: Text(
                                team.name
                              ),
                            );
                          }).toList()
                      );
                    },
                  )
                  
                ],
              ),
            )
          ],
        )
      );
  }
}
