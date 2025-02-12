import 'package:flutter/material.dart';
import 'package:medicare/layout/hospital/desktop_scaffold.dart';
import 'package:medicare/layout/hospital/hospital_responsive_layout.dart';
import 'package:medicare/layout/hospital/mobile_scaffold.dart';
import 'package:medicare/layout/hospital/tablet_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HospitalResponsiveLayout(
          mobileScaffold: MobileScaffold(),
          tabletScaffold: TabletScaffold(),
          desktopScaffold: DesktopScaffold()),
    );
  }
}
