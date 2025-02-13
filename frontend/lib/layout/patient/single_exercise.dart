import 'package:flutter/material.dart';

// Data Model
class Exercise {
  final String id;
  final String name;
  final String category;
  final String description;
  final String duration;
  final String image;
  final String difficulty;
  final int calories;
  final List<String> equipment;
  final List<String> steps;
  final List<String> benefits;
  final Instructor instructor;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.duration,
    required this.image,
    required this.difficulty,
    required this.calories,
    required this.equipment,
    required this.steps,
    required this.benefits,
    required this.instructor,
  });
}

class Instructor {
  final String name;
  final String image;
  final String experience;
  final String specialization;

  Instructor({
    required this.name,
    required this.image,
    required this.experience,
    required this.specialization,
  });
}

// Sample Data
final Map<String, Exercise> exercises = {
  'e1': Exercise(
    id: 'e1',
    name: 'Morning Yoga',
    category: 'Flexibility',
    description: 'A gentle morning yoga routine to improve flexibility, reduce stress, and increase energy levels. Perfect for beginners and intermediate practitioners.',
    duration: '30 min',
    image: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?auto=format&fit=crop&w=500&q=80',
    difficulty: 'Beginner',
    calories: 150,
    equipment: ['Yoga Mat', 'Comfortable Clothes'],
    steps: [
      'Start with 5 minutes of deep breathing',
      'Perform sun salutations for 10 minutes',
      'Hold warrior poses for 5 minutes',
      'Practice balance poses for 5 minutes',
      'End with 5 minutes of meditation',
    ],
    benefits: [
      'Improved Flexibility',
      'Reduced Stress',
      'Better Posture',
      'Increased Energy',
    ],
    instructor: Instructor(
      name: 'Sarah Wilson',
      image: 'https://images.unsplash.com/photo-1594381898411-846e7d193883?auto=format&fit=crop&w=500&q=80',
      experience: '10 years',
      specialization: 'Yoga & Meditation',
    ),
  ),
};

class ExerciseDetailScreen extends StatelessWidget {
  final String exerciseId;

  const ExerciseDetailScreen({Key? key, required this.exerciseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final exercise = exercises[exerciseId];

    if (exercise == null) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              'Exercise not found',
              style: TextStyle(
                fontSize: 18,
                color: isDark ? Colors.white : Colors.grey[800],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[100],
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    exercise.image,
                    fit: BoxFit.cover,
                  ),
                ),
                leading: _buildCircularButton(
                  context,
                  Icons.arrow_back,
                  () => Navigator.pop(context),
                  isDark,
                ),
                actions: [
                  _buildCircularButton(
                    context,
                    Icons.share_outlined,
                    () {},
                    isDark,
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleSection(exercise, isDark),
                      const SizedBox(height: 16),
                      _buildStatsSection(exercise, isDark),
                      const SizedBox(height: 24),
                      _buildDescriptionSection(exercise, isDark),
                      const SizedBox(height: 24),
                      _buildEquipmentSection(exercise, isDark),
                      const SizedBox(height: 24),
                      _buildStepsSection(exercise, isDark),
                      const SizedBox(height: 24),
                      _buildBenefitsSection(exercise, isDark),
                      const SizedBox(height: 24),
                      _buildInstructorSection(exercise, isDark),
                      const SizedBox(height: 80), // Space for bottom button
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: _buildStartButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(icon, color: isDark ? Colors.grey[800] : Colors.grey[900]),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _buildTitleSection(Exercise exercise, bool isDark) {
    return Row(
      children: [
        Expanded(
          child: Text(
            exercise.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.grey[900],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            exercise.category,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(Exercise exercise, bool isDark) {
    return Row(
      children: [
        _buildStatItem(
          Icons.timer_outlined,
          exercise.duration,
          'Duration',
          isDark,
        ),
        const SizedBox(width: 8),
        _buildStatItem(
          Icons.fitness_center_outlined,
          exercise.difficulty,
          'Level',
          isDark,
        ),
        const SizedBox(width: 8),
        _buildStatItem(
          Icons.local_fire_department_outlined,
          '${exercise.calories}',
          'Calories',
          isDark,
        ),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label, bool isDark) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.white,
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
          children: [
            Icon(icon, color: isDark ? Colors.grey[300] : Colors.grey[900]),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.grey[900],
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(Exercise exercise, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Description', isDark),
        const SizedBox(height: 12),
        Text(
          exercise.description,
          style: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildEquipmentSection(Exercise exercise, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Equipment Needed', isDark),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: exercise.equipment.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[700],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStepsSection(Exercise exercise, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Steps', isDark),
        const SizedBox(height: 12),
        ...exercise.steps.asMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      '${entry.key + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.white : Colors.grey[900],
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildBenefitsSection(Exercise exercise, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Benefits', isDark),
        const SizedBox(height: 12),
        ...exercise.benefits.map((benefit) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.blue[700],
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    benefit,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.white : Colors.grey[900],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildInstructorSection(Exercise exercise, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Instructor', isDark),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : Colors.white,
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
                borderRadius: BorderRadius.circular(32),
                child: Image.network(
                  exercise.instructor.image,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.instructor.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.grey[900],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exercise.instructor.specialization,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${exercise.instructor.experience} experience',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: isDark ? Colors.white : Colors.grey[900],
      ),
    );
  }

  Widget _buildStartButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[700],
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Start Exercise',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}