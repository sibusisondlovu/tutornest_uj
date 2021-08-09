import 'package:flutter/material.dart';
import 'package:tutornest/screens/onboarding_screen.dart';
import 'screens/learner/learner_home_layouts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tutor Nest',
        debugShowCheckedModeBanner: false,
         theme: ThemeData(
             primarySwatch: Colors.orange,
             fontFamily: 'Poppins',
           bottomAppBarColor: Colors.amberAccent
         ),
        home: OnboardingScreen()
    );
  }
}
