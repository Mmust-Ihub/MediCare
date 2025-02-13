import 'package:flutter/material.dart';

// Data Models
class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String image;
  final String hospitalId;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.image,
    required this.hospitalId,
  });
}

class Hospital {
  final String id;
  final String name;
  final String type;
  final String address;
  final String image;
  final double rating;
  final List<Doctor> doctors;

  Hospital({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.image,
    required this.rating,
    required this.doctors,
  });
}

// Dummy Data
final List<Hospital> DUMMY_HOSPITALS = [
  Hospital(
    id: '1',
    name: 'City General Hospital',
    type: 'General',
    address: '123 Medical Drive',
    image: 'https://images.unsplash.com/photo-1587351021759-3e566b6af7cc?auto=format&fit=crop&w=500&q=80',
    rating: 4.5,
    doctors: [
      Doctor(
        id: 'd1',
        name: 'Dr. Sarah Johnson',
        specialization: 'Cardiology',
        image: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=500&q=80',
        hospitalId: '1',
      ),
    ],
  ),
  Hospital(
    id: '2',
    name: 'Children\'s Medical Center',
    type: 'Pediatric',
    address: '456 Health Avenue',
    image: 'https://images.unsplash.com/photo-1538108149393-fbbd81895907?auto=format&fit=crop&w=500&q=80',
    rating: 4.8,
    doctors: [
      Doctor(
        id: 'd2',
        name: 'Dr. Michael Chen',
        specialization: 'Pediatrics',
        image: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=500&q=80',
        hospitalId: '2',
      ),
    ],
  ),
];

class HospitalsScreen extends StatelessWidget {
  const HospitalsScreen({super.key});

  void _removeHospital(String hospitalId) {
    // Implement hospital removal logic here
    debugPrint('Remove hospital with ID: $hospitalId');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Your Hospitals',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 24),
              
              // Hospital List
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: DUMMY_HOSPITALS.length,
                  itemBuilder: (context, index) {
                    final hospital = DUMMY_HOSPITALS[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF374151) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Hospital Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              hospital.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          
                          // Hospital Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hospital.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  hospital.type,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  hospital.address,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Color(0xFFFBC02D),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      hospital.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                          // Remove Button
                          IconButton(
                            onPressed: () => _removeHospital(hospital.id),
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Color(0xFFDC2626),
                              size: 24,
                            ),
                            padding: const EdgeInsets.all(4),
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
      ),
    );
  }
}