import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ies_isaac_diaz_pardo_quizzer/main.dart';


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
        useMaterial3: true,
        primarySwatch: Colors.purple,
      ),
    );
  }
}

List data = [];

class Structure extends StatelessWidget {
  const Structure({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IES Isaac Díaz Pardo Quizzer'),
      ),
      body: const QuestionPage(title: 'IES Isaac Díaz Pardo Quizzer'),
    );
  }
}


class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          // Text button creation
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.military_tech,
              size: 32,
            ),
            label: const Text(
                '100'
            ),
          ),
        ],
      ),
      body: Center(child:
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('punctuation')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          Text(
                            snapshot.data?.docs[index].get('name'),
                            style: const TextStyle(
                                height: 2.0
                            ),
                          ),
                          const Spacer(),
                          Text(snapshot.data?.docs[index].get('name'),
                          ),
                        ],
                      );
                    }
                );
              }
          )
      ),
    );
  }
}
