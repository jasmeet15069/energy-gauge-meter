import 'package:flutter/material.dart';
import '/responsive/desktop_body.dart';
import '/responsive/tablet_body.dart';
import '/responsive/mobile_body.dart';
import '/responsive/responsive_layout.dart';
import 'package:provider/provider.dart';
import '/app_mode_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppModeProvider(),
      child: MYAPP(),
    );
  }
}

class MYAPP extends StatelessWidget {
  MYAPP({Key? key}) : super(key: key);

  // final user = FirebaseAuth.instance.currentUser!;
  // // sign user out method
  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'IIT Energy Meter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IIT Energy Meter'),
          centerTitle: true,
          // actions: [
          // IconButton(
          //   onPressed: signUserOut,
          //   icon: const Icon(Icons.logout),
          // ),
          // ],
        ),
        body: const ResponsiveLayout(
          mobileBody: MobileScaffold(),
          tabletBody: TabletScaffold(),
          desktopBody: DesktopScaffold(),
        ),
      ),
    );
  }
}
