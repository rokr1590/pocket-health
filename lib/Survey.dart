import 'package:flutter/material.dart';
import 'package:pocket_health/Happy.dart';
import 'package:pocket_health/Moderate.dart';
import 'package:pocket_health/Stressed.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  double question1=1;
  double _value=2;
  double question2 =1;
  double question3 =1;
  double question4=1;
  double question5=1;
  double question6=1;
  double question7 =1;
  double question8 =1;
  double question9=1;
  double question10=1;
  double total=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "Perceived stress scale ",
                   style: TextStyle(
                     fontSize: 48,
                     fontFamily: "Acme",
                     fontWeight: FontWeight.bold
                   ),
              ),
              SizedBox(height: 10,),
              Text("Q1 .In the last month, how often have you been upset because of something that happened unexpectedly?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question1.round().toString(),
                value: question1,
                onChanged: (newvalue) {
                  setState(() {
                    question1 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q2 In the last month, how often have you felt that you were unable to control the important things in your life?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question2.round().toString(),
                value: question2,
                onChanged: (newvalue) {
                  setState(() {
                    question2 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q3 In the last month, how often have you felt nervous and stressed?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question3.round().toString(),
                value: question3,
                onChanged: (newvalue) {
                  setState(() {
                    question3 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q4 In the last month, how often have you felt confident about your ability to handle your personal problems?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question4.round().toString(),
                value: question4,
                onChanged: (newvalue) {
                  setState(() {
                    question4 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q5 In the last month, how often have you felt that things were going your way?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question5.round().toString(),
                value: question5,
                onChanged: (newvalue) {
                  setState(() {
                    question5 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q6 In the last month, how often have you found that you could not cope with all the things that you had to do?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question6.round().toString(),
                value: question6,
                onChanged: (newvalue) {
                  setState(() {
                    question6 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q7 In the last month, how often have you been able to control irritations in your life?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question7.round().toString(),
                value: question7,
                onChanged: (newvalue) {
                  setState(() {
                    question7 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q8 In the last month, how often have you felt that you were on top of things?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question8.round().toString(),
                value: question8,
                onChanged: (newvalue) {
                  setState(() {
                    question8 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q9 In the last month, how often have you been angered because of things that happened that were outside of your control?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question9.round().toString(),
                value: question9,
                onChanged: (newvalue) {
                  setState(() {
                    question9 = newvalue;
                  });
                },
              ),
              SizedBox(height: 10,),
              Text("Q10 In the last month, how often have you felt difficulties were piling up so high that you could not overcome them?"),
              SizedBox(height: 10,),
              Slider(
                min: 1,
                max: 5,
                divisions: 4,
                label: question10.round().toString(),
                value: question10,
                onChanged: (newvalue) {
                  setState(() {
                    question10 = newvalue;
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(248, 96, 96, 1),
                    onPrimary: Color.fromRGBO(248, 96, 96, 1),
                    minimumSize: Size(300, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                ),
                onPressed: (){
                  setState(() {
                    total = (question1+question2+question3+question4+question5+question6+question7+question8+question9+question10);
                    if(total>0 && total<=13)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Happy())
                        );
                      }
                    else if(total>13 && total<=26)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Moder())
                        );
                      }
                    else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Stressed())
                      );
                    }
                  });
                }, child: Text("SUBMIT SURVEY",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

