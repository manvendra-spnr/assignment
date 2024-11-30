import 'package:assignment/api/api.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:assignment/screens/weight_screen.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  double selectedHeight = 150.0; // Default height in cm

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeightScreen(),
                ),
              );
            },
            child: Icon(Icons.arrow_back_rounded)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.05),
          const Center(
            child: Text(
              "What is your Height",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff4E4866),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              "Help us to create your personalized plan",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff626C72),
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
                color: Color(0xff522ED2),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Text(
              "Cm",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
          SizedBox(
            height: height * 0.12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/heightIcon.jpg"),
              SizedBox(
                width: width * 0.2,
              ),
              Container(
                width: 100, // Adjust the width as needed
                height: 250, // Adjust the height as needed
                margin: EdgeInsets.all(10),
                child: SfLinearGauge(
                  minimum: 140.0, // Minimum height in cm
                  maximum: 200.0, // Maximum height in cm
                  orientation: LinearGaugeOrientation.vertical,
                  majorTickStyle: LinearTickStyle(length: 20),
                  axisLabelStyle:
                      TextStyle(fontSize: 12.0, color: Colors.black),
                  axisTrackStyle: LinearAxisTrackStyle(
                    color: Colors.cyan,
                    edgeStyle: LinearEdgeStyle.bothFlat,
                    thickness: 15.0,
                    borderColor: Colors.grey,
                  ),
                  // Use a gauge pointer to represent the height selection
                  // pointers: <LinearGaugePointer>[
                  //   LinearBarPointer(
                  //     value: selectedHeight, // Dynamically change the pointer based on the slider
                  //     color: Colors.purple,
                  //     thickness: 15,
                  //   ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.05),
          // Display selected height
          Text(
            "Selected Height: ${selectedHeight.toStringAsFixed(0)} cm",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
           
           
           
           
           GestureDetector(
            onTap: checkApi,
             child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 60,
                    width: 60,
                    color: Color(0xff6C4DDA),
                    child: Icon(
                      Icons.arrow_right_alt_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
           )
        ],
      ),
    );
  }
}
