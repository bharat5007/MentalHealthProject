import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/AuthServices.dart';
import 'questions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Brain quiz = Brain();

class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  final _firestore = FirebaseFirestore.instance;
  int count = 0;
  late int value;
  late String question;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Questions',
                            style: TextStyle(
                                fontSize: 40, fontFamily: 'DancingScript'),
                          ),
                        ), //PRINT QUESTION TEXT
                        const SizedBox(
                          height: 100,
                          width: 300,
                          child: Center(
                            child: Text(
                              'Complete the test for your betterment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontFamily: 'DancingScript'),
                            ),
                          ),
                        ), // PRINT COMPLETE THE TEST TEST
                        const SizedBox(
                          height: 50,
                        ), //SPACE
                        Container(
                          width: 350,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFEFEBE9),
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ), //SPACE
                              SizedBox(
                                width: 300,
                                height: 235,
                                child: Text(
                                  quiz.getquestion(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ), //QUESTIONS DISPLAY
                              SizedBox(
                                  width: 300,
                                  height: 135,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        count.toString(),
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      Slider(
                                        value: count.toDouble(),
                                        min: 0,
                                        max: 10,
                                        activeColor: const Color(0xFFFB1555),
                                        inactiveColor: const Color(0xFF8D8E98),
                                        onChanged: (double newvalue) {
                                          setState(() {
                                            count = newvalue.round();
                                          });
                                        },
                                      ),
                                    ],
                                  )) //ANSWER DISPLAY
                            ],
                          ),
                        ), //QUESTION AND ANSWER BOX
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () async {
                              final uid = AuthService().inputData();
                              setState(() {
                                question = quiz.getquestion();
                                value = count;
                                quiz.next();
                              });
                              await _firestore.collection('user').doc(uid).set({
                                'question': question,
                                'answer': value,
                              });
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(fontSize: 25, color: Colors.black),
                            )) //NEXT
                      ],
                    ) //Questions and complete the test
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
