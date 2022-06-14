import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

// Global variables
SharedPreferences? prefs;

// Run and start our app
void main() async {
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

// Setup a MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: MyCounter(),
    );
  }
}

// Don't worry about this too much, just know that we need it
class MyCounter extends StatefulWidget {
  const MyCounter({Key? key}) : super(key: key);

  @override
  State<MyCounter> createState() => _MyCounterState();
}

// This is our actual app!
class _MyCounterState extends State<MyCounter> {
  // This variable stores the current count (always starting at 0)
  int counter = 0;

  // This function increases our counter by 1
  void incrementCounter() async {
    setState(() {
      counter++;
    });
    await prefs?.setInt("counter", counter);
  }

  void decreaseCounter() async {
    setState(() {
      counter--;
    });
    await prefs?.setInt("counter", counter);
  }

  @override
  void initState() {
    super.initState();
    counter = (prefs?.getInt("counter") ?? 0);
  }

  // This function makes things appear on screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello world!",
            ),
            Text(
              "Count: $counter",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decreaseCounter,
                  child: Text("-1"),
                ),
                ElevatedButton(
                  onPressed: incrementCounter,
                  child: Text("+1"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
