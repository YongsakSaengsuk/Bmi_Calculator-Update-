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
  late int bmitype = 5 ;

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
          bmitype = 0; // ต่ำกว่าเกณฑ์
        } else if (bmiValue < 25) {
          bmitype = 1; // น้ำหนักปกติ
        } else if (bmiValue < 30) {
          bmitype = 2; // น้ำหนักเกินเกณฑ์ ระดับ 1
        } else if (bmiValue < 35) {
          bmitype = 3; // น้ำหนักเกินเกณฑ์ ระดับ 2
        } else {
          bmitype = 4; // โรคอ้วน
        }
      }
    });
    weightController.clear();
    heightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Text("BMI Calculator"),
              SizedBox(
                height: 20,
              ),
              bmiGauges(bmiValue, bmitype),
              TextField(
                controller: weightController,
                decoration: InputDecoration(labelText: 'น้ำหนัก(Kg.) :'),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: heightController,
                decoration: InputDecoration(labelText: 'ส่วนสูง(cm.) :'),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: bmiCalculate, child: Text("Enter"))
            ],
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
            widget: Text(bmiLevels[bmitype].title),
            angle: 90,
            axisValue: 90,
            positionFactor: 0.2,
          ),
          GaugeAnnotation(
            widget: Text(bmiLevels[bmitype].description),
            positionFactor: 0.6,
            angle: 90,
          ),
        ],
      )
    ],
  );
}
