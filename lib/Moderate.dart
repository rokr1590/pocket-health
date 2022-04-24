import 'package:flutter/material.dart';
import 'package:pocket_health/survey_screen.dart';

class Moder extends StatefulWidget {
  @override
  _ModerState createState() => _ModerState();
}

class _ModerState extends State<Moder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "You appear to be moderately stressed :|",
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Acme",
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              Image.asset("assets/survey/confused-face.gif"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(248, 96, 96, 1),
                    onPrimary: Color.fromRGBO(248, 96, 96, 1),
                    minimumSize: Size(300, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                child: Text("ok",style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}
