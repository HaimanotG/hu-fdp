import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:fresh_dorm/Info.dart';
import 'package:fresh_dorm/MyClipper.dart';
import 'package:fresh_dorm/SplashScreen.dart';
import 'package:fresh_dorm/entities/Student.dart';

List<Student> _students = new List<Student>();

Future<List<Student>> loadAsset() async {
  var data = await rootBundle.loadString('assets/data.json');
  var initial = json.decode(data);

  var students = List<Student>();

  for (int i = 0; i < initial.length; i++) {
    var stud = initial['SS&NS'];
    for (var j = 0; j < stud.length; j++) {
      students.add(Student.fromJson(stud[j]));
    }
  }

  return students;
}

void initState() {
  loadAsset().then((onValue) {
    _students.addAll(onValue);
  });
}

void main() {
  initState();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        accentColor: Colors.teal,
      ),
      title: "Fresh Dormitary",
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashScreen(),
        '/home': (context) => Home(),
        '/info': (context) => Info()
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color firstColor = Color(0xFFF47D15);
  Color secondColor = Color(0xFFEF772C);

  var myController = TextEditingController();
  var searchedData = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: MyClipper(),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[Colors.amber, secondColor],
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 40,
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/info');
                                          },
                                          child: Icon(
                                            Icons.info_outline,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          buildTopCenter(screenWidth, context)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Center(
                            child: Text(
                          searchedData,
                          style: TextStyle(fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Center buildTopCenter(double screenWidth, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter Your Admission \n ID Here',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: 20),
            Material(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              elevation: 8,
              child: Container(
                height: 45,
                width: screenWidth * .75,
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 14,
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    suffixIcon: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          var stud = _students.where((student) {
                            return student.admsionNo
                                .contains(myController.text);
                          });

                          var test = stud.toList();
                          print(test.length);
                          if (test.length == 0) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Can't Find Student"),
                            ));
                            searchedData = "Can't Find Student";
                          } else {
                            var testData = test[0];
                            setState(() {
                              searchedData = 'S/N: ' +
                                  testData.sn +
                                  '\nSex: ' +
                                  testData.sex +
                                  '\nFull Name: ' +
                                  testData.fullName +
                                  '\nAdmsion N: ' +
                                  testData.admsionNo +
                                  '\nField: ' +
                                  testData.field +
                                  '\nCampus: ' +
                                  testData.campus +
                                  '\nBuilding: ' +
                                  testData.building +
                                  ' \nDorm: ' +
                                  testData.dorm +
                                  '\nYear: ' +
                                  testData.year;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
