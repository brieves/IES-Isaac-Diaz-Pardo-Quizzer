import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Points extends StatelessWidget {
  const Points({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Table(
              children: const [
                TableRow(
                  children: [TableCell(child: Text('Hola'))],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
