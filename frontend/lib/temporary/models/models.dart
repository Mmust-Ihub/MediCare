class User {
  final String id;
  final String fullName;
  final String email;
  final double distance;
  final bool isCritical;
  final List<MedicalRecord> records;
  final List<Hospital> enrolledHospitals;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.distance = 0.0,
    this.isCritical = false,
    required this.records,
    required this.enrolledHospitals,
  });
}

// lib/models/medical_record.dart
class MedicalRecord {
  final String id;
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final List<String> signsAndSymptoms;
  final String prescription;
  final String diagnosedDisease;
  final List<String> medications;
  final Hospital hospital;
  final Doctor doctor;

  MedicalRecord({
    required this.id,
    required this.dateCreated,
    required this.dateUpdated,
    required this.signsAndSymptoms,
    required this.prescription,
    required this.diagnosedDisease,
    required this.medications,
    required this.hospital,
    required this.doctor,
  });
}

// lib/models/hospital.dart
class Hospital {
  final String id;
  final String name;
  final String address;
  final String category;
  final List<Doctor> doctors;
  final List<User> enrolledPatients;
  final String imageUrl;
  final double rating;

  Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.category,
    required this.doctors,
    required this.enrolledPatients,
    required this.imageUrl,
    required this.rating,
  });
}

// lib/models/doctor.dart
class Doctor {
  final String id;
  final String name;
  final String specialization;
  final Hospital hospital;
  final String imageUrl;
  final double rating;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.imageUrl,
    required this.rating,
  });
}

// lib/models/exercise.dart
class Exercise {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final Duration duration;
  final int caloriesBurn;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.caloriesBurn,
  });
}

// lib/models/diet.dart
class Diet {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final int calories;
  final List<String> ingredients;

  Diet({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.calories,
    required this.ingredients,
  });
}