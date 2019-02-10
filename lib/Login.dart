import 'package:flutter/material.dart';

import 'ElectroluxDrawer.dart';
import 'ForgotPassword.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  String _username = "";
  String _password = "";
  bool _rememberMe = false;
  bool _passwordVisible = true;

  void rememberMeChanged(bool value) {
    setState(() => _rememberMe = value);
  }

  void performLogin() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) {
        return NavigationDrawerDemo();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Image(
                  image: new NetworkImage(
                      'https://wallpaperbrowse.com/media/images/3848765-wallpaper-images-download.jpg'),
                ),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                  onChanged: (value) {
                    setState(() => _username = value);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() => _password = value);
                  },
                  obscureText: _passwordVisible,
                  //This will obscure text dynamically
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible
                              ? _passwordVisible = false
                              : _passwordVisible = true;
                        });
                      },
                    ),
                  ),
                ),
                CheckboxListTile(
                  title: Text("Remember me"),
                  onChanged: rememberMeChanged,
                  value: _rememberMe,
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  onPressed: performLogin,
                  textColor: Colors.white,
                  color: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 20.0),
                  child: Text(
                    "Login",
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) {
                        return ForgotPassword();
                      }),
                    );
                  },
                  textColor: Colors.blueAccent,
                  color: Colors.transparent,
                  child: Text(
                    "Forgot password?",
                  ),
                ),
              ],
            )));
  }
}
