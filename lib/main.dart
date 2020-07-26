import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jsonwidget/resources/colors.dart';
import 'package:jsonwidget/src/code_editor_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp firebaseApp = await FirebaseApp.configure(
    name: 'jsonWidget',
    options: const FirebaseOptions(
      googleAppID: '1:977612628028:android:a91538d210a0b423522339',
      gcmSenderID: '977612628028',
      apiKey: 'AIzaSyCB2xBXLR4s41exrZxOEj5nprtBHMnceNo',
      projectID: 'json-widget',
    ),
  );
  final Firestore firestore = Firestore(app: firebaseApp);
  final FirebaseStorage firebaseStorage = FirebaseStorage(
      app: firebaseApp, storageBucket: 'gs://json-widget.appspot.com');

  runApp(MyApp(
    firestore: firestore,
    firebaseStorage: firebaseStorage,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({this.firestore, this.firebaseStorage});

  final Firestore firestore;
  final FirebaseStorage firebaseStorage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _getAppTheme(context),
      home: CodeEditorPage(),
    );
  }
}

_getAppTheme(BuildContext context) {
  return ThemeData(
    primaryColor: AppColor.PRIMARY.color,
    accentColor: AppColor.ACCENT.color,
    primarySwatch: MaterialColor(AppColor.PRIMARY_DARK.color.value, colorCodes),
    primaryIconTheme:
        Theme.of(context).accentIconTheme.copyWith(color: AppColor.WHITE.color),
    accentIconTheme:
        Theme.of(context).accentIconTheme.copyWith(color: AppColor.WHITE.color),
    primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
    cursorColor: AppColor.PRIMARY_DARK.color,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: AppColor.LABEL.color),
      hoverColor: AppColor.PRIMARY_DARK.color,
      focusColor: AppColor.PRIMARY_DARK.color,
      fillColor: AppColor.PRIMARY_DARK.color,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.LABEL.color),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.LABEL.color),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.LABEL.color),
      ),
    ),
  );
}
