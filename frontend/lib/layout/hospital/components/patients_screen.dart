import 'package:flutter/material.dart';
import 'package:medicare/layout/hospital/components/single_patient_screen.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Patients',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Patient'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search patients...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      PopupMenuButton<String>(
                        initialValue: 'all',
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'all',
                            child: Text('All Patients'),
                          ),
                          const PopupMenuItem(
                            value: 'active',
                            child: Text('Active Patients'),
                          ),
                          const PopupMenuItem(
                            value: 'inactive',
                            child: Text('Inactive Patients'),
                          ),
                        ],
                        child: Chip(
                          label: const Text('All Patients'),
                          deleteIcon: const Icon(Icons.arrow_drop_down),
                          onDeleted: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Patient Name')),
                      DataColumn(label: Text('Age')),
                      DataColumn(label: Text('Gender')),
                      DataColumn(label: Text('Blood Type')),
                      DataColumn(label: Text('Last Visit')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: _demoPatients.map((patient) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  child: Text(patient.name[0]),
                                ),
                                const SizedBox(width: 8),
                                Text(patient.name),
                              ],
                            ),
                            onTap: () {
                              _showPasswordDialog(context, patient);
                            },
                          ),
                          DataCell(Text(patient.age.toString())),
                          DataCell(Text(patient.gender)),
                          DataCell(Text(patient.bloodType)),
                          DataCell(Text(patient.lastVisit)),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPasswordDialog(BuildContext context, _Patient patient) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Patient Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please enter the password for ${patient.name}'),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (value) {
                  // In a real app, validate the password here
                  if (value == '1234') {
                    // Demo password
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePatientScreen(
                          patientName: patient.name,
                          patientId: 'P${patient.age}${patient.bloodType}',
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid password'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                // For demo purposes, we'll just navigate
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SinglePatientScreen(
                      patientName: patient.name,
                      patientId: 'P${patient.age}${patient.bloodType}',
                    ),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class _Patient {
  final String name;
  final int age;
  final String gender;
  final String bloodType;
  final String lastVisit;

  const _Patient({
    required this.name,
    required this.age,
    required this.gender,
    required this.bloodType,
    required this.lastVisit,
  });
}

final List<_Patient> _demoPatients = [
  const _Patient(
    name: 'John Smith',
    age: 45,
    gender: 'Male',
    bloodType: 'A+',
    lastVisit: '12 May 2023',
  ),
  const _Patient(
    name: 'Emma Johnson',
    age: 32,
    gender: 'Female',
    bloodType: 'O-',
    lastVisit: '10 May 2023',
  ),
  const _Patient(
    name: 'Michael Brown',
    age: 28,
    gender: 'Male',
    bloodType: 'B+',
    lastVisit: '15 May 2023',
  ),
];
