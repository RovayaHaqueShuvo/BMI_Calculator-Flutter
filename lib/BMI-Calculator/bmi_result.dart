import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.bmiresult});
  final bmiresult;

  String getBMIStatus(){
    if (bmiresult < 16.0) return underweightSevere;
  if (bmiresult >= 16.0 && bmiresult <= 16.9) return underweightModerate;
  if (bmiresult>= 17.0 && bmiresult <= 18.4) return underweightMild;
  if (bmiresult >= 18.5 && bmiresult <= 24.9) return normal;
  if (bmiresult >= 25.0 && bmiresult <= 29.9) return preObese;
  if (bmiresult >= 30.0 && bmiresult <= 34.9) return obese1;
  if (bmiresult >= 35.0 && bmiresult <= 39.9) return obese2;
  return obese3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Result")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Your BMI",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                Text(bmiresult.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.lightBlueAccent,
                    )),
               SizedBox(height: 15,),
               const Text("BMI Status",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    )),
                Text(getBMIStatus(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    )),
                SizedBox(height: 15,),
                const Text("BMI Table",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    )),
            for(var key in bmiStatusMap.keys)
              ListTile(
                tileColor: _getTileColor(key),
                title: Text(key),
                trailing: Text("${bmiStatusMap[key]}", style: TextStyle(fontSize: 16,)),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color? _getTileColor(String status) {
    if (getBMIStatus() == status) return Colors.greenAccent;
    return null;
  }
}

const underweightSevere = 'Underweight\n(Severe thinness)';
const underweightModerate = 'Underweight\n(Moderate thinness)';
const underweightMild = 'Underweight\n(Mild thinness)';
const normal = 'Normal Range';
const preObese = 'Overweight\n(Pre-obese)';
const obese1 = 'Obese\n(Class I)';
const obese2 = 'Obese\n(Class II)';
const obese3 = 'Obese\n(Class III)';

final bmiStatusMap = {
  underweightSevere: 'less than 16.0',
  underweightModerate: '16.0 - 16.9',
  underweightMild: '17.0 - 18.4',
  normal: '18.5 - 24.9',
  preObese: '25.0 - 29.9',
  obese1: '30.0 - 34.9',
  obese2: '35.0 - 39.9',
  obese3: '40.0 and up'
};
