import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import '../variable.dart';

class DynamicChart extends StatefulWidget {
  final String dataType;
  const DynamicChart({Key? key, required this.dataType}) : super(key: key);
  @override
  State<DynamicChart> createState() => _DynamicChartState();
}

class _DynamicChartState extends State<DynamicChart> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
    initializeChartData();
  }

  Future<void> initializeChartData() async {
    chartData = [];
    await openFile();

    setState(() {
      chartData = getChartData();
      Timer.periodic(const Duration(seconds: 1), updateDataSource);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        child: SfCartesianChart(
          series: <LineSeries<LiveData, int>>[
            LineSeries<LiveData, int>(
              onRendererCreated: (ChartSeriesController controller) {
                _chartSeriesController = controller;
              },
              dataSource: chartData,
              color: const Color.fromRGBO(192, 108, 132, 1),
              xValueMapper: (LiveData data, _) => data.time,
              yValueMapper: (LiveData data, _) => data.energy,
            ),
          ],
          primaryXAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 3,
            title: AxisTitle(text: 'Time'),
          ),
          primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
            title: AxisTitle(text: 'Energy'),
          ),
        ),
      ),
    );
  }

  int time = 21;
  void updateDataSource(Timer timer) {
    if (widget.dataType == "Power Factor") {
      if (powerfactorData.isNotEmpty && time < powerfactorData.length) {
        chartData.add(LiveData(time, powerfactorData[time]));
        chartData.removeAt(0);

        _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1,
          removedDataIndex: 0,
        );
        time++; // Increment time only when adding data to chartData
      }
    }
    if (widget.dataType == "Frequency") {
      if (frequencyData.isNotEmpty && time < frequencyData.length) {
        chartData.add(LiveData(time, frequencyData[time]));
        chartData.removeAt(0);

        _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1,
          removedDataIndex: 0,
        );
        time++; // Increment time only when adding data to chartData
      }
    }
    if (widget.dataType == "Current") {
      if (currentData.isNotEmpty && time < currentData.length) {
        chartData.add(LiveData(time, currentData[time]));
        chartData.removeAt(0);

        _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1,
          removedDataIndex: 0,
        );
        time++; // Increment time only when adding data to chartData
      }
    }
    if (widget.dataType == "Volt") {
      if (voltageData.isNotEmpty && time < voltageData.length) {
        chartData.add(LiveData(time, voltageData[time]));
        chartData.removeAt(0);

        _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1,
          removedDataIndex: 0,
        );
        time++; // Increment time only when adding data to chartData
      }
    }
  }

  List<LiveData> getChartData() {
    List<LiveData> chartData = [];

    if (widget.dataType == "Power Factor") {
      for (var data in powerfactorData) {
        int time = powerfactorData
            .indexOf(data); // Assuming the time value is stored in index 1
        double energy = 0;
        try {
          energy = data;
        } catch (e) {
          for (var element in data) {
            print(element);
          }
          energy = 0;
        }
        // double energy = data; // Assuming the energy value is stored in index 2
        chartData.add(LiveData(time, energy));
      }
    }
    if (widget.dataType == "Frequency") {
      for (var data in frequencyData) {
        int time = frequencyData
            .indexOf(data); // Assuming the time value is stored in index 1
        double energy = 0;
        try {
          energy = data;
        } catch (e) {
          for (var element in data) {
            print(element);
          }
          energy = 0;
        }
        // double energy = data; // Assuming the energy value is stored in index 2
        chartData.add(LiveData(time, energy));
      }
    }
    if (widget.dataType == "Current") {
      for (var data in currentData) {
        int time = currentData
            .indexOf(data); // Assuming the time value is stored in index 1
        double energy = 0;
        try {
          energy = data;
        } catch (e) {
          for (var element in data) {
            print(element);
          }
          energy = 0;
        }
        // double energy = data; // Assuming the energy value is stored in index 2
        chartData.add(LiveData(time, energy));
      }
    }
    if (widget.dataType == "Volt") {
      for (var data in voltageData) {
        int time = voltageData
            .indexOf(data); // Assuming the time value is stored in index 1
        double energy = 0;
        try {
          energy = data;
        } catch (e) {
          for (var element in data) {
            print(element);
          }
          energy = 0;
        }
        // double energy = data; // Assuming the energy value is stored in index 2
        chartData.add(LiveData(time, energy));
      }
    }
    return chartData;
  }
}

class LiveData {
  LiveData(this.time, this.energy);
  final int time;
  final double energy;
}

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import '../timedata.dart';

// class TimeEnergyData {
//   final DateTime time;
//   final double energy;

//   TimeEnergyData(this.time, this.energy);
// }

// class MyTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 300, // Set the desired width
//         height: 500, // Set the desired height

//         child: DynamicChart(), // Replace DynamicChart with your actual widget
//       ),
//     );
//   }
// }

// class DynamicChart extends StatefulWidget {
//   const DynamicChart({Key? key}) : super(key: key);

//   @override
//   _DynamicChartState createState() => _DynamicChartState();
// }

// class _DynamicChartState extends State<DynamicChart> {
//   List<charts.Series<TimeEnergyData, DateTime>>? _seriesData;

//   @override
//   void initState() {
//     super.initState();
//     _generateData(); // Generate initial chart data
//   }

//   void _generateData() {
//     List<TimeEnergyData> data = [];

//     for (int i = 0; i < pFData.length; i++) {
//       try {
//         DateTime time = vPData[i][1];
//         double energy = vPData[i][2];
//         data.add(TimeEnergyData(time, energy));
//       } catch (e) {
//         // Handle the out-of-range index error
//         print('Error accessing data at index $i: $e');
//       }
//     }

//     _seriesData = [
//       charts.Series<TimeEnergyData, DateTime>(
//         id: 'TimeEnergy',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (TimeEnergyData data, _) => data.time,
//         measureFn: (TimeEnergyData data, _) => data.energy,
//         data: data,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Data Graph'),
//       ),
//       body: _seriesData != null
//           ? charts.TimeSeriesChart(
//               _seriesData!,
//               animate: true,
//               dateTimeFactory: const charts.LocalDateTimeFactory(),
//             )
//           : const CircularProgressIndicator(),
//     );
//   }
// }
