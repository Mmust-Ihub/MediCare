// Dummy Data Generator

import 'package:medicare/temporary/models/models.dart';

// Generate random hospitals
final List<Hospital> dummyHospitals = [
  Hospital(
    id: 'h1',
    name: 'Metro General Hospital',
    address: '123 Healthcare Ave, Metro City',
    category: 'General',
    doctors: [], // Will be populated after doctor creation
    enrolledPatients: [], // Will be populated after user creation
    imageUrl:
        'https://content.presspage.com/uploads/1878/c1920_4091-001-00-843.013-large.jpg?19146',
    rating: 4.5,
    latitudee: 40.7128,
    longitude: -74.0060,
  ),
  Hospital(
    id: 'h2',
    name: 'City Medical Center',
    address: '456 Medical Blvd, Downtown',
    category: 'Specialized',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLmaixfuON6ciZ_0jZ4pI9GvJmxZ38-_AcDA&s',
    rating: 4.8,
    latitudee: 40.7589,
    longitude: -73.9851,
  ),
  Hospital(
    id: 'h3',
    name: 'Community Health Hospital',
    address: '789 Wellness Road, Uptown',
    category: 'Community',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.maramani.com/cdn/shop/collections/Community_health_center_Medical_centres_building_Design.jpg?v=1689587922&width=2048',
    rating: 4.2,
    latitudee: 40.7829,
    longitude: -73.9654,
  ),
];

// Generate random doctors
final List<Doctor> dummyDoctors = [
  Doctor(
    id: 'd1',
    name: 'Dr. Sarah Johnson',
    specialization: 'Cardiology',
    hospital: dummyHospitals[0],
    imageUrl: 'assets/images/doctor1.jpg',
    rating: 4.7,
  ),
  Doctor(
    id: 'd2',
    name: 'Dr. Michael Chen',
    specialization: 'Pediatrics',
    hospital: dummyHospitals[1],
    imageUrl: 'assets/images/doctor2.jpg',
    rating: 4.9,
  ),
  Doctor(
    id: 'd3',
    name: 'Dr. Emily Williams',
    specialization: 'Neurology',
    hospital: dummyHospitals[2],
    imageUrl: 'assets/images/doctor3.jpg',
    rating: 4.6,
  ),
  Doctor(
    id: 'd4',
    name: 'Dr. James Wilson',
    specialization: 'Orthopedics',
    hospital: dummyHospitals[0],
    imageUrl: 'assets/images/doctor4.jpg',
    rating: 4.8,
  ),
];

// Update hospitals with doctors
void _updateHospitalDoctors() {
  for (var doctor in dummyDoctors) {
    doctor.hospital.doctors.add(doctor);
  }
}

// Generate random medical records
final List<MedicalRecord> dummyMedicalRecords = [
  MedicalRecord(
    id: 'mr1',
    dateCreated: DateTime.now().subtract(const Duration(days: 30)),
    dateUpdated: DateTime.now().subtract(const Duration(days: 25)),
    signsAndSymptoms: ['Fever', 'Cough', 'Fatigue'],
    prescription: 'Antibiotics - 3 times daily',
    diagnosedDisease: 'Upper Respiratory Infection',
    medications: ['Amoxicillin 500mg', 'Paracetamol 500mg'],
    hospitalId: 'h1',
    doctorId: 'd1',
  ),
  MedicalRecord(
    id: 'mr2',
    dateCreated: DateTime.now().subtract(const Duration(days: 15)),
    dateUpdated: DateTime.now().subtract(const Duration(days: 10)),
    signsAndSymptoms: ['Joint Pain', 'Stiffness'],
    prescription: 'Anti-inflammatory medication',
    diagnosedDisease: 'Osteoarthritis',
    medications: ['Ibuprofen 400mg', 'Glucosamine'],
    hospitalId: 'h2',
    doctorId: 'd2',
  ),
];

// Generate random users
final List<User> dummyUsers = [
  User(
    id: 'u1',
    fullName: 'Byrone Kingsly',
    email: 'kinslybyrone17@gmail.com',
    isCritical: false,
    gender: 'Male',
    records: [
      dummyMedicalRecords[1],
    ],
    enrolledHospitals: [dummyHospitals[0]],
  ),
  User(
    id: 'u2',
    fullName: 'Jane Smith',
    email: 'jane.smith@email.com',
    isCritical: true,
    gender: 'Female',
    records: [dummyMedicalRecords[1]],
    enrolledHospitals: [dummyHospitals[1]],
  ),
];

// Update hospitals with enrolled patients
void _updateHospitalPatients() {
  for (var user in dummyUsers) {
    for (var hospital in user.enrolledHospitals) {
      hospital.enrolledPatients.add(user);
    }
  }
}

final User currentUser = dummyUsers[0];

// Generate random exercises
final List<Exercise> dummyExercises = [
  Exercise(
    id: 'e1',
    name: 'Morning Yoga',
    category: 'Flexibility',
    description:
        'Start your day with gentle stretching and breathing exercises',
    imageUrl: 'assets/images/yoga.jpg',
    duration: const Duration(minutes: 30),
    caloriesBurn: 150,
  ),
  Exercise(
    id: 'e2',
    name: 'Cardio Walking',
    category: 'Cardio',
    description: 'Moderate-paced walking to improve heart health',
    imageUrl: 'assets/images/walking.jpg',
    duration: const Duration(minutes: 45),
    caloriesBurn: 200,
  ),
  Exercise(
    id: 'e3',
    name: 'Strength Training',
    category: 'Strength',
    description: 'Basic strength exercises using body weight',
    imageUrl: 'assets/images/strength.jpg',
    duration: const Duration(minutes: 40),
    caloriesBurn: 250,
  ),
];

// Generate random diets
final List<Diet> dummyDiets = [
  Diet(
    id: 'd1',
    name: 'Heart-Healthy Breakfast',
    category: 'Breakfast',
    description: 'Nutritious breakfast to support cardiovascular health',
    imageUrl: 'assets/images/breakfast.jpg',
    calories: 350,
    ingredients: ['Oatmeal', 'Berries', 'Almonds', 'Honey'],
  ),
  Diet(
    id: 'd2',
    name: 'Mediterranean Lunch',
    category: 'Lunch',
    description: 'Balanced Mediterranean-style lunch',
    imageUrl: 'assets/images/lunch.jpg',
    calories: 450,
    ingredients: ['Grilled Chicken', 'Quinoa', 'Mixed Vegetables', 'Olive Oil'],
  ),
  Diet(
    id: 'd3',
    name: 'Light Dinner',
    category: 'Dinner',
    description: 'Light and nutritious evening meal',
    imageUrl: 'assets/images/dinner.jpg',
    calories: 400,
    ingredients: ['Salmon', 'Brown Rice', 'Steamed Vegetables', 'Lemon'],
  ),
];

// Generate random appointments
final List<Appointment> dummyAppointments = [
  Appointment(
    id: 'a1',
    date: DateTime.now().add(const Duration(days: 2)),
    time: '09:30 AM',
    doctor: 'Dr. Sarah Johnson',
    hospital: 'Metro General Hospital',
    department: 'Cardiology',
    status: 'Scheduled',
  ),
  Appointment(
    id: 'a2',
    date: DateTime.now().add(const Duration(days: 5)),
    time: '02:15 PM',
    doctor: 'Dr. Michael Chen',
    hospital: 'City Medical Center',
    department: 'Pediatrics',
    status: 'Confirmed',
  ),
  Appointment(
    id: 'a3',
    date: DateTime.now().subtract(const Duration(days: 1)),
    time: '11:00 AM',
    doctor: 'Dr. Emily Williams',
    hospital: 'Community Health Hospital',
    department: 'Neurology',
    status: 'Completed',
  ),
];

// Generate random chat messages
final List<ChatMessage> dummyChatMessages = [
  ChatMessage(
    message: 'Hello, how can I help you today?',
    isUser: false,
  ),
  ChatMessage(
    message: 'I need to schedule an appointment with Dr. Johnson',
    isUser: true,
  ),
  ChatMessage(
    message: 'I can help you with that. What time works best for you?',
    isUser: false,
  ),
  ChatMessage(
    message: 'Morning appointments would be preferred',
    isUser: true,
  ),
  ChatMessage(
    message:
        'I see several morning slots available next week. Would Tuesday at 9:30 AM work for you?',
    isUser: false,
  ),
];

// Initialize all relationships
void initializeDummyData() {
  _updateHospitalDoctors();
  _updateHospitalPatients();
}
