import 'package:drift/drift.dart';

import 'package:sail_polar/core/database/app_database.dart';

part 'navigation_sample_dao.g.dart';

@DriftAccessor(tables: [NavigationSamples])
class NavigationSampleDao extends DatabaseAccessor<AppDatabase> with _$NavigationSampleDaoMixin {
  final AppDatabase db;
  NavigationSampleDao(this.db) : super(db);

   Future<int> insertNavigationSample(NavigationSamplesCompanion sample) => into(navigationSamples).insert(sample);
}
