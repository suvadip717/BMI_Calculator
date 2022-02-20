import 'package:bmi_calculater/components/app_color.dart';
import 'package:bmi_calculater/wigets/leftBar.dart';
import 'package:bmi_calculater/wigets/rightBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _hightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATER",
          style: TextStyle(color: accentColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 150,
                  child: TextField(
                    controller: _hightController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: accentColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 42,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Hight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: accentColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 42,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_hightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  // Below 18.5	Underweight
                  // 18.5—24.9	Healthy
                  // 25.0—29.9	Overweight
                  // 30.0 and Above	Obese

                  if (_bmiResult < 18.5) {
                    _textResult = "You are Underweight";
                  }
                  if (_bmiResult < 25 && _bmiResult > 18.5) {
                    _textResult = "You are Healthy";
                  }
                  if (_bmiResult < 30 && 25 > _bmiResult) {
                    _textResult = "You are Overweight";
                  }
                });
              },
              child: Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 90),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                  fontSize: 30,
                  color: accentColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RightBar(
              barWidth: 35,
            ),
            SizedBox(
              height: 15,
            ),
            LeftBar(
              barWidth: 80,
            ),
            SizedBox(
              height: 15,
            ),
            LeftBar(
              barWidth: 180,
            ),
            SizedBox(
              height: 15,
            ),
            LeftBar(
              barWidth: 80,
            ),
            RightBar(
              barWidth: 35,
            ),
          ],
        ),
      ),
    );
  }
}
