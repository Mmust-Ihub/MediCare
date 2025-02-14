import 'package:flutter/material.dart';
import 'package:medicare/services/geo_locator_service.dart';
import 'package:medicare/temporary/dummy.dart';
import 'package:medicare/temporary/models/models.dart';
import 'package:geolocator/geolocator.dart';

class HospitalProvider with ChangeNotifier {
  final User user = currentUser;

  final List<Hospital> hospitals = dummyHospitals;

  final List<Hospital> _sortedHospitals = [];

  bool _isLoading = false;
  Hospital? _currentHospital;

  bool get isLoading => _isLoading;

  List<Hospital> get sortedHospitals => _sortedHospitals;
  Hospital? get currentHospital => _currentHospital;

  HospitalProvider() {
    _initLocation();
    debugPrint(user.toString());
  }

  Position? position;

  Future<void> _initLocation() async {
    _isLoading = true;
    notifyListeners();

    position = await LocationService.determinePosition();

    if (position != null) {
      nearestHospitals();
    }
    _isLoading = false;

    notifyListeners();
  }

  Future<void> nearestHospitals() async {
    final List<Hospital> nearHospitals;

    for (var hospital in hospitals) {
      hospital.distance = Geolocator.distanceBetween(
            position!.latitude,
            position!.longitude,
            hospital.latitudee,
            hospital.longitude,
          ) /
          1000;
    }

    hospitals.sort((a, b) => a.distance.compareTo(b.distance));

    nearHospitals = hospitals.take(5).toList();

    for (var hospital in nearHospitals) {
      _sortedHospitals.add(hospital);
    }

    notifyListeners();
  }

  Future<void> addUserHospital(Hospital hospital) async {
    _isLoading = true;
    notifyListeners();
    if (hospitals.contains(hospital)) {
      user.enrolledHospitals.add(hospital);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeUserHospital(Hospital hospital) async {
    _isLoading = true;
    notifyListeners();
    if (user.enrolledHospitals.contains(hospital)) {
      user.enrolledHospitals.remove(hospital);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCurrentHospital(String hospitalId) async {
    _isLoading = true;
    notifyListeners();

    _currentHospital =
        hospitals.firstWhere((hospital) => hospital.id == hospitalId);

    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }
}
