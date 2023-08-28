import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../variable.dart';

class BarChartData {
  final String category;
  final int value;

  BarChartData(this.category, this.value);
}

class MyRegionBar extends StatefulWidget {
  final String dataType;
  const MyRegionBar({Key? key, required this.dataType}) : super(key: key);

  @override
  State<MyRegionBar> createState() => _MyRegionBarState();
}

class _MyRegionBarState extends State<MyRegionBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Set the desired width
      height: 200, // Set the desired height
      child: DynamicBarChart(
          aa: widget.dataType), // Replace DynamicChart with your actual widget
    );
  }
}

class DynamicBarChart extends StatefulWidget {
  final String aa;
  const DynamicBarChart({Key? key, required this.aa}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DynamicBarChartState createState() => _DynamicBarChartState();
}

class _DynamicBarChartState extends State<DynamicBarChart> {
  List<charts.Series<BarChartData, String>>? _seriesData;

  @override
  void initState() {
    super.initState();
    _generateData(); // Generate initial chart data
  }

  void _generateData() {
    List<BarChartData> data = [];

    // Replace this with your own logic to fetch and update data dynamically
    if (widget.aa == 'power factor') {
      data = [
        BarChartData('IIT East Region',
            powerfactorData.last.toInt()),
        BarChartData('IIT West Region',
            powerfactorData.last.toInt()),
        BarChartData('IIT North Region',
            powerfactorData.last.toInt()),
        BarChartData('IIT South Region',
            powerfactorData.last.toInt()),
      ];
    }
    if (widget.aa == 'frequency') {
      data = [
        BarChartData('IIT East Region',
            frequencyData.last.toInt()),
        BarChartData('IIT West Region',
            frequencyData.last.toInt()),
        BarChartData('IIT North Region',
            frequencyData.last.toInt()),
        BarChartData('IIT South Region',
            frequencyData.last.toInt()),
      ];
    }
    if (widget.aa == 'current value') {
      data = [
        BarChartData('IIT East Region',
            currentData.last.toInt()),
        BarChartData('IIT West Region',
            currentData.last.toInt()),
        BarChartData('IIT North Region',
            currentData.last.toInt()),
        BarChartData('IIT South Region',
            currentData.last.toInt()),
      ];
    }
    if (widget.aa == 'volt phase') {
      data = [
        BarChartData('IIT East Region',
            voltageData.last.toInt()),
        BarChartData('IIT West Region',
            voltageData.last.toInt()),
        BarChartData('IIT North Region',
            voltageData.last.toInt()),
        BarChartData('IIT South Region',
            voltageData.last.toInt()),
      ];
    }
    setState(() {
      _seriesData = [
        charts.Series<BarChartData, String>(
          id: 'BarChart',
          domainFn: (BarChartData data, _) => data.category,
          measureFn: (BarChartData data, _) => data.value,
          data: data,
          labelAccessorFn: (BarChartData data, _) => '${data.value}',
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = '';

    if (widget.aa == 'power factor') {
      appBarTitle = 'Power Factor';
    } else if (widget.aa == 'frequency') {
      appBarTitle = 'Frequency';
    } else if (widget.aa == 'current value') {
      appBarTitle = 'Current Value';
    } else if (widget.aa == 'volt phase') {
      appBarTitle = 'Volt Phase';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: _seriesData != null
          ? charts.BarChart(
              _seriesData!,
              animate: true,
              barGroupingType: charts.BarGroupingType.grouped,
              vertical: false,
            )
          : const CircularProgressIndicator(),
    );
  }
}
