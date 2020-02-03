import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valuu_teste/app/modules/login/login_controller.dart';
import 'package:valuu_teste/app/modules/login/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controller = Modular.get<LoginController>();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          Column(
            children: <Widget>[
              InputWidget(
                labelText: "Email", 
                obscure: false,
                onChanged: controller.changeEmail,
              ),
              InputWidget(
                labelText: "Password", 
                obscure: true,
                onChanged: controller.changePassword,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 45,
                child: Observer(
                  builder: (_) {
                    return RaisedButton(
                      color: Colors.purple,
                      disabledColor: Colors.purple.withOpacity(0.7),
                      onPressed: controller.checkForm && !controller.isLoading ? () async{
                        try {
                          await controller.login();
                          Modular.to.pushReplacementNamed('/home');
                        } catch (e) {
                          controller.setLoading(false);
                          this.showSnackbarError();
                        }
                      }: null,
                      child: controller.isLoading ? 
                      Container(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ) 
                      : Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),  
                    );
                  }
                )
              )
            ],
          )
        ],
      )
    );
  }

  void showSnackbarError() {
    this._drawerKey.currentState
    .showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Container(
          child: Text("Incorrect password or email. Try Again"),
        )
      )
    );
  }
}
