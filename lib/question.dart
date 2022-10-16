import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ies_isaac_diaz_pardo_quizzer/main.dart';

void main() {
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
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 16,
                ),
                Text(
                  '¿Pregunta?',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(children: [
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
            ]),
          ),
        ],
      ),
    );
  }
}
