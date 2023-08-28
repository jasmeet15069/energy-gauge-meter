import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_mode_provider.dart';

class MyRegionLink extends StatefulWidget {
  const MyRegionLink({Key? key}) : super(key: key);

  @override
  State<MyRegionLink> createState() => _MyRegionLinkState();
}

class _MyRegionLinkState extends State<MyRegionLink> {
  String currentAppMode = "IIT East Region";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<AppModeProvider>(
          builder: (context, appModeProvider, _) =>
              Text(appModeProvider.currentAppMode),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinkedButton(
              label: 'IIT East Region',
              onTap: () {
                Provider.of<AppModeProvider>(context, listen: false)
                    .changeAppMode("IIT East Region");
              },
            ),
            const SizedBox(height: 16),
            LinkedButton(
              label: 'IIT West Region',
              onTap: () {
                Provider.of<AppModeProvider>(context, listen: false)
                    .changeAppMode("IIT West Region");
              },
            ),
            const SizedBox(height: 10),
            LinkedButton(
              label: 'IIT North Region',
              onTap: () {
                Provider.of<AppModeProvider>(context, listen: false)
                    .changeAppMode("IIT North Region");
              },
            ),
            const SizedBox(height: 16),
            LinkedButton(
              label: 'IIT South Region',
              onTap: () {
                Provider.of<AppModeProvider>(context, listen: false)
                    .changeAppMode("IIT South Region");
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
      child: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
