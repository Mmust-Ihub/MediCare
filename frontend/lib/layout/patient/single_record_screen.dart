import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicalRecord {
  final String id;
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final List<String> symptoms;
  final String prescription;
  final String diagnosis;
  final List<String> medications;
  final String hospitalId;
  final String doctorId;
  final Doctor doctor;
  final Hospital hospital;
  final String notes;
  final Vitals vitals;

  MedicalRecord({
    required this.id,
    required this.dateCreated,
    required this.dateUpdated,
    required this.symptoms,
    required this.prescription,
    required this.diagnosis,
    required this.medications,
    required this.hospitalId,
    required this.doctorId,
    required this.doctor,
    required this.hospital,
    required this.notes,
    required this.vitals,
  });
}

class Doctor {
  final String name;
  final String specialization;

  Doctor({required this.name, required this.specialization});
}

class Hospital {
  final String name;

  Hospital({required this.name});
}

class Vitals {
  final String temperature;
  final String bloodPressure;
  final String heartRate;
  final String oxygenSaturation;

  Vitals({
    required this.temperature,
    required this.bloodPressure,
    required this.heartRate,
    required this.oxygenSaturation,
  });
}

final Map<String, MedicalRecord> DUMMY_RECORDS = {
  'r1': MedicalRecord(
    id: 'r1',
    dateCreated: DateTime.parse('2024-01-15T10:30:00Z'),
    dateUpdated: DateTime.parse('2024-01-15T11:45:00Z'),
    symptoms: ['Fever', 'Cough', 'Fatigue'],
    prescription: 'Paracetamol 500mg - Take 1 tablet every 6 hours\nVitamin C 500mg - Take 1 tablet daily',
    diagnosis: 'Common Cold',
    medications: ['Paracetamol', 'Vitamin C'],
    hospitalId: '1',
    doctorId: 'd1',
    doctor: Doctor(
      name: 'Dr. Sarah Johnson',
      specialization: 'General Medicine',
    ),
    hospital: Hospital(
      name: 'City General Hospital',
    ),
    notes: 'Patient should rest and maintain hydration. Follow-up in 3 days if symptoms persist.',
    vitals: Vitals(
      temperature: '38.5°C',
      bloodPressure: '120/80',
      heartRate: '82 bpm',
      oxygenSaturation: '98%',
    ),
  ),
};

class RecordDetailScreen extends StatelessWidget {
  final String recordId;

  const RecordDetailScreen({Key? key, required this.recordId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final record = DUMMY_RECORDS[recordId];
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (record == null) {
      return Scaffold(
        backgroundColor: isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
        body: SafeArea(
          child: Center(
            child: Text(
              'Record not found',
              style: TextStyle(
                fontSize: 18,
                color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE5E7EB),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Medical Record',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: isDark ? const Color(0xFF374151) : Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSection(
                            context,
                            'Basic Information',
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoText(context, 'Date: ${DateFormat('MMMM d, yyyy').format(record.dateCreated)}'),
                                _buildInfoText(context, 'Hospital: ${record.hospital.name}'),
                                _buildInfoText(context, 'Doctor: ${record.doctor.name}'),
                                _buildInfoText(context, 'Specialization: ${record.doctor.specialization}'),
                              ],
                            ),
                          ),
                          const Divider(height: 32),
                          _buildSection(
                            context,
                            'Vital Signs',
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoText(context, 'Temperature: ${record.vitals.temperature}'),
                                _buildInfoText(context, 'Blood Pressure: ${record.vitals.bloodPressure}'),
                                _buildInfoText(context, 'Heart Rate: ${record.vitals.heartRate}'),
                                _buildInfoText(context, 'Oxygen Saturation: ${record.vitals.oxygenSaturation}'),
                              ],
                            ),
                          ),
                          const Divider(height: 32),
                          _buildSection(
                            context,
                            'Symptoms',
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: record.symptoms.map((symptom) => _buildSymptomChip(symptom)).toList(),
                            ),
                          ),
                          const Divider(height: 32),
                          _buildSection(
                            context,
                            'Diagnosis',
                            _buildInfoText(context, record.diagnosis),
                          ),
                          const Divider(height: 32),
                          _buildSection(
                            context,
                            'Prescription',
                            _buildInfoText(context, record.prescription),
                          ),
                          const Divider(height: 32),
                          _buildSection(
                            context,
                            'Doctor\'s Notes',
                            _buildInfoText(context, record.notes),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget content) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }

  Widget _buildInfoText(BuildContext context, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildSymptomChip(String symptom) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        symptom,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF2563EB),
        ),
      ),
    );
  }
}