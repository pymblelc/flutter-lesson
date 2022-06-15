import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

const boxName = "counter";

// Run and start our app
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(boxName);
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
  Box storage = Hive.box(boxName);
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = storage.get("count", defaultValue: 0);
  }

  // This function increases our counter by `amount`
  void Function() changeCounter(int? amount) {
    return () {
      setState(() {
        if (amount != null) {
          counter += amount;
        } else {
          counter = 0;
        }
      });
      storage.put("count", counter);
    };
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
                  onPressed: changeCounter(-5),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 71, 96, 129),
                    ),
                  ),
                  child: Text("-5"),
                ),
                ElevatedButton(
                  onPressed: changeCounter(-1),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 61, 90, 129),
                    ),
                  ),
                  child: Text("-1"),
                ),
                ElevatedButton(
                  onPressed: changeCounter(1),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 60, 111, 179),
                    ),
                  ),
                  child: Text("+1"),
                ),
                ElevatedButton(
                  onPressed: changeCounter(5),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 48, 135, 250),
                    ),
                  ),
                  child: Text("+5"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: changeCounter(null),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 204, 171, 171),
                ),
              ),
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
