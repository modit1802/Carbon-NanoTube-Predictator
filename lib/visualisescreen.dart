import 'package:flutter/material.dart';

class VisualizeScreen extends StatelessWidget {
  final String structure;
  final double dt;

  // Constructor to accept structure and diameter as parameters
  VisualizeScreen({required this.structure, required this.dt});

  @override
  Widget build(BuildContext context) {
    // Determine which image to show based on the structure
    String gifPath = '';
    if (structure == 'Armchair') {
      gifPath = 'images/armchair.gif'; // Armchair gif
    } else if (structure == 'Zigzag') {
      gifPath = 'images/zigzag.gif'; // Zigzag gif
    } else if (structure == 'Chiral') {
      gifPath = 'images/chiral.gif'; // Chiral gif
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Visualize CNT',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 112, 145, 162),
      ),
      body: Stack(
        children: [
                    Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/cnt.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                    height: 80,
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
                    child:Center(
                      child: Text(
                      'Visualizing CNT Structure: $structure',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                                        ),
                    )),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 50,
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
                      child: Center(
                        child: Text(
                          'Diameter: ${dt.toStringAsFixed(2)} Å',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(136, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Display the GIF based on structure type
                  Container(
                    width: 250,
                    height: 250,
                    child: gifPath.isNotEmpty
                        ? Image.asset(
                            gifPath, // Dynamically load the gif
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Text('No visualization available'),
                          ),
                  ),
                  SizedBox(height: 20),
                  // You can replace the above container with your CNT visualization
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
