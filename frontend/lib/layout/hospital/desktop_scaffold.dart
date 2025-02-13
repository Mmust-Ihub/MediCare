import 'package:flutter/material.dart';
import 'package:medicare/components/constants.dart';
import 'package:medicare/components/login_page.dart';
import 'package:medicare/layout/hospital/components/appointment_screen.dart';
import 'package:medicare/layout/hospital/components/dashboard.dart';
import 'package:medicare/layout/hospital/components/patients_screen.dart';
import 'package:medicare/layout/hospital/components/report_screen.dart';
import 'package:medicare/layout/hospital/components/settings_screen.dart';
import 'package:medicare/screens/authentication.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/logo.webp"),
                    Container(
                      width: 600,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.blue,
                        labelColor: Colors.blue,
                        splashBorderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        unselectedLabelColor: Colors.grey[400],
                        tabs: <Widget>[
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              )),
                              child: const Text("Dashboard"),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              )),
                              child: const Text("Appointment"),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              )),
                              child: const Text("Patients"),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              )),
                              child: const Text("Reports"),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              )),
                              child: const Text("Settings"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Authentication()));
                        },
                        child: const Text("Logout"))
                  ]),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  DashboardScreen(),
                  AppointmentScreen(),
                  PatientsScreen(),
                  ReportsScreen(),
                  SettingsScreen(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
