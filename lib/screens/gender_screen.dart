import 'package:assignment/screens/height_screen.dart';
import 'package:assignment/screens/weight_screen.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int selectedIndex = 0; // Track selected gender
  String selectedGender = "Female"; // Track the selected gender label

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_rounded),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeightScreen(),
                  ),
                );
              },
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HeightScreen()));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 16, color: Color(0xff522ED2)),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.1),
          const Center(
            child: Text(
              "Select your Gender",
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
          SizedBox(height: height * 0.1),

          // Image row with taps
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    selectedGender = "Female";
                  });
                },
                child: Stack(children: [
                  Image.asset(
                    "assets/female.jpg",
                    width: 150,
                    height: 150,
                  ),
                  if (selectedIndex == 0)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                ]),
              ),
              SizedBox(width: width * 0.15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                    selectedGender = "Male";
                  });
                },
                child: Stack(children: [
                  Image.asset(
                    "assets/male.jpg",
                    width: 100,
                    height: 150,
                  ),
                  if (selectedIndex == 1)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.blue,
                        size: 24,
                      ),
                    )
                ]),
              ),
            ],
          ),
          SizedBox(height: height * 0.05),

          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 2;
                selectedGender = "Other";
              });
            },
            child: Stack(
              children: [
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Other")),
                ),
                if (selectedIndex == 2)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.radio_button_checked,
                      color: Colors.blue,
                      size: 24,
                    ),
                  )
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
          // Container for tabs with text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(
                    color: const Color(0xffE9E9E9),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Male Tab
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                        selectedGender = "Female";
                      });
                    },
                    child: Text(
                      "Female",
                      style: TextStyle(
                        color: selectedIndex == 0 ? Colors.blue : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Female Tab
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                        selectedGender = "Male";
                      });
                    },
                    child: Text(
                      "Male",
                      style: TextStyle(
                        color: selectedIndex == 1 ? Colors.blue : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Other Tab
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                        selectedGender = "Other";
                      });
                    },
                    child: Text(
                      "Other",
                      style: TextStyle(
                        color: selectedIndex == 2 ? Colors.blue : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WeightScreen(),
                ),
              );
            },
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
