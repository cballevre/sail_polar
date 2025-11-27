import 'package:flutter/material.dart';

import '../domain/session_model.dart';
import '../domain/session_repository.dart';

class SessionViewModel extends ChangeNotifier {
  final SessionRepository repository;
  List<SessionModel> sessions = [];

  SessionViewModel({required this.repository});

  Future<void> loadSessions() async {
    sessions = await repository.getSessions();
    notifyListeners();
  }

  Future<void> addSession(String name) async {
    await repository.addSession(name);
    await loadSessions();
  }
}
