import 'dart:async';
import 'package:flutter/material.dart';

import 'package:ies_isaac_diaz_pardo_quizzer/firebase_options.dart';
import 'package:ies_isaac_diaz_pardo_quizzer/main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> main() async {
  runApp(const QuestionScreen());
}

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IES Isaac Díaz Pardo Quizzer',
      home: Structure(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class Structure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IES Isaac Díaz Pardo Quizzer'),
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  CollectionReference preguntas =
      FirebaseFirestore.instance.collection('preguntas');

  return FutureBuilder<DocumentSnapshot>(
      future: preguntas.doc('Question 1').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text('Document does not exist');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Center(
            child: Container(
              padding: EdgeInsetsGeometry.infinity,
              child: Column(
                children: [
                  Container(
                    height: 16,
                  ),
                  Text(
                    "${data['pregunta']}",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 16.0,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text(
                                'Respuesta 1',
                                style: TextStyle(
                                  fontSize: 22,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text(
                                'Respuesta 2',
                                style: TextStyle(
                                  fontSize: 22,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text(
                                'Respuesta 3',
                                style: TextStyle(
                                  fontSize: 22,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}
