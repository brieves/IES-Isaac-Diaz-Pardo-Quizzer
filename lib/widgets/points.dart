import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget points(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('punctuation')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.only(top: 24),
            shrinkWrap: true,
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Text(
                    snapshot.data?.docs[index].get('name'),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Text(
                    snapshot.data?.docs[index].get('points'),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            }
        );
      }
  );
}