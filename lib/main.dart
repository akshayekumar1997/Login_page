import 'package:flutter/material.dart';
import 'screens/splash.dart';
const Save_key_name="User logged in";
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginPage",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home:SplashScreeen(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}