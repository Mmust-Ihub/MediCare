import 'package:flutter/material.dart';
import 'package:medicare/layout/hospital/components/medical_records_screen.dart';
import 'package:medicare/temporary/models/models.dart';

class SinglePatientScreen extends StatelessWidget {
  final String patientName;
  final String patientId;
  final List<MedicalRecord> medicalRecords;

  const SinglePatientScreen({
    super.key,
    required this.patientName,
    required this.patientId,
    required this.medicalRecords,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patientName),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              // Implement print functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: _buildPatientInfoCard(context),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMedicalRecordsCard(context),
                    const SizedBox(height: 24),
                    _buildPrescriptionsCard(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddRecordDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('New Record'),
      ),
    );
  }

  Widget _buildPatientInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(
              patientName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text('Patient ID: $patientId'),
            const Divider(height: 32),
            const PatientInfoItem(
              icon: Icons.calendar_today,
              label: 'Date of Birth',
              value: '15 May 1980',
            ),
            const PatientInfoItem(
              icon: Icons.phone,
              label: 'Phone',
              value: '+1 234 567 890',
            ),
            const PatientInfoItem(
              icon: Icons.email,
              label: 'Email',
              value: 'patient@example.com',
            ),
            const PatientInfoItem(
              icon: Icons.location_on,
              label: 'Address',
              value: '123 Medical St, Health City',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalRecordsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Medical Records',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ElevatedButton.icon(
                  onPressed: () => _showAddRecordDialog(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Record'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _MedicalRecordsTable(medicalRecords: medicalRecords),
          ],
        ),
      ),
    );
  }

  Widget _buildPrescriptionsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prescriptions & Medications',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _PrescriptionsTable(medicalRecords: medicalRecords),
          ],
        ),
      ),
    );
  }

  void _showAddRecordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddMedicalRecordDialog(patientId: patientId),
    );
  }
}

class PatientInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const PatientInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MedicalRecordsTable extends StatelessWidget {
  final List<MedicalRecord> medicalRecords;

  const _MedicalRecordsTable({required this.medicalRecords});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Disease')),
          DataColumn(label: Text('Symptoms')),
          DataColumn(label: Text('Doctor')),
          DataColumn(label: Text('Hospital')),
          DataColumn(label: Text('Actions')),
        ],
        rows: medicalRecords.map((record) {
          return _buildMedicalRecordRow(record, context);
        }).toList(),
      ),
    );
  }

  DataRow _buildMedicalRecordRow(MedicalRecord record, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Text(record.dateCreated.toString().split(' ')[0])),
        DataCell(Text(record.diagnosedDisease)),
        DataCell(
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(
              record.signsAndSymptoms.join(', '),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataCell(Text(record.doctorId)),
        DataCell(Text(record.hospitalId)),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  _showRecordDetails(context, record);
                },
              ),
              IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {
                  // Implement download functionality
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showRecordDetails(BuildContext context, MedicalRecord record) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            'Medical Record Details - ${record.dateCreated.toString().split(' ')[0]}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _DetailItem('Disease', record.diagnosedDisease),
              _DetailItem('Symptoms', record.signsAndSymptoms.join(', ')),
              _DetailItem('Prescription', record.prescription),
              _DetailItem('Medications', record.medications.join(', ')),
              _DetailItem('Doctor', record.doctorId),
              _DetailItem('Hospital', record.hospitalId),
              _DetailItem('Created', record.dateCreated.toString()),
              _DetailItem('Last Updated', record.dateUpdated.toString()),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _PrescriptionsTable extends StatelessWidget {
  final List<MedicalRecord> medicalRecords;

  const _PrescriptionsTable({required this.medicalRecords});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Medications')),
          DataColumn(label: Text('Prescription Details')),
          DataColumn(label: Text('Doctor')),
          DataColumn(label: Text('Hospital')),
        ],
        rows: medicalRecords.map((record) {
          return DataRow(
            cells: [
              DataCell(Text(record.dateCreated.toString().split(' ')[0])),
              DataCell(
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Text(
                    record.medications.join(', '),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              DataCell(
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Text(
                    record.prescription,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              DataCell(Text(record.doctorId)),
              DataCell(Text(record.hospitalId)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(value),
          const Divider(),
        ],
      ),
    );
  }
}

class AddMedicalRecordDialog extends StatefulWidget {
  final String patientId;

  const AddMedicalRecordDialog({
    super.key,
    required this.patientId,
  });

  @override
  State<AddMedicalRecordDialog> createState() => _AddMedicalRecordDialogState();
}

class _AddMedicalRecordDialogState extends State<AddMedicalRecordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _symptomsController = TextEditingController();
  final _diseaseController = TextEditingController();
  final _prescriptionController = TextEditingController();
  final _medicationsController = TextEditingController();

  String _doctorId = ''; // You might want to get this from a user session
  String _hospitalId = ''; // You might want to get this from a user session

  @override
  void dispose() {
    _symptomsController.dispose();
    _diseaseController.dispose();
    _prescriptionController.dispose();
    _medicationsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newRecord = MedicalRecord(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(), // Generate a proper ID in production
        // patientId: widget.patientId,
        doctorId: _doctorId,
        hospitalId: _hospitalId,
        dateCreated: DateTime.now(),
        dateUpdated: DateTime.now(),
        signsAndSymptoms:
            _symptomsController.text.split(',').map((e) => e.trim()).toList(),
        diagnosedDisease: _diseaseController.text,
        prescription: _prescriptionController.text,
        medications: _medicationsController.text
            .split(',')
            .map((e) => e.trim())
            .toList(),
      );

      // Here you would typically save the record to your backend
      // For now, we'll just close the dialog
      Navigator.of(context).pop(newRecord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Medical Record'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _diseaseController,
                decoration: const InputDecoration(
                  labelText: 'Diagnosed Disease *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the diagnosed disease';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _symptomsController,
                decoration: const InputDecoration(
                  labelText: 'Signs and Symptoms *',
                  helperText: 'Separate multiple symptoms with commas',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter at least one symptom';
                  }
                  return null;
                },
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _prescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Prescription Details *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter prescription details';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _medicationsController,
                decoration: const InputDecoration(
                  labelText: 'Medications *',
                  helperText: 'Separate multiple medications with commas',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter at least one medication';
                  }
                  return null;
                },
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Save Record'),
        ),
      ],
    );
  }
}
