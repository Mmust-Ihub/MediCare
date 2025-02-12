import 'package:medicare/models/models.dart';

List<Hospital> hospitals = [
  Hospital(
    id: "HOSP1",
    name: "Nairobi Heart Center",
    location: "Nairobi, Kenya",
    latitude: -1.286389,
    longitude: 36.817223,
    specializations: ["Cardiology", "Internal Medicine"],
  ),
  Hospital(
    id: "HOSP2",
    name: "Kisumu Children's Hospital",
    location: "Kisumu, Kenya",
    latitude: -0.1022,
    longitude: 34.7617,
    specializations: ["Pediatrics", "Neonatal Care"],
  ),
  Hospital(
    id: "HOSP3",
    name: "Mombasa Neuro Clinic",
    location: "Mombasa, Kenya",
    latitude: -4.0435,
    longitude: 39.6682,
    specializations: ["Neurology", "Psychiatry"],
  ),
  Hospital(
    id: "HOSP4",
    name: "Eldoret General Hospital",
    location: "Eldoret, Kenya",
    latitude: 0.5143,
    longitude: 35.2698,
    specializations: ["Orthopedics", "General Surgery"],
  ),
];

List<MedicalPractitioner> doctors = [
  MedicalPractitioner(
    id: "DOC1",
    name: "Dr. John Smith",
    specialization: "Cardiologist",
    hospitalId: "HOSP1",
    contact: "+254712345678",
    yearsOfExperience: 12,
  ),
  MedicalPractitioner(
    id: "DOC2",
    name: "Dr. Aisha Khan",
    specialization: "Pediatrician",
    hospitalId: "HOSP2",
    contact: "+254789456123",
    yearsOfExperience: 9,
  ),
  MedicalPractitioner(
    id: "DOC3",
    name: "Dr. Patrick Oduor",
    specialization: "Neurologist",
    hospitalId: "HOSP3",
    contact: "+254723654789",
    yearsOfExperience: 15,
  ),
  MedicalPractitioner(
    id: "DOC4",
    name: "Dr. Mercy Njeri",
    specialization: "Orthopedic Surgeon",
    hospitalId: "HOSP4",
    contact: "+254798321654",
    yearsOfExperience: 10,
  ),
];

List<Patient> patients = [
  Patient(
    id: "PAT1",
    name: "Alice Kamau",
    age: 28,
    gender: "Female",
    contact: "+254711223344",
    subscribedHospitals: ["HOSP1", "HOSP3"],
    latitude: -1.2921,
    longitude: 36.8219,
  ),
  Patient(
    id: "PAT2",
    name: "Brian Ochieng",
    age: 34,
    gender: "Male",
    contact: "+254722334455",
    subscribedHospitals: ["HOSP2"],
    latitude: -0.0917,
    longitude: 34.7683,
  ),
];

List<MedicalRecord> records = [
  MedicalRecord(
    recordId: "REC1",
    patientId: "PAT1",
    hospitalId: "HOSP1",
    doctorId: "DOC1",
    date: DateTime(2024, 2, 10),
    symptoms: ["Chest pain", "Shortness of breath"],
    diagnosis: "Mild Heart Attack",
    medication: ["Aspirin", "Beta Blockers"],
  ),
  MedicalRecord(
    recordId: "REC2",
    patientId: "PAT2",
    hospitalId: "HOSP2",
    doctorId: "DOC2",
    date: DateTime(2024, 2, 5),
    symptoms: ["High fever", "Rash"],
    diagnosis: "Measles",
    medication: ["Paracetamol", "Vitamin A supplements"],
  ),
];
