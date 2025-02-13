import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DummyUser {
  final String id;
  final String fullName;
  final String email;
  final double distance;
  final bool isCritical;
  final List<dynamic> records;
  final List<String> enrolledHospitals;

  DummyUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.distance,
    required this.isCritical,
    required this.records,
    required this.enrolledHospitals,
  });
}

final dummyUser = DummyUser(
  id: 'u1',
  fullName: 'John Doe',
  email: 'john.doe@example.com',
  distance: 0,
  isCritical: false,
  records: [],
  enrolledHospitals: ['1', '2'],
);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  String getInitials(String fullName) {
    return fullName.split(' ').map((name) => name[0]).join('');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header Section
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF3B82F6) : const Color(0xFF2563EB),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        getInitials(dummyUser.fullName),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    dummyUser.fullName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dummyUser.email,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Account Settings Section
              _buildSection(
                context: context,
                title: 'Account Settings',
                items: [
                  _MenuItem(
                    icon: Icons.person_outline,
                    title: 'Edit Profile',
                    onTap: () {},
                  ),
                  _MenuItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  _MenuItem(
                    icon: Icons.lock_outline,
                    title: 'Privacy & Security',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Emergency Contact Section
              _buildSection(
                context: context,
                title: 'Emergency Contact',
                items: [
                  _MenuItem(
                    icon: Icons.call_outlined,
                    title: 'Add Emergency Contact',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Logout Button
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF374151) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Color(0xFFDC2626)),
                      SizedBox(width: 8),
                      Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFDC2626),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required List<_MenuItem> items,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF374151) : Colors.white,
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
            children: items.map((item) {
              final isLast = items.last == item;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(
                      item.icon,
                      color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                    ),
                    onTap: item.onTap,
                  ),
                  if (!isLast)
                    const Divider(height: 1, thickness: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}