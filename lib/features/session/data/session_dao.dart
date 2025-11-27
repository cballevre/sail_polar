import 'package:drift/drift.dart';

import 'package:sail_polar/core/database/app_database.dart';

part 'session_dao.g.dart';

@DriftAccessor(tables: [Sessions])
class SessionDao extends DatabaseAccessor<AppDatabase> with _$SessionDaoMixin {
  final AppDatabase db;
  SessionDao(this.db) : super(db);

  Future<List<Session>> getAllSessions() => select(sessions).get();
  Future<int> insertSession(SessionsCompanion session) => into(sessions).insert(session);
}
