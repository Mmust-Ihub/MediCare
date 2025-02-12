import 'package:flutter/material.dart';
import 'package:medicare/responsive/desktop_scaffold.dart';
import 'package:medicare/responsive/mobile_scaffold.dart';
import 'package:medicare/responsive/responsive_layout.dart';
import 'package:medicare/responsive/tablet_scaffold.dart';
import 'package:medicare/responsive/temp.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold1());
  }
}
