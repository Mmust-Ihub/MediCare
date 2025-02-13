import 'package:flutter/material.dart';
import 'package:medicare/layout/hospital/desktop_scaffold.dart';
import 'package:medicare/layout/hospital/hospital_responsive_layout.dart';
import 'package:medicare/layout/hospital/mobile_scaffold.dart';
import 'package:medicare/layout/hospital/tablet_scaffold.dart';

class Hospital extends StatefulWidget {
  const Hospital({super.key});

  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  @override
  Widget build(BuildContext context) {
    return const HospitalResponsiveLayout(
          mobileScaffold: MobileScaffold(),
          tabletScaffold: TabletScaffold(),
          desktopScaffold: DesktopScaffold());
  }
}