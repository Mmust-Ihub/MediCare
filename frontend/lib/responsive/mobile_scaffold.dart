import 'package:flutter/material.dart';
import 'package:medicare/layout/patient/appointments.dart';
import 'package:medicare/layout/patient/chat_screen.dart';
import 'package:medicare/layout/patient/hospital_screen.dart';
import 'package:medicare/layout/patient/profile_screen.dart';
import 'package:medicare/layout/patient/records_screen.dart';
import 'package:medicare/provider/hospital_provider.dart';
import 'package:medicare/services/emergency_service.dart';
import 'package:medicare/temporary/dummy.dart';
import 'package:medicare/theme/app_theme.dart';
import 'package:provider/provider.dart';

// Data Models
class Category {
  final String id;
  final String name;
  final String icon;

  Category({required this.id, required this.name, required this.icon});
}

class Exercise {
  final String id;
  final String name;
  final String category;
  final String description;
  final String duration;
  final String image;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.duration,
    required this.image,
  });
}

class Diet {
  final String id;
  final String name;
  final String category;
  final String description;
  final int calories;
  final String image;

  Diet({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.calories,
    required this.image,
  });
}

// Constants
final List<Category> categories = [
  Category(id: '1', name: 'Orthopedic', icon: '🦴'),
  Category(id: '2', name: 'Pediatric', icon: '👶'),
  Category(id: '3', name: 'Cardiology', icon: '❤️'),
  Category(id: '4', name: 'Neurology', icon: '🧠'),
  Category(id: '5', name: 'Dental', icon: '🦷'),
];

final List<Exercise> exercises = [
  Exercise(
    id: 'e1',
    name: 'Morning Yoga',
    category: 'Flexibility',
    description: '30-minute gentle yoga routine',
    duration: '30 min',
    image:
        'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?auto=format&fit=crop&w=500&q=80',
  ),
  Exercise(
    id: 'e2',
    name: 'Cardio Walk',
    category: 'Cardio',
    description: 'Moderate-paced walking',
    duration: '20 min',
    image:
        'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?auto=format&fit=crop&w=500&q=80',
  ),
];

final List<Diet> diets = [
  Diet(
    id: 'd1',
    name: 'Heart-Healthy Breakfast',
    category: 'Breakfast',
    description: 'Oatmeal with fruits and nuts',
    calories: 350,
    image:
        'https://images.unsplash.com/photo-1517673400267-0251440c45dc?auto=format&fit=crop&w=500&q=80',
  ),
  Diet(
    id: 'd2',
    name: 'Protein-Rich Lunch',
    category: 'Lunch',
    description: 'Grilled chicken salad',
    calories: 450,
    image:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<HospitalProvider>(
            builder:
                (BuildContext context, HospitalProvider value, Widget? child) {
              final hospitals = value.sortedHospitals;

              return Column(
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, ${currentUser.fullName.split(" ")[0]}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? const Color(0xFFF3F4F6)
                                  : const Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'How are you feeling today?',
                            style: TextStyle(
                              fontSize: 16,
                              color: isDark
                                  ? const Color(0xFF9CA3AF)
                                  : const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () async {
                          await EmergencyService.sendEmergencyEmail(
                              userEmail: currentUser.email,
                              userName: currentUser.fullName);
                        },
                        icon: const Icon(Icons.warning_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0xFFDC2626),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Main Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Categories Section
                        Text(
                          'Hospital Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? const Color(0xFFF3F4F6)
                                : const Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return Container(
                                width: 100,
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF374151)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      category.icon,
                                      style: const TextStyle(fontSize: 32),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      category.name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: isDark
                                            ? const Color(0xFFF3F4F6)
                                            : const Color(0xFF1F2937),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Exercises Section
                        Text(
                          'Nearest Hospitals',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? const Color(0xFFF3F4F6)
                                : const Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              final hospital = hospitals[index];

                              return Container(
                                width: 200,
                                margin: const EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF374151)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        hospital.imageUrl,
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              hospital.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: isDark
                                                    ? const Color(0xFFF3F4F6)
                                                    : const Color(0xFF1F2937),
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    hospital.category,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: isDark
                                                          ? const Color(
                                                              0xFF9CA3AF)
                                                          : const Color(
                                                              0xFF6B7280),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${hospital.distance.toStringAsFixed(2)} km',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: isDark
                                                          ? const Color(
                                                              0xFF9CA3AF)
                                                          : const Color(
                                                              0xFF6B7280),
                                                    ),
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Diet Section
                        Text(
                          'Your Diet Plan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? const Color(0xFFF3F4F6)
                                : const Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: diets.length,
                            itemBuilder: (context, index) {
                              final diet = diets[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF374151)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                        left: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        diet.image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              diet.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: isDark
                                                    ? const Color(0xFFF3F4F6)
                                                    : const Color(0xFF1F2937),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              diet.category,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: isDark
                                                    ? const Color(0xFF9CA3AF)
                                                    : const Color(0xFF6B7280),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '${diet.calories} calories',
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
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const HospitalsScreen(),
    const AppointmentsScreen(),
    const RecordsScreen(),
    const ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
