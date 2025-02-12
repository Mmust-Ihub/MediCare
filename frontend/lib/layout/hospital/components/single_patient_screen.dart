import 'package:flutter/material.dart';

class SinglePatientScreen extends StatelessWidget {
  final String patientName;
  final String patientId;

  const SinglePatientScreen({
    super.key,
    required this.patientName,
    required this.patientId,
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
                child: Card(
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
                        const _PatientInfoItem(
                          icon: Icons.calendar_today,
                          label: 'Date of Birth',
                          value: '15 May 1980',
                        ),
                        const _PatientInfoItem(
                          icon: Icons.phone,
                          label: 'Phone',
                          value: '+1 234 567 890',
                        ),
                        const _PatientInfoItem(
                          icon: Icons.email,
                          label: 'Email',
                          value: 'patient@example.com',
                        ),
                        const _PatientInfoItem(
                          icon: Icons.location_on,
                          label: 'Address',
                          value: '123 Medical St, Health City',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medical Records',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            const _MedicalRecordsTable(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prescriptions History',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            const _PrescriptionsTable(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatientInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PatientInfoItem({
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
          Column(
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
        ],
      ),
    );
  }
}

class _MedicalRecordsTable extends StatelessWidget {
  const _MedicalRecordsTable();

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Diagnosis')),
        DataColumn(label: Text('Doctor')),
        DataColumn(label: Text('Actions')),
      ],
      rows: [
        _buildMedicalRecordRow(
          '15 May 2023',
          'Hypertension',
          'Dr. Sarah Wilson',
        ),
        _buildMedicalRecordRow(
          '10 Apr 2023',
          'Common Cold',
          'Dr. Michael Brown',
        ),
        _buildMedicalRecordRow(
          '25 Mar 2023',
          'Annual Checkup',
          'Dr. Emma Johnson',
        ),
      ],
    );
  }

  DataRow _buildMedicalRecordRow(String date, String diagnosis, String doctor) {
    return DataRow(
      cells: [
        DataCell(Text(date)),
        DataCell(Text(diagnosis)),
        DataCell(Text(doctor)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PrescriptionsTable extends StatelessWidget {
  const _PrescriptionsTable();

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Medicine')),
        DataColumn(label: Text('Duration')),
        DataColumn(label: Text('Doctor')),
      ],
      rows: [
        _buildPrescriptionRow(
          '15 May 2023',
          'Amoxicillin 500mg',
          '7 days',
          'Dr. Sarah Wilson',
        ),
        _buildPrescriptionRow(
          '10 Apr 2023',
          'Paracetamol 500mg',
          '3 days',
          'Dr. Michael Brown',
        ),
        _buildPrescriptionRow(
          '25 Mar 2023',
          'Vitamin D3',
          '30 days',
          'Dr. Emma Johnson',
        ),
      ],
    );
  }

  DataRow _buildPrescriptionRow(
    String date,
    String medicine,
    String duration,
    String doctor,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(date)),
        DataCell(Text(medicine)),
        DataCell(Text(duration)),
        DataCell(Text(doctor)),
      ],
    );
  }
}
