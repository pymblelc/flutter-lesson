import "package:flutter/material.dart";

// Run and start our app
void main() {
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
  void incrementCounter() {
    setState(() {
      counter++;
    });
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
              "Count: $counter",
            ),
            ElevatedButton(
              onPressed: incrementCounter,
              child: Text("+1"),
            ),
          ],
        ),
      ),
    );
  }
}
