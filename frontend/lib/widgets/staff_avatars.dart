import 'package:flutter/material.dart';

class StaffAvatars extends StatelessWidget {
  const StaffAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample staff data
    final staffList = [
      {
        'name': 'Dr. John Doe',
        'image': 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=150',
      },
      {
        'name': 'Dr. Jane Smith',
        'image': 'https://images.unsplash.com/photo-1594824476967-48c8b964273f?w=150',
      },
      {
        'name': 'Dr. Mike Johnson',
        'image': 'https://images.unsplash.com/photo-1622253692010-333f2da6031d?w=150',
      },
      {
        'name': 'Dr. Sarah Williams',
        'image': 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=150',
      },
      {
        'name': 'Dr. Robert Brown',
        'image': 'https://images.unsplash.com/photo-1612531386530-97286d97c2d2?w=150',
      },
    ];

    return SizedBox(
      height: 80,
      child: Row(
        children: [
          ...List.generate(
            staffList.length > 4 ? 4 : staffList.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Tooltip(
                message: staffList[index]['name']!,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(staffList[index]['image']!),
                ),
              ),
            ),
          ),
          if (staffList.length > 4)
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '+${staffList.length - 4}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}