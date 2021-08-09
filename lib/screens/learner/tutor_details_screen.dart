import 'package:flutter/material.dart';
import 'package:tutornest/screens/tutoring_session_video_screen.dart';

class TutorDetailsScreen extends StatefulWidget {
  //const TutorDetailsScreen({Key? key}) : super(key: key);

  @override
  _TutorDetailsScreenState createState() => _TutorDetailsScreenState();
}

class _TutorDetailsScreenState extends State<TutorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topLeft, child: Icon(Icons.arrow_back)),
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              child: Image.asset(
                'assets/images/tutor_avatar.png',
                width: 120,
              )),
          Text(
            'Prof Kim Ndlovu',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('BEd Degree (Senior & FET) - Wits University'),
          Chip(
            label: Text('Online'),
            backgroundColor: Colors.green,
            labelStyle: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subjects',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      'Mathematics (Grade 12), Physical Sciences (Grade 11), Technology (Grade 9)',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => TutoringSessionVideoScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.cyan; // Use the component's default.
                  },
                ),
              ),
              child: Text('Start Tutoring Session')),
          Text('or'),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => TutoringSessionVideoScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.blueAccent; // Use the component's default.
                  },
                ),
              ),
              child: Text('Schedule Tutoring Session'))
        ]),
      ),
    );
  }
}
