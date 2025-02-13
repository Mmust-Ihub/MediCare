import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicare/layout/patient/single_record_screen.dart';

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
  });
}

final DUMMY_RECORDS = [
  MedicalRecord(
    id: 'r1',
    dateCreated: DateTime.parse('2024-01-15T10:30:00Z'),
    dateUpdated: DateTime.parse('2024-01-15T11:45:00Z'),
    symptoms: ['Fever', 'Cough', 'Fatigue'],
    prescription: 'Paracetamol 500mg',
    diagnosis: 'Common Cold',
    medications: ['Paracetamol', 'Vitamin C'],
    hospitalId: '1',
    doctorId: 'd1',
  ),
  MedicalRecord(
    id: 'r2',
    dateCreated: DateTime.parse('2024-01-10T14:20:00Z'),
    dateUpdated: DateTime.parse('2024-01-10T15:30:00Z'),
    symptoms: ['Headache', 'Dizziness'],
    prescription: 'Ibuprofen 400mg',
    diagnosis: 'Migraine',
    medications: ['Ibuprofen', 'Rest'],
    hospitalId: '2',
    doctorId: 'd2',
  ),
];

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medical Records',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? const Color(0xFFF3F4F6)
                      : const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: DUMMY_RECORDS.length,
                  itemBuilder: (context, index) {
                    final record = DUMMY_RECORDS[index];
                    return RecordCard(record: record);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecordCard extends StatelessWidget {
  final MedicalRecord record;

  const RecordCard({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: isDark ? const Color(0xFF374151) : Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordDetailScreen(recordId: record.id),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Date column
              Column(
                children: [
                  Text(
                    DateFormat('MMM dd, yyyy').format(record.dateCreated),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? const Color(0xFFF3F4F6)
                          : const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('HH:mm').format(record.dateCreated),
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? const Color(0xFF9CA3AF)
                          : const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Info column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.diagnosis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? const Color(0xFFF3F4F6)
                            : const Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: record.symptoms.map((symptom) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            symptom,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Prescription: ${record.prescription}',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark
                            ? const Color(0xFF9CA3AF)
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color:
                    isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
