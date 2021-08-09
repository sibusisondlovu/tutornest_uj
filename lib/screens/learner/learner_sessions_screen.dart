import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutornest/models/session_model.dart';
import 'package:tutornest/screens/learner/learner_search_for_tutor_screen.dart';
import 'package:http/http.dart' as http;

class LearnerSessionsScreen extends StatefulWidget {


  @override
  _LearnerSessionsScreenState createState() => _LearnerSessionsScreenState();
}

class _LearnerSessionsScreenState extends State<LearnerSessionsScreen> {

  String url = 'https://api.tutornest.co.za/v1/sessions/read.php';
  bool isDataReady = false;

  Future<List<Session>> _fetchTutors() async {
    var data = await http.get(Uri.parse(url));
    var jsonData = json.decode(data.body);
    List<Session> sessions = [];

    for (var t in jsonData){
      Session session = Session(
          int.parse(t['id']),
          int.parse(t['learner_id']),
          int.parse(t['tutor_id']),
          t['title'],
          t['status'],
          t['session_date'],
          t['title']
      );

      sessions.add(session);
    }

    setState(() {
      isDataReady = true;
    });

    return sessions;

  }

  @override
  void initState() {
   // _fetchTutors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child:_buildSessionsList(context)
    );

  }

  Widget _buildNoSessionWidget(BuildContext context){
    return Column(
      children: [
        SizedBox(height: 30,),
        Image.asset('assets/images/tutornest4.jpg', width: 200,),
        SizedBox(height: 30,),
        Text(
          'You do not have any sessions yet. Click on button below to search for available tutors',
          textAlign: TextAlign.center,
          style: TextStyle(

              fontSize: 16
          ),),
        SizedBox(height: 50,),
        OutlinedButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LearnerSearchForTutorScreen()),
          );
        }, child: Text('Find Tutors')),

      ],
    );
  }

  Widget _buildSessionsList (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: (){
                     Navigator.push(context,
                         new MaterialPageRoute(builder: (context) => LearnerSearchForTutorScreen())
                     );
                },
                child: Text('Find Tutor')),
          ),
          Expanded(
            child: FutureBuilder(
              future: _fetchTutors(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                print(snapshot.data);
                if (!snapshot.hasData) {
                  _buildNoSessionWidget(context);
                }

                if (snapshot.hasError) {
                  return Text('An unknown error has occurred. Please try again \n' + snapshot.error.toString());
                }


                if(snapshot.data == null){
                  return Container(
                      child: Center(
                          child: Text("Loading...")
                      )
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset('assets/images/tutor_avatar.png'),
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].sessionDate),
                        onTap: (){
                       //   Navigator.push(context,
                       //       new MaterialPageRoute(builder: (context) => TutorDetailsScreen())
                       //   );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      );
    }
}

