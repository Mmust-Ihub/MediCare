// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/services.dart';
import 'package:medicare/temporary/models/models.dart';

class EmergencyService {
  static Future<void> sendEmergencyEmail({
    required String userEmail,
    required String userName,
    Hospital? hospital,
  }) async {
    final smtpServer = gmail('kinslybyrone17@gmail.com', 'qgup bauw pocb fmjw');

    final message = Message()
      ..from = const Address('medicare@gmail.com', 'MediCare Emergency')
      ..recipients.add('sebbievilar2@gmail.com')
      ..subject = 'EMERGENCY: Patient Requires Immediate Assistance'
      ..html = '''
        <h2>Emergency Alert</h2>
        <p>Patient $userName requires immediate medical attention.</p>
        <p>Contact Information: $userEmail</p>
      ''';

    try {
      await send(message, smtpServer);
    } catch (e) {
      debugPrint('Error sending emergency email: $e');
      rethrow;
    }
  }
}

// lib/services/power_button_detector.dart

class PowerButtonDetector {
  static const platform = MethodChannel('com.medicare/power_button');
  static const int REQUIRED_PRESSES = 4;
  static const int PRESS_TIMEOUT = 2000; // milliseconds

  List<DateTime> _pressTimestamps = [];

  Future<void> initialize() async {
    platform.setMethodCallHandler((call) async {
      if (call.method == 'onPowerButtonPress') {
        _handlePowerButtonPress();
      }
    });
  }

  void _handlePowerButtonPress() {
    final now = DateTime.now();
    _pressTimestamps.add(now);

    // Remove old timestamps
    _pressTimestamps.removeWhere(
      (timestamp) => now.difference(timestamp).inMilliseconds > PRESS_TIMEOUT,
    );

    if (_pressTimestamps.length >= REQUIRED_PRESSES) {
      _triggerEmergency();
      _pressTimestamps.clear();
    }
  }

  void _triggerEmergency() {
    debugPrint("Power button detected");
    // Trigger emergency email
    // This would be called from your emergency service
  }
}
