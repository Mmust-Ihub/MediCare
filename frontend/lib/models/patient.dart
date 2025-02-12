class Patient {
  final String id;
  final String name;
  final String email;
  final String phone;
  final List<MedicalRecord> medicalRecords;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.medicalRecords = const [],
  });
}

class MedicalRecord {
  final String id;
  final String type;
  final String symptoms;
  final String prescription;
  final String disease;
  final DateTime date;
  final String doctorId;

  MedicalRecord({
    required this.id,
    required this.type,
    required this.symptoms,
    required this.prescription,
    required this.disease,
    required this.date,
    required this.doctorId,
  });
}