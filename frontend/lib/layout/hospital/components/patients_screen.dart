import 'package:flutter/material.dart';
import 'package:medicare/layout/hospital/components/single_patient_screen.dart';
import 'package:medicare/temporary/models/models.dart';

class User {
  final String id;
  final String fullName;
  final String email;
  final bool isCritical;
  final String gender;
  final List<MedicalRecord> records;
  final List<Hospital> enrolledHospitals;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.isCritical = false,
    required this.records,
    required this.gender,
    required this.enrolledHospitals,
  });
}

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  bool _showAddPatientModal = false;
  User? _editingPatient;
  List<User> patients = List.from(_demoPatients);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
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
                    onPressed: () => setState(() => _showAddPatientModal = true),
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
                                value: 'critical',
                                child: Text('Critical Patients'),
                              ),
                              const PopupMenuItem(
                                value: 'normal',
                                child: Text('Normal Patients'),
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
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Gender')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Hospitals')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: patients.map((patient) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: patient.isCritical 
                                          ? Colors.red.withOpacity(0.1)
                                          : Colors.blue.withOpacity(0.1),
                                      child: Text(
                                        patient.fullName[0],
                                        style: TextStyle(
                                          color: patient.isCritical 
                                              ? Colors.red 
                                              : Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(patient.fullName),
                                  ],
                                ),
                                onTap: () => _showPasswordDialog(context, patient),
                              ),
                              DataCell(Text(patient.email)),
                              DataCell(Text(patient.gender)),
                              DataCell(
                                Chip(
                                  label: Text(
                                    patient.isCritical ? 'Critical' : 'Normal',
                                    style: TextStyle(
                                      color: patient.isCritical 
                                          ? Colors.red 
                                          : Colors.green,
                                    ),
                                  ),
                                  backgroundColor: patient.isCritical 
                                      ? Colors.red.withOpacity(0.1)
                                      : Colors.green.withOpacity(0.1),
                                ),
                              ),
                              DataCell(
                                Text('${patient.enrolledHospitals.length} hospitals'),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () => setState(() => _editingPatient = patient),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () => _showDeleteConfirmation(patient),
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
        ),
        if (_showAddPatientModal) _buildPatientModal(isEditing: false),
        if (_editingPatient != null) _buildPatientModal(isEditing: true),
      ],
    );
  }

  Widget _buildPatientModal({required bool isEditing}) {
    final patient = isEditing ? _editingPatient : null;
    final nameController = TextEditingController(text: patient?.fullName);
    final emailController = TextEditingController(text: patient?.email);
    final genderController = TextEditingController(text: patient?.gender);
    bool isCritical = patient?.isCritical ?? false;

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Edit Patient' : 'Add New Patient',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => setState(() {
                        _showAddPatientModal = false;
                        _editingPatient = null;
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 400,
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: genderController,
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('Critical Patient'),
                        value: isCritical,
                        onChanged: (value) => setState(() => isCritical = value),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => setState(() {
                              _showAddPatientModal = false;
                              _editingPatient = null;
                            }),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 16),
                          FilledButton(
                            onPressed: () {
                              final newPatient = User(
                                id: patient?.id ?? DateTime.now().toString(),
                                fullName: nameController.text,
                                email: emailController.text,
                                gender: genderController.text,
                                isCritical: isCritical,
                                records: patient?.records ?? [],
                                enrolledHospitals: patient?.enrolledHospitals ?? [],
                              );

                                 setState(() {
                                if (isEditing) {
                                  final index = patients.indexOf(_editingPatient!);
                                  patients[index] = newPatient;
                                  _editingPatient = null;
                                } else {
                                  patients.add(newPatient);
                                  _showAddPatientModal = false;
                                }
                              });
                            },
                            child: Text(isEditing ? 'Save Changes' : 'Add Patient'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(User patient) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Patient'),
          content: Text('Are you sure you want to delete ${patient.fullName}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  patients.remove(patient);
                });
                Navigator.pop(context);
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showPasswordDialog(BuildContext context, User patient) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Patient Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please enter the password for ${patient.fullName}'),
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
                  if (value == '1234') {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePatientScreen(
                          patientName: patient.fullName,
                          patientId: patient.id, medicalRecords: patient.records,
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
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SinglePatientScreen(
                      patientName: patient.fullName,
                      patientId: patient.id, medicalRecords: patient.records,
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

final List<User> _demoPatients = [
  User(
    id: '1',
    fullName: 'John Smith',
    email: 'john.smith@example.com',
    gender: 'Male',
    isCritical: true,
    records: [MedicalRecord(
    id: 'r1',
    dateCreated: DateTime.parse('2024-01-15T10:30:00Z'),
    dateUpdated: DateTime.parse('2024-01-15T11:45:00Z'),
    signsAndSymptoms: ['Fever', 'Cough', 'Fatigue'],
    prescription: 'Paracetamol 500mg',
    diagnosedDisease: 'Common Cold',
    medications: ['Paracetamol', 'Vitamin C'],
    hospitalId: '1',
    doctorId: 'd1',
  ),
  MedicalRecord(
    id: 'r2',
    dateCreated: DateTime.parse('2024-01-10T14:20:00Z'),
    dateUpdated: DateTime.parse('2024-01-10T15:30:00Z'),
    signsAndSymptoms: ['Headache', 'Dizziness'],
    prescription: 'Ibuprofen 400mg',
    diagnosedDisease: 'Migraine',
    medications: ['Ibuprofen', 'Rest'],
    hospitalId: '2',
    doctorId: 'd2',
  ),],
    enrolledHospitals: [],
  ),
  User(
    id: '2',
    fullName: 'Emma Johnson',
    email: 'emma.j@example.com',
    gender: 'Female',
    records: [],
    enrolledHospitals: [],
  ),
  User(
    id: '3',
    fullName: 'Michael Brown',
    email: 'michael.b@example.com',
    gender: 'Male',
    records: [],
    enrolledHospitals: [],
  ),
];