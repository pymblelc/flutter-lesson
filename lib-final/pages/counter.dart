import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

// Don't worry about this too much, just know that we need it
class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// This is our actual app!
class _CounterPageState extends State<CounterPage> {
  Box storage = Hive.box("storage");
  // This variable stores the current count (always starting at 0)
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
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "💽 Saved Count",
              textScaleFactor: 2.5,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: changeCounter(-100),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 80, 59, 107),
                    ),
                  ),
                  child: Text("-100"),
                ),
                ElevatedButton(
                  onPressed: changeCounter(100),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 135, 88, 197),
                    ),
                  ),
                  child: Text("+100"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: changeCounter(null),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 156, 124, 124),
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
