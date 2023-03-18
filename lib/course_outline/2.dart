import 'package:dartapp/configs/appbar.dart';
import 'package:dartapp/configs/configs.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreExample2 extends StatefulWidget {
  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample2> {
  // Firestore collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('dartapp');
  // Document ID to fetch data from
  final String documentId = '2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarDesign(
        header: Text(
          "Flutter - Introduction",
          style: headingMain,
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        // Stream to listen for changes in the document
        stream: collection.doc(documentId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Text('Loading...');
          }
          // Extract data from the document snapshot
          final data = snapshot.data!.data();
          // Display the data in a ListView]]]]]]]]]]]]]]]

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    data
                        .toString()
                        .replaceAll(
                          "{basics:",
                          "",
                        )
                        .replaceAll("}", ""),
                    style: content,
                  ),
                  //subtitle: Text('Age: ${data['basics']}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
