import 'package:flutter/material.dart';
import './util/regionbar.dart';
import './util/regionlink.dart';
import './util/meter.dart';
import './util/chart.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

var defaultBackgroundColor = Colors.purple[300];
var appBarColor = Colors.green;
var myAppBar = AppBar(
  backgroundColor: appBarColor,
);
var drawerTextColor = TextStyle(
  color: Colors.blue[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

var myleftnavBar = Drawer(
  backgroundColor: Colors.green,
  elevation: 0,
  child: SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinkedButton(
            label: 'D A S H B O A R D',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinkedButton(
            label: 'S E T T I N G S',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinkedButton(
            label: 'A B O U T',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 16),
      ],
    ),
  ),
);

var myrightnavBar = Drawer(
  backgroundColor: Colors.green,
  elevation: 0,
  child: SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 1050,
          child: Column(
            children: [
              const SizedBox(height: 250, child: MyRegionLink()),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const MyRegionBar(
                        dataType: 'power factor',
                      );
                    } else if (index == 1) {
                      return const MyRegionBar(
                        dataType: 'frequency',
                      );
                    } else if (index == 2) {
                      return const MyRegionBar(
                        dataType: 'current value',
                      );
                    } else if (index == 3) {
                      return const MyRegionBar(
                        dataType: 'volt phase',
                      );
                    } else {
                      return Container();
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
);

var centerData = Drawer(
  backgroundColor: Colors.green,
  elevation: 0,
  child: SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 1050,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 4,
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
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
                        return Container();
                      }
                    },
                  ),
                ),
              ),
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
                      return Container();
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
);

class LinkedButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const LinkedButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
