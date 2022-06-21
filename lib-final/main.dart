import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

import "pages/home.dart";

// Run and start our app
void main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  runApp(const MyApp());
}

// Setup a MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: HomePage(),
    );
  }
}
