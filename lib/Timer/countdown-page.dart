import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'round-button.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  String get countText {
    Duration count = controller.duration! * controller.value;
    return
    controller.isDismissed?
    '${controller.duration!.inHours}:${(controller.duration!.inMinutes%60).toString().padLeft(2,'0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2,'0')}':
    '${count.inHours}:${(count.inMinutes%60).toString().padLeft(2,'0')}:${(count.inSeconds % 60).toString().padLeft(2,'0')}';
  }

  double progress =1.0;
  void notify(){
    if(countText == '0:00:00'){
      FlutterRingtonePlayer.playAlarm(
          volume: 0.1,
          looping:false);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =AnimationController(vsync: this,duration: Duration(seconds: 60));
    controller.addListener(() {
      notify();
      if(controller.isAnimating) {
        setState(() {
          progress =controller.value;
        });
      }
      else{
        setState(() {
          progress =1.0;
          isPlaying =false;
        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5fbff),
      body: Column(
        children: [
          Image.asset('assets/meditate_bg.png'),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: const Text("we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Acme',fontSize: 16,color: Colors.grey,),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(width: 100,height: 100,child: CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade300,
                strokeWidth: 6,
              ),),
              GestureDetector(
                onTap: (){
                  if(controller.isDismissed){
                    showModalBottomSheet(context: context,
                        builder: (context) =>
                            Container(
                              height: 200,
                              child: CupertinoTimerPicker(
                                initialTimerDuration: controller.duration!,
                                onTimerDurationChanged: (time){
                                  setState(() {
                                    controller.duration =time;
                                  });
                                },
                              ),
                            )
                    );
                  }
                },
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context,child)=>Text(
                    countText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:(){
                    if(controller.isAnimating){
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    }
                    else{
                      controller.reverse(from: controller.value ==0?1.0:controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  child: RoundButton(
                  icon: isPlaying ==true? Icons.pause:Icons.play_arrow,
                )),
                GestureDetector(
                  onTap: (){
                    controller.reset();
                    setState(() {
                      isPlaying ==false;
                      FlutterRingtonePlayer.stop();
                    });
                  },
                  child:RoundButton(
                   icon: Icons.stop,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
