import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../variable.dart';

class MyBox extends StatefulWidget {
  final String dataType;

  const MyBox({Key? key, required this.dataType}) : super(key: key);

  @override
  State<MyBox> createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  double meterData = 0.0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: openFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Data has been loaded, access the last element based on the dataType
          if (widget.dataType == "Power Factor") {
            meterData = powerfactorData.last;
          } else if (widget.dataType == "Frequency") {
            meterData = frequencyData.last;
          } else if (widget.dataType == "Volt") {
            meterData = voltageData.last;
          } else if (widget.dataType == "Current") {
            meterData = currentData.last;
          }

          // Calculate maxMeter using the formula (n // 100 + 1) * 100
          double maxMeter = ((meterData ~/ 100) + 1) * 100;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: SfRadialGauge(
                    title: GaugeTitle(text: widget.dataType),
                    enableLoadingAnimation: true,
                    animationDuration: 4500,
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: maxMeter+1,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: meterData,
                            color: Colors.red,
                            startWidth: 10,
                            endWidth: 10,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: meterData),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              meterData.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          // While the data is loading, you can display a loading indicator or a placeholder widget
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
                      