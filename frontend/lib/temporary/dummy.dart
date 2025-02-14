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
    id: 'h1',
    name: 'Kakamega County Referral Hospital',
    address: 'Kakamega-Kisumu Road, Kakamega',
    category: 'Public',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.constructionkenya.com/wp-content/uploads/2020/06/Kakamega-Teaching-and-Referral-Hospital.jpg',
    rating: 4.3,
    latitudee: -0.2827,
    longitude: 34.7519,
  ),
  Hospital(
    id: 'h2',
    name: 'St. Elizabeth Mukumu Hospital',
    address: 'Kakamega-Kisumu Highway, Kakamega',
    category: 'Faith-Based',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5Y5V5j5i5vXqOMj0DTnQH7QjPGdfBzYWJ4w&usqp=CAU',
    rating: 4.1,
    latitudee: -0.2891,
    longitude: 34.7644,
  ),
  Hospital(
    id: 'h3',
    name: 'Jaramogi Oginga Odinga Teaching and Referral Hospital',
    address: 'Kisumu-Kakamega Road, Kisumu',
    category: 'Public',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.constructionkenya.com/wp-content/uploads/2020/06/Jaramogi-Oginga-Odinga-Teaching-and-Referral-Hospital.jpg',
    rating: 4.4,
    latitudee: -0.0917,
    longitude: 34.7680,
  ),
  Hospital(
    id: 'h4',
    name: 'Aga Khan Hospital Kisumu',
    address: 'Obama Road, Kisumu',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.agakhanhospitals.org/images/default-source/hospitals/kisumu/akhk-building.jpg',
    rating: 4.6,
    latitudee: -0.0875,
    longitude: 34.7633,
  ),
  Hospital(
    id: 'h5',
    name: 'Avenue Hospital Kisumu',
    address: 'Oginga Odinga Street, Kisumu',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.avenuehealthcare.com/wp-content/uploads/2020/03/avenue-kisumu-1.jpg',
    rating: 4.2,
    latitudee: -0.0922,
    longitude: 34.7577,
  ),
  Hospital(
    id: 'h6',
    name: 'Kenyatta National Hospital',
    address: 'Hospital Road, Upper Hill, Nairobi',
    category: 'Public',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.constructionkenya.com/wp-content/uploads/2020/06/Kenyatta-National-Hospital.jpg',
    rating: 4.5,
    latitudee: -1.3031,
    longitude: 36.8072,
  ),
  Hospital(
    id: 'h7',
    name: 'Nairobi Hospital',
    address: 'Argwings Kodhek Road, Nairobi',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.nairobihospital.org/wp-content/uploads/2022/03/Anderson-1-1.jpg',
    rating: 4.7,
    latitudee: -1.2921,
    longitude: 36.8219,
  ),
  Hospital(
    id: 'h8',
    name: 'Aga Khan University Hospital',
    address: '3rd Parklands Avenue, Nairobi',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.agakhanhospitals.org/images/default-source/hospitals/nairobi/akuh-building.jpg',
    rating: 4.8,
    latitudee: -1.2636,
    longitude: 36.8159,
  ),
  Hospital(
    id: 'h9',
    name: 'Mama Lucy Kibaki Hospital',
    address: 'Kangundo Road, Nairobi',
    category: 'Public',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.constructionkenya.com/wp-content/uploads/2020/06/Mama-Lucy-Kibaki-Hospital.jpg',
    rating: 4.0,
    latitudee: -1.2833,
    longitude: 36.8987,
  ),
  Hospital(
    id: 'h10',
    name: 'Gertrude\'s Children\'s Hospital',
    address: 'Muthaiga Road, Nairobi',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.gerties.org/wp-content/uploads/2022/03/Gertrudes-Muthaiga-1.jpg',
    rating: 4.6,
    latitudee: -1.2573,
    longitude: 36.8362,
  ),
  Hospital(
    id: 'h11',
    name: 'Coast General Teaching and Referral Hospital',
    address: 'Mombasa-Malindi Highway, Mombasa',
    category: 'Public',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.constructionkenya.com/wp-content/uploads/2020/06/Coast-General-Hospital.jpg',
    rating: 4.3,
    latitudee: -4.0435,
    longitude: 39.6682,
  ),
  Hospital(
    id: 'h12',
    name: 'Aga Khan Hospital Mombasa',
    address: 'Vanga Road, Mombasa',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://www.agakhanhospitals.org/images/default-source/hospitals/mombasa/akhm-building.jpg',
    rating: 4.5,
    latitudee: -4.0551,
    longitude: 39.6744,
  ),
  Hospital(
    id: 'h13',
    name: 'Pandya Memorial Hospital',
    address: 'Dedan Kimathi Road, Mombasa',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl: 'https://www.pandyahospital.org/images/building.jpg',
    rating: 4.2,
    latitudee: -4.0428,
    longitude: 39.6739,
  ),
  Hospital(
    id: 'h14',
    name: 'Premier Hospital Kakamega',
    address: 'Kenyatta Avenue, Kakamega',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9X5V5j5i5vXqOMj0DTnQH7QjPGdfBzYWJ4w&usqp=CAU',
    rating: 4.0,
    latitudee: -0.2856,
    longitude: 34.7511,
  ),
  Hospital(
    id: 'h15',
    name: 'Victoria Hospital Kisumu',
    address: 'Nyerere Road, Kisumu',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5Y5V5j5i5vXqOMj0DTnQH7QjPGdfBzYWJ4w&usqp=CAU',
    rating: 4.1,
    latitudee: -0.0914,
    longitude: 34.7623,
  ),
  Hospital(
    id: 'h16',
    name: 'MP Shah Hospital',
    address: 'Shivachi Road, Nairobi',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://mpshahhosp.org/wp-content/uploads/2022/03/MP-Shah-Hospital.jpg',
    rating: 4.6,
    latitudee: -1.2640,
    longitude: 36.8064,
  ),
  Hospital(
    id: 'h17',
    name: 'Karen Hospital',
    address: 'Karen Road, Nairobi',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://karenhospital.org/wp-content/uploads/2022/03/karen-hospital-building.jpg',
    rating: 4.5,
    latitudee: -1.3237,
    longitude: 36.7062,
  ),
  Hospital(
    id: 'h18',
    name: 'Mombasa Hospital',
    address: 'Mombasa-Malindi Road, Mombasa',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Y5V5j5i5vXqOMj0DTnQH7QjPGdfBzYWJ4w&usqp=CAU',
    rating: 4.3,
    latitudee: -4.0478,
    longitude: 39.6696,
  ),
  Hospital(
    id: 'h19',
    name: 'Tudor Healthcare',
    address: 'Tudor Road, Mombasa',
    category: 'Private',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Y5V5j5i5vXqOMj0DTnQH7QjPGdfBzYWJ4w&usqp=CAU',
    rating: 4.0,
    latitudee: -4.0357,
    longitude: 39.6731,
  ),
  Hospital(
    id: 'h20',
    name: 'Port Health Hospital',
    address: 'Port Reitz Road, Mombasa',
    category: 'Public',
    doctors: [],
    enrolledPatients: [],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcU5Y5V5j5i5vXqOMj0DTnQH7QjPGdfBzYWJ4w&usqp=CAU',
    rating: 4.1,
    latitudee: -4.0412,
    longitude: 39.6424,
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
