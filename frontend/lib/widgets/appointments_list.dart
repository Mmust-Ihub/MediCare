import 'package:flutter/material.dart';
import 'package:medicare/models/appointment.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample appointments data
    final appointments = [
      Appointment(
        id: '1',
        patientId: '1',
        patientName: 'Alice Johnson',
        doctorId: '1',
        doctorName: 'Dr. John Doe',
        dateTime: DateTime.now().add(const Duration(hours: 2)),
      ),
      Appointment(
        id: '2',
        patientId: '2',
        patientName: 'Bob Smith',
        doctorId: '2',
        doctorName: 'Dr. Jane Smith',
        dateTime: DateTime.now().add(const Duration(hours: 4)),
      ),
      // Add more sample appointments as needed
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.calendar_today),
            ),
            title: Text(appointment.patientName),
            subtitle: Text(
              '${appointment.doctorName} • ${_formatDateTime(appointment.dateTime)}',
            ),
            trailing: _getStatusChip(appointment.status),
          ),
        );
      },
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  Widget _getStatusChip(AppointmentStatus status) {
    Color color;
    String label;

    switch (status) {
      case AppointmentStatus.scheduled:
        color = Colors.blue;
        label = 'Scheduled';
        break;
      case AppointmentStatus.completed:
        color = Colors.green;
        label = 'Completed';
        break;
      case AppointmentStatus.cancelled:
        color = Colors.red;
        label = 'Cancelled';
        break;
    }

    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
    );
  }
}