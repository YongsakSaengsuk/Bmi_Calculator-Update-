import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          child: Center(
              child: Column(
            children: [
              Text("BMI Calculator"),
              SizedBox(
                height: 20,
              ),
              bmiGauges(),
            ],
          )),
        ),
      ),
    );
  }
}

Widget bmiGauges() {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: [
      RadialAxis(
        startAngle: 180,
        endAngle: 0,
        minimum: 0,
        maximum: 40,
        showTicks: false,
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
            value: 23, // เอาไว้ใส่ค่าที่ลูกสรชี้
            needleLength: 0.5,
            needleEndWidth: 10,
            knobStyle: KnobStyle(knobRadius: 0.1),
          )
        ],
        annotations: [
          GaugeAnnotation(
            widget: Text('BMI'),
            positionFactor: 0.2,
            angle: 90,
          )
        ],
      )
    ],
  );
}
