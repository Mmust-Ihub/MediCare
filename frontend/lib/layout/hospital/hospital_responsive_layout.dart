import 'package:flutter/material.dart';

class HospitalResponsiveLayout extends StatefulWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  const HospitalResponsiveLayout(
      {super.key,
      required this.mobileScaffold,
      required this.tabletScaffold,
      required this.desktopScaffold});

  @override
  State<HospitalResponsiveLayout> createState() => _HospitalResponsiveLayoutState();
}

class _HospitalResponsiveLayoutState extends State<HospitalResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 426) {
          return widget.mobileScaffold;
        } else if (constraints.maxWidth < 900) {
          return widget.tabletScaffold;
        } else {
          return widget.desktopScaffold;
        }
      },
    );
  }
}
