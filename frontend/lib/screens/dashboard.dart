import 'package:flutter/material.dart';
import 'package:medicare/widgets/stats_card.dart';
import 'package:medicare/widgets/appointments_list.dart';
import 'package:medicare/widgets/staff_avatars.dart';
import 'package:medicare/widgets/patients_chart.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: StatsCard(
                    title: 'Total Patients',
                    value: '1,234',
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: StatsCard(
                    title: 'Staff Members',
                    value: '56',
                    icon: Icons.medical_services,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Patient Trends',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: PatientsChart(),
            ),
            SizedBox(height: 24),
            Text(
              'Doctors on Shift',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            StaffAvatars(),
            SizedBox(height: 24),
            Text(
              'Upcoming Appointments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            AppointmentsList(),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'MediCare',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Patients'),
              onTap: () {
                // TODO: Navigate to patients screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text('Staff'),
              onTap: () {
                // TODO: Navigate to staff screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Appointments'),
              onTap: () {
                // TODO: Navigate to appointments screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Analytics'),
              onTap: () {
                // TODO: Navigate to analytics screen
              },
            ),
          ],
        ),
      ),
    );
  }
}