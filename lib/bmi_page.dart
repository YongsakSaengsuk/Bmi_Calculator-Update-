import 'package:bmi_calculator/model/bmidata.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  late double weight;
  late double height;
  late double bmiValue = 0;
  late int bmitype = 5;

  void bmiCalculate() {
    final weightText = weightController.text;
    final heightText = heightController.text;
    setState(() {
      if (weightText.isEmpty || heightText.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("กรุณากรอกข้อมูลให้ครบถ้วน")),
        );
      } else if (double.tryParse(weightText) == null ||
          double.tryParse(heightText) == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("กรุณากรอกเฉพาะตัวเลข")),
        );
      } else {
        // เมื่อค่าถูกต้อง
        weight = double.parse(weightText);
        height = double.parse(heightText) / 100;
        bmiValue = weight / ((height * height));
        if (bmiValue < 18.5) {
          bmitype = 0;
        } else if (bmiValue < 25) {
          bmitype = 1;
        } else if (bmiValue < 30) {
          bmitype = 2;
        } else if (bmiValue < 35) {
          bmitype = 3;
        } else {
          bmitype = 4;
        }
      }
    });
    weightController.clear();
    heightController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI Calculator",
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
            child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 199, 199, 199),
              offset: Offset(6, 0),
              spreadRadius: 2,
              blurRadius: 15,
            ),
            BoxShadow(
              color: Colors.white,
            ),
          ], borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                bmiGauges(bmiValue, bmitype),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromARGB(255, 123, 120, 120),
                          offset: Offset(-1, -1)),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: weightController,
                        decoration:
                            InputDecoration(labelText: 'น้ำหนัก(Kg.) :'),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: heightController,
                        decoration:
                            InputDecoration(labelText: 'ส่วนสูง(cm.) :'),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: bmiCalculate,
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.blueAccent),
                    animationDuration: Duration(seconds: 1),
                  ),
                  child: Text("Enter"),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

Widget bmiGauges(double bmiValue, int bmitype) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    title: GaugeTitle(text: bmiValue.toStringAsFixed(2)),
    axes: [
      RadialAxis(
        startAngle: 180,
        endAngle: 0,
        minimum: 0,
        maximum: 40,
        showTicks: false,
        showLabels: false,
        axisLineStyle:
            AxisLineStyle(thickness: 0.4, thicknessUnit: GaugeSizeUnit.factor),
        ranges: [
          GaugeRange(
            startValue: 0,
            endValue: 18.5,
            startWidth: 60,
            endWidth: 60,
            color: Colors.green,
          ),
          GaugeRange(
            startValue: 18.5,
            endValue: 24.9,
            startWidth: 60,
            endWidth: 60,
            color: Colors.yellow,
          ),
          GaugeRange(
            startValue: 25,
            endValue: 29.9,
            startWidth: 60,
            endWidth: 60,
            color: Colors.orange,
          ),
          GaugeRange(
            startValue: 30,
            endValue: 34.9,
            startWidth: 60,
            endWidth: 60,
            color: Colors.deepOrange,
          ),
          GaugeRange(
            startValue: 35,
            endValue: 40,
            startWidth: 60,
            endWidth: 60,
            color: Colors.red,
          ),
        ],
        pointers: [
          NeedlePointer(
            value: bmiValue, // เอาไว้ใส่ค่าที่ลูกสรชี้
            needleLength: 0.5,
            needleEndWidth: 10,
            enableAnimation: true,
            animationType: AnimationType.elasticOut,
            animationDuration: 2500,
            tailStyle: TailStyle(
                color: Colors.red,
                length: 0.4,
                lengthUnit: GaugeSizeUnit.factor),
            knobStyle: KnobStyle(knobRadius: 0.1),
          )
        ],
        annotations: [
          GaugeAnnotation(
            angle: 90,
            axisValue: 90,
            positionFactor: 0.2,
            widget: Text(bmiLevels[bmitype].title),
          ),
          GaugeAnnotation(
            positionFactor: 0.7,
            angle: 90,
            widget: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 123, 120, 120),
                      offset: Offset(-1, -1)),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 3,
                    blurRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                bmiLevels[bmitype].description == ""
                    ? "BMI Calculator"
                    : bmiLevels[bmitype].description,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      )
    ],
  );
}
