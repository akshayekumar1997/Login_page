import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'splash.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
 LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 bool _isDataMatched=true;
 final _usernameController=TextEditingController();

 final _passwordController=TextEditingController();
final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
       SafeArea(child: 
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: 
          Form(
            
            key: _formkey,
            child: Column(

            children: [
              
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "username"
                ),
                 validator: (value){
                 
                  if(value==null||value.isEmpty){
                    return "Enter name";
                  }
                  else{
                    return null;
                  }
                 }
              ),
             const SizedBox(
                height: 20,
          
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password"),
                validator: (value){
                  
 if(value==null||value.isEmpty){
                    return "Enter password";
                  }
                  else{
                    return null;
                  }
                },  
              ),
              SizedBox(
                height: 20,
              ),
              
                 
                
                          
                         
                          
                          
                              
                              ElevatedButton.icon
                              (onPressed: (){
                                if(_formkey.currentState!.validate()){

                                 checkLogin(context); 
                                }
                                else{
                                  print("Data empty");
                                }
                 
                              }, 
                        
                              icon: Icon(Icons.check), 
                              label: Text("Login")),
                            ],
                          ),
                        
                      
                    
                  ),
          ),
              
            )
          
           
        );
        
       
            
  }

  void checkLogin(BuildContext ctx)async{
    final _username=_usernameController.text;
    final _password=_passwordController.text;
  if(_username=="akshay"&&_password=="pass"){
final _sharedPrefs=await SharedPreferences.getInstance();
await _sharedPrefs.setBool(Save_key_name, true
);
final _loggedinmessage="Sucessfully logged in";
ScaffoldMessenger.of(ctx).showSnackBar(
SnackBar(behavior: SnackBarBehavior.floating
,
   backgroundColor: Colors.greenAccent.shade400,
      margin: EdgeInsets.all(10), 
    content: Text(_loggedinmessage),
    duration: Duration(seconds: 3,
    ),
)
);

Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx){
  return HomeScreen();

}
)
);




  }
  else{
    final _errorMessage="Username and Password does not match";
    ScaffoldMessenger.of(ctx).showSnackBar
    (SnackBar
    
    (behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.redAccent,
      margin: EdgeInsets.all(10), 
    content: Text(_errorMessage),
    duration: Duration(seconds: 3,
    ),
    )
    
    );
  }

  }
}

