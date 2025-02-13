import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointment {
  final String id;
  final DateTime date;
  final String time;
  final String doctor;
  final String hospital;
  final String department;
  final String status;

  Appointment({
    required this.id,
    required this.date,
    required this.time,
    required this.doctor,
    required this.hospital,
    required this.department,
    required this.status,
  });
}

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final List<String> timeSlots = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
  ];

  late DateTime selectedDate;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  List<Appointment> getDummyAppointments() {
    return [
      Appointment(
        id: 'a1',
        date: DateTime.now().add(const Duration(days: 2)),
        time: '10:30 AM',
        doctor: 'Dr. Sarah Johnson',
        hospital: 'City General Hospital',
        department: 'Cardiology',
        status: 'upcoming',
      ),
      Appointment(
        id: 'a2',
        date: DateTime.now().add(const Duration(days: 5)),
        time: '2:15 PM',
        doctor: 'Dr. Michael Chen',
        hospital: "Children's Medical Center",
        department: 'Pediatrics',
        status: 'upcoming',
      ),
    ];
  }

  List<DateTime> getNextSevenDays() {
    return List.generate(
      7,
      (index) => DateTime.now().add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF111827) : const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildHeader(isDark),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Upcoming Appointments', isDark),
                      ..._buildAppointmentsList(isDark),
                      _buildSectionTitle('Book New Appointment', isDark),
                      _buildDateSelector(isDark),
                      _buildTimeSelector(isDark),
                      _buildConfirmButton(),
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

  Widget _buildHeader(bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Appointments',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB),
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
        ),
      ),
    );
  }

  List<Widget> _buildAppointmentsList(bool isDark) {
    return getDummyAppointments().map((appointment) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
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
        child: Column(
          children: [
            Row(
              children: [
                _buildDateContainer(appointment, isDark),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildAppointmentInfo(appointment, isDark),
                ),
                _buildTimeWidget(appointment, isDark),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(color: Color(0xFFE5E7EB)),
            ),
            _buildActionButtons(),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildDateContainer(Appointment appointment, bool isDark) {
    return Column(
      children: [
        Text(
          DateFormat('d').format(appointment.date),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
          ),
        ),
        Text(
          DateFormat('MMM').format(appointment.date),
          style: TextStyle(
            fontSize: 14,
            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentInfo(Appointment appointment, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appointment.doctor,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          appointment.hospital,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
          ),
        ),
        Text(
          appointment.department,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeWidget(Appointment appointment, bool isDark) {
    return Text(
      appointment.time,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionButton(
          icon: Icons.close,
          label: 'Cancel',
          color: const Color(0xFFDC2626),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        _buildActionButton(
          icon: Icons.calendar_today,
          label: 'Reschedule',
          color: const Color(0xFF2563EB),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white, size: 20),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildDateSelector(bool isDark) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index));
          final isSelected = DateUtils.isSameDay(date, selectedDate);

          return GestureDetector(
            onTap: () => setState(() => selectedDate = date),
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF2563EB)
                    : (isDark ? const Color(0xFF374151) : Colors.white),
                borderRadius: BorderRadius.circular(12),
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
                    DateFormat('EEE').format(date),
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected
                          ? Colors.white
                          : (isDark
                              ? const Color(0xFFF3F4F6)
                              : const Color(0xFF1F2937)),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('d').format(date),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : (isDark
                              ? const Color(0xFFF3F4F6)
                              : const Color(0xFF1F2937)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimeSelector(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: timeSlots.map((time) {
          final isSelected = time == selectedTime;
          return GestureDetector(
            onTap: () => setState(() => selectedTime = time),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.28,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF2563EB)
                    : (isDark ? const Color(0xFF374151) : Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected
                      ? Colors.white
                      : (isDark
                          ? const Color(0xFFF3F4F6)
                          : const Color(0xFF1F2937)),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2563EB),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Confirm Appointment',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
