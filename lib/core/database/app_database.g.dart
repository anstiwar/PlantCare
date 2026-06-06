// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlantsTableTable extends PlantsTable
    with TableInfo<$PlantsTableTable, Plant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nicknameMeta =
      const VerificationMeta('nickname');
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
      'nickname', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _wateringProgressMeta =
      const VerificationMeta('wateringProgress');
  @override
  late final GeneratedColumn<double> wateringProgress = GeneratedColumn<double>(
      'watering_progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(1.0));
  static const VerificationMeta _nextWateringMeta =
      const VerificationMeta('nextWatering');
  @override
  late final GeneratedColumn<String> nextWatering = GeneratedColumn<String>(
      'next_watering', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('7 days left'));
  static const VerificationMeta _healthStatusMeta =
      const VerificationMeta('healthStatus');
  @override
  late final GeneratedColumn<String> healthStatus = GeneratedColumn<String>(
      'health_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Excellent'));
  static const VerificationMeta _wateringIntervalMeta =
      const VerificationMeta('wateringInterval');
  @override
  late final GeneratedColumn<int> wateringInterval = GeneratedColumn<int>(
      'watering_interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(7));
  static const VerificationMeta _dateAddedMeta =
      const VerificationMeta('dateAdded');
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
      'date_added', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        nickname,
        photoPath,
        species,
        location,
        category,
        wateringProgress,
        nextWatering,
        healthStatus,
        wateringInterval,
        dateAdded,
        notes,
        isArchived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plants_table';
  @override
  VerificationContext validateIntegrity(Insertable<Plant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(_nicknameMeta,
          nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta));
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('watering_progress')) {
      context.handle(
          _wateringProgressMeta,
          wateringProgress.isAcceptableOrUnknown(
              data['watering_progress']!, _wateringProgressMeta));
    }
    if (data.containsKey('next_watering')) {
      context.handle(
          _nextWateringMeta,
          nextWatering.isAcceptableOrUnknown(
              data['next_watering']!, _nextWateringMeta));
    }
    if (data.containsKey('health_status')) {
      context.handle(
          _healthStatusMeta,
          healthStatus.isAcceptableOrUnknown(
              data['health_status']!, _healthStatusMeta));
    }
    if (data.containsKey('watering_interval')) {
      context.handle(
          _wateringIntervalMeta,
          wateringInterval.isAcceptableOrUnknown(
              data['watering_interval']!, _wateringIntervalMeta));
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta));
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plant(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nickname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nickname']),
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path']),
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      wateringProgress: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}watering_progress'])!,
      nextWatering: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next_watering'])!,
      healthStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}health_status'])!,
      wateringInterval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watering_interval'])!,
      dateAdded: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_added'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PlantsTableTable createAlias(String alias) {
    return $PlantsTableTable(attachedDatabase, alias);
  }
}

class Plant extends DataClass implements Insertable<Plant> {
  final String id;
  final String name;
  final String? nickname;
  final String? photoPath;
  final String? species;
  final String? location;
  final String? category;
  final double wateringProgress;
  final String nextWatering;
  final String healthStatus;
  final int wateringInterval;
  final DateTime dateAdded;
  final String? notes;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Plant(
      {required this.id,
      required this.name,
      this.nickname,
      this.photoPath,
      this.species,
      this.location,
      this.category,
      required this.wateringProgress,
      required this.nextWatering,
      required this.healthStatus,
      required this.wateringInterval,
      required this.dateAdded,
      this.notes,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || species != null) {
      map['species'] = Variable<String>(species);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['watering_progress'] = Variable<double>(wateringProgress);
    map['next_watering'] = Variable<String>(nextWatering);
    map['health_status'] = Variable<String>(healthStatus);
    map['watering_interval'] = Variable<int>(wateringInterval);
    map['date_added'] = Variable<DateTime>(dateAdded);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PlantsTableCompanion toCompanion(bool nullToAbsent) {
    return PlantsTableCompanion(
      id: Value(id),
      name: Value(name),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      species: species == null && nullToAbsent
          ? const Value.absent()
          : Value(species),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      wateringProgress: Value(wateringProgress),
      nextWatering: Value(nextWatering),
      healthStatus: Value(healthStatus),
      wateringInterval: Value(wateringInterval),
      dateAdded: Value(dateAdded),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Plant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plant(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      species: serializer.fromJson<String?>(json['species']),
      location: serializer.fromJson<String?>(json['location']),
      category: serializer.fromJson<String?>(json['category']),
      wateringProgress: serializer.fromJson<double>(json['wateringProgress']),
      nextWatering: serializer.fromJson<String>(json['nextWatering']),
      healthStatus: serializer.fromJson<String>(json['healthStatus']),
      wateringInterval: serializer.fromJson<int>(json['wateringInterval']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      notes: serializer.fromJson<String?>(json['notes']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nickname': serializer.toJson<String?>(nickname),
      'photoPath': serializer.toJson<String?>(photoPath),
      'species': serializer.toJson<String?>(species),
      'location': serializer.toJson<String?>(location),
      'category': serializer.toJson<String?>(category),
      'wateringProgress': serializer.toJson<double>(wateringProgress),
      'nextWatering': serializer.toJson<String>(nextWatering),
      'healthStatus': serializer.toJson<String>(healthStatus),
      'wateringInterval': serializer.toJson<int>(wateringInterval),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'notes': serializer.toJson<String?>(notes),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Plant copyWith(
          {String? id,
          String? name,
          Value<String?> nickname = const Value.absent(),
          Value<String?> photoPath = const Value.absent(),
          Value<String?> species = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> category = const Value.absent(),
          double? wateringProgress,
          String? nextWatering,
          String? healthStatus,
          int? wateringInterval,
          DateTime? dateAdded,
          Value<String?> notes = const Value.absent(),
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Plant(
        id: id ?? this.id,
        name: name ?? this.name,
        nickname: nickname.present ? nickname.value : this.nickname,
        photoPath: photoPath.present ? photoPath.value : this.photoPath,
        species: species.present ? species.value : this.species,
        location: location.present ? location.value : this.location,
        category: category.present ? category.value : this.category,
        wateringProgress: wateringProgress ?? this.wateringProgress,
        nextWatering: nextWatering ?? this.nextWatering,
        healthStatus: healthStatus ?? this.healthStatus,
        wateringInterval: wateringInterval ?? this.wateringInterval,
        dateAdded: dateAdded ?? this.dateAdded,
        notes: notes.present ? notes.value : this.notes,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Plant copyWithCompanion(PlantsTableCompanion data) {
    return Plant(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      species: data.species.present ? data.species.value : this.species,
      location: data.location.present ? data.location.value : this.location,
      category: data.category.present ? data.category.value : this.category,
      wateringProgress: data.wateringProgress.present
          ? data.wateringProgress.value
          : this.wateringProgress,
      nextWatering: data.nextWatering.present
          ? data.nextWatering.value
          : this.nextWatering,
      healthStatus: data.healthStatus.present
          ? data.healthStatus.value
          : this.healthStatus,
      wateringInterval: data.wateringInterval.present
          ? data.wateringInterval.value
          : this.wateringInterval,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      notes: data.notes.present ? data.notes.value : this.notes,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plant(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('photoPath: $photoPath, ')
          ..write('species: $species, ')
          ..write('location: $location, ')
          ..write('category: $category, ')
          ..write('wateringProgress: $wateringProgress, ')
          ..write('nextWatering: $nextWatering, ')
          ..write('healthStatus: $healthStatus, ')
          ..write('wateringInterval: $wateringInterval, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('notes: $notes, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      nickname,
      photoPath,
      species,
      location,
      category,
      wateringProgress,
      nextWatering,
      healthStatus,
      wateringInterval,
      dateAdded,
      notes,
      isArchived,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plant &&
          other.id == this.id &&
          other.name == this.name &&
          other.nickname == this.nickname &&
          other.photoPath == this.photoPath &&
          other.species == this.species &&
          other.location == this.location &&
          other.category == this.category &&
          other.wateringProgress == this.wateringProgress &&
          other.nextWatering == this.nextWatering &&
          other.healthStatus == this.healthStatus &&
          other.wateringInterval == this.wateringInterval &&
          other.dateAdded == this.dateAdded &&
          other.notes == this.notes &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PlantsTableCompanion extends UpdateCompanion<Plant> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> nickname;
  final Value<String?> photoPath;
  final Value<String?> species;
  final Value<String?> location;
  final Value<String?> category;
  final Value<double> wateringProgress;
  final Value<String> nextWatering;
  final Value<String> healthStatus;
  final Value<int> wateringInterval;
  final Value<DateTime> dateAdded;
  final Value<String?> notes;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PlantsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickname = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.species = const Value.absent(),
    this.location = const Value.absent(),
    this.category = const Value.absent(),
    this.wateringProgress = const Value.absent(),
    this.nextWatering = const Value.absent(),
    this.healthStatus = const Value.absent(),
    this.wateringInterval = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.notes = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlantsTableCompanion.insert({
    required String id,
    required String name,
    this.nickname = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.species = const Value.absent(),
    this.location = const Value.absent(),
    this.category = const Value.absent(),
    this.wateringProgress = const Value.absent(),
    this.nextWatering = const Value.absent(),
    this.healthStatus = const Value.absent(),
    this.wateringInterval = const Value.absent(),
    required DateTime dateAdded,
    this.notes = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        dateAdded = Value(dateAdded),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Plant> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nickname,
    Expression<String>? photoPath,
    Expression<String>? species,
    Expression<String>? location,
    Expression<String>? category,
    Expression<double>? wateringProgress,
    Expression<String>? nextWatering,
    Expression<String>? healthStatus,
    Expression<int>? wateringInterval,
    Expression<DateTime>? dateAdded,
    Expression<String>? notes,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nickname != null) 'nickname': nickname,
      if (photoPath != null) 'photo_path': photoPath,
      if (species != null) 'species': species,
      if (location != null) 'location': location,
      if (category != null) 'category': category,
      if (wateringProgress != null) 'watering_progress': wateringProgress,
      if (nextWatering != null) 'next_watering': nextWatering,
      if (healthStatus != null) 'health_status': healthStatus,
      if (wateringInterval != null) 'watering_interval': wateringInterval,
      if (dateAdded != null) 'date_added': dateAdded,
      if (notes != null) 'notes': notes,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlantsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? nickname,
      Value<String?>? photoPath,
      Value<String?>? species,
      Value<String?>? location,
      Value<String?>? category,
      Value<double>? wateringProgress,
      Value<String>? nextWatering,
      Value<String>? healthStatus,
      Value<int>? wateringInterval,
      Value<DateTime>? dateAdded,
      Value<String?>? notes,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PlantsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      photoPath: photoPath ?? this.photoPath,
      species: species ?? this.species,
      location: location ?? this.location,
      category: category ?? this.category,
      wateringProgress: wateringProgress ?? this.wateringProgress,
      nextWatering: nextWatering ?? this.nextWatering,
      healthStatus: healthStatus ?? this.healthStatus,
      wateringInterval: wateringInterval ?? this.wateringInterval,
      dateAdded: dateAdded ?? this.dateAdded,
      notes: notes ?? this.notes,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (wateringProgress.present) {
      map['watering_progress'] = Variable<double>(wateringProgress.value);
    }
    if (nextWatering.present) {
      map['next_watering'] = Variable<String>(nextWatering.value);
    }
    if (healthStatus.present) {
      map['health_status'] = Variable<String>(healthStatus.value);
    }
    if (wateringInterval.present) {
      map['watering_interval'] = Variable<int>(wateringInterval.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('photoPath: $photoPath, ')
          ..write('species: $species, ')
          ..write('location: $location, ')
          ..write('category: $category, ')
          ..write('wateringProgress: $wateringProgress, ')
          ..write('nextWatering: $nextWatering, ')
          ..write('healthStatus: $healthStatus, ')
          ..write('wateringInterval: $wateringInterval, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('notes: $notes, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTableTable extends SchedulesTable
    with TableInfo<$SchedulesTableTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _plantIdMeta =
      const VerificationMeta('plantId');
  @override
  late final GeneratedColumn<String> plantId = GeneratedColumn<String>(
      'plant_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES plants_table (id)'));
  static const VerificationMeta _taskTypeMeta =
      const VerificationMeta('taskType');
  @override
  late final GeneratedColumn<String> taskType = GeneratedColumn<String>(
      'task_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastCompletedMeta =
      const VerificationMeta('lastCompleted');
  @override
  late final GeneratedColumn<DateTime> lastCompleted =
      GeneratedColumn<DateTime>('last_completed', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nextDueDateMeta =
      const VerificationMeta('nextDueDate');
  @override
  late final GeneratedColumn<DateTime> nextDueDate = GeneratedColumn<DateTime>(
      'next_due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        plantId,
        taskType,
        frequency,
        lastCompleted,
        nextDueDate,
        isActive,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedules_table';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plant_id')) {
      context.handle(_plantIdMeta,
          plantId.isAcceptableOrUnknown(data['plant_id']!, _plantIdMeta));
    } else if (isInserting) {
      context.missing(_plantIdMeta);
    }
    if (data.containsKey('task_type')) {
      context.handle(_taskTypeMeta,
          taskType.isAcceptableOrUnknown(data['task_type']!, _taskTypeMeta));
    } else if (isInserting) {
      context.missing(_taskTypeMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('last_completed')) {
      context.handle(
          _lastCompletedMeta,
          lastCompleted.isAcceptableOrUnknown(
              data['last_completed']!, _lastCompletedMeta));
    }
    if (data.containsKey('next_due_date')) {
      context.handle(
          _nextDueDateMeta,
          nextDueDate.isAcceptableOrUnknown(
              data['next_due_date']!, _nextDueDateMeta));
    } else if (isInserting) {
      context.missing(_nextDueDateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Schedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      plantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plant_id'])!,
      taskType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_type'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency'])!,
      lastCompleted: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_completed']),
      nextDueDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_due_date'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SchedulesTableTable createAlias(String alias) {
    return $SchedulesTableTable(attachedDatabase, alias);
  }
}

class Schedule extends DataClass implements Insertable<Schedule> {
  final String id;
  final String plantId;
  final String taskType;
  final int frequency;
  final DateTime? lastCompleted;
  final DateTime nextDueDate;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Schedule(
      {required this.id,
      required this.plantId,
      required this.taskType,
      required this.frequency,
      this.lastCompleted,
      required this.nextDueDate,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plant_id'] = Variable<String>(plantId);
    map['task_type'] = Variable<String>(taskType);
    map['frequency'] = Variable<int>(frequency);
    if (!nullToAbsent || lastCompleted != null) {
      map['last_completed'] = Variable<DateTime>(lastCompleted);
    }
    map['next_due_date'] = Variable<DateTime>(nextDueDate);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SchedulesTableCompanion toCompanion(bool nullToAbsent) {
    return SchedulesTableCompanion(
      id: Value(id),
      plantId: Value(plantId),
      taskType: Value(taskType),
      frequency: Value(frequency),
      lastCompleted: lastCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompleted),
      nextDueDate: Value(nextDueDate),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<String>(json['id']),
      plantId: serializer.fromJson<String>(json['plantId']),
      taskType: serializer.fromJson<String>(json['taskType']),
      frequency: serializer.fromJson<int>(json['frequency']),
      lastCompleted: serializer.fromJson<DateTime?>(json['lastCompleted']),
      nextDueDate: serializer.fromJson<DateTime>(json['nextDueDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'plantId': serializer.toJson<String>(plantId),
      'taskType': serializer.toJson<String>(taskType),
      'frequency': serializer.toJson<int>(frequency),
      'lastCompleted': serializer.toJson<DateTime?>(lastCompleted),
      'nextDueDate': serializer.toJson<DateTime>(nextDueDate),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Schedule copyWith(
          {String? id,
          String? plantId,
          String? taskType,
          int? frequency,
          Value<DateTime?> lastCompleted = const Value.absent(),
          DateTime? nextDueDate,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Schedule(
        id: id ?? this.id,
        plantId: plantId ?? this.plantId,
        taskType: taskType ?? this.taskType,
        frequency: frequency ?? this.frequency,
        lastCompleted:
            lastCompleted.present ? lastCompleted.value : this.lastCompleted,
        nextDueDate: nextDueDate ?? this.nextDueDate,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Schedule copyWithCompanion(SchedulesTableCompanion data) {
    return Schedule(
      id: data.id.present ? data.id.value : this.id,
      plantId: data.plantId.present ? data.plantId.value : this.plantId,
      taskType: data.taskType.present ? data.taskType.value : this.taskType,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      lastCompleted: data.lastCompleted.present
          ? data.lastCompleted.value
          : this.lastCompleted,
      nextDueDate:
          data.nextDueDate.present ? data.nextDueDate.value : this.nextDueDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('plantId: $plantId, ')
          ..write('taskType: $taskType, ')
          ..write('frequency: $frequency, ')
          ..write('lastCompleted: $lastCompleted, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, plantId, taskType, frequency,
      lastCompleted, nextDueDate, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.plantId == this.plantId &&
          other.taskType == this.taskType &&
          other.frequency == this.frequency &&
          other.lastCompleted == this.lastCompleted &&
          other.nextDueDate == this.nextDueDate &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SchedulesTableCompanion extends UpdateCompanion<Schedule> {
  final Value<String> id;
  final Value<String> plantId;
  final Value<String> taskType;
  final Value<int> frequency;
  final Value<DateTime?> lastCompleted;
  final Value<DateTime> nextDueDate;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SchedulesTableCompanion({
    this.id = const Value.absent(),
    this.plantId = const Value.absent(),
    this.taskType = const Value.absent(),
    this.frequency = const Value.absent(),
    this.lastCompleted = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SchedulesTableCompanion.insert({
    required String id,
    required String plantId,
    required String taskType,
    required int frequency,
    this.lastCompleted = const Value.absent(),
    required DateTime nextDueDate,
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        plantId = Value(plantId),
        taskType = Value(taskType),
        frequency = Value(frequency),
        nextDueDate = Value(nextDueDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Schedule> custom({
    Expression<String>? id,
    Expression<String>? plantId,
    Expression<String>? taskType,
    Expression<int>? frequency,
    Expression<DateTime>? lastCompleted,
    Expression<DateTime>? nextDueDate,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plantId != null) 'plant_id': plantId,
      if (taskType != null) 'task_type': taskType,
      if (frequency != null) 'frequency': frequency,
      if (lastCompleted != null) 'last_completed': lastCompleted,
      if (nextDueDate != null) 'next_due_date': nextDueDate,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SchedulesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? plantId,
      Value<String>? taskType,
      Value<int>? frequency,
      Value<DateTime?>? lastCompleted,
      Value<DateTime>? nextDueDate,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return SchedulesTableCompanion(
      id: id ?? this.id,
      plantId: plantId ?? this.plantId,
      taskType: taskType ?? this.taskType,
      frequency: frequency ?? this.frequency,
      lastCompleted: lastCompleted ?? this.lastCompleted,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (plantId.present) {
      map['plant_id'] = Variable<String>(plantId.value);
    }
    if (taskType.present) {
      map['task_type'] = Variable<String>(taskType.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (lastCompleted.present) {
      map['last_completed'] = Variable<DateTime>(lastCompleted.value);
    }
    if (nextDueDate.present) {
      map['next_due_date'] = Variable<DateTime>(nextDueDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesTableCompanion(')
          ..write('id: $id, ')
          ..write('plantId: $plantId, ')
          ..write('taskType: $taskType, ')
          ..write('frequency: $frequency, ')
          ..write('lastCompleted: $lastCompleted, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoryTableTable extends HistoryTable
    with TableInfo<$HistoryTableTable, HistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _plantIdMeta =
      const VerificationMeta('plantId');
  @override
  late final GeneratedColumn<String> plantId = GeneratedColumn<String>(
      'plant_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionTypeMeta =
      const VerificationMeta('actionType');
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
      'action_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, plantId, actionType, timestamp, notes, photoPath, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_table';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plant_id')) {
      context.handle(_plantIdMeta,
          plantId.isAcceptableOrUnknown(data['plant_id']!, _plantIdMeta));
    } else if (isInserting) {
      context.missing(_plantIdMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
          _actionTypeMeta,
          actionType.isAcceptableOrUnknown(
              data['action_type']!, _actionTypeMeta));
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      plantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plant_id'])!,
      actionType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_type'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HistoryTableTable createAlias(String alias) {
    return $HistoryTableTable(attachedDatabase, alias);
  }
}

class HistoryEntry extends DataClass implements Insertable<HistoryEntry> {
  final String id;
  final String plantId;
  final String actionType;
  final DateTime timestamp;
  final String? notes;
  final String? photoPath;
  final DateTime createdAt;
  const HistoryEntry(
      {required this.id,
      required this.plantId,
      required this.actionType,
      required this.timestamp,
      this.notes,
      this.photoPath,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plant_id'] = Variable<String>(plantId);
    map['action_type'] = Variable<String>(actionType);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HistoryTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryTableCompanion(
      id: Value(id),
      plantId: Value(plantId),
      actionType: Value(actionType),
      timestamp: Value(timestamp),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      createdAt: Value(createdAt),
    );
  }

  factory HistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryEntry(
      id: serializer.fromJson<String>(json['id']),
      plantId: serializer.fromJson<String>(json['plantId']),
      actionType: serializer.fromJson<String>(json['actionType']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      notes: serializer.fromJson<String?>(json['notes']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'plantId': serializer.toJson<String>(plantId),
      'actionType': serializer.toJson<String>(actionType),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'notes': serializer.toJson<String?>(notes),
      'photoPath': serializer.toJson<String?>(photoPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HistoryEntry copyWith(
          {String? id,
          String? plantId,
          String? actionType,
          DateTime? timestamp,
          Value<String?> notes = const Value.absent(),
          Value<String?> photoPath = const Value.absent(),
          DateTime? createdAt}) =>
      HistoryEntry(
        id: id ?? this.id,
        plantId: plantId ?? this.plantId,
        actionType: actionType ?? this.actionType,
        timestamp: timestamp ?? this.timestamp,
        notes: notes.present ? notes.value : this.notes,
        photoPath: photoPath.present ? photoPath.value : this.photoPath,
        createdAt: createdAt ?? this.createdAt,
      );
  HistoryEntry copyWithCompanion(HistoryTableCompanion data) {
    return HistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      plantId: data.plantId.present ? data.plantId.value : this.plantId,
      actionType:
          data.actionType.present ? data.actionType.value : this.actionType,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      notes: data.notes.present ? data.notes.value : this.notes,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryEntry(')
          ..write('id: $id, ')
          ..write('plantId: $plantId, ')
          ..write('actionType: $actionType, ')
          ..write('timestamp: $timestamp, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, plantId, actionType, timestamp, notes, photoPath, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryEntry &&
          other.id == this.id &&
          other.plantId == this.plantId &&
          other.actionType == this.actionType &&
          other.timestamp == this.timestamp &&
          other.notes == this.notes &&
          other.photoPath == this.photoPath &&
          other.createdAt == this.createdAt);
}

class HistoryTableCompanion extends UpdateCompanion<HistoryEntry> {
  final Value<String> id;
  final Value<String> plantId;
  final Value<String> actionType;
  final Value<DateTime> timestamp;
  final Value<String?> notes;
  final Value<String?> photoPath;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const HistoryTableCompanion({
    this.id = const Value.absent(),
    this.plantId = const Value.absent(),
    this.actionType = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HistoryTableCompanion.insert({
    required String id,
    required String plantId,
    required String actionType,
    required DateTime timestamp,
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        plantId = Value(plantId),
        actionType = Value(actionType),
        timestamp = Value(timestamp),
        createdAt = Value(createdAt);
  static Insertable<HistoryEntry> custom({
    Expression<String>? id,
    Expression<String>? plantId,
    Expression<String>? actionType,
    Expression<DateTime>? timestamp,
    Expression<String>? notes,
    Expression<String>? photoPath,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plantId != null) 'plant_id': plantId,
      if (actionType != null) 'action_type': actionType,
      if (timestamp != null) 'timestamp': timestamp,
      if (notes != null) 'notes': notes,
      if (photoPath != null) 'photo_path': photoPath,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HistoryTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? plantId,
      Value<String>? actionType,
      Value<DateTime>? timestamp,
      Value<String?>? notes,
      Value<String?>? photoPath,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return HistoryTableCompanion(
      id: id ?? this.id,
      plantId: plantId ?? this.plantId,
      actionType: actionType ?? this.actionType,
      timestamp: timestamp ?? this.timestamp,
      notes: notes ?? this.notes,
      photoPath: photoPath ?? this.photoPath,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (plantId.present) {
      map['plant_id'] = Variable<String>(plantId.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('plantId: $plantId, ')
          ..write('actionType: $actionType, ')
          ..write('timestamp: $timestamp, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlantsTableTable plantsTable = $PlantsTableTable(this);
  late final $SchedulesTableTable schedulesTable = $SchedulesTableTable(this);
  late final $HistoryTableTable historyTable = $HistoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [plantsTable, schedulesTable, historyTable];
}

typedef $$PlantsTableTableCreateCompanionBuilder = PlantsTableCompanion
    Function({
  required String id,
  required String name,
  Value<String?> nickname,
  Value<String?> photoPath,
  Value<String?> species,
  Value<String?> location,
  Value<String?> category,
  Value<double> wateringProgress,
  Value<String> nextWatering,
  Value<String> healthStatus,
  Value<int> wateringInterval,
  required DateTime dateAdded,
  Value<String?> notes,
  Value<bool> isArchived,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PlantsTableTableUpdateCompanionBuilder = PlantsTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> nickname,
  Value<String?> photoPath,
  Value<String?> species,
  Value<String?> location,
  Value<String?> category,
  Value<double> wateringProgress,
  Value<String> nextWatering,
  Value<String> healthStatus,
  Value<int> wateringInterval,
  Value<DateTime> dateAdded,
  Value<String?> notes,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$PlantsTableTableReferences
    extends BaseReferences<_$AppDatabase, $PlantsTableTable, Plant> {
  $$PlantsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SchedulesTableTable, List<Schedule>>
      _schedulesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.schedulesTable,
              aliasName: $_aliasNameGenerator(
                  db.plantsTable.id, db.schedulesTable.plantId));

  $$SchedulesTableTableProcessedTableManager get schedulesTableRefs {
    final manager = $$SchedulesTableTableTableManager($_db, $_db.schedulesTable)
        .filter((f) => f.plantId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_schedulesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlantsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PlantsTableTable> {
  $$PlantsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nickname => $composableBuilder(
      column: $table.nickname, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get wateringProgress => $composableBuilder(
      column: $table.wateringProgress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nextWatering => $composableBuilder(
      column: $table.nextWatering, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get healthStatus => $composableBuilder(
      column: $table.healthStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wateringInterval => $composableBuilder(
      column: $table.wateringInterval,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> schedulesTableRefs(
      Expression<bool> Function($$SchedulesTableTableFilterComposer f) f) {
    final $$SchedulesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.schedulesTable,
        getReferencedColumn: (t) => t.plantId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SchedulesTableTableFilterComposer(
              $db: $db,
              $table: $db.schedulesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlantsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PlantsTableTable> {
  $$PlantsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nickname => $composableBuilder(
      column: $table.nickname, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get wateringProgress => $composableBuilder(
      column: $table.wateringProgress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nextWatering => $composableBuilder(
      column: $table.nextWatering,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get healthStatus => $composableBuilder(
      column: $table.healthStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wateringInterval => $composableBuilder(
      column: $table.wateringInterval,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
      column: $table.dateAdded, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PlantsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlantsTableTable> {
  $$PlantsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get wateringProgress => $composableBuilder(
      column: $table.wateringProgress, builder: (column) => column);

  GeneratedColumn<String> get nextWatering => $composableBuilder(
      column: $table.nextWatering, builder: (column) => column);

  GeneratedColumn<String> get healthStatus => $composableBuilder(
      column: $table.healthStatus, builder: (column) => column);

  GeneratedColumn<int> get wateringInterval => $composableBuilder(
      column: $table.wateringInterval, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> schedulesTableRefs<T extends Object>(
      Expression<T> Function($$SchedulesTableTableAnnotationComposer a) f) {
    final $$SchedulesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.schedulesTable,
        getReferencedColumn: (t) => t.plantId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SchedulesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.schedulesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlantsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlantsTableTable,
    Plant,
    $$PlantsTableTableFilterComposer,
    $$PlantsTableTableOrderingComposer,
    $$PlantsTableTableAnnotationComposer,
    $$PlantsTableTableCreateCompanionBuilder,
    $$PlantsTableTableUpdateCompanionBuilder,
    (Plant, $$PlantsTableTableReferences),
    Plant,
    PrefetchHooks Function({bool schedulesTableRefs})> {
  $$PlantsTableTableTableManager(_$AppDatabase db, $PlantsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlantsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlantsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlantsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> nickname = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<String?> species = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<double> wateringProgress = const Value.absent(),
            Value<String> nextWatering = const Value.absent(),
            Value<String> healthStatus = const Value.absent(),
            Value<int> wateringInterval = const Value.absent(),
            Value<DateTime> dateAdded = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlantsTableCompanion(
            id: id,
            name: name,
            nickname: nickname,
            photoPath: photoPath,
            species: species,
            location: location,
            category: category,
            wateringProgress: wateringProgress,
            nextWatering: nextWatering,
            healthStatus: healthStatus,
            wateringInterval: wateringInterval,
            dateAdded: dateAdded,
            notes: notes,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> nickname = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<String?> species = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<double> wateringProgress = const Value.absent(),
            Value<String> nextWatering = const Value.absent(),
            Value<String> healthStatus = const Value.absent(),
            Value<int> wateringInterval = const Value.absent(),
            required DateTime dateAdded,
            Value<String?> notes = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PlantsTableCompanion.insert(
            id: id,
            name: name,
            nickname: nickname,
            photoPath: photoPath,
            species: species,
            location: location,
            category: category,
            wateringProgress: wateringProgress,
            nextWatering: nextWatering,
            healthStatus: healthStatus,
            wateringInterval: wateringInterval,
            dateAdded: dateAdded,
            notes: notes,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlantsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({schedulesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (schedulesTableRefs) db.schedulesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (schedulesTableRefs)
                    await $_getPrefetchedData<Plant, $PlantsTableTable,
                            Schedule>(
                        currentTable: table,
                        referencedTable: $$PlantsTableTableReferences
                            ._schedulesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantsTableTableReferences(db, table, p0)
                                .schedulesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.plantId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlantsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlantsTableTable,
    Plant,
    $$PlantsTableTableFilterComposer,
    $$PlantsTableTableOrderingComposer,
    $$PlantsTableTableAnnotationComposer,
    $$PlantsTableTableCreateCompanionBuilder,
    $$PlantsTableTableUpdateCompanionBuilder,
    (Plant, $$PlantsTableTableReferences),
    Plant,
    PrefetchHooks Function({bool schedulesTableRefs})>;
typedef $$SchedulesTableTableCreateCompanionBuilder = SchedulesTableCompanion
    Function({
  required String id,
  required String plantId,
  required String taskType,
  required int frequency,
  Value<DateTime?> lastCompleted,
  required DateTime nextDueDate,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$SchedulesTableTableUpdateCompanionBuilder = SchedulesTableCompanion
    Function({
  Value<String> id,
  Value<String> plantId,
  Value<String> taskType,
  Value<int> frequency,
  Value<DateTime?> lastCompleted,
  Value<DateTime> nextDueDate,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$SchedulesTableTableReferences
    extends BaseReferences<_$AppDatabase, $SchedulesTableTable, Schedule> {
  $$SchedulesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlantsTableTable _plantIdTable(_$AppDatabase db) =>
      db.plantsTable.createAlias(
          $_aliasNameGenerator(db.schedulesTable.plantId, db.plantsTable.id));

  $$PlantsTableTableProcessedTableManager get plantId {
    final $_column = $_itemColumn<String>('plant_id')!;

    final manager = $$PlantsTableTableTableManager($_db, $_db.plantsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_plantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SchedulesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SchedulesTableTable> {
  $$SchedulesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskType => $composableBuilder(
      column: $table.taskType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastCompleted => $composableBuilder(
      column: $table.lastCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$PlantsTableTableFilterComposer get plantId {
    final $$PlantsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantId,
        referencedTable: $db.plantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantsTableTableFilterComposer(
              $db: $db,
              $table: $db.plantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SchedulesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SchedulesTableTable> {
  $$SchedulesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskType => $composableBuilder(
      column: $table.taskType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastCompleted => $composableBuilder(
      column: $table.lastCompleted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$PlantsTableTableOrderingComposer get plantId {
    final $$PlantsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantId,
        referencedTable: $db.plantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantsTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SchedulesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchedulesTableTable> {
  $$SchedulesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get taskType =>
      $composableBuilder(column: $table.taskType, builder: (column) => column);

  GeneratedColumn<int> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<DateTime> get lastCompleted => $composableBuilder(
      column: $table.lastCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get nextDueDate => $composableBuilder(
      column: $table.nextDueDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PlantsTableTableAnnotationComposer get plantId {
    final $$PlantsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantId,
        referencedTable: $db.plantsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SchedulesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SchedulesTableTable,
    Schedule,
    $$SchedulesTableTableFilterComposer,
    $$SchedulesTableTableOrderingComposer,
    $$SchedulesTableTableAnnotationComposer,
    $$SchedulesTableTableCreateCompanionBuilder,
    $$SchedulesTableTableUpdateCompanionBuilder,
    (Schedule, $$SchedulesTableTableReferences),
    Schedule,
    PrefetchHooks Function({bool plantId})> {
  $$SchedulesTableTableTableManager(
      _$AppDatabase db, $SchedulesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchedulesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchedulesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchedulesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> plantId = const Value.absent(),
            Value<String> taskType = const Value.absent(),
            Value<int> frequency = const Value.absent(),
            Value<DateTime?> lastCompleted = const Value.absent(),
            Value<DateTime> nextDueDate = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SchedulesTableCompanion(
            id: id,
            plantId: plantId,
            taskType: taskType,
            frequency: frequency,
            lastCompleted: lastCompleted,
            nextDueDate: nextDueDate,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String plantId,
            required String taskType,
            required int frequency,
            Value<DateTime?> lastCompleted = const Value.absent(),
            required DateTime nextDueDate,
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SchedulesTableCompanion.insert(
            id: id,
            plantId: plantId,
            taskType: taskType,
            frequency: frequency,
            lastCompleted: lastCompleted,
            nextDueDate: nextDueDate,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SchedulesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({plantId = false}) {
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
                      dynamic>>(state) {
                if (plantId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.plantId,
                    referencedTable:
                        $$SchedulesTableTableReferences._plantIdTable(db),
                    referencedColumn:
                        $$SchedulesTableTableReferences._plantIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SchedulesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SchedulesTableTable,
    Schedule,
    $$SchedulesTableTableFilterComposer,
    $$SchedulesTableTableOrderingComposer,
    $$SchedulesTableTableAnnotationComposer,
    $$SchedulesTableTableCreateCompanionBuilder,
    $$SchedulesTableTableUpdateCompanionBuilder,
    (Schedule, $$SchedulesTableTableReferences),
    Schedule,
    PrefetchHooks Function({bool plantId})>;
typedef $$HistoryTableTableCreateCompanionBuilder = HistoryTableCompanion
    Function({
  required String id,
  required String plantId,
  required String actionType,
  required DateTime timestamp,
  Value<String?> notes,
  Value<String?> photoPath,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$HistoryTableTableUpdateCompanionBuilder = HistoryTableCompanion
    Function({
  Value<String> id,
  Value<String> plantId,
  Value<String> actionType,
  Value<DateTime> timestamp,
  Value<String?> notes,
  Value<String?> photoPath,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$HistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get plantId => $composableBuilder(
      column: $table.plantId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$HistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get plantId => $composableBuilder(
      column: $table.plantId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$HistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get plantId =>
      $composableBuilder(column: $table.plantId, builder: (column) => column);

  GeneratedColumn<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HistoryTableTable,
    HistoryEntry,
    $$HistoryTableTableFilterComposer,
    $$HistoryTableTableOrderingComposer,
    $$HistoryTableTableAnnotationComposer,
    $$HistoryTableTableCreateCompanionBuilder,
    $$HistoryTableTableUpdateCompanionBuilder,
    (
      HistoryEntry,
      BaseReferences<_$AppDatabase, $HistoryTableTable, HistoryEntry>
    ),
    HistoryEntry,
    PrefetchHooks Function()> {
  $$HistoryTableTableTableManager(_$AppDatabase db, $HistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> plantId = const Value.absent(),
            Value<String> actionType = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HistoryTableCompanion(
            id: id,
            plantId: plantId,
            actionType: actionType,
            timestamp: timestamp,
            notes: notes,
            photoPath: photoPath,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String plantId,
            required String actionType,
            required DateTime timestamp,
            Value<String?> notes = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              HistoryTableCompanion.insert(
            id: id,
            plantId: plantId,
            actionType: actionType,
            timestamp: timestamp,
            notes: notes,
            photoPath: photoPath,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HistoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HistoryTableTable,
    HistoryEntry,
    $$HistoryTableTableFilterComposer,
    $$HistoryTableTableOrderingComposer,
    $$HistoryTableTableAnnotationComposer,
    $$HistoryTableTableCreateCompanionBuilder,
    $$HistoryTableTableUpdateCompanionBuilder,
    (
      HistoryEntry,
      BaseReferences<_$AppDatabase, $HistoryTableTable, HistoryEntry>
    ),
    HistoryEntry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlantsTableTableTableManager get plantsTable =>
      $$PlantsTableTableTableManager(_db, _db.plantsTable);
  $$SchedulesTableTableTableManager get schedulesTable =>
      $$SchedulesTableTableTableManager(_db, _db.schedulesTable);
  $$HistoryTableTableTableManager get historyTable =>
      $$HistoryTableTableTableManager(_db, _db.historyTable);
}
