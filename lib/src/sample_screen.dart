import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jsonwidget/src/preview_page.dart';

class SampleScreen extends StatefulWidget {
  SampleScreen(this.firestore, this.firebaseStorage);

  final Firestore firestore;
  final FirebaseStorage firebaseStorage;

  @override
  State<StatefulWidget> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.firestore.collection('widgets').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.documents.length;
        print(messageCount);
        print(snapshot.data.documents[0].data);
        return PreviewPage(json.encode(snapshot.data.documents[0].data));
      },
    );
  }
}
