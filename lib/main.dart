import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ies_isaac_diaz_pardo_quizzer/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ies_isaac_diaz_pardo_quizzer/question.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable debug banner
      debugShowCheckedModeBanner: false,
      // App title
      title: 'IES Isaac Díaz Pardo Quizzer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(title: 'IES Isaac Díaz Pardo Quizzer'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

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
              color: Colors.white,
            ),
            label: const Text(
              '100',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            // style: ButtonStyle(
            //   textStyle: MaterialStateTextStyle.resolveWith((states) => const TextStyle(
            //     color: Colors.white,
            //   )),
            // ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }
}
// Center(
//   // Center is a layout widget. It takes a single child and positions it
//   // in the middle of the parent.
//   child: Column(
//     // Column is also a layout widget. It takes a list of children and
//     // arranges them vertically. By default, it sizes itself to fit its
//     // children horizontally, and tries to be as tall as its parent.
//     //
//     // Invoke "debug painting" (press "p" in the console, choose the
//     // "Toggle Debug Paint" action from the Flutter Inspector in Android
//     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//     // to see the wireframe for each widget.
//     //
//     // Column has various properties to control how it sizes itself and
//     // how it positions its children. Here we use mainAxisAlignment to
//     // center the children vertically; the main axis here is the vertical
//     // axis because Columns are vertical (the cross axis would be
//     // horizontal).
//     // mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Container(
//         height: 50,
//       ),
//       // Title text
//       Text(
//         'IES Isaac Díaz Pardo Quizzer',
//         style: Theme.of(context).textTheme.headline3,
//         textAlign: TextAlign.center,
//       ),
//       Container(
//         height: 30,
//       ),
//       // Start button
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           minimumSize: const Size(100, 50),
//         ),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const QuestionScreen()),
//           );
//         },
//         child: const Text(
//           'Empezar',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 26,
//           ),
//         ),
//       ),
//     ],
//   ),
// ),

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
    .collection('preguntas')
    .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: LinearProgressIndicator(),
        );
      } else {
        if (snapshot.error != null) {
          return const Center(
            child: Text('An error has occured'),
          );
        } else { Row(
            children: [
              Column(
                children: [
                  Text(
                    'Pregunta',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              ListView(
                padding: const EdgeInsets.only(top: 20.0),
                children:[
                  snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['respuesta1']),
                      onTap: () {},
                    );
                  }).toList()
                ],
              ),  
            ],
          );
        }
      }
    }
  );
}