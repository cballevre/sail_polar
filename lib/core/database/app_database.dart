import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sail_polar/features/session/data/session_dao.dart';


// Définir ici toutes les tables de l'app
part 'app_database.g.dart';

@DataClassName('Session')
class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('NavigationSample')
class NavigationSamples extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().customConstraint('REFERENCES sessions(id) NOT NULL')();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  RealColumn get boatSpeed => real()();
  RealColumn get trueWindSpeed => real()();
  RealColumn get trueWindAngle => real()();
}

@DriftDatabase(tables: [Sessions, NavigationSamples], daos: [SessionDao])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}