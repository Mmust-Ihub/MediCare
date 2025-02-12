import 'package:flutter/material.dart';

class Providers with ChangeNotifier {
  final UserType _usertype = UserType.patient;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  UserType get usertype => _usertype;

  Future<UserType?> auth(String email) async {
    _isLoading = true;
    notifyListeners();


    UserType? result;

    if (email == "patient@gmail.com") {
      result = UserType.patient;
    } else if (email == "hospital@gmail.com") {
      result = UserType.hospital;
    } else if (email == "doctor@gmail.com") {
      result = UserType.doctor;
    } else if (email == "admin@gmail.com") {
      result = UserType.admin;
    } else {
      result = null;
    }

    await Future.delayed(const Duration(seconds: 5), () => UserType.patient);

    _isLoading = false;
    notifyListeners();

    return result;
  }

  Future<void> loading() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(
      const Duration(seconds: 5),
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addRecord() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(
      const Duration(seconds: 5),
    );

    _isLoading = false;
    notifyListeners();
  }
}

enum UserType { doctor, patient, hospital, admin }
