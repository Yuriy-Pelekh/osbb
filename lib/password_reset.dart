import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class PasswordReset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GetTextFieldValue());
  }
}

class GetTextFieldValue extends StatefulWidget {
  _TextFieldValueState createState() => _TextFieldValueState();
}

class _TextFieldValueState extends State<GetTextFieldValue> {
  final textFieldValueHolder = TextEditingController();

  String result = '';

  getTextInputData() {
    setState(() {
      result = textFieldValueHolder.text;
    });
  }

  // ignore: missing_return
  Future<String> makeRequest() async {
    result = textFieldValueHolder.text;
    String url = 'https://steposbbwebapi.azurewebsites.net/api/refreshpassword';
    var response = await http.post(Uri.encodeFull(url),
        body: json.encode({"email": "$result"}),
        headers: {"content-type": "application/json"});
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                'На цей емейл було відправленно повідомлення для сбросу пароля. Перевірте, будь ласка, поштову скриню.'),
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
    else {
            return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                'Сталась помилка. Перевірте введений емейл і спробуйте знову.'),
            content: const Text(''),
            actions: <Widget>[
              FlatButton(
                child: Text('Оу...'),
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
          title: new Text('Password Reset'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: textFieldValueHolder,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter email',
                    ),
                  ),
                ),
                RaisedButton(
                  color: HexColor("#DACEFF"),
                  child: Text('Sign In', style: TextStyle(color: HexColor("#8D69FF"),fontWeight: FontWeight.bold)),  
                  onPressed: makeRequest,  
                ),
              ],
            )));
  }
}
