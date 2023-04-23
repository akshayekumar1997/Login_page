import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home") ,
        actions: [
          
          IconButton(onPressed: (){
            final _loggedoutmessage="Logged Out";
            ScaffoldMessenger.of(context).showSnackBar(
SnackBar(behavior: SnackBarBehavior.floating
,
   backgroundColor: Colors.redAccent,
      margin: EdgeInsets.all(10), 
    content: Text(_loggedoutmessage),
    duration: Duration(seconds: 3,
    ),
),
            );
       Tooltip(message: "Sign Out",);
            signOut(context);
          }, icon: Icon(Icons.logout))
          
        ],
      ),
      body: SafeArea(
        child: 
        ListView.separated(
          itemBuilder:(ctx,index) {
            return ListTile(
              title: Text( "Person $index",
              style:GoogleFonts.roboto() ,
          ),
              subtitle: Text("Message $index"),
              leading: 
              index.isEven?CircleAvatar( 
                 radius: 35,
                backgroundColor: Colors.white60,
                backgroundImage: AssetImage(
                  "assets/images/dicpro.jpeg"
                ),
                
              
              
             
              )
              :    //ternary operator
ClipRRect(child:
Image.asset("assets/images/dicpro.jpeg")
)
            );
          }, 
        separatorBuilder: (ctx,index){
          return Divider();
        }
        , itemCount: 20)
      
      )
    );
  }
  signOut(BuildContext ctx)async{
    
    final _sharedPrefs=await SharedPreferences.getInstance(); 
await _sharedPrefs.clear();
Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginScreen()) , (route) => false);
}
}