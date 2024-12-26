import 'package:flutter/material.dart';
import 'package:structure_identifier_cnt/resultscreen.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(CarbonNanotubeApp());

class CarbonNanotubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Nanotube Predictor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InputScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InputScreen extends StatelessWidget {
  final TextEditingController nController = TextEditingController();
  final TextEditingController mController = TextEditingController();

  void showToast(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/cnt.jpg',  // Set your CNT image for the AppBar title
              height: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Carbon Nanotube Predictor',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 112, 145, 162),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/cnt.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Slight transparency
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter n and m values',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: nController,
                      decoration: InputDecoration(
                        labelText: 'Enter n value',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.blue[50],
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: mController,
                      decoration: InputDecoration(
                        labelText: 'Enter m value',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.blue[50],
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (nController.text.isEmpty || mController.text.isEmpty) {
                          showToast(context, "Please input both n and m to determine the structure.");
                        } else {
                          int n = int.parse(nController.text);
                          int m = int.parse(mController.text);
                          double dt = calculateDiameter(n, m);
                          String structure = determineStructure(m, n);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(dt: dt, structure: structure),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 0, 79, 119),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Check Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateDiameter(int n, int m) {
    const double aCC = 1.42; // Carbon-carbon bond length in Ångstroms
    return (sqrt(3) * aCC * sqrt(m * m + m * n + n * n)) / pi;
  }

  String determineStructure(int m, int n) {
    if (m == n) {
      return 'Armchair';
    } else if (n == 0) {
      return 'Zigzag';
    } else {
      return 'Chiral';
    }
  }
}
