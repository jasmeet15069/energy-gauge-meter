import 'package:flutter/material.dart';
import '../constants.dart';
import '../util/meter.dart';
import '../util/chart.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myleftnavBar,
      endDrawer: myrightnavBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1050,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return const MyBox(dataType: "Power Factor");
                            } else if (index == 1) {
                              return const MyBox(dataType: "Frequency");
                            } else if (index == 2) {
                              return const MyBox(dataType: "Current");
                            } else if (index == 3) {
                              return const MyBox(dataType: "Volt");
                            } else {
                              return Container(); // Placeholder for any additional indices
                            }
                          },
                        ),
                      ),
                    ), // list of stuff
                    Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return const DynamicChart(dataType: "Power Factor");
                          } else if (index == 1) {
                            return const DynamicChart(dataType: "Frequency");
                          } else if (index == 2) {
                            return const DynamicChart(dataType: "Current");
                          } else if (index == 3) {
                            return const DynamicChart(dataType: "Volt");
                          } else {
                            return Container(); // Placeholder for any additional indices
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
