import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  const ResponsiveLayout(
      {super.key,
      required this.mobileScaffold,
      required this.tabletScaffold,
      required this.desktopScaffold});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
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
