enum AppointmentStatus { scheduled, completed, cancelled }

class Appointment {
  final String id;
  final String patientId;
  final String patientName;
  final String doctorId;
  final String doctorName;
  final DateTime dateTime;
  final AppointmentStatus status;

  Appointment({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.doctorId,
    required this.doctorName,
    required this.dateTime,
    this.status = AppointmentStatus.scheduled,
  });
}