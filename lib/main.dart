import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();

  String tip = "";

  List<bool> _selection = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ignore: unnecessary_null_comparison
            if (tip != null)
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  tip,
                  style: TextStyle(fontSize: 30),
                ),
              ),

            Text(
              "Total Amount",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 70,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '\$100.00'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ToggleButtons(
                children: [
                  Text('10%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text('15%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text('20%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))
                ],
                isSelected: _selection,
                onPressed: (int selectedIndex) {
                  setState(
                    () {
                      for (int i = 0; i < _selection.length; i++) {
                        _selection[i] = selectedIndex == i;
                      }
                    },
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                final totalAmount = double.parse(controller.text);
                final selectedIndex =
                    _selection.indexWhere((element) => element);
                final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

                final tipTotal =
                    (totalAmount * tipPercentage).toStringAsFixed(2);

                setState(() {
                  tip = '\$$tipTotal';
                });
              },
              child: Text("Calculate Tip.."),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(150, 40)),
            ),
          ]),
        ),
      ),
    );
  }
}
