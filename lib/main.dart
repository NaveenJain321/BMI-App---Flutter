import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'project2222',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = ' ';
  var bgColor = Colors.blueAccent.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YOUR BMI",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 244, 248, 0),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter your Weight (in kg)'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in Feet)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in Inch)'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text;
                      var ft = ftController.text;
                      var inch = inController.text;

                      if (wt != '' && ft != "" && inch != '') {
                        //BMI Calculation

                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;

                        var tCm = tInch * 2.54;

                        var tM = tCm / 100;

                        var bmi = iWt / (tM * tM);
                        var msg = '';

                        if (bmi > 25) {
                          msg = "You are Overweight !!";
                          bgColor = Colors.orange.shade500;
                        } else if (bmi < 18) {
                          msg = "You are underweight !! ";
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = '   You are Healthy !!';
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              '$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}';
                        });
                      } else {
                        setState(() {
                          result = 'Please fill all the required blanks';
                        });
                      }
                    },
                    child: Text('Calculate')),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
