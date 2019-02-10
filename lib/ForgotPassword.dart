import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => new _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _username = "";


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

                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.blueAccent,
                  color: Colors.transparent,
                  child: Text(
                    "Back to login",
                  ),
                ),
              ],
            )));
  }
}
