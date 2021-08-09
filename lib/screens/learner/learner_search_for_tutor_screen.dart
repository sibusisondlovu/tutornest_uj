import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutornest/models/tutor_model.dart';
import 'package:tutornest/screens/learner/tutor_details_screen.dart';


class LearnerSearchForTutorScreen extends StatefulWidget {
  //const LearnerSearchForTutorScreen({Key? key}) : super(key: key);

  @override
  _LearnerSearchForTutorScreenState createState() => _LearnerSearchForTutorScreenState();
}

class _LearnerSearchForTutorScreenState extends State<LearnerSearchForTutorScreen> {

  String url =
      "https://api.tutornest.co.za/v1/tutors/find_tutor.php";

  bool isDataReady = false;

  var grades = ['Grade 8', 'Grade 9', 'Grade 10', 'Grade 11', 'Grade 12'];
  String gradeValue = 'Grade 8';
  var getBandSubjects = ['EMS', 'MLMMS', 'Technology', 'Life Sciences'];
  String getSubjectsValues = 'EMS';
  var fetBandSubjects = ['Mathematics', 'Physical Science', 'Business Studies', 'Tourism'];
  String fetSubjectsValue = 'Mathematics';

  Future<List<Tutor>> _fetchTutors() async {
    var data = await http.get(Uri.parse(url));
    var jsonData = json.decode(data.body);
    List<Tutor> tutors = [];

    for (var t in jsonData){
      Tutor tutor = Tutor(
        int.parse(t['id']),
        t['first_name'],
        t['last_name'],
        t['avatar'],
        t['email_address'],
        t['contact_number'],
        t['sace_number']
      );
      
      tutors.add(tutor);
    }

    print(tutors.length);
    setState(() {
      isDataReady = true;
    });

    return tutors;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search for Tutor'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: isDataReady? _buildResultView(context): _buildSearchView(context)
        ));
  }

  //search widget view

  Widget _buildSearchView(BuildContext context) {
    return Column(
      children: [
        Text('To get help from tutors, fill in the details below'),
        SizedBox(height: 30,),
        Text('Select your grade'),
        DropdownButton(
          value: gradeValue,
          items: grades.map((String items) {
            return DropdownMenuItem(
                value: items,
                child: Text(items)
            );
          }
          ).toList(),
          onChanged: (String newValue){
            setState(() {
              gradeValue = newValue;
            });
          },),
        SizedBox(height: 30,),
        Text('Select your subject'),
        gradeValue == 'Grade 8' || gradeValue == 'Grade 9'?
        DropdownButton(
          value: getSubjectsValues,
          items: getBandSubjects.map((String items) {
            return DropdownMenuItem(
                value: items,
                child: Text(items)
            );
          }
          ).toList(),
          onChanged: (String newValue){
            setState(() {
              getSubjectsValues = newValue;
            });
          },) :
        DropdownButton(
          value: fetSubjectsValue,
          items: fetBandSubjects.map((String items) {
            return DropdownMenuItem(
                value: items,
                child: Text(items)
            );
          }
          ).toList(),
          onChanged: (String newValue){
            setState(() {
              fetSubjectsValue = newValue;
            });
          },),
        SizedBox(height: 30,),
        Text('Type your learning area'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            decoration: InputDecoration(labelText: 'e.g Trigonometry'),
          ),
        ),

        SizedBox(height: 20,),
        ElevatedButton(
            onPressed: () async {
              _fetchTutors();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return Colors.cyan; // Use the component's default.
                },
              ),
            ),
            child: Text('Search')),
      ],
    );

  }

  Widget _buildResultView (BuildContext context) {
    return FutureBuilder(
      future: _fetchTutors(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        print(snapshot.data);
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
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      snapshot.data[index].firstName
                  ),
                ),
                title: Text(snapshot.data[index].firstName + ' ' + snapshot.data[index].lastName),
                subtitle: Text(snapshot.data[index].toString()),
                onTap: (){
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => TutorDetailsScreen())
                  );
                },
              );
            },
          );
        }
      },
    );
  }

}

