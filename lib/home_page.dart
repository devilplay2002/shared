import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Loginpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nothing",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: NewPage(),
    );
  }
}
class NewPage extends StatefulWidget {

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState(){
    super.initState();
    initial();
  }
  void initial() async{
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "WELCOME $username !!!!",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => sharedpreference()));
              },
              child: Text('LOGOUT'),
            ),
          ],
        ),
      ),
    );
  }
}