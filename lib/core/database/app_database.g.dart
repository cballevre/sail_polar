// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Session> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final String name;
  final DateTime createdAt;
  const Session({
    required this.id,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory Session.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Session copyWith({int? id, String? name, DateTime? createdAt}) => Session(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NavigationSamplesTable extends NavigationSamples
    with TableInfo<$NavigationSamplesTable, NavigationSample> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NavigationSamplesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES sessions(id) NOT NULL',
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _boatSpeedMeta = const VerificationMeta(
    'boatSpeed',
  );
  @override
  late final GeneratedColumn<double> boatSpeed = GeneratedColumn<double>(
    'boat_speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trueWindSpeedMeta = const VerificationMeta(
    'trueWindSpeed',
  );
  @override
  late final GeneratedColumn<double> trueWindSpeed = GeneratedColumn<double>(
    'true_wind_speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trueWindAngleMeta = const VerificationMeta(
    'trueWindAngle',
  );
  @override
  late final GeneratedColumn<double> trueWindAngle = GeneratedColumn<double>(
    'true_wind_angle',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    timestamp,
    boatSpeed,
    trueWindSpeed,
    trueWindAngle,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'navigation_samples';
  @override
  VerificationContext validateIntegrity(
    Insertable<NavigationSample> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    if (data.containsKey('boat_speed')) {
      context.handle(
        _boatSpeedMeta,
        boatSpeed.isAcceptableOrUnknown(data['boat_speed']!, _boatSpeedMeta),
      );
    } else if (isInserting) {
      context.missing(_boatSpeedMeta);
    }
    if (data.containsKey('true_wind_speed')) {
      context.handle(
        _trueWindSpeedMeta,
        trueWindSpeed.isAcceptableOrUnknown(
          data['true_wind_speed']!,
          _trueWindSpeedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trueWindSpeedMeta);
    }
    if (data.containsKey('true_wind_angle')) {
      context.handle(
        _trueWindAngleMeta,
        trueWindAngle.isAcceptableOrUnknown(
          data['true_wind_angle']!,
          _trueWindAngleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trueWindAngleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NavigationSample map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NavigationSample(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      sessionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}session_id'],
          )!,
      timestamp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}timestamp'],
          )!,
      boatSpeed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}boat_speed'],
          )!,
      trueWindSpeed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}true_wind_speed'],
          )!,
      trueWindAngle:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}true_wind_angle'],
          )!,
    );
  }

  @override
  $NavigationSamplesTable createAlias(String alias) {
    return $NavigationSamplesTable(attachedDatabase, alias);
  }
}

class NavigationSample extends DataClass
    implements Insertable<NavigationSample> {
  final int id;
  final int sessionId;
  final DateTime timestamp;
  final double boatSpeed;
  final double trueWindSpeed;
  final double trueWindAngle;
  const NavigationSample({
    required this.id,
    required this.sessionId,
    required this.timestamp,
    required this.boatSpeed,
    required this.trueWindSpeed,
    required this.trueWindAngle,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['boat_speed'] = Variable<double>(boatSpeed);
    map['true_wind_speed'] = Variable<double>(trueWindSpeed);
    map['true_wind_angle'] = Variable<double>(trueWindAngle);
    return map;
  }

  NavigationSamplesCompanion toCompanion(bool nullToAbsent) {
    return NavigationSamplesCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      timestamp: Value(timestamp),
      boatSpeed: Value(boatSpeed),
      trueWindSpeed: Value(trueWindSpeed),
      trueWindAngle: Value(trueWindAngle),
    );
  }

  factory NavigationSample.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NavigationSample(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      boatSpeed: serializer.fromJson<double>(json['boatSpeed']),
      trueWindSpeed: serializer.fromJson<double>(json['trueWindSpeed']),
      trueWindAngle: serializer.fromJson<double>(json['trueWindAngle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'boatSpeed': serializer.toJson<double>(boatSpeed),
      'trueWindSpeed': serializer.toJson<double>(trueWindSpeed),
      'trueWindAngle': serializer.toJson<double>(trueWindAngle),
    };
  }

  NavigationSample copyWith({
    int? id,
    int? sessionId,
    DateTime? timestamp,
    double? boatSpeed,
    double? trueWindSpeed,
    double? trueWindAngle,
  }) => NavigationSample(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    timestamp: timestamp ?? this.timestamp,
    boatSpeed: boatSpeed ?? this.boatSpeed,
    trueWindSpeed: trueWindSpeed ?? this.trueWindSpeed,
    trueWindAngle: trueWindAngle ?? this.trueWindAngle,
  );
  NavigationSample copyWithCompanion(NavigationSamplesCompanion data) {
    return NavigationSample(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      boatSpeed: data.boatSpeed.present ? data.boatSpeed.value : this.boatSpeed,
      trueWindSpeed:
          data.trueWindSpeed.present
              ? data.trueWindSpeed.value
              : this.trueWindSpeed,
      trueWindAngle:
          data.trueWindAngle.present
              ? data.trueWindAngle.value
              : this.trueWindAngle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NavigationSample(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('timestamp: $timestamp, ')
          ..write('boatSpeed: $boatSpeed, ')
          ..write('trueWindSpeed: $trueWindSpeed, ')
          ..write('trueWindAngle: $trueWindAngle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    timestamp,
    boatSpeed,
    trueWindSpeed,
    trueWindAngle,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NavigationSample &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.timestamp == this.timestamp &&
          other.boatSpeed == this.boatSpeed &&
          other.trueWindSpeed == this.trueWindSpeed &&
          other.trueWindAngle == this.trueWindAngle);
}

class NavigationSamplesCompanion extends UpdateCompanion<NavigationSample> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<DateTime> timestamp;
  final Value<double> boatSpeed;
  final Value<double> trueWindSpeed;
  final Value<double> trueWindAngle;
  const NavigationSamplesCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.boatSpeed = const Value.absent(),
    this.trueWindSpeed = const Value.absent(),
    this.trueWindAngle = const Value.absent(),
  });
  NavigationSamplesCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    this.timestamp = const Value.absent(),
    required double boatSpeed,
    required double trueWindSpeed,
    required double trueWindAngle,
  }) : sessionId = Value(sessionId),
       boatSpeed = Value(boatSpeed),
       trueWindSpeed = Value(trueWindSpeed),
       trueWindAngle = Value(trueWindAngle);
  static Insertable<NavigationSample> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<DateTime>? timestamp,
    Expression<double>? boatSpeed,
    Expression<double>? trueWindSpeed,
    Expression<double>? trueWindAngle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (timestamp != null) 'timestamp': timestamp,
      if (boatSpeed != null) 'boat_speed': boatSpeed,
      if (trueWindSpeed != null) 'true_wind_speed': trueWindSpeed,
      if (trueWindAngle != null) 'true_wind_angle': trueWindAngle,
    });
  }

  NavigationSamplesCompanion copyWith({
    Value<int>? id,
    Value<int>? sessionId,
    Value<DateTime>? timestamp,
    Value<double>? boatSpeed,
    Value<double>? trueWindSpeed,
    Value<double>? trueWindAngle,
  }) {
    return NavigationSamplesCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      timestamp: timestamp ?? this.timestamp,
      boatSpeed: boatSpeed ?? this.boatSpeed,
      trueWindSpeed: trueWindSpeed ?? this.trueWindSpeed,
      trueWindAngle: trueWindAngle ?? this.trueWindAngle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (boatSpeed.present) {
      map['boat_speed'] = Variable<double>(boatSpeed.value);
    }
    if (trueWindSpeed.present) {
      map['true_wind_speed'] = Variable<double>(trueWindSpeed.value);
    }
    if (trueWindAngle.present) {
      map['true_wind_angle'] = Variable<double>(trueWindAngle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NavigationSamplesCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('timestamp: $timestamp, ')
          ..write('boatSpeed: $boatSpeed, ')
          ..write('trueWindSpeed: $trueWindSpeed, ')
          ..write('trueWindAngle: $trueWindAngle')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $NavigationSamplesTable navigationSamples =
      $NavigationSamplesTable(this);
  late final SessionDao sessionDao = SessionDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sessions,
    navigationSamples,
  ];
}

typedef $$SessionsTableCreateCompanionBuilder =
    SessionsCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime> createdAt,
    });
typedef $$SessionsTableUpdateCompanionBuilder =
    SessionsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
    });

final class $$SessionsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionsTable, Session> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NavigationSamplesTable, List<NavigationSample>>
  _navigationSamplesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.navigationSamples,
        aliasName: $_aliasNameGenerator(
          db.sessions.id,
          db.navigationSamples.sessionId,
        ),
      );

  $$NavigationSamplesTableProcessedTableManager get navigationSamplesRefs {
    final manager = $$NavigationSamplesTableTableManager(
      $_db,
      $_db.navigationSamples,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _navigationSamplesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> navigationSamplesRefs(
    Expression<bool> Function($$NavigationSamplesTableFilterComposer f) f,
  ) {
    final $$NavigationSamplesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.navigationSamples,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NavigationSamplesTableFilterComposer(
            $db: $db,
            $table: $db.navigationSamples,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> navigationSamplesRefs<T extends Object>(
    Expression<T> Function($$NavigationSamplesTableAnnotationComposer a) f,
  ) {
    final $$NavigationSamplesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.navigationSamples,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NavigationSamplesTableAnnotationComposer(
                $db: $db,
                $table: $db.navigationSamples,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsTable,
          Session,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (Session, $$SessionsTableReferences),
          Session,
          PrefetchHooks Function({bool navigationSamplesRefs})
        > {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SessionsCompanion(id: id, name: name, createdAt: createdAt),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SessionsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({navigationSamplesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (navigationSamplesRefs) db.navigationSamples,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (navigationSamplesRefs)
                    await $_getPrefetchedData<
                      Session,
                      $SessionsTable,
                      NavigationSample
                    >(
                      currentTable: table,
                      referencedTable: $$SessionsTableReferences
                          ._navigationSamplesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).navigationSamplesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.sessionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsTable,
      Session,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (Session, $$SessionsTableReferences),
      Session,
      PrefetchHooks Function({bool navigationSamplesRefs})
    >;
typedef $$NavigationSamplesTableCreateCompanionBuilder =
    NavigationSamplesCompanion Function({
      Value<int> id,
      required int sessionId,
      Value<DateTime> timestamp,
      required double boatSpeed,
      required double trueWindSpeed,
      required double trueWindAngle,
    });
typedef $$NavigationSamplesTableUpdateCompanionBuilder =
    NavigationSamplesCompanion Function({
      Value<int> id,
      Value<int> sessionId,
      Value<DateTime> timestamp,
      Value<double> boatSpeed,
      Value<double> trueWindSpeed,
      Value<double> trueWindAngle,
    });

final class $$NavigationSamplesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $NavigationSamplesTable,
          NavigationSample
        > {
  $$NavigationSamplesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias(
        $_aliasNameGenerator(db.navigationSamples.sessionId, db.sessions.id),
      );

  $$SessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NavigationSamplesTableFilterComposer
    extends Composer<_$AppDatabase, $NavigationSamplesTable> {
  $$NavigationSamplesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get boatSpeed => $composableBuilder(
    column: $table.boatSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get trueWindSpeed => $composableBuilder(
    column: $table.trueWindSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get trueWindAngle => $composableBuilder(
    column: $table.trueWindAngle,
    builder: (column) => ColumnFilters(column),
  );

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NavigationSamplesTableOrderingComposer
    extends Composer<_$AppDatabase, $NavigationSamplesTable> {
  $$NavigationSamplesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get boatSpeed => $composableBuilder(
    column: $table.boatSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get trueWindSpeed => $composableBuilder(
    column: $table.trueWindSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get trueWindAngle => $composableBuilder(
    column: $table.trueWindAngle,
    builder: (column) => ColumnOrderings(column),
  );

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NavigationSamplesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NavigationSamplesTable> {
  $$NavigationSamplesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<double> get boatSpeed =>
      $composableBuilder(column: $table.boatSpeed, builder: (column) => column);

  GeneratedColumn<double> get trueWindSpeed => $composableBuilder(
    column: $table.trueWindSpeed,
    builder: (column) => column,
  );

  GeneratedColumn<double> get trueWindAngle => $composableBuilder(
    column: $table.trueWindAngle,
    builder: (column) => column,
  );

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NavigationSamplesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NavigationSamplesTable,
          NavigationSample,
          $$NavigationSamplesTableFilterComposer,
          $$NavigationSamplesTableOrderingComposer,
          $$NavigationSamplesTableAnnotationComposer,
          $$NavigationSamplesTableCreateCompanionBuilder,
          $$NavigationSamplesTableUpdateCompanionBuilder,
          (NavigationSample, $$NavigationSamplesTableReferences),
          NavigationSample,
          PrefetchHooks Function({bool sessionId})
        > {
  $$NavigationSamplesTableTableManager(
    _$AppDatabase db,
    $NavigationSamplesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$NavigationSamplesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$NavigationSamplesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$NavigationSamplesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sessionId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<double> boatSpeed = const Value.absent(),
                Value<double> trueWindSpeed = const Value.absent(),
                Value<double> trueWindAngle = const Value.absent(),
              }) => NavigationSamplesCompanion(
                id: id,
                sessionId: sessionId,
                timestamp: timestamp,
                boatSpeed: boatSpeed,
                trueWindSpeed: trueWindSpeed,
                trueWindAngle: trueWindAngle,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sessionId,
                Value<DateTime> timestamp = const Value.absent(),
                required double boatSpeed,
                required double trueWindSpeed,
                required double trueWindAngle,
              }) => NavigationSamplesCompanion.insert(
                id: id,
                sessionId: sessionId,
                timestamp: timestamp,
                boatSpeed: boatSpeed,
                trueWindSpeed: trueWindSpeed,
                trueWindAngle: trueWindAngle,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$NavigationSamplesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (sessionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.sessionId,
                            referencedTable: $$NavigationSamplesTableReferences
                                ._sessionIdTable(db),
                            referencedColumn:
                                $$NavigationSamplesTableReferences
                                    ._sessionIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NavigationSamplesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NavigationSamplesTable,
      NavigationSample,
      $$NavigationSamplesTableFilterComposer,
      $$NavigationSamplesTableOrderingComposer,
      $$NavigationSamplesTableAnnotationComposer,
      $$NavigationSamplesTableCreateCompanionBuilder,
      $$NavigationSamplesTableUpdateCompanionBuilder,
      (NavigationSample, $$NavigationSamplesTableReferences),
      NavigationSample,
      PrefetchHooks Function({bool sessionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$NavigationSamplesTableTableManager get navigationSamples =>
      $$NavigationSamplesTableTableManager(_db, _db.navigationSamples);
}
