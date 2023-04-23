import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_page/screens/home.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_page/main.dart';
class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
   checkUserLogin();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  
  @override

  Widget build(BuildContext context) { 
    return Scaffold(
      body: 
      Center(
        child: Image.asset("assets/images/splash.jpeg"),
 ),
    );
  }
  void dispose() {
    
    super.dispose();
  }
  Future<void>goToLogin()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
      return LoginScreen();
    }
    ) 
    );
  }
  Future <void>checkUserLogin()async{
    final _sharedPrefs=await SharedPreferences.getInstance(); 
  final userLoggedIn= _sharedPrefs.getBool(Save_key_name);
 if(userLoggedIn==null||userLoggedIn==false){
  goToLogin();
 }
 else{
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>HomeScreen()));
 }
  }
}
