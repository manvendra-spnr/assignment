// ignore_for_file: unnecessary_string_interpolations

import 'package:assignment/screens/gender_screen.dart';
import 'package:assignment/screens/height_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen>
    with SingleTickerProviderStateMixin {
  double _weightKg = 55.0; // Base weight in kilograms
  String _unit = 'Kg';

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Use addPostFrameCallback to safely call setState after the widget has been built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tabController.addListener(() {
        setState(() {
          _unit = _tabController.index == 0 ? 'Kg' : 'Pound';
        });
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  double get _displayWeight => _unit == 'Kg' ? _weightKg : _weightKg * 2.205;
// Changes value from pound to weight and vice versa
  void _updateWeight(String value) {
    if (value.isNotEmpty) {
      double enteredWeight = double.tryParse(value) ?? _weightKg;
      setState(() {
        _weightKg = _unit == 'Kg' ? enteredWeight : enteredWeight / 2.205;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GenderScreen(),
                ),
              );
            },
            child: Icon(Icons.arrow_back_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              const Center(
                child: Text(
                  "What is your Weight",
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
              const SizedBox(height: 30),

              // Tabs for Unit Selection
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Background color for the tabs
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.blue, // Selected tab background color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: const Text('Kg'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: const Text('Pound'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Weight Dial
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: _unit == 'Kg' ? 100 : 220,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: _unit == 'Kg' ? 100 : 220,
                          color: Colors.green),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: _displayWeight,
                        enableAnimation: true,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          '${_displayWeight.toStringAsFixed(1)} $_unit',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 70,
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: _updateWeight,
                    ),
                  ),
                  Text(
                    '$_unit',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(height: 40),
              // Continue Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeightScreen(),
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
        ),
      ),
    );
  }
}
