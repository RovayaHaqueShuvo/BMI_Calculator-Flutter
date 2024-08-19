import 'package:bmi_calculator/BMI-Calculator/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text("Enter Weight(in Kg)"),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.balance_outlined)),
            ),
           const Text(
              "You must provide number which Weight in kg. Example: 70",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 14.0),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text("Enter Height(in feet)"),
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.height)),
            ),
            const Text(
              "You must provide number which Height in feet. Example: 5.6",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 14.0),
            OutlinedButton(
                onPressed: _calculateBmi, child: const Text("CALCULATE BMI")),
          ],
        ),
      ),
    );
  }

  _calculateBmi() {
    if (_weightController.text.isEmpty) return;
    if (_heightController.text.isEmpty) return;
    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text) / 3.28084;

    var bmiResult = (weight / ((height * height)));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BmiResult(bmiresult: bmiResult)));
  }
}
