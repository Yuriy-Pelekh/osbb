import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

class UserRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GetTextFieldValue());
  }
}

class GetTextFieldValue extends StatefulWidget {
  _TextFieldValueState createState() => _TextFieldValueState();
}

class _TextFieldValueState extends State<GetTextFieldValue> {
  // ignore: non_constant_identifier_names
  final email_h = TextEditingController();
  final name_h = TextEditingController();
  final password_h = TextEditingController();
  final aps_h = TextEditingController();
  final number_h = TextEditingController();

  String email = '';
  String password = '';
  String name = '';
  String aps = '';
  String number = '';

  getTextInputData() {
    setState(() {
      email = email_h.text;
      password = password_h.text;
      name = name_h.text;
      aps = aps_h.text;
      number = number_h.text;
    });
  }

  // ignore: missing_return
  Future<String> makeRequest() async {
    email = email_h.text;
    password = password_h.text;
    name = name_h.text;
    aps = aps_h.text;
    number = number_h.text;
    String url = 'https://steposbbwebapi.azurewebsites.net/api/registration';
    var response = await http.post(Uri.encodeFull(url),
        body: json.encode({
          "email": "$email",
          "password": "$password",
          "name": "$name",
          "phonenumber": "$number",
          "apartmentnumber": "$aps"
        }),
        headers: {"Content-Type": "application/json"});
    print("$email, $password, $number, $aps, $name");
    var b = response.body;
    print(response.statusCode);
    if (response.statusCode == 200) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Акаунт успішно зареєстровано'),
            content: const Text(''),
            actions: <Widget>[
              FlatButton(
                child: Text('Супер!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Сталась помилка. $b'),
            content: const Text(''),
            actions: <Widget>[
              FlatButton(
                child: Text('Супер!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: HexColor("#8D69FF"),
          title: new Text('Register'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: name_h,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name Surname',
                      hintText: 'Enter your name and surname',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: number_h,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone number',
                      hintText: 'Enter your phone number',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: email_h,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: aps_h,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Apartments number',
                      hintText: 'Enter your apartments number where you live',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: password_h,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm password',
                      hintText: 'Confirm your password',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: HexColor("#DACEFF"),
                  child: Text('Register',
                      style: TextStyle(
                          color: HexColor("#8D69FF"),
                          fontWeight: FontWeight.bold)),
                  onPressed: makeRequest,
                )
              ],
            )));
  }
}
