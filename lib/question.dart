import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ies_isaac_diaz_pardo_quizzer/main.dart';

void main (){
  runApp(const QuestionScreen());
}

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IES Isaac Díaz Pardo Quizzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

}