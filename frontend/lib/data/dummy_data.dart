import 'package:medicare/models/models.dart';

// List<Hospital> hospitals = [
//   Hospital(
//     id: "HOSP1",
//     name: "Nairobi Heart Center",
//     location: "Nairobi, Kenya",
//     latitude: -1.286389,
//     longitude: 36.817223,
//     specializations: ["Cardiology", "Internal Medicine"],
//   ),
//   Hospital(
//     id: "HOSP2",
//     name: "Kisumu Children's Hospital",
//     location: "Kisumu, Kenya",
//     latitude: -0.1022,
//     longitude: 34.7617,
//     specializations: ["Pediatrics", "Neonatal Care"],
//   ),
//   Hospital(
//     id: "HOSP3",
//     name: "Mombasa Neuro Clinic",
//     location: "Mombasa, Kenya",
//     latitude: -4.0435,
//     longitude: 39.6682,
//     specializations: ["Neurology", "Psychiatry"],
//   ),
//   Hospital(
//     id: "HOSP4",
//     name: "Eldoret General Hospital",
//     location: "Eldoret, Kenya",
//     latitude: 0.5143,
//     longitude: 35.2698,
//     specializations: ["Orthopedics", "General Surgery"],
//   ),
// ];

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





class Hospital {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String hours;
  final String description;
  final List<String> services;
  final List<String> facilities;
  final String imageUrl;
  final double rating;
  final int numDoctors;
  final String specialization;

 const Hospital({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.hours,
    required this.description,
    required this.services,
    required this.facilities,
    required this.imageUrl,
    required this.rating,
    required this.numDoctors,
    required this.specialization,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'hours': hours,
      'description': description,
      'services': services,
      'facilities': facilities,
      'imageUrl': imageUrl,
      'rating': rating,
      'numDoctors': numDoctors,
      'specialization': specialization,
    };
  }
}

final List<Hospital> dummyHospitals = [
  const Hospital(
    name: 'City General Hospital',
    address: '123 Medical Center Drive, Downtown, City 12345',
    phone: '(555) 123-4567',
    email: 'info@citygeneralhospital.com',
    hours: 'Open 24/7',
    description: 'City General Hospital is a leading healthcare facility providing comprehensive medical services. With state-of-the-art equipment and a dedicated team of healthcare professionals, we are committed to delivering exceptional patient care. Our facility specializes in emergency medicine, surgery, and specialized treatments.',
    services: [
      'Emergency Care',
      'General Surgery',
      'Pediatrics',
      'Cardiology',
      'Orthopedics',
      'Neurology',
      'Oncology',
      'Maternity Care',
    ],
    facilities: [
      'ICU',
      'Operating Rooms',
      'Emergency Department',
      'Pharmacy',
      'Laboratory',
      'Radiology',
      'Cafeteria',
      'Parking',
      'Ambulance Services',
    ],
    imageUrl: 'assets/images/hospital1.jpg',
    rating: 4.5,
    numDoctors: 150,
    specialization: 'Multi-Specialty',
  ),
  
  const Hospital(
    name: 'Metropolitan Medical Center',
    address: '456 Health Avenue, Uptown, City 12346',
    phone: '(555) 987-6543',
    email: 'contact@metropolitanmed.com',
    hours: 'Open 24/7',
    description: 'Metropolitan Medical Center is renowned for its innovative approach to healthcare and patient-centered services. Our modern facility features cutting-edge technology and a team of specialized healthcare providers dedicated to improving patient outcomes. We pride ourselves on our comprehensive care programs and community health initiatives.',
    services: [
      'Intensive Care',
      'Robotic Surgery',
      'Cancer Treatment',
      'Heart Center',
      'Women\'s Health',
      'Physical Therapy',
      'Mental Health',
      'Diagnostic Imaging',
    ],
    facilities: [
      'Advanced ICU',
      'Robotic Surgery Suite',
      'Cancer Center',
      'Heart Center',
      'Women\'s Center',
      'Rehabilitation Center',
      'Mental Health Wing',
      'Imaging Center',
      'Helipad',
    ],
    imageUrl: 'assets/images/hospital2.jpg',
    rating: 4.8,
    numDoctors: 200,
    specialization: 'Surgical Excellence',
  ),
  
  const Hospital(
    name: 'Sunrise Children\'s Hospital',
    address: '789 Pediatric Way, Suburbs, City 12347',
    phone: '(555) 246-8135',
    email: 'care@sunrisechildrens.com',
    hours: 'Open 24/7',
    description: 'Sunrise Children\'s Hospital is dedicated to providing specialized care for children and young adults. Our child-friendly environment and expert pediatric staff ensure that young patients receive the best possible care in a comfortable setting. We offer comprehensive pediatric services and specialized programs for chronic conditions.',
    services: [
      'Pediatric Emergency',
      'Neonatal Care',
      'Pediatric Surgery',
      'Child Psychology',
      'Developmental Care',
      'Pediatric Oncology',
      'Child Life Services',
      'Family Support',
    ],
    facilities: [
      'NICU',
      'Pediatric ICU',
      'Child-Friendly Rooms',
      'Play Areas',
      'Family Lounges',
      'Education Center',
      'Child Life Center',
      'Parent Accommodation',
      'School Program',
    ],
    imageUrl: 'assets/images/hospital3.jpg',
    rating: 4.7,
    numDoctors: 120,
    specialization: 'Pediatrics',
  ),
];