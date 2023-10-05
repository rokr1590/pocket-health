import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pocket_health/google_signin.dart';
import 'package:pocket_health/home_bottom_bar.dart';
//import 'package:pocket_health/home_screen.dart';
import 'package:provider/provider.dart';
//import 'package:pocket_health/user_profile.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child :MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      )
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset("assets/Welcome_Back.png"),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(2),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 60),
                  side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
              ),
              icon: Image.asset('assets/icons/google.png'),
              onPressed: (){
                final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
                provider.googleLogin();
              },
              label: Text("Sign Up with Google"),
            ),
          ),
          SizedBox(height:1),

        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if(snapshot.hasData) {
              return HomeBottomBar();
            } else if(snapshot.hasError) {
              return Center(child: Text('Something Went Wrong!'));
            }
            else {
              return Home();
            }
          }
      ),
    );
  }
}
