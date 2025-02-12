import 'package:flutter/material.dart';

class MedicalRecordDetailsScreen extends StatelessWidget {
  final String patientName;
  final String date;
  final String diagnosis;
  final String doctor;

  const MedicalRecordDetailsScreen({
    super.key,
    required this.patientName,
    required this.date,
    required this.diagnosis,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Record - $patientName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: _buildSection(
                      context,
                      'Visit Information',
                      [
                        _buildInfoRow('Date', date),
                        _buildInfoRow('Hospital', 'City General Hospital'),
                        _buildInfoRow('Department', 'Internal Medicine'),
                        _buildInfoRow('Doctor', doctor),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildSection(
                      context,
                      'Symptoms & Signs',
                      [
                        _buildInfoRow(
                            'Chief Complaint', 'Severe headache and dizziness'),
                        _buildInfoRow('Duration', '3 days'),
                        _buildInfoRow('Severity', 'Moderate to severe'),
                        _buildInfoRow('Associated Symptoms',
                            'Nausea, sensitivity to light'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildSection(
                      context,
                      'Vital Signs',
                      [
                        _buildInfoRow('Blood Pressure', '130/85 mmHg'),
                        _buildInfoRow('Heart Rate', '78 bpm'),
                        _buildInfoRow('Temperature', '37.2°C'),
                        _buildInfoRow('Respiratory Rate', '16/min'),
                        _buildInfoRow('SpO2', '98%'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: _buildSection(
                      context,
                      'Diagnosis & Assessment',
                      [
                        _buildInfoRow('Primary Diagnosis', diagnosis),
                        _buildInfoRow('Secondary Diagnosis', 'Anxiety'),
                        _buildInfoRow('Clinical Findings',
                            'Patient presents with elevated blood pressure and reports significant work-related stress.'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildSection(
                      context,
                      'Treatment Plan',
                      [
                        _buildInfoRow('Medications', '''
                    • Amoxicillin 500mg - 1 tablet 3 times daily for 7 days
                    • Paracetamol 500mg - 1 tablet as needed for pain
                    • Omeprazole 20mg - 1 tablet daily before breakfast'''),
                        _buildInfoRow('Instructions', '''
                    • Take medications as prescribed
                    • Rest for at least 48 hours
                    • Increase fluid intake
                    • Avoid caffeine and alcohol'''),
                        _buildInfoRow(
                            'Follow-up', 'Schedule follow-up visit in 2 weeks'),
                      ],
                    ),
                  ),
                ])),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: _buildSection(
                      context,
                      'Laboratory Results',
                      [
                        _buildInfoRow('Blood Tests', '''
• WBC: 7.5 x 10^9/L (Normal)
• Hemoglobin: 14.2 g/dL (Normal)
• Platelets: 250 x 10^9/L (Normal)'''),
                        _buildInfoRow('Urinalysis', 'Normal findings'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: _buildSection(
                      context,
                      'Notes & Recommendations',
                      [
                        _buildInfoRow('Clinical Notes',
                            'Patient shows improvement from previous visit. Continue current treatment plan.'),
                        _buildInfoRow('Lifestyle Recommendations', '''
• Regular exercise (30 minutes daily)
• Stress management techniques
• Balanced diet
• Adequate sleep (7-8 hours)'''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
