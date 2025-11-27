import 'package:drift/drift.dart';
import 'package:sail_polar/core/database/app_database.dart';
import '../data/navigation_sample_dao.dart';

class NavigationSampleRepository {
  final NavigationSampleDao navigationSampleDao;

  NavigationSampleRepository({required this.navigationSampleDao});

  Future<List<NavigationSample>> getNavigationSamples() async {
    return await navigationSampleDao.select(navigationSampleDao.navigationSamples).get();
  }

  Future<void> addNavigationSample({
    required int sessionId,
    required DateTime timestamp,
    required double boatSpeed,
    required double trueWindSpeed,
    required double trueWindAngle,
  }) async {
    final sample = NavigationSamplesCompanion(
      sessionId: Value(sessionId),
      timestamp: Value(timestamp),
      boatSpeed: Value(boatSpeed),
      trueWindSpeed: Value(trueWindSpeed),
      trueWindAngle: Value(trueWindAngle),
    );
    await navigationSampleDao.insertNavigationSample(sample);
  }
}