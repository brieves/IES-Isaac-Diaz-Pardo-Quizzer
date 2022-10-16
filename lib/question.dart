import 'dart:async';
import 'package:flutter/material.dart';

import 'package:ies_isaac_diaz_pardo_quizzer/firebase_options.dart';
import 'package:ies_isaac_diaz_pardo_quizzer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ies_isaac_diaz_pardo_quizzer/widgets/points.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuestionScreen());
}

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IES Isaac Díaz Pardo Quizzer',
      home: const Structure(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class Structure extends StatelessWidget {
  const Structure({Key? key}) : super(key: key);

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
      // Get document Question 1
      future: preguntas.doc('Question 1').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        // If an error ocurred
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        // If the document doesn't exist
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text('Document does not exist');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Center(
            child: Container(
              // padding: EdgeInsetsGeometry.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  // The question
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16.0,
                            ),
                            // Repuesta 1
                            OutlinedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                              ),
                              child: Text(
                                "${data['respuesta1']}",
                                style: const TextStyle(
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                              ),
                              child: Text(
                                "${data['respuesta2']}",
                                style: const TextStyle(
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                              ),
                              child: Text(
                                "${data['respuesta3']}",
                                style: const TextStyle(
                                  fontSize: 26,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Points(),
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
