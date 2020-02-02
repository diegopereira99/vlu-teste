import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valuu_teste/app/components/custom_drawer/custom_drawer_page.dart';
import 'package:valuu_teste/app/shared/user_data.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  UserData userData = Modular.get<UserData>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 0,
      key: _drawerKey,
      drawer: CustomDrawerPage(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    this._drawerKey.currentState.openDrawer();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          this.userData.actualUser?.photo
                        )
                      ),
                      shape: BoxShape.circle
                    ),
                  )
                ),
                SizedBox(width: 10),
                Text(
                  userData.actualUser?.fullName != null 
                  ? userData.actualUser?.fullName : 'undefined' ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
          
        ],
      ),
    );
      
  }
}
