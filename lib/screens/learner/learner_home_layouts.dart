import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tutornest/screens/learner/learner_library_screen.dart';
import 'package:tutornest/screens/learner/learner_profile_screen.dart';
import 'package:tutornest/screens/learner/learner_sessions_screen.dart';

class LearnerHomeScreen extends StatefulWidget {
  //const LearnerHomeScreen({Key? key}) : super(key: key);

  @override
  _LearnerHomeScreenState createState() => _LearnerHomeScreenState();
}

class _LearnerHomeScreenState extends State<LearnerHomeScreen> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  GlobalKey _postItemKey = GlobalKey();
  int _currentIndex = 0;


  final tabs = [
    LearnerSessionsScreen(),
    LearnerLibraryScreen(), //home screen, default landing
    LearnerProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/images/app_bar_white_logo.png'),
        ),
        title: Text('Tutornest', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.white,
        color: Colors.orange,
        items: <Widget>[
          Icon(Icons.video_call, size: 30, color: Colors.white,semanticLabel: 'Sessions',),
          Icon(Icons.menu_book, size: 30,color: Colors.white,),
          Icon(Icons.account_circle, size: 30,  color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // changing selected page as per bar index selected by the user
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: tabs[_currentIndex],
      ),);
  }
}
