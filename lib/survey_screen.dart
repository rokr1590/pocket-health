
import 'package:flutter/material.dart';
import 'package:pocket_health/Survey.dart';
import 'actual_survey.dart';

class SurveyForm extends StatefulWidget {
  @override
  _SurveyFormState createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
      child: Column(
        children: [
          Text(
            "Take A Survey To See\nHow Stressed You Are ??",
            style: TextStyle(
              color:Colors.black,
              fontSize: 48,
              fontFamily: 'Acme'
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/survey/relieved-face.gif"),
              Image.asset("assets/survey/pouting-face.gif")
            ],
          ),
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Survey())
                );
              },
              child: Text("LETS GET STARTED",style: TextStyle(color: Colors.white,fontSize: 20),),
              style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(248, 96, 96, 1),
              onPrimary: Color.fromRGBO(248, 96, 96, 1),
              minimumSize: Size(300, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
          ),
          )
        ],
      ),
    );
  }

}


