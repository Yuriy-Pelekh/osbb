import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:osbb/password_reset.dart';
import 'package:osbb/user_registration.dart';  
import 'password_reset.dart';


void main() {  
  runApp(MaterialApp( home: MyApp(),));  
}  
  
class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new LoginScreen(),
    );
  }
}   

class LoginScreen extends StatelessWidget{
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
        appBar: AppBar(  
          centerTitle: true,
          backgroundColor: HexColor("#8D69FF"),
          title: new Text('Log In'),
             bottom: PreferredSize(
      child: Container(
         color: HexColor("#7D5DE2"),
         height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0)),
        ),  
        body: Padding(  
            padding: EdgeInsets.all(15),  
            child: Column(  
              children: <Widget>[  
                Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Email',  
                      hintText: 'Enter your email',  
                    ),  
                  ),  
                ),  
                Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    obscureText: true,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Password',  
                      hintText: 'Enter Password',  
                    ),  
                  ),  
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#DACEFF")
                  ),
                  child: Text('Sign In', style: TextStyle(color: HexColor("#8D69FF"),fontWeight: FontWeight.bold)),  
                  onPressed: (){},  
                ),
                InkWell(
                  child: new Text('Reset Password', style: TextStyle(color: Colors.blue)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordReset()));
                  },
                ),
                InkWell(
                  child: new Text('Register', style: TextStyle(color: Colors.blue)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserRegistration()));
                  },
                )
              ],  
            )  
        )  
    );  
  } 
}