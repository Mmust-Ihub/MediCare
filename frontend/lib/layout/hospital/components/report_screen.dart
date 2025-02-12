import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reports & Analytics',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24),
          const Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Expanded(
                    child: Column(
                      children: [
                        _RevenueChart(),
                        SizedBox(height: 12),
                        _DepartmentStats(),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: _TopDoctors(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RevenueChart extends StatelessWidget {
  const _RevenueChart();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Revenue Overview',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'week', label: Text('Week')),
                    ButtonSegment(value: 'month', label: Text('Month')),
                    ButtonSegment(value: 'year', label: Text('Year')),
                  ],
                  selected: const {'month'},
                  onSelectionChanged: (Set<String> newSelection) {},
                ),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 3),
                        const FlSpot(1, 4),
                        const FlSpot(2, 3.5),
                        const FlSpot(3, 5),
                        const FlSpot(4, 4),
                        const FlSpot(5, 6),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DepartmentStats extends StatelessWidget {
  const _DepartmentStats();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Department Statistics',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _DepartmentCard(
                    title: 'Cardiology',
                    patients: 125,
                    increase: 12.5,
                    color: Colors.red.shade100,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _DepartmentCard(
                    title: 'Neurology',
                    patients: 89,
                    increase: 8.2,
                    color: Colors.blue.shade100,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _DepartmentCard(
                    title: 'Pediatrics',
                    patients: 156,
                    increase: 15.8,
                    color: Colors.green.shade100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DepartmentCard extends StatelessWidget {
  final String title;
  final int patients;
  final double increase;
  final Color color;

  const _DepartmentCard({
    required this.title,
    required this.patients,
    required this.increase,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            '$patients Patients',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            '+$increase%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class _TopDoctors extends StatelessWidget {
  const _TopDoctors();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Performing Doctors',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: _topDoctors.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final doctor = _topDoctors[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(doctor.name[0])),
                  title: Text(doctor.name),
                  subtitle: Text(doctor.department),
                  trailing: Text(
                    '${doctor.rating}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Doctor {
  final String name;
  final String department;
  final double rating;

  const _Doctor({
    required this.name,
    required this.department,
    required this.rating,
  });
}

final List<_Doctor> _topDoctors = [
  const _Doctor(
      name: 'Dr. Sarah Wilson', department: 'Cardiology', rating: 4.9),
  const _Doctor(
      name: 'Dr. Michael Brown', department: 'Neurology', rating: 4.8),
  const _Doctor(
      name: 'Dr. Emma Johnson', department: 'Pediatrics', rating: 4.7),
];
