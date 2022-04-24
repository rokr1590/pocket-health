import 'package:flutter/material.dart';
import 'package:pocket_health/Timer/countdown-page.dart';
import 'package:pocket_health/custom_icons_icons.dart';
import 'package:pocket_health/home_screen.dart';
import 'package:pocket_health/meditate.dart';
import 'package:pocket_health/survey_screen.dart';
import 'package:pocket_health/user_profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pocket_health/Survey.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int index=0;
  final screens =[

    HomeScreen(),
    SurveyForm(),
    CountdownPage(),
    ProfileDetails(),
  ];
  final items=<Widget>[
    Icon(
      CustomIcons.icons8_home__2_
    ),
    Icon(
      CustomIcons.icons8_survey_24
    ),
    Icon(
      CustomIcons.icons8_meditation_50
    ),
    Icon(
      CustomIcons.icons8_male_user_24
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          color: Color.fromRGBO(246, 181, 120, 1),
          backgroundColor: Colors.transparent,
          height: 60,
          index: index,
          items: items,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}
