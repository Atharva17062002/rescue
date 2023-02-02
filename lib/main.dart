import 'package:flutter/material.dart';
import 'package:rescue/dbhelper/mongodb.dart';
import 'package:rescue/screen/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await MongoDatabase.connect();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: homepage()
    );
  }
}



