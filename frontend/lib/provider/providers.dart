import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medicare/services/gemini_api_service.dart';
import 'package:medicare/temporary/models/models.dart';

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

class ChatProvider with ChangeNotifier {
  final geminiService = GeminiService(apiKey: dotenv.env['GEMINI_API_KEY']!);

  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  Future<void> sendMessage(String content) async {
    final userMessage = ChatMessage(message: content, isUser: true);
    _messages.add(userMessage);
    notifyListeners();

    _isLoading = true;
    notifyListeners();

    try {
      final response = await geminiService.getResponse(content);

      final responseMessage = ChatMessage(message: response, isUser: false);
      _messages.add(responseMessage);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      final errorMessage = ChatMessage(
        message: "Sorry, I couldn't process your message: $e",
        isUser: false,
      );
      _messages.add(errorMessage);
      _isLoading = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
