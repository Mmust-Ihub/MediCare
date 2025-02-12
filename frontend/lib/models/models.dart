class Hospital {
  final String id;
  final String name;
  final String location; // e.g., "Nairobi, Kenya"
  final double latitude;
  final double longitude;
  final List<String> specializations; // e.g., ["Cardiology", "Pediatrics"]

  Hospital({
    required this.id,
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.specializations,
  });
}

class MedicalPractitioner {
  final String id;
  final String name;
  final String specialization; // e.g., "Cardiologist"
  final String hospitalId;
  final String contact;
  final int yearsOfExperience;

  MedicalPractitioner({
    required this.id,
    required this.name,
    required this.specialization,
    required this.hospitalId,
    required this.contact,
    required this.yearsOfExperience,
  });
}

class Patient {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String contact;
  final List<String> subscribedHospitals; // List of hospital IDs
  final double latitude;
  final double longitude;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.contact,
    required this.subscribedHospitals,
    required this.latitude,
    required this.longitude,
  });
}

class MedicalRecord {
  final String recordId;
  final String patientId;
  final String hospitalId;
  final String doctorId;
  final DateTime date;
  final List<String> symptoms; // e.g., ["Fever", "Cough"]
  final String diagnosis; // e.g., "Flu"
  final List<String> medication; // e.g., ["Paracetamol", "Antibiotics"]

  MedicalRecord({
    required this.recordId,
    required this.patientId,
    required this.hospitalId,
    required this.doctorId,
    required this.date,
    required this.symptoms,
    required this.diagnosis,
    required this.medication,
  });
}
