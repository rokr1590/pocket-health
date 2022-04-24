import 'package:flutter/cupertino.dart';
import 'package:pocket_health/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocket_health/home_bottom_bar.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      color: Colors.white,
      /*appBar: AppBar(
        title: Text("SIGNED IN AS",style: TextStyle(fontFamily: 'Acme',color: Colors.white)),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: (){
                final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
                provider.logout();
              },
              child:Text("Logout"))
        ],
      ),*/
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/user_animated.png',height: 445,width: 510),
              Padding(
                padding: const EdgeInsets.fromLTRB(45, 60, 20, 0),
                child: Row(
                  children: [
                    Image.asset('assets/icons/user.png'),
                    Text('User Profile',
                    style: TextStyle(fontFamily: 'Acme',fontSize: 48),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
                SizedBox(height :8),
                Text(
                  user.displayName!,
                  style : TextStyle(color:Colors.black,fontSize :16),
                ),
                SizedBox(height :8),
                Text(
                  user.email!,
                  style : TextStyle(color:Colors.black,fontSize :16),
                ),
                SizedBox(height: 2,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 96, 96, 1),
                      onPrimary: Color.fromRGBO(248, 96, 96, 1),
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                  ),
                  onPressed: (){
                    final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
                    provider.logout();
                  }, child: Text("SIGN OUT",style: TextStyle(color: Colors.white,fontSize: 20),),

                ),
              ],
            )
          ),
        ],
      ),
    );
  }
  Widget buildProfileView(){
    return HomeBottomBar();
  }
}
