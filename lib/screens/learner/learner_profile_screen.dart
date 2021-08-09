import 'package:flutter/material.dart';

class LearnerProfileScreen extends StatefulWidget {

  @override
  _LearnerProfileScreenState createState() => _LearnerProfileScreenState();
}

class _LearnerProfileScreenState extends State<LearnerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 20,),
          CircleAvatar(
            radius: 55,
            backgroundColor: Color(0xffFDCF09),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/leaner_avatar.jpeg'),
            ),
          ),
          SizedBox(height: 10,),
          Text('Sibusiso Ndlovu', style: TextStyle(
            fontSize: 18
          ),),
          Text('1,000 TutorEggs', style: TextStyle(
            fontSize: 13
          ),),
          SizedBox(height: 20,),
          Card(
            child: ListTile(
              title: Text('Tisand Technical High School'),
              subtitle: Text('Grade 12 - (2022)'),
              trailing: Icon(Icons.edit),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Career Objective'),
              subtitle: Text('Ethical Hacker and Software Developer'),
              trailing: Icon(Icons.edit),
            ),
          )
        ],
      ),
    );
  }
}
