import 'package:flutter/material.dart';
import 'package:pocket_health/Timer/countdown-page.dart';

class Meditate extends StatefulWidget {
  @override
  _MeditateState createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          //Image.asset('assets/meditate_bg.png'),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: const Text("we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Acme',fontSize: 16,color: Colors.grey,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
