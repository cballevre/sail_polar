import 'package:sail_polar/core/database/app_database.dart';
import 'package:drift/drift.dart';

import '../data/session_dao.dart';
import '../domain/session_model.dart';


class SessionRepository {
  final SessionDao sessionDao;

  SessionRepository({required this.sessionDao});

  Future<List<SessionModel>> getSessions() async {
    final sessions = await sessionDao.getAllSessions();
    return sessions.map((s) => SessionModel(
      id: s.id,
      name: s.name,
      createdAt: s.createdAt,
    )).toList();
  }

  Future<void> addSession(String name) async {
    final session = SessionsCompanion(
      name: Value(name),
    );
    await sessionDao.insertSession(session);
  }
}
