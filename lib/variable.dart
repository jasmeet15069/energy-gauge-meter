import 'dart:async';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

List<dynamic> voltageData = [];
List<dynamic> currentData = [];
List<dynamic> frequencyData = [];
List<dynamic> powerfactorData = [];

Future<void> openFile() async {
  try {
    String csvContent = await rootBundle.loadString('assets/sample1.csv');
    final List<List<dynamic>> rows =
        const CsvToListConverter().convert(csvContent);

    // Clear previous data
    voltageData.clear();
    currentData.clear();
    frequencyData.clear();
    powerfactorData.clear();

    for (var row in rows) {
      final String table = row[0].toString();
      final String field = row[2].toString();
      final String value = row[3].toString();

      // Check and add data to the appropriate list
      if (table == '0' && field == 'PF' && value.isNotEmpty) {
        powerfactorData.add(double.parse(value));
      } else if (table == '2' && field == 'Current' && value.isNotEmpty) {
        currentData.add(double.parse(value));
      } else if (table == '1' && field == 'Freq' && value.isNotEmpty) {
        frequencyData.add(double.parse(value));
      } else if (table == '11' && field == 'Volt' && value.isNotEmpty) {
        voltageData.add(double.parse(value));
      }
    }
  } catch (e) {
    // Handle the error appropriately
    // ignore: avoid_print
    print(e);
  }
}
// Future<void> openFile() async {
//   try {
//     String csvContent = await rootBundle.loadString('assets/sample.csv');
//     final List<List<dynamic>> rows = const CsvToListConverter().convert(csvContent);

//     // Clear previous data
//     voltageData.clear();
//     currentData.clear();
//     frequencyData.clear();
//     powerfactorData.clear();

//     for (var row in rows) {
//       final String table = row[1].toString();
//       final String field = row[6].toString();
//       final String value = row[5].toString();

//       // Check and add data to the appropriate list
//       if (table == '0' && field == 'PF' && value.isNotEmpty) {
//         powerfactorData.add(double.parse(value));
//       } else if (table == '2' && field == 'Current' && value.isNotEmpty) {
//         currentData.add(double.parse(value));
//       } else if (table == '1' && field == 'Freq' && value.isNotEmpty) {
//         frequencyData.add(double.parse(value));
//       } else if (table == '11' && field == 'Volt' && value.isNotEmpty) {
//         voltageData.add(double.parse(value));
//       }
//     }
//   } catch (e) {
//     // Handle the error appropriately
//     // ignore: avoid_print
//     print(e);
//   }
// }
DateTime rfc3339(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Extract fractional seconds as a Duration object
  String fractionalSecondsString =
      dateTimeString.substring(20, dateTimeString.length - 1);
  Duration fractionalSeconds = Duration(
      microseconds: (double.parse(fractionalSecondsString) * 1000000).toInt());

  // Add fractional seconds to the DateTime object
  dateTime = dateTime.add(fractionalSeconds);

  return dateTime;
}
