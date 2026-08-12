// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _serialNumberMeta = const VerificationMeta(
    'serialNumber',
  );
  @override
  late final GeneratedColumn<String> serialNumber = GeneratedColumn<String>(
    'serial_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hospitalNumberMeta = const VerificationMeta(
    'hospitalNumber',
  );
  @override
  late final GeneratedColumn<String> hospitalNumber = GeneratedColumn<String>(
    'hospital_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parityMeta = const VerificationMeta('parity');
  @override
  late final GeneratedColumn<String> parity = GeneratedColumn<String>(
    'parity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _menstrualStatusMeta = const VerificationMeta(
    'menstrualStatus',
  );
  @override
  late final GeneratedColumn<String> menstrualStatus = GeneratedColumn<String>(
    'menstrual_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageAtMenarcheMeta = const VerificationMeta(
    'ageAtMenarche',
  );
  @override
  late final GeneratedColumn<int> ageAtMenarche = GeneratedColumn<int>(
    'age_at_menarche',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageAtMenopauseMeta = const VerificationMeta(
    'ageAtMenopause',
  );
  @override
  late final GeneratedColumn<int> ageAtMenopause = GeneratedColumn<int>(
    'age_at_menopause',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _presentingComplaintsMeta =
      const VerificationMeta('presentingComplaints');
  @override
  late final GeneratedColumn<String> presentingComplaints =
      GeneratedColumn<String>(
        'presenting_complaints',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _complaintsDetailsMeta = const VerificationMeta(
    'complaintsDetails',
  );
  @override
  late final GeneratedColumn<String> complaintsDetails =
      GeneratedColumn<String>(
        'complaints_details',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _medicalHistoryMeta = const VerificationMeta(
    'medicalHistory',
  );
  @override
  late final GeneratedColumn<String> medicalHistory = GeneratedColumn<String>(
    'medical_history',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicalHistoryOthersMeta =
      const VerificationMeta('medicalHistoryOthers');
  @override
  late final GeneratedColumn<String> medicalHistoryOthers =
      GeneratedColumn<String>(
        'medical_history_others',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _surgicalHistoryMeta = const VerificationMeta(
    'surgicalHistory',
  );
  @override
  late final GeneratedColumn<String> surgicalHistory = GeneratedColumn<String>(
    'surgical_history',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surgicalHistoryOthersMeta =
      const VerificationMeta('surgicalHistoryOthers');
  @override
  late final GeneratedColumn<String> surgicalHistoryOthers =
      GeneratedColumn<String>(
        'surgical_history_others',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _familyHistoryMeta = const VerificationMeta(
    'familyHistory',
  );
  @override
  late final GeneratedColumn<String> familyHistory = GeneratedColumn<String>(
    'family_history',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _familyHistoryOthersMeta =
      const VerificationMeta('familyHistoryOthers');
  @override
  late final GeneratedColumn<String> familyHistoryOthers =
      GeneratedColumn<String>(
        'family_history_others',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
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
  List<GeneratedColumn> get $columns => [
    id,
    serialNumber,
    hospitalNumber,
    unit,
    name,
    age,
    parity,
    address,
    phone,
    menstrualStatus,
    ageAtMenarche,
    ageAtMenopause,
    presentingComplaints,
    complaintsDetails,
    medicalHistory,
    medicalHistoryOthers,
    surgicalHistory,
    surgicalHistoryOthers,
    familyHistory,
    familyHistoryOthers,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Patient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(
        _serialNumberMeta,
        serialNumber.isAcceptableOrUnknown(
          data['serial_number']!,
          _serialNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serialNumberMeta);
    }
    if (data.containsKey('hospital_number')) {
      context.handle(
        _hospitalNumberMeta,
        hospitalNumber.isAcceptableOrUnknown(
          data['hospital_number']!,
          _hospitalNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hospitalNumberMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('parity')) {
      context.handle(
        _parityMeta,
        parity.isAcceptableOrUnknown(data['parity']!, _parityMeta),
      );
    } else if (isInserting) {
      context.missing(_parityMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('menstrual_status')) {
      context.handle(
        _menstrualStatusMeta,
        menstrualStatus.isAcceptableOrUnknown(
          data['menstrual_status']!,
          _menstrualStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_menstrualStatusMeta);
    }
    if (data.containsKey('age_at_menarche')) {
      context.handle(
        _ageAtMenarcheMeta,
        ageAtMenarche.isAcceptableOrUnknown(
          data['age_at_menarche']!,
          _ageAtMenarcheMeta,
        ),
      );
    }
    if (data.containsKey('age_at_menopause')) {
      context.handle(
        _ageAtMenopauseMeta,
        ageAtMenopause.isAcceptableOrUnknown(
          data['age_at_menopause']!,
          _ageAtMenopauseMeta,
        ),
      );
    }
    if (data.containsKey('presenting_complaints')) {
      context.handle(
        _presentingComplaintsMeta,
        presentingComplaints.isAcceptableOrUnknown(
          data['presenting_complaints']!,
          _presentingComplaintsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_presentingComplaintsMeta);
    }
    if (data.containsKey('complaints_details')) {
      context.handle(
        _complaintsDetailsMeta,
        complaintsDetails.isAcceptableOrUnknown(
          data['complaints_details']!,
          _complaintsDetailsMeta,
        ),
      );
    }
    if (data.containsKey('medical_history')) {
      context.handle(
        _medicalHistoryMeta,
        medicalHistory.isAcceptableOrUnknown(
          data['medical_history']!,
          _medicalHistoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicalHistoryMeta);
    }
    if (data.containsKey('medical_history_others')) {
      context.handle(
        _medicalHistoryOthersMeta,
        medicalHistoryOthers.isAcceptableOrUnknown(
          data['medical_history_others']!,
          _medicalHistoryOthersMeta,
        ),
      );
    }
    if (data.containsKey('surgical_history')) {
      context.handle(
        _surgicalHistoryMeta,
        surgicalHistory.isAcceptableOrUnknown(
          data['surgical_history']!,
          _surgicalHistoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surgicalHistoryMeta);
    }
    if (data.containsKey('surgical_history_others')) {
      context.handle(
        _surgicalHistoryOthersMeta,
        surgicalHistoryOthers.isAcceptableOrUnknown(
          data['surgical_history_others']!,
          _surgicalHistoryOthersMeta,
        ),
      );
    }
    if (data.containsKey('family_history')) {
      context.handle(
        _familyHistoryMeta,
        familyHistory.isAcceptableOrUnknown(
          data['family_history']!,
          _familyHistoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_familyHistoryMeta);
    }
    if (data.containsKey('family_history_others')) {
      context.handle(
        _familyHistoryOthersMeta,
        familyHistoryOthers.isAcceptableOrUnknown(
          data['family_history_others']!,
          _familyHistoryOthersMeta,
        ),
      );
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
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      serialNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial_number'],
      )!,
      hospitalNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hospital_number'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      parity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parity'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      menstrualStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}menstrual_status'],
      )!,
      ageAtMenarche: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_at_menarche'],
      ),
      ageAtMenopause: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_at_menopause'],
      ),
      presentingComplaints: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}presenting_complaints'],
      )!,
      complaintsDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}complaints_details'],
      ),
      medicalHistory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medical_history'],
      )!,
      medicalHistoryOthers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medical_history_others'],
      ),
      surgicalHistory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surgical_history'],
      )!,
      surgicalHistoryOthers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surgical_history_others'],
      ),
      familyHistory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}family_history'],
      )!,
      familyHistoryOthers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}family_history_others'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final int id;
  final String serialNumber;
  final String hospitalNumber;
  final String unit;
  final String name;
  final int age;
  final String parity;
  final String? address;
  final String? phone;
  final String menstrualStatus;
  final int? ageAtMenarche;
  final int? ageAtMenopause;
  final String presentingComplaints;
  final String? complaintsDetails;
  final String medicalHistory;
  final String? medicalHistoryOthers;
  final String surgicalHistory;
  final String? surgicalHistoryOthers;
  final String familyHistory;
  final String? familyHistoryOthers;
  final DateTime createdAt;
  const Patient({
    required this.id,
    required this.serialNumber,
    required this.hospitalNumber,
    required this.unit,
    required this.name,
    required this.age,
    required this.parity,
    this.address,
    this.phone,
    required this.menstrualStatus,
    this.ageAtMenarche,
    this.ageAtMenopause,
    required this.presentingComplaints,
    this.complaintsDetails,
    required this.medicalHistory,
    this.medicalHistoryOthers,
    required this.surgicalHistory,
    this.surgicalHistoryOthers,
    required this.familyHistory,
    this.familyHistoryOthers,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['serial_number'] = Variable<String>(serialNumber);
    map['hospital_number'] = Variable<String>(hospitalNumber);
    map['unit'] = Variable<String>(unit);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['parity'] = Variable<String>(parity);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['menstrual_status'] = Variable<String>(menstrualStatus);
    if (!nullToAbsent || ageAtMenarche != null) {
      map['age_at_menarche'] = Variable<int>(ageAtMenarche);
    }
    if (!nullToAbsent || ageAtMenopause != null) {
      map['age_at_menopause'] = Variable<int>(ageAtMenopause);
    }
    map['presenting_complaints'] = Variable<String>(presentingComplaints);
    if (!nullToAbsent || complaintsDetails != null) {
      map['complaints_details'] = Variable<String>(complaintsDetails);
    }
    map['medical_history'] = Variable<String>(medicalHistory);
    if (!nullToAbsent || medicalHistoryOthers != null) {
      map['medical_history_others'] = Variable<String>(medicalHistoryOthers);
    }
    map['surgical_history'] = Variable<String>(surgicalHistory);
    if (!nullToAbsent || surgicalHistoryOthers != null) {
      map['surgical_history_others'] = Variable<String>(surgicalHistoryOthers);
    }
    map['family_history'] = Variable<String>(familyHistory);
    if (!nullToAbsent || familyHistoryOthers != null) {
      map['family_history_others'] = Variable<String>(familyHistoryOthers);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      serialNumber: Value(serialNumber),
      hospitalNumber: Value(hospitalNumber),
      unit: Value(unit),
      name: Value(name),
      age: Value(age),
      parity: Value(parity),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      menstrualStatus: Value(menstrualStatus),
      ageAtMenarche: ageAtMenarche == null && nullToAbsent
          ? const Value.absent()
          : Value(ageAtMenarche),
      ageAtMenopause: ageAtMenopause == null && nullToAbsent
          ? const Value.absent()
          : Value(ageAtMenopause),
      presentingComplaints: Value(presentingComplaints),
      complaintsDetails: complaintsDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(complaintsDetails),
      medicalHistory: Value(medicalHistory),
      medicalHistoryOthers: medicalHistoryOthers == null && nullToAbsent
          ? const Value.absent()
          : Value(medicalHistoryOthers),
      surgicalHistory: Value(surgicalHistory),
      surgicalHistoryOthers: surgicalHistoryOthers == null && nullToAbsent
          ? const Value.absent()
          : Value(surgicalHistoryOthers),
      familyHistory: Value(familyHistory),
      familyHistoryOthers: familyHistoryOthers == null && nullToAbsent
          ? const Value.absent()
          : Value(familyHistoryOthers),
      createdAt: Value(createdAt),
    );
  }

  factory Patient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<int>(json['id']),
      serialNumber: serializer.fromJson<String>(json['serialNumber']),
      hospitalNumber: serializer.fromJson<String>(json['hospitalNumber']),
      unit: serializer.fromJson<String>(json['unit']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      parity: serializer.fromJson<String>(json['parity']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      menstrualStatus: serializer.fromJson<String>(json['menstrualStatus']),
      ageAtMenarche: serializer.fromJson<int?>(json['ageAtMenarche']),
      ageAtMenopause: serializer.fromJson<int?>(json['ageAtMenopause']),
      presentingComplaints: serializer.fromJson<String>(
        json['presentingComplaints'],
      ),
      complaintsDetails: serializer.fromJson<String?>(
        json['complaintsDetails'],
      ),
      medicalHistory: serializer.fromJson<String>(json['medicalHistory']),
      medicalHistoryOthers: serializer.fromJson<String?>(
        json['medicalHistoryOthers'],
      ),
      surgicalHistory: serializer.fromJson<String>(json['surgicalHistory']),
      surgicalHistoryOthers: serializer.fromJson<String?>(
        json['surgicalHistoryOthers'],
      ),
      familyHistory: serializer.fromJson<String>(json['familyHistory']),
      familyHistoryOthers: serializer.fromJson<String?>(
        json['familyHistoryOthers'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serialNumber': serializer.toJson<String>(serialNumber),
      'hospitalNumber': serializer.toJson<String>(hospitalNumber),
      'unit': serializer.toJson<String>(unit),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'parity': serializer.toJson<String>(parity),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'menstrualStatus': serializer.toJson<String>(menstrualStatus),
      'ageAtMenarche': serializer.toJson<int?>(ageAtMenarche),
      'ageAtMenopause': serializer.toJson<int?>(ageAtMenopause),
      'presentingComplaints': serializer.toJson<String>(presentingComplaints),
      'complaintsDetails': serializer.toJson<String?>(complaintsDetails),
      'medicalHistory': serializer.toJson<String>(medicalHistory),
      'medicalHistoryOthers': serializer.toJson<String?>(medicalHistoryOthers),
      'surgicalHistory': serializer.toJson<String>(surgicalHistory),
      'surgicalHistoryOthers': serializer.toJson<String?>(
        surgicalHistoryOthers,
      ),
      'familyHistory': serializer.toJson<String>(familyHistory),
      'familyHistoryOthers': serializer.toJson<String?>(familyHistoryOthers),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Patient copyWith({
    int? id,
    String? serialNumber,
    String? hospitalNumber,
    String? unit,
    String? name,
    int? age,
    String? parity,
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    String? menstrualStatus,
    Value<int?> ageAtMenarche = const Value.absent(),
    Value<int?> ageAtMenopause = const Value.absent(),
    String? presentingComplaints,
    Value<String?> complaintsDetails = const Value.absent(),
    String? medicalHistory,
    Value<String?> medicalHistoryOthers = const Value.absent(),
    String? surgicalHistory,
    Value<String?> surgicalHistoryOthers = const Value.absent(),
    String? familyHistory,
    Value<String?> familyHistoryOthers = const Value.absent(),
    DateTime? createdAt,
  }) => Patient(
    id: id ?? this.id,
    serialNumber: serialNumber ?? this.serialNumber,
    hospitalNumber: hospitalNumber ?? this.hospitalNumber,
    unit: unit ?? this.unit,
    name: name ?? this.name,
    age: age ?? this.age,
    parity: parity ?? this.parity,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
    menstrualStatus: menstrualStatus ?? this.menstrualStatus,
    ageAtMenarche: ageAtMenarche.present
        ? ageAtMenarche.value
        : this.ageAtMenarche,
    ageAtMenopause: ageAtMenopause.present
        ? ageAtMenopause.value
        : this.ageAtMenopause,
    presentingComplaints: presentingComplaints ?? this.presentingComplaints,
    complaintsDetails: complaintsDetails.present
        ? complaintsDetails.value
        : this.complaintsDetails,
    medicalHistory: medicalHistory ?? this.medicalHistory,
    medicalHistoryOthers: medicalHistoryOthers.present
        ? medicalHistoryOthers.value
        : this.medicalHistoryOthers,
    surgicalHistory: surgicalHistory ?? this.surgicalHistory,
    surgicalHistoryOthers: surgicalHistoryOthers.present
        ? surgicalHistoryOthers.value
        : this.surgicalHistoryOthers,
    familyHistory: familyHistory ?? this.familyHistory,
    familyHistoryOthers: familyHistoryOthers.present
        ? familyHistoryOthers.value
        : this.familyHistoryOthers,
    createdAt: createdAt ?? this.createdAt,
  );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      serialNumber: data.serialNumber.present
          ? data.serialNumber.value
          : this.serialNumber,
      hospitalNumber: data.hospitalNumber.present
          ? data.hospitalNumber.value
          : this.hospitalNumber,
      unit: data.unit.present ? data.unit.value : this.unit,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      parity: data.parity.present ? data.parity.value : this.parity,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      menstrualStatus: data.menstrualStatus.present
          ? data.menstrualStatus.value
          : this.menstrualStatus,
      ageAtMenarche: data.ageAtMenarche.present
          ? data.ageAtMenarche.value
          : this.ageAtMenarche,
      ageAtMenopause: data.ageAtMenopause.present
          ? data.ageAtMenopause.value
          : this.ageAtMenopause,
      presentingComplaints: data.presentingComplaints.present
          ? data.presentingComplaints.value
          : this.presentingComplaints,
      complaintsDetails: data.complaintsDetails.present
          ? data.complaintsDetails.value
          : this.complaintsDetails,
      medicalHistory: data.medicalHistory.present
          ? data.medicalHistory.value
          : this.medicalHistory,
      medicalHistoryOthers: data.medicalHistoryOthers.present
          ? data.medicalHistoryOthers.value
          : this.medicalHistoryOthers,
      surgicalHistory: data.surgicalHistory.present
          ? data.surgicalHistory.value
          : this.surgicalHistory,
      surgicalHistoryOthers: data.surgicalHistoryOthers.present
          ? data.surgicalHistoryOthers.value
          : this.surgicalHistoryOthers,
      familyHistory: data.familyHistory.present
          ? data.familyHistory.value
          : this.familyHistory,
      familyHistoryOthers: data.familyHistoryOthers.present
          ? data.familyHistoryOthers.value
          : this.familyHistoryOthers,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('hospitalNumber: $hospitalNumber, ')
          ..write('unit: $unit, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('parity: $parity, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('menstrualStatus: $menstrualStatus, ')
          ..write('ageAtMenarche: $ageAtMenarche, ')
          ..write('ageAtMenopause: $ageAtMenopause, ')
          ..write('presentingComplaints: $presentingComplaints, ')
          ..write('complaintsDetails: $complaintsDetails, ')
          ..write('medicalHistory: $medicalHistory, ')
          ..write('medicalHistoryOthers: $medicalHistoryOthers, ')
          ..write('surgicalHistory: $surgicalHistory, ')
          ..write('surgicalHistoryOthers: $surgicalHistoryOthers, ')
          ..write('familyHistory: $familyHistory, ')
          ..write('familyHistoryOthers: $familyHistoryOthers, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    serialNumber,
    hospitalNumber,
    unit,
    name,
    age,
    parity,
    address,
    phone,
    menstrualStatus,
    ageAtMenarche,
    ageAtMenopause,
    presentingComplaints,
    complaintsDetails,
    medicalHistory,
    medicalHistoryOthers,
    surgicalHistory,
    surgicalHistoryOthers,
    familyHistory,
    familyHistoryOthers,
    createdAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.serialNumber == this.serialNumber &&
          other.hospitalNumber == this.hospitalNumber &&
          other.unit == this.unit &&
          other.name == this.name &&
          other.age == this.age &&
          other.parity == this.parity &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.menstrualStatus == this.menstrualStatus &&
          other.ageAtMenarche == this.ageAtMenarche &&
          other.ageAtMenopause == this.ageAtMenopause &&
          other.presentingComplaints == this.presentingComplaints &&
          other.complaintsDetails == this.complaintsDetails &&
          other.medicalHistory == this.medicalHistory &&
          other.medicalHistoryOthers == this.medicalHistoryOthers &&
          other.surgicalHistory == this.surgicalHistory &&
          other.surgicalHistoryOthers == this.surgicalHistoryOthers &&
          other.familyHistory == this.familyHistory &&
          other.familyHistoryOthers == this.familyHistoryOthers &&
          other.createdAt == this.createdAt);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<int> id;
  final Value<String> serialNumber;
  final Value<String> hospitalNumber;
  final Value<String> unit;
  final Value<String> name;
  final Value<int> age;
  final Value<String> parity;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String> menstrualStatus;
  final Value<int?> ageAtMenarche;
  final Value<int?> ageAtMenopause;
  final Value<String> presentingComplaints;
  final Value<String?> complaintsDetails;
  final Value<String> medicalHistory;
  final Value<String?> medicalHistoryOthers;
  final Value<String> surgicalHistory;
  final Value<String?> surgicalHistoryOthers;
  final Value<String> familyHistory;
  final Value<String?> familyHistoryOthers;
  final Value<DateTime> createdAt;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.hospitalNumber = const Value.absent(),
    this.unit = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.parity = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.menstrualStatus = const Value.absent(),
    this.ageAtMenarche = const Value.absent(),
    this.ageAtMenopause = const Value.absent(),
    this.presentingComplaints = const Value.absent(),
    this.complaintsDetails = const Value.absent(),
    this.medicalHistory = const Value.absent(),
    this.medicalHistoryOthers = const Value.absent(),
    this.surgicalHistory = const Value.absent(),
    this.surgicalHistoryOthers = const Value.absent(),
    this.familyHistory = const Value.absent(),
    this.familyHistoryOthers = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.id = const Value.absent(),
    required String serialNumber,
    required String hospitalNumber,
    required String unit,
    required String name,
    required int age,
    required String parity,
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    required String menstrualStatus,
    this.ageAtMenarche = const Value.absent(),
    this.ageAtMenopause = const Value.absent(),
    required String presentingComplaints,
    this.complaintsDetails = const Value.absent(),
    required String medicalHistory,
    this.medicalHistoryOthers = const Value.absent(),
    required String surgicalHistory,
    this.surgicalHistoryOthers = const Value.absent(),
    required String familyHistory,
    this.familyHistoryOthers = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : serialNumber = Value(serialNumber),
       hospitalNumber = Value(hospitalNumber),
       unit = Value(unit),
       name = Value(name),
       age = Value(age),
       parity = Value(parity),
       menstrualStatus = Value(menstrualStatus),
       presentingComplaints = Value(presentingComplaints),
       medicalHistory = Value(medicalHistory),
       surgicalHistory = Value(surgicalHistory),
       familyHistory = Value(familyHistory);
  static Insertable<Patient> custom({
    Expression<int>? id,
    Expression<String>? serialNumber,
    Expression<String>? hospitalNumber,
    Expression<String>? unit,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? parity,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? menstrualStatus,
    Expression<int>? ageAtMenarche,
    Expression<int>? ageAtMenopause,
    Expression<String>? presentingComplaints,
    Expression<String>? complaintsDetails,
    Expression<String>? medicalHistory,
    Expression<String>? medicalHistoryOthers,
    Expression<String>? surgicalHistory,
    Expression<String>? surgicalHistoryOthers,
    Expression<String>? familyHistory,
    Expression<String>? familyHistoryOthers,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (hospitalNumber != null) 'hospital_number': hospitalNumber,
      if (unit != null) 'unit': unit,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (parity != null) 'parity': parity,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (menstrualStatus != null) 'menstrual_status': menstrualStatus,
      if (ageAtMenarche != null) 'age_at_menarche': ageAtMenarche,
      if (ageAtMenopause != null) 'age_at_menopause': ageAtMenopause,
      if (presentingComplaints != null)
        'presenting_complaints': presentingComplaints,
      if (complaintsDetails != null) 'complaints_details': complaintsDetails,
      if (medicalHistory != null) 'medical_history': medicalHistory,
      if (medicalHistoryOthers != null)
        'medical_history_others': medicalHistoryOthers,
      if (surgicalHistory != null) 'surgical_history': surgicalHistory,
      if (surgicalHistoryOthers != null)
        'surgical_history_others': surgicalHistoryOthers,
      if (familyHistory != null) 'family_history': familyHistory,
      if (familyHistoryOthers != null)
        'family_history_others': familyHistoryOthers,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PatientsCompanion copyWith({
    Value<int>? id,
    Value<String>? serialNumber,
    Value<String>? hospitalNumber,
    Value<String>? unit,
    Value<String>? name,
    Value<int>? age,
    Value<String>? parity,
    Value<String?>? address,
    Value<String?>? phone,
    Value<String>? menstrualStatus,
    Value<int?>? ageAtMenarche,
    Value<int?>? ageAtMenopause,
    Value<String>? presentingComplaints,
    Value<String?>? complaintsDetails,
    Value<String>? medicalHistory,
    Value<String?>? medicalHistoryOthers,
    Value<String>? surgicalHistory,
    Value<String?>? surgicalHistoryOthers,
    Value<String>? familyHistory,
    Value<String?>? familyHistoryOthers,
    Value<DateTime>? createdAt,
  }) {
    return PatientsCompanion(
      id: id ?? this.id,
      serialNumber: serialNumber ?? this.serialNumber,
      hospitalNumber: hospitalNumber ?? this.hospitalNumber,
      unit: unit ?? this.unit,
      name: name ?? this.name,
      age: age ?? this.age,
      parity: parity ?? this.parity,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      menstrualStatus: menstrualStatus ?? this.menstrualStatus,
      ageAtMenarche: ageAtMenarche ?? this.ageAtMenarche,
      ageAtMenopause: ageAtMenopause ?? this.ageAtMenopause,
      presentingComplaints: presentingComplaints ?? this.presentingComplaints,
      complaintsDetails: complaintsDetails ?? this.complaintsDetails,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      medicalHistoryOthers: medicalHistoryOthers ?? this.medicalHistoryOthers,
      surgicalHistory: surgicalHistory ?? this.surgicalHistory,
      surgicalHistoryOthers:
          surgicalHistoryOthers ?? this.surgicalHistoryOthers,
      familyHistory: familyHistory ?? this.familyHistory,
      familyHistoryOthers: familyHistoryOthers ?? this.familyHistoryOthers,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (hospitalNumber.present) {
      map['hospital_number'] = Variable<String>(hospitalNumber.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (parity.present) {
      map['parity'] = Variable<String>(parity.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (menstrualStatus.present) {
      map['menstrual_status'] = Variable<String>(menstrualStatus.value);
    }
    if (ageAtMenarche.present) {
      map['age_at_menarche'] = Variable<int>(ageAtMenarche.value);
    }
    if (ageAtMenopause.present) {
      map['age_at_menopause'] = Variable<int>(ageAtMenopause.value);
    }
    if (presentingComplaints.present) {
      map['presenting_complaints'] = Variable<String>(
        presentingComplaints.value,
      );
    }
    if (complaintsDetails.present) {
      map['complaints_details'] = Variable<String>(complaintsDetails.value);
    }
    if (medicalHistory.present) {
      map['medical_history'] = Variable<String>(medicalHistory.value);
    }
    if (medicalHistoryOthers.present) {
      map['medical_history_others'] = Variable<String>(
        medicalHistoryOthers.value,
      );
    }
    if (surgicalHistory.present) {
      map['surgical_history'] = Variable<String>(surgicalHistory.value);
    }
    if (surgicalHistoryOthers.present) {
      map['surgical_history_others'] = Variable<String>(
        surgicalHistoryOthers.value,
      );
    }
    if (familyHistory.present) {
      map['family_history'] = Variable<String>(familyHistory.value);
    }
    if (familyHistoryOthers.present) {
      map['family_history_others'] = Variable<String>(
        familyHistoryOthers.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('hospitalNumber: $hospitalNumber, ')
          ..write('unit: $unit, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('parity: $parity, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('menstrualStatus: $menstrualStatus, ')
          ..write('ageAtMenarche: $ageAtMenarche, ')
          ..write('ageAtMenopause: $ageAtMenopause, ')
          ..write('presentingComplaints: $presentingComplaints, ')
          ..write('complaintsDetails: $complaintsDetails, ')
          ..write('medicalHistory: $medicalHistory, ')
          ..write('medicalHistoryOthers: $medicalHistoryOthers, ')
          ..write('surgicalHistory: $surgicalHistory, ')
          ..write('surgicalHistoryOthers: $surgicalHistoryOthers, ')
          ..write('familyHistory: $familyHistory, ')
          ..write('familyHistoryOthers: $familyHistoryOthers, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PreChemoAssessmentsTable extends PreChemoAssessments
    with TableInfo<$PreChemoAssessmentsTable, PreChemoAssessment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreChemoAssessmentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patients (id)',
    ),
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bmiMeta = const VerificationMeta('bmi');
  @override
  late final GeneratedColumn<double> bmi = GeneratedColumn<double>(
    'bmi',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pallorMeta = const VerificationMeta('pallor');
  @override
  late final GeneratedColumn<String> pallor = GeneratedColumn<String>(
    'pallor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _icterusMeta = const VerificationMeta(
    'icterus',
  );
  @override
  late final GeneratedColumn<String> icterus = GeneratedColumn<String>(
    'icterus',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lymphadenopathyMeta = const VerificationMeta(
    'lymphadenopathy',
  );
  @override
  late final GeneratedColumn<String> lymphadenopathy = GeneratedColumn<String>(
    'lymphadenopathy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _abdominalExamMeta = const VerificationMeta(
    'abdominalExam',
  );
  @override
  late final GeneratedColumn<String> abdominalExam = GeneratedColumn<String>(
    'abdominal_exam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pelvicExamMeta = const VerificationMeta(
    'pelvicExam',
  );
  @override
  late final GeneratedColumn<String> pelvicExam = GeneratedColumn<String>(
    'pelvic_exam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _perRectalExamMeta = const VerificationMeta(
    'perRectalExam',
  );
  @override
  late final GeneratedColumn<String> perRectalExam = GeneratedColumn<String>(
    'per_rectal_exam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _otherExamMeta = const VerificationMeta(
    'otherExam',
  );
  @override
  late final GeneratedColumn<String> otherExam = GeneratedColumn<String>(
    'other_exam',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hemoglobinMeta = const VerificationMeta(
    'hemoglobin',
  );
  @override
  late final GeneratedColumn<double> hemoglobin = GeneratedColumn<double>(
    'hemoglobin',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _plateletCountMeta = const VerificationMeta(
    'plateletCount',
  );
  @override
  late final GeneratedColumn<double> plateletCount = GeneratedColumn<double>(
    'platelet_count',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _plrMeta = const VerificationMeta('plr');
  @override
  late final GeneratedColumn<double> plr = GeneratedColumn<double>(
    'plr',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albuminMeta = const VerificationMeta(
    'albumin',
  );
  @override
  late final GeneratedColumn<double> albumin = GeneratedColumn<double>(
    'albumin',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neutrophilMeta = const VerificationMeta(
    'neutrophil',
  );
  @override
  late final GeneratedColumn<double> neutrophil = GeneratedColumn<double>(
    'neutrophil',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lymphocyteMeta = const VerificationMeta(
    'lymphocyte',
  );
  @override
  late final GeneratedColumn<double> lymphocyte = GeneratedColumn<double>(
    'lymphocyte',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nlrMeta = const VerificationMeta('nlr');
  @override
  late final GeneratedColumn<double> nlr = GeneratedColumn<double>(
    'nlr',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _siiMeta = const VerificationMeta('sii');
  @override
  late final GeneratedColumn<double> sii = GeneratedColumn<double>(
    'sii',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    height,
    weight,
    bmi,
    pallor,
    icterus,
    lymphadenopathy,
    abdominalExam,
    pelvicExam,
    perRectalExam,
    otherExam,
    hemoglobin,
    plateletCount,
    plr,
    albumin,
    neutrophil,
    lymphocyte,
    nlr,
    sii,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pre_chemo_assessments';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreChemoAssessment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('bmi')) {
      context.handle(
        _bmiMeta,
        bmi.isAcceptableOrUnknown(data['bmi']!, _bmiMeta),
      );
    }
    if (data.containsKey('pallor')) {
      context.handle(
        _pallorMeta,
        pallor.isAcceptableOrUnknown(data['pallor']!, _pallorMeta),
      );
    }
    if (data.containsKey('icterus')) {
      context.handle(
        _icterusMeta,
        icterus.isAcceptableOrUnknown(data['icterus']!, _icterusMeta),
      );
    }
    if (data.containsKey('lymphadenopathy')) {
      context.handle(
        _lymphadenopathyMeta,
        lymphadenopathy.isAcceptableOrUnknown(
          data['lymphadenopathy']!,
          _lymphadenopathyMeta,
        ),
      );
    }
    if (data.containsKey('abdominal_exam')) {
      context.handle(
        _abdominalExamMeta,
        abdominalExam.isAcceptableOrUnknown(
          data['abdominal_exam']!,
          _abdominalExamMeta,
        ),
      );
    }
    if (data.containsKey('pelvic_exam')) {
      context.handle(
        _pelvicExamMeta,
        pelvicExam.isAcceptableOrUnknown(data['pelvic_exam']!, _pelvicExamMeta),
      );
    }
    if (data.containsKey('per_rectal_exam')) {
      context.handle(
        _perRectalExamMeta,
        perRectalExam.isAcceptableOrUnknown(
          data['per_rectal_exam']!,
          _perRectalExamMeta,
        ),
      );
    }
    if (data.containsKey('other_exam')) {
      context.handle(
        _otherExamMeta,
        otherExam.isAcceptableOrUnknown(data['other_exam']!, _otherExamMeta),
      );
    }
    if (data.containsKey('hemoglobin')) {
      context.handle(
        _hemoglobinMeta,
        hemoglobin.isAcceptableOrUnknown(data['hemoglobin']!, _hemoglobinMeta),
      );
    }
    if (data.containsKey('platelet_count')) {
      context.handle(
        _plateletCountMeta,
        plateletCount.isAcceptableOrUnknown(
          data['platelet_count']!,
          _plateletCountMeta,
        ),
      );
    }
    if (data.containsKey('plr')) {
      context.handle(
        _plrMeta,
        plr.isAcceptableOrUnknown(data['plr']!, _plrMeta),
      );
    }
    if (data.containsKey('albumin')) {
      context.handle(
        _albuminMeta,
        albumin.isAcceptableOrUnknown(data['albumin']!, _albuminMeta),
      );
    }
    if (data.containsKey('neutrophil')) {
      context.handle(
        _neutrophilMeta,
        neutrophil.isAcceptableOrUnknown(data['neutrophil']!, _neutrophilMeta),
      );
    }
    if (data.containsKey('lymphocyte')) {
      context.handle(
        _lymphocyteMeta,
        lymphocyte.isAcceptableOrUnknown(data['lymphocyte']!, _lymphocyteMeta),
      );
    }
    if (data.containsKey('nlr')) {
      context.handle(
        _nlrMeta,
        nlr.isAcceptableOrUnknown(data['nlr']!, _nlrMeta),
      );
    }
    if (data.containsKey('sii')) {
      context.handle(
        _siiMeta,
        sii.isAcceptableOrUnknown(data['sii']!, _siiMeta),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PreChemoAssessment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreChemoAssessment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      bmi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bmi'],
      ),
      pallor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pallor'],
      ),
      icterus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icterus'],
      ),
      lymphadenopathy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lymphadenopathy'],
      ),
      abdominalExam: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abdominal_exam'],
      ),
      pelvicExam: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pelvic_exam'],
      ),
      perRectalExam: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}per_rectal_exam'],
      ),
      otherExam: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}other_exam'],
      ),
      hemoglobin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hemoglobin'],
      ),
      plateletCount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}platelet_count'],
      ),
      plr: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}plr'],
      ),
      albumin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}albumin'],
      ),
      neutrophil: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}neutrophil'],
      ),
      lymphocyte: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lymphocyte'],
      ),
      nlr: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nlr'],
      ),
      sii: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sii'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $PreChemoAssessmentsTable createAlias(String alias) {
    return $PreChemoAssessmentsTable(attachedDatabase, alias);
  }
}

class PreChemoAssessment extends DataClass
    implements Insertable<PreChemoAssessment> {
  final int id;
  final int patientId;
  final double? height;
  final double? weight;
  final double? bmi;
  final String? pallor;
  final String? icterus;
  final String? lymphadenopathy;
  final String? abdominalExam;
  final String? pelvicExam;
  final String? perRectalExam;
  final String? otherExam;
  final double? hemoglobin;
  final double? plateletCount;
  final double? plr;
  final double? albumin;
  final double? neutrophil;
  final double? lymphocyte;
  final double? nlr;
  final double? sii;
  final DateTime recordedAt;
  const PreChemoAssessment({
    required this.id,
    required this.patientId,
    this.height,
    this.weight,
    this.bmi,
    this.pallor,
    this.icterus,
    this.lymphadenopathy,
    this.abdominalExam,
    this.pelvicExam,
    this.perRectalExam,
    this.otherExam,
    this.hemoglobin,
    this.plateletCount,
    this.plr,
    this.albumin,
    this.neutrophil,
    this.lymphocyte,
    this.nlr,
    this.sii,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || bmi != null) {
      map['bmi'] = Variable<double>(bmi);
    }
    if (!nullToAbsent || pallor != null) {
      map['pallor'] = Variable<String>(pallor);
    }
    if (!nullToAbsent || icterus != null) {
      map['icterus'] = Variable<String>(icterus);
    }
    if (!nullToAbsent || lymphadenopathy != null) {
      map['lymphadenopathy'] = Variable<String>(lymphadenopathy);
    }
    if (!nullToAbsent || abdominalExam != null) {
      map['abdominal_exam'] = Variable<String>(abdominalExam);
    }
    if (!nullToAbsent || pelvicExam != null) {
      map['pelvic_exam'] = Variable<String>(pelvicExam);
    }
    if (!nullToAbsent || perRectalExam != null) {
      map['per_rectal_exam'] = Variable<String>(perRectalExam);
    }
    if (!nullToAbsent || otherExam != null) {
      map['other_exam'] = Variable<String>(otherExam);
    }
    if (!nullToAbsent || hemoglobin != null) {
      map['hemoglobin'] = Variable<double>(hemoglobin);
    }
    if (!nullToAbsent || plateletCount != null) {
      map['platelet_count'] = Variable<double>(plateletCount);
    }
    if (!nullToAbsent || plr != null) {
      map['plr'] = Variable<double>(plr);
    }
    if (!nullToAbsent || albumin != null) {
      map['albumin'] = Variable<double>(albumin);
    }
    if (!nullToAbsent || neutrophil != null) {
      map['neutrophil'] = Variable<double>(neutrophil);
    }
    if (!nullToAbsent || lymphocyte != null) {
      map['lymphocyte'] = Variable<double>(lymphocyte);
    }
    if (!nullToAbsent || nlr != null) {
      map['nlr'] = Variable<double>(nlr);
    }
    if (!nullToAbsent || sii != null) {
      map['sii'] = Variable<double>(sii);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  PreChemoAssessmentsCompanion toCompanion(bool nullToAbsent) {
    return PreChemoAssessmentsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      bmi: bmi == null && nullToAbsent ? const Value.absent() : Value(bmi),
      pallor: pallor == null && nullToAbsent
          ? const Value.absent()
          : Value(pallor),
      icterus: icterus == null && nullToAbsent
          ? const Value.absent()
          : Value(icterus),
      lymphadenopathy: lymphadenopathy == null && nullToAbsent
          ? const Value.absent()
          : Value(lymphadenopathy),
      abdominalExam: abdominalExam == null && nullToAbsent
          ? const Value.absent()
          : Value(abdominalExam),
      pelvicExam: pelvicExam == null && nullToAbsent
          ? const Value.absent()
          : Value(pelvicExam),
      perRectalExam: perRectalExam == null && nullToAbsent
          ? const Value.absent()
          : Value(perRectalExam),
      otherExam: otherExam == null && nullToAbsent
          ? const Value.absent()
          : Value(otherExam),
      hemoglobin: hemoglobin == null && nullToAbsent
          ? const Value.absent()
          : Value(hemoglobin),
      plateletCount: plateletCount == null && nullToAbsent
          ? const Value.absent()
          : Value(plateletCount),
      plr: plr == null && nullToAbsent ? const Value.absent() : Value(plr),
      albumin: albumin == null && nullToAbsent
          ? const Value.absent()
          : Value(albumin),
      neutrophil: neutrophil == null && nullToAbsent
          ? const Value.absent()
          : Value(neutrophil),
      lymphocyte: lymphocyte == null && nullToAbsent
          ? const Value.absent()
          : Value(lymphocyte),
      nlr: nlr == null && nullToAbsent ? const Value.absent() : Value(nlr),
      sii: sii == null && nullToAbsent ? const Value.absent() : Value(sii),
      recordedAt: Value(recordedAt),
    );
  }

  factory PreChemoAssessment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreChemoAssessment(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      height: serializer.fromJson<double?>(json['height']),
      weight: serializer.fromJson<double?>(json['weight']),
      bmi: serializer.fromJson<double?>(json['bmi']),
      pallor: serializer.fromJson<String?>(json['pallor']),
      icterus: serializer.fromJson<String?>(json['icterus']),
      lymphadenopathy: serializer.fromJson<String?>(json['lymphadenopathy']),
      abdominalExam: serializer.fromJson<String?>(json['abdominalExam']),
      pelvicExam: serializer.fromJson<String?>(json['pelvicExam']),
      perRectalExam: serializer.fromJson<String?>(json['perRectalExam']),
      otherExam: serializer.fromJson<String?>(json['otherExam']),
      hemoglobin: serializer.fromJson<double?>(json['hemoglobin']),
      plateletCount: serializer.fromJson<double?>(json['plateletCount']),
      plr: serializer.fromJson<double?>(json['plr']),
      albumin: serializer.fromJson<double?>(json['albumin']),
      neutrophil: serializer.fromJson<double?>(json['neutrophil']),
      lymphocyte: serializer.fromJson<double?>(json['lymphocyte']),
      nlr: serializer.fromJson<double?>(json['nlr']),
      sii: serializer.fromJson<double?>(json['sii']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'height': serializer.toJson<double?>(height),
      'weight': serializer.toJson<double?>(weight),
      'bmi': serializer.toJson<double?>(bmi),
      'pallor': serializer.toJson<String?>(pallor),
      'icterus': serializer.toJson<String?>(icterus),
      'lymphadenopathy': serializer.toJson<String?>(lymphadenopathy),
      'abdominalExam': serializer.toJson<String?>(abdominalExam),
      'pelvicExam': serializer.toJson<String?>(pelvicExam),
      'perRectalExam': serializer.toJson<String?>(perRectalExam),
      'otherExam': serializer.toJson<String?>(otherExam),
      'hemoglobin': serializer.toJson<double?>(hemoglobin),
      'plateletCount': serializer.toJson<double?>(plateletCount),
      'plr': serializer.toJson<double?>(plr),
      'albumin': serializer.toJson<double?>(albumin),
      'neutrophil': serializer.toJson<double?>(neutrophil),
      'lymphocyte': serializer.toJson<double?>(lymphocyte),
      'nlr': serializer.toJson<double?>(nlr),
      'sii': serializer.toJson<double?>(sii),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  PreChemoAssessment copyWith({
    int? id,
    int? patientId,
    Value<double?> height = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<double?> bmi = const Value.absent(),
    Value<String?> pallor = const Value.absent(),
    Value<String?> icterus = const Value.absent(),
    Value<String?> lymphadenopathy = const Value.absent(),
    Value<String?> abdominalExam = const Value.absent(),
    Value<String?> pelvicExam = const Value.absent(),
    Value<String?> perRectalExam = const Value.absent(),
    Value<String?> otherExam = const Value.absent(),
    Value<double?> hemoglobin = const Value.absent(),
    Value<double?> plateletCount = const Value.absent(),
    Value<double?> plr = const Value.absent(),
    Value<double?> albumin = const Value.absent(),
    Value<double?> neutrophil = const Value.absent(),
    Value<double?> lymphocyte = const Value.absent(),
    Value<double?> nlr = const Value.absent(),
    Value<double?> sii = const Value.absent(),
    DateTime? recordedAt,
  }) => PreChemoAssessment(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    height: height.present ? height.value : this.height,
    weight: weight.present ? weight.value : this.weight,
    bmi: bmi.present ? bmi.value : this.bmi,
    pallor: pallor.present ? pallor.value : this.pallor,
    icterus: icterus.present ? icterus.value : this.icterus,
    lymphadenopathy: lymphadenopathy.present
        ? lymphadenopathy.value
        : this.lymphadenopathy,
    abdominalExam: abdominalExam.present
        ? abdominalExam.value
        : this.abdominalExam,
    pelvicExam: pelvicExam.present ? pelvicExam.value : this.pelvicExam,
    perRectalExam: perRectalExam.present
        ? perRectalExam.value
        : this.perRectalExam,
    otherExam: otherExam.present ? otherExam.value : this.otherExam,
    hemoglobin: hemoglobin.present ? hemoglobin.value : this.hemoglobin,
    plateletCount: plateletCount.present
        ? plateletCount.value
        : this.plateletCount,
    plr: plr.present ? plr.value : this.plr,
    albumin: albumin.present ? albumin.value : this.albumin,
    neutrophil: neutrophil.present ? neutrophil.value : this.neutrophil,
    lymphocyte: lymphocyte.present ? lymphocyte.value : this.lymphocyte,
    nlr: nlr.present ? nlr.value : this.nlr,
    sii: sii.present ? sii.value : this.sii,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  PreChemoAssessment copyWithCompanion(PreChemoAssessmentsCompanion data) {
    return PreChemoAssessment(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      bmi: data.bmi.present ? data.bmi.value : this.bmi,
      pallor: data.pallor.present ? data.pallor.value : this.pallor,
      icterus: data.icterus.present ? data.icterus.value : this.icterus,
      lymphadenopathy: data.lymphadenopathy.present
          ? data.lymphadenopathy.value
          : this.lymphadenopathy,
      abdominalExam: data.abdominalExam.present
          ? data.abdominalExam.value
          : this.abdominalExam,
      pelvicExam: data.pelvicExam.present
          ? data.pelvicExam.value
          : this.pelvicExam,
      perRectalExam: data.perRectalExam.present
          ? data.perRectalExam.value
          : this.perRectalExam,
      otherExam: data.otherExam.present ? data.otherExam.value : this.otherExam,
      hemoglobin: data.hemoglobin.present
          ? data.hemoglobin.value
          : this.hemoglobin,
      plateletCount: data.plateletCount.present
          ? data.plateletCount.value
          : this.plateletCount,
      plr: data.plr.present ? data.plr.value : this.plr,
      albumin: data.albumin.present ? data.albumin.value : this.albumin,
      neutrophil: data.neutrophil.present
          ? data.neutrophil.value
          : this.neutrophil,
      lymphocyte: data.lymphocyte.present
          ? data.lymphocyte.value
          : this.lymphocyte,
      nlr: data.nlr.present ? data.nlr.value : this.nlr,
      sii: data.sii.present ? data.sii.value : this.sii,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreChemoAssessment(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('bmi: $bmi, ')
          ..write('pallor: $pallor, ')
          ..write('icterus: $icterus, ')
          ..write('lymphadenopathy: $lymphadenopathy, ')
          ..write('abdominalExam: $abdominalExam, ')
          ..write('pelvicExam: $pelvicExam, ')
          ..write('perRectalExam: $perRectalExam, ')
          ..write('otherExam: $otherExam, ')
          ..write('hemoglobin: $hemoglobin, ')
          ..write('plateletCount: $plateletCount, ')
          ..write('plr: $plr, ')
          ..write('albumin: $albumin, ')
          ..write('neutrophil: $neutrophil, ')
          ..write('lymphocyte: $lymphocyte, ')
          ..write('nlr: $nlr, ')
          ..write('sii: $sii, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    patientId,
    height,
    weight,
    bmi,
    pallor,
    icterus,
    lymphadenopathy,
    abdominalExam,
    pelvicExam,
    perRectalExam,
    otherExam,
    hemoglobin,
    plateletCount,
    plr,
    albumin,
    neutrophil,
    lymphocyte,
    nlr,
    sii,
    recordedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreChemoAssessment &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.bmi == this.bmi &&
          other.pallor == this.pallor &&
          other.icterus == this.icterus &&
          other.lymphadenopathy == this.lymphadenopathy &&
          other.abdominalExam == this.abdominalExam &&
          other.pelvicExam == this.pelvicExam &&
          other.perRectalExam == this.perRectalExam &&
          other.otherExam == this.otherExam &&
          other.hemoglobin == this.hemoglobin &&
          other.plateletCount == this.plateletCount &&
          other.plr == this.plr &&
          other.albumin == this.albumin &&
          other.neutrophil == this.neutrophil &&
          other.lymphocyte == this.lymphocyte &&
          other.nlr == this.nlr &&
          other.sii == this.sii &&
          other.recordedAt == this.recordedAt);
}

class PreChemoAssessmentsCompanion extends UpdateCompanion<PreChemoAssessment> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<double?> height;
  final Value<double?> weight;
  final Value<double?> bmi;
  final Value<String?> pallor;
  final Value<String?> icterus;
  final Value<String?> lymphadenopathy;
  final Value<String?> abdominalExam;
  final Value<String?> pelvicExam;
  final Value<String?> perRectalExam;
  final Value<String?> otherExam;
  final Value<double?> hemoglobin;
  final Value<double?> plateletCount;
  final Value<double?> plr;
  final Value<double?> albumin;
  final Value<double?> neutrophil;
  final Value<double?> lymphocyte;
  final Value<double?> nlr;
  final Value<double?> sii;
  final Value<DateTime> recordedAt;
  const PreChemoAssessmentsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.bmi = const Value.absent(),
    this.pallor = const Value.absent(),
    this.icterus = const Value.absent(),
    this.lymphadenopathy = const Value.absent(),
    this.abdominalExam = const Value.absent(),
    this.pelvicExam = const Value.absent(),
    this.perRectalExam = const Value.absent(),
    this.otherExam = const Value.absent(),
    this.hemoglobin = const Value.absent(),
    this.plateletCount = const Value.absent(),
    this.plr = const Value.absent(),
    this.albumin = const Value.absent(),
    this.neutrophil = const Value.absent(),
    this.lymphocyte = const Value.absent(),
    this.nlr = const Value.absent(),
    this.sii = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  PreChemoAssessmentsCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.bmi = const Value.absent(),
    this.pallor = const Value.absent(),
    this.icterus = const Value.absent(),
    this.lymphadenopathy = const Value.absent(),
    this.abdominalExam = const Value.absent(),
    this.pelvicExam = const Value.absent(),
    this.perRectalExam = const Value.absent(),
    this.otherExam = const Value.absent(),
    this.hemoglobin = const Value.absent(),
    this.plateletCount = const Value.absent(),
    this.plr = const Value.absent(),
    this.albumin = const Value.absent(),
    this.neutrophil = const Value.absent(),
    this.lymphocyte = const Value.absent(),
    this.nlr = const Value.absent(),
    this.sii = const Value.absent(),
    this.recordedAt = const Value.absent(),
  }) : patientId = Value(patientId);
  static Insertable<PreChemoAssessment> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<double>? bmi,
    Expression<String>? pallor,
    Expression<String>? icterus,
    Expression<String>? lymphadenopathy,
    Expression<String>? abdominalExam,
    Expression<String>? pelvicExam,
    Expression<String>? perRectalExam,
    Expression<String>? otherExam,
    Expression<double>? hemoglobin,
    Expression<double>? plateletCount,
    Expression<double>? plr,
    Expression<double>? albumin,
    Expression<double>? neutrophil,
    Expression<double>? lymphocyte,
    Expression<double>? nlr,
    Expression<double>? sii,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (bmi != null) 'bmi': bmi,
      if (pallor != null) 'pallor': pallor,
      if (icterus != null) 'icterus': icterus,
      if (lymphadenopathy != null) 'lymphadenopathy': lymphadenopathy,
      if (abdominalExam != null) 'abdominal_exam': abdominalExam,
      if (pelvicExam != null) 'pelvic_exam': pelvicExam,
      if (perRectalExam != null) 'per_rectal_exam': perRectalExam,
      if (otherExam != null) 'other_exam': otherExam,
      if (hemoglobin != null) 'hemoglobin': hemoglobin,
      if (plateletCount != null) 'platelet_count': plateletCount,
      if (plr != null) 'plr': plr,
      if (albumin != null) 'albumin': albumin,
      if (neutrophil != null) 'neutrophil': neutrophil,
      if (lymphocyte != null) 'lymphocyte': lymphocyte,
      if (nlr != null) 'nlr': nlr,
      if (sii != null) 'sii': sii,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  PreChemoAssessmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? patientId,
    Value<double?>? height,
    Value<double?>? weight,
    Value<double?>? bmi,
    Value<String?>? pallor,
    Value<String?>? icterus,
    Value<String?>? lymphadenopathy,
    Value<String?>? abdominalExam,
    Value<String?>? pelvicExam,
    Value<String?>? perRectalExam,
    Value<String?>? otherExam,
    Value<double?>? hemoglobin,
    Value<double?>? plateletCount,
    Value<double?>? plr,
    Value<double?>? albumin,
    Value<double?>? neutrophil,
    Value<double?>? lymphocyte,
    Value<double?>? nlr,
    Value<double?>? sii,
    Value<DateTime>? recordedAt,
  }) {
    return PreChemoAssessmentsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bmi: bmi ?? this.bmi,
      pallor: pallor ?? this.pallor,
      icterus: icterus ?? this.icterus,
      lymphadenopathy: lymphadenopathy ?? this.lymphadenopathy,
      abdominalExam: abdominalExam ?? this.abdominalExam,
      pelvicExam: pelvicExam ?? this.pelvicExam,
      perRectalExam: perRectalExam ?? this.perRectalExam,
      otherExam: otherExam ?? this.otherExam,
      hemoglobin: hemoglobin ?? this.hemoglobin,
      plateletCount: plateletCount ?? this.plateletCount,
      plr: plr ?? this.plr,
      albumin: albumin ?? this.albumin,
      neutrophil: neutrophil ?? this.neutrophil,
      lymphocyte: lymphocyte ?? this.lymphocyte,
      nlr: nlr ?? this.nlr,
      sii: sii ?? this.sii,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (bmi.present) {
      map['bmi'] = Variable<double>(bmi.value);
    }
    if (pallor.present) {
      map['pallor'] = Variable<String>(pallor.value);
    }
    if (icterus.present) {
      map['icterus'] = Variable<String>(icterus.value);
    }
    if (lymphadenopathy.present) {
      map['lymphadenopathy'] = Variable<String>(lymphadenopathy.value);
    }
    if (abdominalExam.present) {
      map['abdominal_exam'] = Variable<String>(abdominalExam.value);
    }
    if (pelvicExam.present) {
      map['pelvic_exam'] = Variable<String>(pelvicExam.value);
    }
    if (perRectalExam.present) {
      map['per_rectal_exam'] = Variable<String>(perRectalExam.value);
    }
    if (otherExam.present) {
      map['other_exam'] = Variable<String>(otherExam.value);
    }
    if (hemoglobin.present) {
      map['hemoglobin'] = Variable<double>(hemoglobin.value);
    }
    if (plateletCount.present) {
      map['platelet_count'] = Variable<double>(plateletCount.value);
    }
    if (plr.present) {
      map['plr'] = Variable<double>(plr.value);
    }
    if (albumin.present) {
      map['albumin'] = Variable<double>(albumin.value);
    }
    if (neutrophil.present) {
      map['neutrophil'] = Variable<double>(neutrophil.value);
    }
    if (lymphocyte.present) {
      map['lymphocyte'] = Variable<double>(lymphocyte.value);
    }
    if (nlr.present) {
      map['nlr'] = Variable<double>(nlr.value);
    }
    if (sii.present) {
      map['sii'] = Variable<double>(sii.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreChemoAssessmentsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('bmi: $bmi, ')
          ..write('pallor: $pallor, ')
          ..write('icterus: $icterus, ')
          ..write('lymphadenopathy: $lymphadenopathy, ')
          ..write('abdominalExam: $abdominalExam, ')
          ..write('pelvicExam: $pelvicExam, ')
          ..write('perRectalExam: $perRectalExam, ')
          ..write('otherExam: $otherExam, ')
          ..write('hemoglobin: $hemoglobin, ')
          ..write('plateletCount: $plateletCount, ')
          ..write('plr: $plr, ')
          ..write('albumin: $albumin, ')
          ..write('neutrophil: $neutrophil, ')
          ..write('lymphocyte: $lymphocyte, ')
          ..write('nlr: $nlr, ')
          ..write('sii: $sii, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

class $PostChemoAssessmentsTable extends PostChemoAssessments
    with TableInfo<$PostChemoAssessmentsTable, PostChemoAssessment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostChemoAssessmentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patients (id)',
    ),
  );
  static const VerificationMeta _nactCyclesMeta = const VerificationMeta(
    'nactCycles',
  );
  @override
  late final GeneratedColumn<int> nactCycles = GeneratedColumn<int>(
    'nact_cycles',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nactDatesMeta = const VerificationMeta(
    'nactDates',
  );
  @override
  late final GeneratedColumn<String> nactDates = GeneratedColumn<String>(
    'nact_dates',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nactNatureMeta = const VerificationMeta(
    'nactNature',
  );
  @override
  late final GeneratedColumn<String> nactNature = GeneratedColumn<String>(
    'nact_nature',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _secondLineMeta = const VerificationMeta(
    'secondLine',
  );
  @override
  late final GeneratedColumn<String> secondLine = GeneratedColumn<String>(
    'second_line',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fnacAsciticMeta = const VerificationMeta(
    'fnacAscitic',
  );
  @override
  late final GeneratedColumn<String> fnacAscitic = GeneratedColumn<String>(
    'fnac_ascitic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _complicationsMeta = const VerificationMeta(
    'complications',
  );
  @override
  late final GeneratedColumn<String> complications = GeneratedColumn<String>(
    'complications',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _needGcsfMeta = const VerificationMeta(
    'needGcsf',
  );
  @override
  late final GeneratedColumn<bool> needGcsf = GeneratedColumn<bool>(
    'need_gcsf',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("need_gcsf" IN (0, 1))',
    ),
  );
  static const VerificationMeta _needBloodTransfusionMeta =
      const VerificationMeta('needBloodTransfusion');
  @override
  late final GeneratedColumn<bool> needBloodTransfusion = GeneratedColumn<bool>(
    'need_blood_transfusion',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("need_blood_transfusion" IN (0, 1))',
    ),
  );
  static const VerificationMeta _hemoglobinMeta = const VerificationMeta(
    'hemoglobin',
  );
  @override
  late final GeneratedColumn<double> hemoglobin = GeneratedColumn<double>(
    'hemoglobin',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _plateletCountMeta = const VerificationMeta(
    'plateletCount',
  );
  @override
  late final GeneratedColumn<double> plateletCount = GeneratedColumn<double>(
    'platelet_count',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _plrMeta = const VerificationMeta('plr');
  @override
  late final GeneratedColumn<double> plr = GeneratedColumn<double>(
    'plr',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albuminMeta = const VerificationMeta(
    'albumin',
  );
  @override
  late final GeneratedColumn<double> albumin = GeneratedColumn<double>(
    'albumin',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neutrophilMeta = const VerificationMeta(
    'neutrophil',
  );
  @override
  late final GeneratedColumn<double> neutrophil = GeneratedColumn<double>(
    'neutrophil',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lymphocyteMeta = const VerificationMeta(
    'lymphocyte',
  );
  @override
  late final GeneratedColumn<double> lymphocyte = GeneratedColumn<double>(
    'lymphocyte',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nlrMeta = const VerificationMeta('nlr');
  @override
  late final GeneratedColumn<double> nlr = GeneratedColumn<double>(
    'nlr',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _siiMeta = const VerificationMeta('sii');
  @override
  late final GeneratedColumn<double> sii = GeneratedColumn<double>(
    'sii',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ca125Reading1Meta = const VerificationMeta(
    'ca125Reading1',
  );
  @override
  late final GeneratedColumn<double> ca125Reading1 = GeneratedColumn<double>(
    'ca125_reading1',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ca125Reading2Meta = const VerificationMeta(
    'ca125Reading2',
  );
  @override
  late final GeneratedColumn<double> ca125Reading2 = GeneratedColumn<double>(
    'ca125_reading2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ca125Reading3Meta = const VerificationMeta(
    'ca125Reading3',
  );
  @override
  late final GeneratedColumn<double> ca125Reading3 = GeneratedColumn<double>(
    'ca125_reading3',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    nactCycles,
    nactDates,
    nactNature,
    secondLine,
    fnacAscitic,
    complications,
    needGcsf,
    needBloodTransfusion,
    hemoglobin,
    plateletCount,
    plr,
    albumin,
    neutrophil,
    lymphocyte,
    nlr,
    sii,
    ca125Reading1,
    ca125Reading2,
    ca125Reading3,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'post_chemo_assessments';
  @override
  VerificationContext validateIntegrity(
    Insertable<PostChemoAssessment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('nact_cycles')) {
      context.handle(
        _nactCyclesMeta,
        nactCycles.isAcceptableOrUnknown(data['nact_cycles']!, _nactCyclesMeta),
      );
    }
    if (data.containsKey('nact_dates')) {
      context.handle(
        _nactDatesMeta,
        nactDates.isAcceptableOrUnknown(data['nact_dates']!, _nactDatesMeta),
      );
    }
    if (data.containsKey('nact_nature')) {
      context.handle(
        _nactNatureMeta,
        nactNature.isAcceptableOrUnknown(data['nact_nature']!, _nactNatureMeta),
      );
    }
    if (data.containsKey('second_line')) {
      context.handle(
        _secondLineMeta,
        secondLine.isAcceptableOrUnknown(data['second_line']!, _secondLineMeta),
      );
    }
    if (data.containsKey('fnac_ascitic')) {
      context.handle(
        _fnacAsciticMeta,
        fnacAscitic.isAcceptableOrUnknown(
          data['fnac_ascitic']!,
          _fnacAsciticMeta,
        ),
      );
    }
    if (data.containsKey('complications')) {
      context.handle(
        _complicationsMeta,
        complications.isAcceptableOrUnknown(
          data['complications']!,
          _complicationsMeta,
        ),
      );
    }
    if (data.containsKey('need_gcsf')) {
      context.handle(
        _needGcsfMeta,
        needGcsf.isAcceptableOrUnknown(data['need_gcsf']!, _needGcsfMeta),
      );
    }
    if (data.containsKey('need_blood_transfusion')) {
      context.handle(
        _needBloodTransfusionMeta,
        needBloodTransfusion.isAcceptableOrUnknown(
          data['need_blood_transfusion']!,
          _needBloodTransfusionMeta,
        ),
      );
    }
    if (data.containsKey('hemoglobin')) {
      context.handle(
        _hemoglobinMeta,
        hemoglobin.isAcceptableOrUnknown(data['hemoglobin']!, _hemoglobinMeta),
      );
    }
    if (data.containsKey('platelet_count')) {
      context.handle(
        _plateletCountMeta,
        plateletCount.isAcceptableOrUnknown(
          data['platelet_count']!,
          _plateletCountMeta,
        ),
      );
    }
    if (data.containsKey('plr')) {
      context.handle(
        _plrMeta,
        plr.isAcceptableOrUnknown(data['plr']!, _plrMeta),
      );
    }
    if (data.containsKey('albumin')) {
      context.handle(
        _albuminMeta,
        albumin.isAcceptableOrUnknown(data['albumin']!, _albuminMeta),
      );
    }
    if (data.containsKey('neutrophil')) {
      context.handle(
        _neutrophilMeta,
        neutrophil.isAcceptableOrUnknown(data['neutrophil']!, _neutrophilMeta),
      );
    }
    if (data.containsKey('lymphocyte')) {
      context.handle(
        _lymphocyteMeta,
        lymphocyte.isAcceptableOrUnknown(data['lymphocyte']!, _lymphocyteMeta),
      );
    }
    if (data.containsKey('nlr')) {
      context.handle(
        _nlrMeta,
        nlr.isAcceptableOrUnknown(data['nlr']!, _nlrMeta),
      );
    }
    if (data.containsKey('sii')) {
      context.handle(
        _siiMeta,
        sii.isAcceptableOrUnknown(data['sii']!, _siiMeta),
      );
    }
    if (data.containsKey('ca125_reading1')) {
      context.handle(
        _ca125Reading1Meta,
        ca125Reading1.isAcceptableOrUnknown(
          data['ca125_reading1']!,
          _ca125Reading1Meta,
        ),
      );
    }
    if (data.containsKey('ca125_reading2')) {
      context.handle(
        _ca125Reading2Meta,
        ca125Reading2.isAcceptableOrUnknown(
          data['ca125_reading2']!,
          _ca125Reading2Meta,
        ),
      );
    }
    if (data.containsKey('ca125_reading3')) {
      context.handle(
        _ca125Reading3Meta,
        ca125Reading3.isAcceptableOrUnknown(
          data['ca125_reading3']!,
          _ca125Reading3Meta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostChemoAssessment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostChemoAssessment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      nactCycles: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nact_cycles'],
      ),
      nactDates: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nact_dates'],
      ),
      nactNature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nact_nature'],
      ),
      secondLine: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}second_line'],
      ),
      fnacAscitic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fnac_ascitic'],
      ),
      complications: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}complications'],
      ),
      needGcsf: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}need_gcsf'],
      ),
      needBloodTransfusion: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}need_blood_transfusion'],
      ),
      hemoglobin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hemoglobin'],
      ),
      plateletCount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}platelet_count'],
      ),
      plr: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}plr'],
      ),
      albumin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}albumin'],
      ),
      neutrophil: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}neutrophil'],
      ),
      lymphocyte: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lymphocyte'],
      ),
      nlr: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nlr'],
      ),
      sii: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sii'],
      ),
      ca125Reading1: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ca125_reading1'],
      ),
      ca125Reading2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ca125_reading2'],
      ),
      ca125Reading3: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ca125_reading3'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $PostChemoAssessmentsTable createAlias(String alias) {
    return $PostChemoAssessmentsTable(attachedDatabase, alias);
  }
}

class PostChemoAssessment extends DataClass
    implements Insertable<PostChemoAssessment> {
  final int id;
  final int patientId;
  final int? nactCycles;
  final String? nactDates;
  final String? nactNature;
  final String? secondLine;
  final String? fnacAscitic;
  final String? complications;
  final bool? needGcsf;
  final bool? needBloodTransfusion;
  final double? hemoglobin;
  final double? plateletCount;
  final double? plr;
  final double? albumin;
  final double? neutrophil;
  final double? lymphocyte;
  final double? nlr;
  final double? sii;
  final double? ca125Reading1;
  final double? ca125Reading2;
  final double? ca125Reading3;
  final DateTime recordedAt;
  const PostChemoAssessment({
    required this.id,
    required this.patientId,
    this.nactCycles,
    this.nactDates,
    this.nactNature,
    this.secondLine,
    this.fnacAscitic,
    this.complications,
    this.needGcsf,
    this.needBloodTransfusion,
    this.hemoglobin,
    this.plateletCount,
    this.plr,
    this.albumin,
    this.neutrophil,
    this.lymphocyte,
    this.nlr,
    this.sii,
    this.ca125Reading1,
    this.ca125Reading2,
    this.ca125Reading3,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    if (!nullToAbsent || nactCycles != null) {
      map['nact_cycles'] = Variable<int>(nactCycles);
    }
    if (!nullToAbsent || nactDates != null) {
      map['nact_dates'] = Variable<String>(nactDates);
    }
    if (!nullToAbsent || nactNature != null) {
      map['nact_nature'] = Variable<String>(nactNature);
    }
    if (!nullToAbsent || secondLine != null) {
      map['second_line'] = Variable<String>(secondLine);
    }
    if (!nullToAbsent || fnacAscitic != null) {
      map['fnac_ascitic'] = Variable<String>(fnacAscitic);
    }
    if (!nullToAbsent || complications != null) {
      map['complications'] = Variable<String>(complications);
    }
    if (!nullToAbsent || needGcsf != null) {
      map['need_gcsf'] = Variable<bool>(needGcsf);
    }
    if (!nullToAbsent || needBloodTransfusion != null) {
      map['need_blood_transfusion'] = Variable<bool>(needBloodTransfusion);
    }
    if (!nullToAbsent || hemoglobin != null) {
      map['hemoglobin'] = Variable<double>(hemoglobin);
    }
    if (!nullToAbsent || plateletCount != null) {
      map['platelet_count'] = Variable<double>(plateletCount);
    }
    if (!nullToAbsent || plr != null) {
      map['plr'] = Variable<double>(plr);
    }
    if (!nullToAbsent || albumin != null) {
      map['albumin'] = Variable<double>(albumin);
    }
    if (!nullToAbsent || neutrophil != null) {
      map['neutrophil'] = Variable<double>(neutrophil);
    }
    if (!nullToAbsent || lymphocyte != null) {
      map['lymphocyte'] = Variable<double>(lymphocyte);
    }
    if (!nullToAbsent || nlr != null) {
      map['nlr'] = Variable<double>(nlr);
    }
    if (!nullToAbsent || sii != null) {
      map['sii'] = Variable<double>(sii);
    }
    if (!nullToAbsent || ca125Reading1 != null) {
      map['ca125_reading1'] = Variable<double>(ca125Reading1);
    }
    if (!nullToAbsent || ca125Reading2 != null) {
      map['ca125_reading2'] = Variable<double>(ca125Reading2);
    }
    if (!nullToAbsent || ca125Reading3 != null) {
      map['ca125_reading3'] = Variable<double>(ca125Reading3);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  PostChemoAssessmentsCompanion toCompanion(bool nullToAbsent) {
    return PostChemoAssessmentsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      nactCycles: nactCycles == null && nullToAbsent
          ? const Value.absent()
          : Value(nactCycles),
      nactDates: nactDates == null && nullToAbsent
          ? const Value.absent()
          : Value(nactDates),
      nactNature: nactNature == null && nullToAbsent
          ? const Value.absent()
          : Value(nactNature),
      secondLine: secondLine == null && nullToAbsent
          ? const Value.absent()
          : Value(secondLine),
      fnacAscitic: fnacAscitic == null && nullToAbsent
          ? const Value.absent()
          : Value(fnacAscitic),
      complications: complications == null && nullToAbsent
          ? const Value.absent()
          : Value(complications),
      needGcsf: needGcsf == null && nullToAbsent
          ? const Value.absent()
          : Value(needGcsf),
      needBloodTransfusion: needBloodTransfusion == null && nullToAbsent
          ? const Value.absent()
          : Value(needBloodTransfusion),
      hemoglobin: hemoglobin == null && nullToAbsent
          ? const Value.absent()
          : Value(hemoglobin),
      plateletCount: plateletCount == null && nullToAbsent
          ? const Value.absent()
          : Value(plateletCount),
      plr: plr == null && nullToAbsent ? const Value.absent() : Value(plr),
      albumin: albumin == null && nullToAbsent
          ? const Value.absent()
          : Value(albumin),
      neutrophil: neutrophil == null && nullToAbsent
          ? const Value.absent()
          : Value(neutrophil),
      lymphocyte: lymphocyte == null && nullToAbsent
          ? const Value.absent()
          : Value(lymphocyte),
      nlr: nlr == null && nullToAbsent ? const Value.absent() : Value(nlr),
      sii: sii == null && nullToAbsent ? const Value.absent() : Value(sii),
      ca125Reading1: ca125Reading1 == null && nullToAbsent
          ? const Value.absent()
          : Value(ca125Reading1),
      ca125Reading2: ca125Reading2 == null && nullToAbsent
          ? const Value.absent()
          : Value(ca125Reading2),
      ca125Reading3: ca125Reading3 == null && nullToAbsent
          ? const Value.absent()
          : Value(ca125Reading3),
      recordedAt: Value(recordedAt),
    );
  }

  factory PostChemoAssessment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostChemoAssessment(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      nactCycles: serializer.fromJson<int?>(json['nactCycles']),
      nactDates: serializer.fromJson<String?>(json['nactDates']),
      nactNature: serializer.fromJson<String?>(json['nactNature']),
      secondLine: serializer.fromJson<String?>(json['secondLine']),
      fnacAscitic: serializer.fromJson<String?>(json['fnacAscitic']),
      complications: serializer.fromJson<String?>(json['complications']),
      needGcsf: serializer.fromJson<bool?>(json['needGcsf']),
      needBloodTransfusion: serializer.fromJson<bool?>(
        json['needBloodTransfusion'],
      ),
      hemoglobin: serializer.fromJson<double?>(json['hemoglobin']),
      plateletCount: serializer.fromJson<double?>(json['plateletCount']),
      plr: serializer.fromJson<double?>(json['plr']),
      albumin: serializer.fromJson<double?>(json['albumin']),
      neutrophil: serializer.fromJson<double?>(json['neutrophil']),
      lymphocyte: serializer.fromJson<double?>(json['lymphocyte']),
      nlr: serializer.fromJson<double?>(json['nlr']),
      sii: serializer.fromJson<double?>(json['sii']),
      ca125Reading1: serializer.fromJson<double?>(json['ca125Reading1']),
      ca125Reading2: serializer.fromJson<double?>(json['ca125Reading2']),
      ca125Reading3: serializer.fromJson<double?>(json['ca125Reading3']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'nactCycles': serializer.toJson<int?>(nactCycles),
      'nactDates': serializer.toJson<String?>(nactDates),
      'nactNature': serializer.toJson<String?>(nactNature),
      'secondLine': serializer.toJson<String?>(secondLine),
      'fnacAscitic': serializer.toJson<String?>(fnacAscitic),
      'complications': serializer.toJson<String?>(complications),
      'needGcsf': serializer.toJson<bool?>(needGcsf),
      'needBloodTransfusion': serializer.toJson<bool?>(needBloodTransfusion),
      'hemoglobin': serializer.toJson<double?>(hemoglobin),
      'plateletCount': serializer.toJson<double?>(plateletCount),
      'plr': serializer.toJson<double?>(plr),
      'albumin': serializer.toJson<double?>(albumin),
      'neutrophil': serializer.toJson<double?>(neutrophil),
      'lymphocyte': serializer.toJson<double?>(lymphocyte),
      'nlr': serializer.toJson<double?>(nlr),
      'sii': serializer.toJson<double?>(sii),
      'ca125Reading1': serializer.toJson<double?>(ca125Reading1),
      'ca125Reading2': serializer.toJson<double?>(ca125Reading2),
      'ca125Reading3': serializer.toJson<double?>(ca125Reading3),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  PostChemoAssessment copyWith({
    int? id,
    int? patientId,
    Value<int?> nactCycles = const Value.absent(),
    Value<String?> nactDates = const Value.absent(),
    Value<String?> nactNature = const Value.absent(),
    Value<String?> secondLine = const Value.absent(),
    Value<String?> fnacAscitic = const Value.absent(),
    Value<String?> complications = const Value.absent(),
    Value<bool?> needGcsf = const Value.absent(),
    Value<bool?> needBloodTransfusion = const Value.absent(),
    Value<double?> hemoglobin = const Value.absent(),
    Value<double?> plateletCount = const Value.absent(),
    Value<double?> plr = const Value.absent(),
    Value<double?> albumin = const Value.absent(),
    Value<double?> neutrophil = const Value.absent(),
    Value<double?> lymphocyte = const Value.absent(),
    Value<double?> nlr = const Value.absent(),
    Value<double?> sii = const Value.absent(),
    Value<double?> ca125Reading1 = const Value.absent(),
    Value<double?> ca125Reading2 = const Value.absent(),
    Value<double?> ca125Reading3 = const Value.absent(),
    DateTime? recordedAt,
  }) => PostChemoAssessment(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    nactCycles: nactCycles.present ? nactCycles.value : this.nactCycles,
    nactDates: nactDates.present ? nactDates.value : this.nactDates,
    nactNature: nactNature.present ? nactNature.value : this.nactNature,
    secondLine: secondLine.present ? secondLine.value : this.secondLine,
    fnacAscitic: fnacAscitic.present ? fnacAscitic.value : this.fnacAscitic,
    complications: complications.present
        ? complications.value
        : this.complications,
    needGcsf: needGcsf.present ? needGcsf.value : this.needGcsf,
    needBloodTransfusion: needBloodTransfusion.present
        ? needBloodTransfusion.value
        : this.needBloodTransfusion,
    hemoglobin: hemoglobin.present ? hemoglobin.value : this.hemoglobin,
    plateletCount: plateletCount.present
        ? plateletCount.value
        : this.plateletCount,
    plr: plr.present ? plr.value : this.plr,
    albumin: albumin.present ? albumin.value : this.albumin,
    neutrophil: neutrophil.present ? neutrophil.value : this.neutrophil,
    lymphocyte: lymphocyte.present ? lymphocyte.value : this.lymphocyte,
    nlr: nlr.present ? nlr.value : this.nlr,
    sii: sii.present ? sii.value : this.sii,
    ca125Reading1: ca125Reading1.present
        ? ca125Reading1.value
        : this.ca125Reading1,
    ca125Reading2: ca125Reading2.present
        ? ca125Reading2.value
        : this.ca125Reading2,
    ca125Reading3: ca125Reading3.present
        ? ca125Reading3.value
        : this.ca125Reading3,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  PostChemoAssessment copyWithCompanion(PostChemoAssessmentsCompanion data) {
    return PostChemoAssessment(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      nactCycles: data.nactCycles.present
          ? data.nactCycles.value
          : this.nactCycles,
      nactDates: data.nactDates.present ? data.nactDates.value : this.nactDates,
      nactNature: data.nactNature.present
          ? data.nactNature.value
          : this.nactNature,
      secondLine: data.secondLine.present
          ? data.secondLine.value
          : this.secondLine,
      fnacAscitic: data.fnacAscitic.present
          ? data.fnacAscitic.value
          : this.fnacAscitic,
      complications: data.complications.present
          ? data.complications.value
          : this.complications,
      needGcsf: data.needGcsf.present ? data.needGcsf.value : this.needGcsf,
      needBloodTransfusion: data.needBloodTransfusion.present
          ? data.needBloodTransfusion.value
          : this.needBloodTransfusion,
      hemoglobin: data.hemoglobin.present
          ? data.hemoglobin.value
          : this.hemoglobin,
      plateletCount: data.plateletCount.present
          ? data.plateletCount.value
          : this.plateletCount,
      plr: data.plr.present ? data.plr.value : this.plr,
      albumin: data.albumin.present ? data.albumin.value : this.albumin,
      neutrophil: data.neutrophil.present
          ? data.neutrophil.value
          : this.neutrophil,
      lymphocyte: data.lymphocyte.present
          ? data.lymphocyte.value
          : this.lymphocyte,
      nlr: data.nlr.present ? data.nlr.value : this.nlr,
      sii: data.sii.present ? data.sii.value : this.sii,
      ca125Reading1: data.ca125Reading1.present
          ? data.ca125Reading1.value
          : this.ca125Reading1,
      ca125Reading2: data.ca125Reading2.present
          ? data.ca125Reading2.value
          : this.ca125Reading2,
      ca125Reading3: data.ca125Reading3.present
          ? data.ca125Reading3.value
          : this.ca125Reading3,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PostChemoAssessment(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('nactCycles: $nactCycles, ')
          ..write('nactDates: $nactDates, ')
          ..write('nactNature: $nactNature, ')
          ..write('secondLine: $secondLine, ')
          ..write('fnacAscitic: $fnacAscitic, ')
          ..write('complications: $complications, ')
          ..write('needGcsf: $needGcsf, ')
          ..write('needBloodTransfusion: $needBloodTransfusion, ')
          ..write('hemoglobin: $hemoglobin, ')
          ..write('plateletCount: $plateletCount, ')
          ..write('plr: $plr, ')
          ..write('albumin: $albumin, ')
          ..write('neutrophil: $neutrophil, ')
          ..write('lymphocyte: $lymphocyte, ')
          ..write('nlr: $nlr, ')
          ..write('sii: $sii, ')
          ..write('ca125Reading1: $ca125Reading1, ')
          ..write('ca125Reading2: $ca125Reading2, ')
          ..write('ca125Reading3: $ca125Reading3, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    patientId,
    nactCycles,
    nactDates,
    nactNature,
    secondLine,
    fnacAscitic,
    complications,
    needGcsf,
    needBloodTransfusion,
    hemoglobin,
    plateletCount,
    plr,
    albumin,
    neutrophil,
    lymphocyte,
    nlr,
    sii,
    ca125Reading1,
    ca125Reading2,
    ca125Reading3,
    recordedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostChemoAssessment &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.nactCycles == this.nactCycles &&
          other.nactDates == this.nactDates &&
          other.nactNature == this.nactNature &&
          other.secondLine == this.secondLine &&
          other.fnacAscitic == this.fnacAscitic &&
          other.complications == this.complications &&
          other.needGcsf == this.needGcsf &&
          other.needBloodTransfusion == this.needBloodTransfusion &&
          other.hemoglobin == this.hemoglobin &&
          other.plateletCount == this.plateletCount &&
          other.plr == this.plr &&
          other.albumin == this.albumin &&
          other.neutrophil == this.neutrophil &&
          other.lymphocyte == this.lymphocyte &&
          other.nlr == this.nlr &&
          other.sii == this.sii &&
          other.ca125Reading1 == this.ca125Reading1 &&
          other.ca125Reading2 == this.ca125Reading2 &&
          other.ca125Reading3 == this.ca125Reading3 &&
          other.recordedAt == this.recordedAt);
}

class PostChemoAssessmentsCompanion
    extends UpdateCompanion<PostChemoAssessment> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<int?> nactCycles;
  final Value<String?> nactDates;
  final Value<String?> nactNature;
  final Value<String?> secondLine;
  final Value<String?> fnacAscitic;
  final Value<String?> complications;
  final Value<bool?> needGcsf;
  final Value<bool?> needBloodTransfusion;
  final Value<double?> hemoglobin;
  final Value<double?> plateletCount;
  final Value<double?> plr;
  final Value<double?> albumin;
  final Value<double?> neutrophil;
  final Value<double?> lymphocyte;
  final Value<double?> nlr;
  final Value<double?> sii;
  final Value<double?> ca125Reading1;
  final Value<double?> ca125Reading2;
  final Value<double?> ca125Reading3;
  final Value<DateTime> recordedAt;
  const PostChemoAssessmentsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.nactCycles = const Value.absent(),
    this.nactDates = const Value.absent(),
    this.nactNature = const Value.absent(),
    this.secondLine = const Value.absent(),
    this.fnacAscitic = const Value.absent(),
    this.complications = const Value.absent(),
    this.needGcsf = const Value.absent(),
    this.needBloodTransfusion = const Value.absent(),
    this.hemoglobin = const Value.absent(),
    this.plateletCount = const Value.absent(),
    this.plr = const Value.absent(),
    this.albumin = const Value.absent(),
    this.neutrophil = const Value.absent(),
    this.lymphocyte = const Value.absent(),
    this.nlr = const Value.absent(),
    this.sii = const Value.absent(),
    this.ca125Reading1 = const Value.absent(),
    this.ca125Reading2 = const Value.absent(),
    this.ca125Reading3 = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  PostChemoAssessmentsCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.nactCycles = const Value.absent(),
    this.nactDates = const Value.absent(),
    this.nactNature = const Value.absent(),
    this.secondLine = const Value.absent(),
    this.fnacAscitic = const Value.absent(),
    this.complications = const Value.absent(),
    this.needGcsf = const Value.absent(),
    this.needBloodTransfusion = const Value.absent(),
    this.hemoglobin = const Value.absent(),
    this.plateletCount = const Value.absent(),
    this.plr = const Value.absent(),
    this.albumin = const Value.absent(),
    this.neutrophil = const Value.absent(),
    this.lymphocyte = const Value.absent(),
    this.nlr = const Value.absent(),
    this.sii = const Value.absent(),
    this.ca125Reading1 = const Value.absent(),
    this.ca125Reading2 = const Value.absent(),
    this.ca125Reading3 = const Value.absent(),
    this.recordedAt = const Value.absent(),
  }) : patientId = Value(patientId);
  static Insertable<PostChemoAssessment> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<int>? nactCycles,
    Expression<String>? nactDates,
    Expression<String>? nactNature,
    Expression<String>? secondLine,
    Expression<String>? fnacAscitic,
    Expression<String>? complications,
    Expression<bool>? needGcsf,
    Expression<bool>? needBloodTransfusion,
    Expression<double>? hemoglobin,
    Expression<double>? plateletCount,
    Expression<double>? plr,
    Expression<double>? albumin,
    Expression<double>? neutrophil,
    Expression<double>? lymphocyte,
    Expression<double>? nlr,
    Expression<double>? sii,
    Expression<double>? ca125Reading1,
    Expression<double>? ca125Reading2,
    Expression<double>? ca125Reading3,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (nactCycles != null) 'nact_cycles': nactCycles,
      if (nactDates != null) 'nact_dates': nactDates,
      if (nactNature != null) 'nact_nature': nactNature,
      if (secondLine != null) 'second_line': secondLine,
      if (fnacAscitic != null) 'fnac_ascitic': fnacAscitic,
      if (complications != null) 'complications': complications,
      if (needGcsf != null) 'need_gcsf': needGcsf,
      if (needBloodTransfusion != null)
        'need_blood_transfusion': needBloodTransfusion,
      if (hemoglobin != null) 'hemoglobin': hemoglobin,
      if (plateletCount != null) 'platelet_count': plateletCount,
      if (plr != null) 'plr': plr,
      if (albumin != null) 'albumin': albumin,
      if (neutrophil != null) 'neutrophil': neutrophil,
      if (lymphocyte != null) 'lymphocyte': lymphocyte,
      if (nlr != null) 'nlr': nlr,
      if (sii != null) 'sii': sii,
      if (ca125Reading1 != null) 'ca125_reading1': ca125Reading1,
      if (ca125Reading2 != null) 'ca125_reading2': ca125Reading2,
      if (ca125Reading3 != null) 'ca125_reading3': ca125Reading3,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  PostChemoAssessmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? patientId,
    Value<int?>? nactCycles,
    Value<String?>? nactDates,
    Value<String?>? nactNature,
    Value<String?>? secondLine,
    Value<String?>? fnacAscitic,
    Value<String?>? complications,
    Value<bool?>? needGcsf,
    Value<bool?>? needBloodTransfusion,
    Value<double?>? hemoglobin,
    Value<double?>? plateletCount,
    Value<double?>? plr,
    Value<double?>? albumin,
    Value<double?>? neutrophil,
    Value<double?>? lymphocyte,
    Value<double?>? nlr,
    Value<double?>? sii,
    Value<double?>? ca125Reading1,
    Value<double?>? ca125Reading2,
    Value<double?>? ca125Reading3,
    Value<DateTime>? recordedAt,
  }) {
    return PostChemoAssessmentsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      nactCycles: nactCycles ?? this.nactCycles,
      nactDates: nactDates ?? this.nactDates,
      nactNature: nactNature ?? this.nactNature,
      secondLine: secondLine ?? this.secondLine,
      fnacAscitic: fnacAscitic ?? this.fnacAscitic,
      complications: complications ?? this.complications,
      needGcsf: needGcsf ?? this.needGcsf,
      needBloodTransfusion: needBloodTransfusion ?? this.needBloodTransfusion,
      hemoglobin: hemoglobin ?? this.hemoglobin,
      plateletCount: plateletCount ?? this.plateletCount,
      plr: plr ?? this.plr,
      albumin: albumin ?? this.albumin,
      neutrophil: neutrophil ?? this.neutrophil,
      lymphocyte: lymphocyte ?? this.lymphocyte,
      nlr: nlr ?? this.nlr,
      sii: sii ?? this.sii,
      ca125Reading1: ca125Reading1 ?? this.ca125Reading1,
      ca125Reading2: ca125Reading2 ?? this.ca125Reading2,
      ca125Reading3: ca125Reading3 ?? this.ca125Reading3,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (nactCycles.present) {
      map['nact_cycles'] = Variable<int>(nactCycles.value);
    }
    if (nactDates.present) {
      map['nact_dates'] = Variable<String>(nactDates.value);
    }
    if (nactNature.present) {
      map['nact_nature'] = Variable<String>(nactNature.value);
    }
    if (secondLine.present) {
      map['second_line'] = Variable<String>(secondLine.value);
    }
    if (fnacAscitic.present) {
      map['fnac_ascitic'] = Variable<String>(fnacAscitic.value);
    }
    if (complications.present) {
      map['complications'] = Variable<String>(complications.value);
    }
    if (needGcsf.present) {
      map['need_gcsf'] = Variable<bool>(needGcsf.value);
    }
    if (needBloodTransfusion.present) {
      map['need_blood_transfusion'] = Variable<bool>(
        needBloodTransfusion.value,
      );
    }
    if (hemoglobin.present) {
      map['hemoglobin'] = Variable<double>(hemoglobin.value);
    }
    if (plateletCount.present) {
      map['platelet_count'] = Variable<double>(plateletCount.value);
    }
    if (plr.present) {
      map['plr'] = Variable<double>(plr.value);
    }
    if (albumin.present) {
      map['albumin'] = Variable<double>(albumin.value);
    }
    if (neutrophil.present) {
      map['neutrophil'] = Variable<double>(neutrophil.value);
    }
    if (lymphocyte.present) {
      map['lymphocyte'] = Variable<double>(lymphocyte.value);
    }
    if (nlr.present) {
      map['nlr'] = Variable<double>(nlr.value);
    }
    if (sii.present) {
      map['sii'] = Variable<double>(sii.value);
    }
    if (ca125Reading1.present) {
      map['ca125_reading1'] = Variable<double>(ca125Reading1.value);
    }
    if (ca125Reading2.present) {
      map['ca125_reading2'] = Variable<double>(ca125Reading2.value);
    }
    if (ca125Reading3.present) {
      map['ca125_reading3'] = Variable<double>(ca125Reading3.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostChemoAssessmentsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('nactCycles: $nactCycles, ')
          ..write('nactDates: $nactDates, ')
          ..write('nactNature: $nactNature, ')
          ..write('secondLine: $secondLine, ')
          ..write('fnacAscitic: $fnacAscitic, ')
          ..write('complications: $complications, ')
          ..write('needGcsf: $needGcsf, ')
          ..write('needBloodTransfusion: $needBloodTransfusion, ')
          ..write('hemoglobin: $hemoglobin, ')
          ..write('plateletCount: $plateletCount, ')
          ..write('plr: $plr, ')
          ..write('albumin: $albumin, ')
          ..write('neutrophil: $neutrophil, ')
          ..write('lymphocyte: $lymphocyte, ')
          ..write('nlr: $nlr, ')
          ..write('sii: $sii, ')
          ..write('ca125Reading1: $ca125Reading1, ')
          ..write('ca125Reading2: $ca125Reading2, ')
          ..write('ca125Reading3: $ca125Reading3, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

class $CytoreductionCtFindingsTable extends CytoreductionCtFindings
    with TableInfo<$CytoreductionCtFindingsTable, CytoreductionCtFinding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CytoreductionCtFindingsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patients (id)',
    ),
  );
  static const VerificationMeta _chemoResponseScoreMeta =
      const VerificationMeta('chemoResponseScore');
  @override
  late final GeneratedColumn<String> chemoResponseScore =
      GeneratedColumn<String>(
        'chemo_response_score',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _pciMeta = const VerificationMeta('pci');
  @override
  late final GeneratedColumn<double> pci = GeneratedColumn<double>(
    'pci',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cytoreductiveLevelMeta =
      const VerificationMeta('cytoreductiveLevel');
  @override
  late final GeneratedColumn<String> cytoreductiveLevel =
      GeneratedColumn<String>(
        'cytoreductive_level',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ctLiverPreMeta = const VerificationMeta(
    'ctLiverPre',
  );
  @override
  late final GeneratedColumn<String> ctLiverPre = GeneratedColumn<String>(
    'ct_liver_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctLiverPostMeta = const VerificationMeta(
    'ctLiverPost',
  );
  @override
  late final GeneratedColumn<String> ctLiverPost = GeneratedColumn<String>(
    'ct_liver_post',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctGallBladderPreMeta = const VerificationMeta(
    'ctGallBladderPre',
  );
  @override
  late final GeneratedColumn<String> ctGallBladderPre = GeneratedColumn<String>(
    'ct_gall_bladder_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctGallBladderPostMeta = const VerificationMeta(
    'ctGallBladderPost',
  );
  @override
  late final GeneratedColumn<String> ctGallBladderPost =
      GeneratedColumn<String>(
        'ct_gall_bladder_post',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ctSpleenPreMeta = const VerificationMeta(
    'ctSpleenPre',
  );
  @override
  late final GeneratedColumn<String> ctSpleenPre = GeneratedColumn<String>(
    'ct_spleen_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctSpleenPostMeta = const VerificationMeta(
    'ctSpleenPost',
  );
  @override
  late final GeneratedColumn<String> ctSpleenPost = GeneratedColumn<String>(
    'ct_spleen_post',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctPancreasPreMeta = const VerificationMeta(
    'ctPancreasPre',
  );
  @override
  late final GeneratedColumn<String> ctPancreasPre = GeneratedColumn<String>(
    'ct_pancreas_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctPancreasPostMeta = const VerificationMeta(
    'ctPancreasPost',
  );
  @override
  late final GeneratedColumn<String> ctPancreasPost = GeneratedColumn<String>(
    'ct_pancreas_post',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctSuprarenalsPreMeta = const VerificationMeta(
    'ctSuprarenalsPre',
  );
  @override
  late final GeneratedColumn<String> ctSuprarenalsPre = GeneratedColumn<String>(
    'ct_suprarenals_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctSuprarenalsPostMeta = const VerificationMeta(
    'ctSuprarenalsPost',
  );
  @override
  late final GeneratedColumn<String> ctSuprarenalsPost =
      GeneratedColumn<String>(
        'ct_suprarenals_post',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ctKidneyPreMeta = const VerificationMeta(
    'ctKidneyPre',
  );
  @override
  late final GeneratedColumn<String> ctKidneyPre = GeneratedColumn<String>(
    'ct_kidney_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctKidneyPostMeta = const VerificationMeta(
    'ctKidneyPost',
  );
  @override
  late final GeneratedColumn<String> ctKidneyPost = GeneratedColumn<String>(
    'ct_kidney_post',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctBowelPreMeta = const VerificationMeta(
    'ctBowelPre',
  );
  @override
  late final GeneratedColumn<String> ctBowelPre = GeneratedColumn<String>(
    'ct_bowel_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctBowelPostMeta = const VerificationMeta(
    'ctBowelPost',
  );
  @override
  late final GeneratedColumn<String> ctBowelPost = GeneratedColumn<String>(
    'ct_bowel_post',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctAortaIvcPreMeta = const VerificationMeta(
    'ctAortaIvcPre',
  );
  @override
  late final GeneratedColumn<String> ctAortaIvcPre = GeneratedColumn<String>(
    'ct_aorta_ivc_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctAortaIvcPostMeta = const VerificationMeta(
    'ctAortaIvcPost',
  );
  @override
  late final GeneratedColumn<String> ctAortaIvcPost = GeneratedColumn<String>(
    'ct_aorta_ivc_post',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctUrinaryBladderPreMeta =
      const VerificationMeta('ctUrinaryBladderPre');
  @override
  late final GeneratedColumn<String> ctUrinaryBladderPre =
      GeneratedColumn<String>(
        'ct_urinary_bladder_pre',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ctUrinaryBladderPostMeta =
      const VerificationMeta('ctUrinaryBladderPost');
  @override
  late final GeneratedColumn<String> ctUrinaryBladderPost =
      GeneratedColumn<String>(
        'ct_urinary_bladder_post',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ctUterusOvariesPreMeta =
      const VerificationMeta('ctUterusOvariesPre');
  @override
  late final GeneratedColumn<String> ctUterusOvariesPre =
      GeneratedColumn<String>(
        'ct_uterus_ovaries_pre',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ctUterusOvariesPostMeta =
      const VerificationMeta('ctUterusOvariesPost');
  @override
  late final GeneratedColumn<String> ctUterusOvariesPost =
      GeneratedColumn<String>(
        'ct_uterus_ovaries_post',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ctLymphNodesPreMeta = const VerificationMeta(
    'ctLymphNodesPre',
  );
  @override
  late final GeneratedColumn<String> ctLymphNodesPre = GeneratedColumn<String>(
    'ct_lymph_nodes_pre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ctLymphNodesPostMeta = const VerificationMeta(
    'ctLymphNodesPost',
  );
  @override
  late final GeneratedColumn<String> ctLymphNodesPost = GeneratedColumn<String>(
    'ct_lymph_nodes_post',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kelimScoreMeta = const VerificationMeta(
    'kelimScore',
  );
  @override
  late final GeneratedColumn<double> kelimScore = GeneratedColumn<double>(
    'kelim_score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _crsOmentumMeta = const VerificationMeta(
    'crsOmentum',
  );
  @override
  late final GeneratedColumn<String> crsOmentum = GeneratedColumn<String>(
    'crs_omentum',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _crsAdnexaMeta = const VerificationMeta(
    'crsAdnexa',
  );
  @override
  late final GeneratedColumn<String> crsAdnexa = GeneratedColumn<String>(
    'crs_adnexa',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _crsOtherSitesMeta = const VerificationMeta(
    'crsOtherSites',
  );
  @override
  late final GeneratedColumn<String> crsOtherSites = GeneratedColumn<String>(
    'crs_other_sites',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    chemoResponseScore,
    pci,
    cytoreductiveLevel,
    ctLiverPre,
    ctLiverPost,
    ctGallBladderPre,
    ctGallBladderPost,
    ctSpleenPre,
    ctSpleenPost,
    ctPancreasPre,
    ctPancreasPost,
    ctSuprarenalsPre,
    ctSuprarenalsPost,
    ctKidneyPre,
    ctKidneyPost,
    ctBowelPre,
    ctBowelPost,
    ctAortaIvcPre,
    ctAortaIvcPost,
    ctUrinaryBladderPre,
    ctUrinaryBladderPost,
    ctUterusOvariesPre,
    ctUterusOvariesPost,
    ctLymphNodesPre,
    ctLymphNodesPost,
    kelimScore,
    crsOmentum,
    crsAdnexa,
    crsOtherSites,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cytoreduction_ct_findings';
  @override
  VerificationContext validateIntegrity(
    Insertable<CytoreductionCtFinding> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('chemo_response_score')) {
      context.handle(
        _chemoResponseScoreMeta,
        chemoResponseScore.isAcceptableOrUnknown(
          data['chemo_response_score']!,
          _chemoResponseScoreMeta,
        ),
      );
    }
    if (data.containsKey('pci')) {
      context.handle(
        _pciMeta,
        pci.isAcceptableOrUnknown(data['pci']!, _pciMeta),
      );
    }
    if (data.containsKey('cytoreductive_level')) {
      context.handle(
        _cytoreductiveLevelMeta,
        cytoreductiveLevel.isAcceptableOrUnknown(
          data['cytoreductive_level']!,
          _cytoreductiveLevelMeta,
        ),
      );
    }
    if (data.containsKey('ct_liver_pre')) {
      context.handle(
        _ctLiverPreMeta,
        ctLiverPre.isAcceptableOrUnknown(
          data['ct_liver_pre']!,
          _ctLiverPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_liver_post')) {
      context.handle(
        _ctLiverPostMeta,
        ctLiverPost.isAcceptableOrUnknown(
          data['ct_liver_post']!,
          _ctLiverPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_gall_bladder_pre')) {
      context.handle(
        _ctGallBladderPreMeta,
        ctGallBladderPre.isAcceptableOrUnknown(
          data['ct_gall_bladder_pre']!,
          _ctGallBladderPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_gall_bladder_post')) {
      context.handle(
        _ctGallBladderPostMeta,
        ctGallBladderPost.isAcceptableOrUnknown(
          data['ct_gall_bladder_post']!,
          _ctGallBladderPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_spleen_pre')) {
      context.handle(
        _ctSpleenPreMeta,
        ctSpleenPre.isAcceptableOrUnknown(
          data['ct_spleen_pre']!,
          _ctSpleenPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_spleen_post')) {
      context.handle(
        _ctSpleenPostMeta,
        ctSpleenPost.isAcceptableOrUnknown(
          data['ct_spleen_post']!,
          _ctSpleenPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_pancreas_pre')) {
      context.handle(
        _ctPancreasPreMeta,
        ctPancreasPre.isAcceptableOrUnknown(
          data['ct_pancreas_pre']!,
          _ctPancreasPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_pancreas_post')) {
      context.handle(
        _ctPancreasPostMeta,
        ctPancreasPost.isAcceptableOrUnknown(
          data['ct_pancreas_post']!,
          _ctPancreasPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_suprarenals_pre')) {
      context.handle(
        _ctSuprarenalsPreMeta,
        ctSuprarenalsPre.isAcceptableOrUnknown(
          data['ct_suprarenals_pre']!,
          _ctSuprarenalsPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_suprarenals_post')) {
      context.handle(
        _ctSuprarenalsPostMeta,
        ctSuprarenalsPost.isAcceptableOrUnknown(
          data['ct_suprarenals_post']!,
          _ctSuprarenalsPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_kidney_pre')) {
      context.handle(
        _ctKidneyPreMeta,
        ctKidneyPre.isAcceptableOrUnknown(
          data['ct_kidney_pre']!,
          _ctKidneyPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_kidney_post')) {
      context.handle(
        _ctKidneyPostMeta,
        ctKidneyPost.isAcceptableOrUnknown(
          data['ct_kidney_post']!,
          _ctKidneyPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_bowel_pre')) {
      context.handle(
        _ctBowelPreMeta,
        ctBowelPre.isAcceptableOrUnknown(
          data['ct_bowel_pre']!,
          _ctBowelPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_bowel_post')) {
      context.handle(
        _ctBowelPostMeta,
        ctBowelPost.isAcceptableOrUnknown(
          data['ct_bowel_post']!,
          _ctBowelPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_aorta_ivc_pre')) {
      context.handle(
        _ctAortaIvcPreMeta,
        ctAortaIvcPre.isAcceptableOrUnknown(
          data['ct_aorta_ivc_pre']!,
          _ctAortaIvcPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_aorta_ivc_post')) {
      context.handle(
        _ctAortaIvcPostMeta,
        ctAortaIvcPost.isAcceptableOrUnknown(
          data['ct_aorta_ivc_post']!,
          _ctAortaIvcPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_urinary_bladder_pre')) {
      context.handle(
        _ctUrinaryBladderPreMeta,
        ctUrinaryBladderPre.isAcceptableOrUnknown(
          data['ct_urinary_bladder_pre']!,
          _ctUrinaryBladderPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_urinary_bladder_post')) {
      context.handle(
        _ctUrinaryBladderPostMeta,
        ctUrinaryBladderPost.isAcceptableOrUnknown(
          data['ct_urinary_bladder_post']!,
          _ctUrinaryBladderPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_uterus_ovaries_pre')) {
      context.handle(
        _ctUterusOvariesPreMeta,
        ctUterusOvariesPre.isAcceptableOrUnknown(
          data['ct_uterus_ovaries_pre']!,
          _ctUterusOvariesPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_uterus_ovaries_post')) {
      context.handle(
        _ctUterusOvariesPostMeta,
        ctUterusOvariesPost.isAcceptableOrUnknown(
          data['ct_uterus_ovaries_post']!,
          _ctUterusOvariesPostMeta,
        ),
      );
    }
    if (data.containsKey('ct_lymph_nodes_pre')) {
      context.handle(
        _ctLymphNodesPreMeta,
        ctLymphNodesPre.isAcceptableOrUnknown(
          data['ct_lymph_nodes_pre']!,
          _ctLymphNodesPreMeta,
        ),
      );
    }
    if (data.containsKey('ct_lymph_nodes_post')) {
      context.handle(
        _ctLymphNodesPostMeta,
        ctLymphNodesPost.isAcceptableOrUnknown(
          data['ct_lymph_nodes_post']!,
          _ctLymphNodesPostMeta,
        ),
      );
    }
    if (data.containsKey('kelim_score')) {
      context.handle(
        _kelimScoreMeta,
        kelimScore.isAcceptableOrUnknown(data['kelim_score']!, _kelimScoreMeta),
      );
    }
    if (data.containsKey('crs_omentum')) {
      context.handle(
        _crsOmentumMeta,
        crsOmentum.isAcceptableOrUnknown(data['crs_omentum']!, _crsOmentumMeta),
      );
    }
    if (data.containsKey('crs_adnexa')) {
      context.handle(
        _crsAdnexaMeta,
        crsAdnexa.isAcceptableOrUnknown(data['crs_adnexa']!, _crsAdnexaMeta),
      );
    }
    if (data.containsKey('crs_other_sites')) {
      context.handle(
        _crsOtherSitesMeta,
        crsOtherSites.isAcceptableOrUnknown(
          data['crs_other_sites']!,
          _crsOtherSitesMeta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CytoreductionCtFinding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CytoreductionCtFinding(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      chemoResponseScore: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chemo_response_score'],
      ),
      pci: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pci'],
      ),
      cytoreductiveLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cytoreductive_level'],
      ),
      ctLiverPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_liver_pre'],
      ),
      ctLiverPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_liver_post'],
      ),
      ctGallBladderPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_gall_bladder_pre'],
      ),
      ctGallBladderPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_gall_bladder_post'],
      ),
      ctSpleenPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_spleen_pre'],
      ),
      ctSpleenPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_spleen_post'],
      ),
      ctPancreasPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_pancreas_pre'],
      ),
      ctPancreasPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_pancreas_post'],
      ),
      ctSuprarenalsPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_suprarenals_pre'],
      ),
      ctSuprarenalsPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_suprarenals_post'],
      ),
      ctKidneyPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_kidney_pre'],
      ),
      ctKidneyPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_kidney_post'],
      ),
      ctBowelPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_bowel_pre'],
      ),
      ctBowelPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_bowel_post'],
      ),
      ctAortaIvcPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_aorta_ivc_pre'],
      ),
      ctAortaIvcPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_aorta_ivc_post'],
      ),
      ctUrinaryBladderPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_urinary_bladder_pre'],
      ),
      ctUrinaryBladderPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_urinary_bladder_post'],
      ),
      ctUterusOvariesPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_uterus_ovaries_pre'],
      ),
      ctUterusOvariesPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_uterus_ovaries_post'],
      ),
      ctLymphNodesPre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_lymph_nodes_pre'],
      ),
      ctLymphNodesPost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ct_lymph_nodes_post'],
      ),
      kelimScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kelim_score'],
      ),
      crsOmentum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crs_omentum'],
      ),
      crsAdnexa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crs_adnexa'],
      ),
      crsOtherSites: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crs_other_sites'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $CytoreductionCtFindingsTable createAlias(String alias) {
    return $CytoreductionCtFindingsTable(attachedDatabase, alias);
  }
}

class CytoreductionCtFinding extends DataClass
    implements Insertable<CytoreductionCtFinding> {
  final int id;
  final int patientId;
  final String? chemoResponseScore;
  final double? pci;
  final String? cytoreductiveLevel;
  final String? ctLiverPre;
  final String? ctLiverPost;
  final String? ctGallBladderPre;
  final String? ctGallBladderPost;
  final String? ctSpleenPre;
  final String? ctSpleenPost;
  final String? ctPancreasPre;
  final String? ctPancreasPost;
  final String? ctSuprarenalsPre;
  final String? ctSuprarenalsPost;
  final String? ctKidneyPre;
  final String? ctKidneyPost;
  final String? ctBowelPre;
  final String? ctBowelPost;
  final String? ctAortaIvcPre;
  final String? ctAortaIvcPost;
  final String? ctUrinaryBladderPre;
  final String? ctUrinaryBladderPost;
  final String? ctUterusOvariesPre;
  final String? ctUterusOvariesPost;
  final String? ctLymphNodesPre;
  final String? ctLymphNodesPost;
  final double? kelimScore;
  final String? crsOmentum;
  final String? crsAdnexa;
  final String? crsOtherSites;
  final DateTime recordedAt;
  const CytoreductionCtFinding({
    required this.id,
    required this.patientId,
    this.chemoResponseScore,
    this.pci,
    this.cytoreductiveLevel,
    this.ctLiverPre,
    this.ctLiverPost,
    this.ctGallBladderPre,
    this.ctGallBladderPost,
    this.ctSpleenPre,
    this.ctSpleenPost,
    this.ctPancreasPre,
    this.ctPancreasPost,
    this.ctSuprarenalsPre,
    this.ctSuprarenalsPost,
    this.ctKidneyPre,
    this.ctKidneyPost,
    this.ctBowelPre,
    this.ctBowelPost,
    this.ctAortaIvcPre,
    this.ctAortaIvcPost,
    this.ctUrinaryBladderPre,
    this.ctUrinaryBladderPost,
    this.ctUterusOvariesPre,
    this.ctUterusOvariesPost,
    this.ctLymphNodesPre,
    this.ctLymphNodesPost,
    this.kelimScore,
    this.crsOmentum,
    this.crsAdnexa,
    this.crsOtherSites,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    if (!nullToAbsent || chemoResponseScore != null) {
      map['chemo_response_score'] = Variable<String>(chemoResponseScore);
    }
    if (!nullToAbsent || pci != null) {
      map['pci'] = Variable<double>(pci);
    }
    if (!nullToAbsent || cytoreductiveLevel != null) {
      map['cytoreductive_level'] = Variable<String>(cytoreductiveLevel);
    }
    if (!nullToAbsent || ctLiverPre != null) {
      map['ct_liver_pre'] = Variable<String>(ctLiverPre);
    }
    if (!nullToAbsent || ctLiverPost != null) {
      map['ct_liver_post'] = Variable<String>(ctLiverPost);
    }
    if (!nullToAbsent || ctGallBladderPre != null) {
      map['ct_gall_bladder_pre'] = Variable<String>(ctGallBladderPre);
    }
    if (!nullToAbsent || ctGallBladderPost != null) {
      map['ct_gall_bladder_post'] = Variable<String>(ctGallBladderPost);
    }
    if (!nullToAbsent || ctSpleenPre != null) {
      map['ct_spleen_pre'] = Variable<String>(ctSpleenPre);
    }
    if (!nullToAbsent || ctSpleenPost != null) {
      map['ct_spleen_post'] = Variable<String>(ctSpleenPost);
    }
    if (!nullToAbsent || ctPancreasPre != null) {
      map['ct_pancreas_pre'] = Variable<String>(ctPancreasPre);
    }
    if (!nullToAbsent || ctPancreasPost != null) {
      map['ct_pancreas_post'] = Variable<String>(ctPancreasPost);
    }
    if (!nullToAbsent || ctSuprarenalsPre != null) {
      map['ct_suprarenals_pre'] = Variable<String>(ctSuprarenalsPre);
    }
    if (!nullToAbsent || ctSuprarenalsPost != null) {
      map['ct_suprarenals_post'] = Variable<String>(ctSuprarenalsPost);
    }
    if (!nullToAbsent || ctKidneyPre != null) {
      map['ct_kidney_pre'] = Variable<String>(ctKidneyPre);
    }
    if (!nullToAbsent || ctKidneyPost != null) {
      map['ct_kidney_post'] = Variable<String>(ctKidneyPost);
    }
    if (!nullToAbsent || ctBowelPre != null) {
      map['ct_bowel_pre'] = Variable<String>(ctBowelPre);
    }
    if (!nullToAbsent || ctBowelPost != null) {
      map['ct_bowel_post'] = Variable<String>(ctBowelPost);
    }
    if (!nullToAbsent || ctAortaIvcPre != null) {
      map['ct_aorta_ivc_pre'] = Variable<String>(ctAortaIvcPre);
    }
    if (!nullToAbsent || ctAortaIvcPost != null) {
      map['ct_aorta_ivc_post'] = Variable<String>(ctAortaIvcPost);
    }
    if (!nullToAbsent || ctUrinaryBladderPre != null) {
      map['ct_urinary_bladder_pre'] = Variable<String>(ctUrinaryBladderPre);
    }
    if (!nullToAbsent || ctUrinaryBladderPost != null) {
      map['ct_urinary_bladder_post'] = Variable<String>(ctUrinaryBladderPost);
    }
    if (!nullToAbsent || ctUterusOvariesPre != null) {
      map['ct_uterus_ovaries_pre'] = Variable<String>(ctUterusOvariesPre);
    }
    if (!nullToAbsent || ctUterusOvariesPost != null) {
      map['ct_uterus_ovaries_post'] = Variable<String>(ctUterusOvariesPost);
    }
    if (!nullToAbsent || ctLymphNodesPre != null) {
      map['ct_lymph_nodes_pre'] = Variable<String>(ctLymphNodesPre);
    }
    if (!nullToAbsent || ctLymphNodesPost != null) {
      map['ct_lymph_nodes_post'] = Variable<String>(ctLymphNodesPost);
    }
    if (!nullToAbsent || kelimScore != null) {
      map['kelim_score'] = Variable<double>(kelimScore);
    }
    if (!nullToAbsent || crsOmentum != null) {
      map['crs_omentum'] = Variable<String>(crsOmentum);
    }
    if (!nullToAbsent || crsAdnexa != null) {
      map['crs_adnexa'] = Variable<String>(crsAdnexa);
    }
    if (!nullToAbsent || crsOtherSites != null) {
      map['crs_other_sites'] = Variable<String>(crsOtherSites);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  CytoreductionCtFindingsCompanion toCompanion(bool nullToAbsent) {
    return CytoreductionCtFindingsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      chemoResponseScore: chemoResponseScore == null && nullToAbsent
          ? const Value.absent()
          : Value(chemoResponseScore),
      pci: pci == null && nullToAbsent ? const Value.absent() : Value(pci),
      cytoreductiveLevel: cytoreductiveLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(cytoreductiveLevel),
      ctLiverPre: ctLiverPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctLiverPre),
      ctLiverPost: ctLiverPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctLiverPost),
      ctGallBladderPre: ctGallBladderPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctGallBladderPre),
      ctGallBladderPost: ctGallBladderPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctGallBladderPost),
      ctSpleenPre: ctSpleenPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctSpleenPre),
      ctSpleenPost: ctSpleenPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctSpleenPost),
      ctPancreasPre: ctPancreasPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctPancreasPre),
      ctPancreasPost: ctPancreasPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctPancreasPost),
      ctSuprarenalsPre: ctSuprarenalsPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctSuprarenalsPre),
      ctSuprarenalsPost: ctSuprarenalsPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctSuprarenalsPost),
      ctKidneyPre: ctKidneyPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctKidneyPre),
      ctKidneyPost: ctKidneyPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctKidneyPost),
      ctBowelPre: ctBowelPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctBowelPre),
      ctBowelPost: ctBowelPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctBowelPost),
      ctAortaIvcPre: ctAortaIvcPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctAortaIvcPre),
      ctAortaIvcPost: ctAortaIvcPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctAortaIvcPost),
      ctUrinaryBladderPre: ctUrinaryBladderPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctUrinaryBladderPre),
      ctUrinaryBladderPost: ctUrinaryBladderPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctUrinaryBladderPost),
      ctUterusOvariesPre: ctUterusOvariesPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctUterusOvariesPre),
      ctUterusOvariesPost: ctUterusOvariesPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctUterusOvariesPost),
      ctLymphNodesPre: ctLymphNodesPre == null && nullToAbsent
          ? const Value.absent()
          : Value(ctLymphNodesPre),
      ctLymphNodesPost: ctLymphNodesPost == null && nullToAbsent
          ? const Value.absent()
          : Value(ctLymphNodesPost),
      kelimScore: kelimScore == null && nullToAbsent
          ? const Value.absent()
          : Value(kelimScore),
      crsOmentum: crsOmentum == null && nullToAbsent
          ? const Value.absent()
          : Value(crsOmentum),
      crsAdnexa: crsAdnexa == null && nullToAbsent
          ? const Value.absent()
          : Value(crsAdnexa),
      crsOtherSites: crsOtherSites == null && nullToAbsent
          ? const Value.absent()
          : Value(crsOtherSites),
      recordedAt: Value(recordedAt),
    );
  }

  factory CytoreductionCtFinding.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CytoreductionCtFinding(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      chemoResponseScore: serializer.fromJson<String?>(
        json['chemoResponseScore'],
      ),
      pci: serializer.fromJson<double?>(json['pci']),
      cytoreductiveLevel: serializer.fromJson<String?>(
        json['cytoreductiveLevel'],
      ),
      ctLiverPre: serializer.fromJson<String?>(json['ctLiverPre']),
      ctLiverPost: serializer.fromJson<String?>(json['ctLiverPost']),
      ctGallBladderPre: serializer.fromJson<String?>(json['ctGallBladderPre']),
      ctGallBladderPost: serializer.fromJson<String?>(
        json['ctGallBladderPost'],
      ),
      ctSpleenPre: serializer.fromJson<String?>(json['ctSpleenPre']),
      ctSpleenPost: serializer.fromJson<String?>(json['ctSpleenPost']),
      ctPancreasPre: serializer.fromJson<String?>(json['ctPancreasPre']),
      ctPancreasPost: serializer.fromJson<String?>(json['ctPancreasPost']),
      ctSuprarenalsPre: serializer.fromJson<String?>(json['ctSuprarenalsPre']),
      ctSuprarenalsPost: serializer.fromJson<String?>(
        json['ctSuprarenalsPost'],
      ),
      ctKidneyPre: serializer.fromJson<String?>(json['ctKidneyPre']),
      ctKidneyPost: serializer.fromJson<String?>(json['ctKidneyPost']),
      ctBowelPre: serializer.fromJson<String?>(json['ctBowelPre']),
      ctBowelPost: serializer.fromJson<String?>(json['ctBowelPost']),
      ctAortaIvcPre: serializer.fromJson<String?>(json['ctAortaIvcPre']),
      ctAortaIvcPost: serializer.fromJson<String?>(json['ctAortaIvcPost']),
      ctUrinaryBladderPre: serializer.fromJson<String?>(
        json['ctUrinaryBladderPre'],
      ),
      ctUrinaryBladderPost: serializer.fromJson<String?>(
        json['ctUrinaryBladderPost'],
      ),
      ctUterusOvariesPre: serializer.fromJson<String?>(
        json['ctUterusOvariesPre'],
      ),
      ctUterusOvariesPost: serializer.fromJson<String?>(
        json['ctUterusOvariesPost'],
      ),
      ctLymphNodesPre: serializer.fromJson<String?>(json['ctLymphNodesPre']),
      ctLymphNodesPost: serializer.fromJson<String?>(json['ctLymphNodesPost']),
      kelimScore: serializer.fromJson<double?>(json['kelimScore']),
      crsOmentum: serializer.fromJson<String?>(json['crsOmentum']),
      crsAdnexa: serializer.fromJson<String?>(json['crsAdnexa']),
      crsOtherSites: serializer.fromJson<String?>(json['crsOtherSites']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'chemoResponseScore': serializer.toJson<String?>(chemoResponseScore),
      'pci': serializer.toJson<double?>(pci),
      'cytoreductiveLevel': serializer.toJson<String?>(cytoreductiveLevel),
      'ctLiverPre': serializer.toJson<String?>(ctLiverPre),
      'ctLiverPost': serializer.toJson<String?>(ctLiverPost),
      'ctGallBladderPre': serializer.toJson<String?>(ctGallBladderPre),
      'ctGallBladderPost': serializer.toJson<String?>(ctGallBladderPost),
      'ctSpleenPre': serializer.toJson<String?>(ctSpleenPre),
      'ctSpleenPost': serializer.toJson<String?>(ctSpleenPost),
      'ctPancreasPre': serializer.toJson<String?>(ctPancreasPre),
      'ctPancreasPost': serializer.toJson<String?>(ctPancreasPost),
      'ctSuprarenalsPre': serializer.toJson<String?>(ctSuprarenalsPre),
      'ctSuprarenalsPost': serializer.toJson<String?>(ctSuprarenalsPost),
      'ctKidneyPre': serializer.toJson<String?>(ctKidneyPre),
      'ctKidneyPost': serializer.toJson<String?>(ctKidneyPost),
      'ctBowelPre': serializer.toJson<String?>(ctBowelPre),
      'ctBowelPost': serializer.toJson<String?>(ctBowelPost),
      'ctAortaIvcPre': serializer.toJson<String?>(ctAortaIvcPre),
      'ctAortaIvcPost': serializer.toJson<String?>(ctAortaIvcPost),
      'ctUrinaryBladderPre': serializer.toJson<String?>(ctUrinaryBladderPre),
      'ctUrinaryBladderPost': serializer.toJson<String?>(ctUrinaryBladderPost),
      'ctUterusOvariesPre': serializer.toJson<String?>(ctUterusOvariesPre),
      'ctUterusOvariesPost': serializer.toJson<String?>(ctUterusOvariesPost),
      'ctLymphNodesPre': serializer.toJson<String?>(ctLymphNodesPre),
      'ctLymphNodesPost': serializer.toJson<String?>(ctLymphNodesPost),
      'kelimScore': serializer.toJson<double?>(kelimScore),
      'crsOmentum': serializer.toJson<String?>(crsOmentum),
      'crsAdnexa': serializer.toJson<String?>(crsAdnexa),
      'crsOtherSites': serializer.toJson<String?>(crsOtherSites),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  CytoreductionCtFinding copyWith({
    int? id,
    int? patientId,
    Value<String?> chemoResponseScore = const Value.absent(),
    Value<double?> pci = const Value.absent(),
    Value<String?> cytoreductiveLevel = const Value.absent(),
    Value<String?> ctLiverPre = const Value.absent(),
    Value<String?> ctLiverPost = const Value.absent(),
    Value<String?> ctGallBladderPre = const Value.absent(),
    Value<String?> ctGallBladderPost = const Value.absent(),
    Value<String?> ctSpleenPre = const Value.absent(),
    Value<String?> ctSpleenPost = const Value.absent(),
    Value<String?> ctPancreasPre = const Value.absent(),
    Value<String?> ctPancreasPost = const Value.absent(),
    Value<String?> ctSuprarenalsPre = const Value.absent(),
    Value<String?> ctSuprarenalsPost = const Value.absent(),
    Value<String?> ctKidneyPre = const Value.absent(),
    Value<String?> ctKidneyPost = const Value.absent(),
    Value<String?> ctBowelPre = const Value.absent(),
    Value<String?> ctBowelPost = const Value.absent(),
    Value<String?> ctAortaIvcPre = const Value.absent(),
    Value<String?> ctAortaIvcPost = const Value.absent(),
    Value<String?> ctUrinaryBladderPre = const Value.absent(),
    Value<String?> ctUrinaryBladderPost = const Value.absent(),
    Value<String?> ctUterusOvariesPre = const Value.absent(),
    Value<String?> ctUterusOvariesPost = const Value.absent(),
    Value<String?> ctLymphNodesPre = const Value.absent(),
    Value<String?> ctLymphNodesPost = const Value.absent(),
    Value<double?> kelimScore = const Value.absent(),
    Value<String?> crsOmentum = const Value.absent(),
    Value<String?> crsAdnexa = const Value.absent(),
    Value<String?> crsOtherSites = const Value.absent(),
    DateTime? recordedAt,
  }) => CytoreductionCtFinding(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    chemoResponseScore: chemoResponseScore.present
        ? chemoResponseScore.value
        : this.chemoResponseScore,
    pci: pci.present ? pci.value : this.pci,
    cytoreductiveLevel: cytoreductiveLevel.present
        ? cytoreductiveLevel.value
        : this.cytoreductiveLevel,
    ctLiverPre: ctLiverPre.present ? ctLiverPre.value : this.ctLiverPre,
    ctLiverPost: ctLiverPost.present ? ctLiverPost.value : this.ctLiverPost,
    ctGallBladderPre: ctGallBladderPre.present
        ? ctGallBladderPre.value
        : this.ctGallBladderPre,
    ctGallBladderPost: ctGallBladderPost.present
        ? ctGallBladderPost.value
        : this.ctGallBladderPost,
    ctSpleenPre: ctSpleenPre.present ? ctSpleenPre.value : this.ctSpleenPre,
    ctSpleenPost: ctSpleenPost.present ? ctSpleenPost.value : this.ctSpleenPost,
    ctPancreasPre: ctPancreasPre.present
        ? ctPancreasPre.value
        : this.ctPancreasPre,
    ctPancreasPost: ctPancreasPost.present
        ? ctPancreasPost.value
        : this.ctPancreasPost,
    ctSuprarenalsPre: ctSuprarenalsPre.present
        ? ctSuprarenalsPre.value
        : this.ctSuprarenalsPre,
    ctSuprarenalsPost: ctSuprarenalsPost.present
        ? ctSuprarenalsPost.value
        : this.ctSuprarenalsPost,
    ctKidneyPre: ctKidneyPre.present ? ctKidneyPre.value : this.ctKidneyPre,
    ctKidneyPost: ctKidneyPost.present ? ctKidneyPost.value : this.ctKidneyPost,
    ctBowelPre: ctBowelPre.present ? ctBowelPre.value : this.ctBowelPre,
    ctBowelPost: ctBowelPost.present ? ctBowelPost.value : this.ctBowelPost,
    ctAortaIvcPre: ctAortaIvcPre.present
        ? ctAortaIvcPre.value
        : this.ctAortaIvcPre,
    ctAortaIvcPost: ctAortaIvcPost.present
        ? ctAortaIvcPost.value
        : this.ctAortaIvcPost,
    ctUrinaryBladderPre: ctUrinaryBladderPre.present
        ? ctUrinaryBladderPre.value
        : this.ctUrinaryBladderPre,
    ctUrinaryBladderPost: ctUrinaryBladderPost.present
        ? ctUrinaryBladderPost.value
        : this.ctUrinaryBladderPost,
    ctUterusOvariesPre: ctUterusOvariesPre.present
        ? ctUterusOvariesPre.value
        : this.ctUterusOvariesPre,
    ctUterusOvariesPost: ctUterusOvariesPost.present
        ? ctUterusOvariesPost.value
        : this.ctUterusOvariesPost,
    ctLymphNodesPre: ctLymphNodesPre.present
        ? ctLymphNodesPre.value
        : this.ctLymphNodesPre,
    ctLymphNodesPost: ctLymphNodesPost.present
        ? ctLymphNodesPost.value
        : this.ctLymphNodesPost,
    kelimScore: kelimScore.present ? kelimScore.value : this.kelimScore,
    crsOmentum: crsOmentum.present ? crsOmentum.value : this.crsOmentum,
    crsAdnexa: crsAdnexa.present ? crsAdnexa.value : this.crsAdnexa,
    crsOtherSites: crsOtherSites.present
        ? crsOtherSites.value
        : this.crsOtherSites,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  CytoreductionCtFinding copyWithCompanion(
    CytoreductionCtFindingsCompanion data,
  ) {
    return CytoreductionCtFinding(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      chemoResponseScore: data.chemoResponseScore.present
          ? data.chemoResponseScore.value
          : this.chemoResponseScore,
      pci: data.pci.present ? data.pci.value : this.pci,
      cytoreductiveLevel: data.cytoreductiveLevel.present
          ? data.cytoreductiveLevel.value
          : this.cytoreductiveLevel,
      ctLiverPre: data.ctLiverPre.present
          ? data.ctLiverPre.value
          : this.ctLiverPre,
      ctLiverPost: data.ctLiverPost.present
          ? data.ctLiverPost.value
          : this.ctLiverPost,
      ctGallBladderPre: data.ctGallBladderPre.present
          ? data.ctGallBladderPre.value
          : this.ctGallBladderPre,
      ctGallBladderPost: data.ctGallBladderPost.present
          ? data.ctGallBladderPost.value
          : this.ctGallBladderPost,
      ctSpleenPre: data.ctSpleenPre.present
          ? data.ctSpleenPre.value
          : this.ctSpleenPre,
      ctSpleenPost: data.ctSpleenPost.present
          ? data.ctSpleenPost.value
          : this.ctSpleenPost,
      ctPancreasPre: data.ctPancreasPre.present
          ? data.ctPancreasPre.value
          : this.ctPancreasPre,
      ctPancreasPost: data.ctPancreasPost.present
          ? data.ctPancreasPost.value
          : this.ctPancreasPost,
      ctSuprarenalsPre: data.ctSuprarenalsPre.present
          ? data.ctSuprarenalsPre.value
          : this.ctSuprarenalsPre,
      ctSuprarenalsPost: data.ctSuprarenalsPost.present
          ? data.ctSuprarenalsPost.value
          : this.ctSuprarenalsPost,
      ctKidneyPre: data.ctKidneyPre.present
          ? data.ctKidneyPre.value
          : this.ctKidneyPre,
      ctKidneyPost: data.ctKidneyPost.present
          ? data.ctKidneyPost.value
          : this.ctKidneyPost,
      ctBowelPre: data.ctBowelPre.present
          ? data.ctBowelPre.value
          : this.ctBowelPre,
      ctBowelPost: data.ctBowelPost.present
          ? data.ctBowelPost.value
          : this.ctBowelPost,
      ctAortaIvcPre: data.ctAortaIvcPre.present
          ? data.ctAortaIvcPre.value
          : this.ctAortaIvcPre,
      ctAortaIvcPost: data.ctAortaIvcPost.present
          ? data.ctAortaIvcPost.value
          : this.ctAortaIvcPost,
      ctUrinaryBladderPre: data.ctUrinaryBladderPre.present
          ? data.ctUrinaryBladderPre.value
          : this.ctUrinaryBladderPre,
      ctUrinaryBladderPost: data.ctUrinaryBladderPost.present
          ? data.ctUrinaryBladderPost.value
          : this.ctUrinaryBladderPost,
      ctUterusOvariesPre: data.ctUterusOvariesPre.present
          ? data.ctUterusOvariesPre.value
          : this.ctUterusOvariesPre,
      ctUterusOvariesPost: data.ctUterusOvariesPost.present
          ? data.ctUterusOvariesPost.value
          : this.ctUterusOvariesPost,
      ctLymphNodesPre: data.ctLymphNodesPre.present
          ? data.ctLymphNodesPre.value
          : this.ctLymphNodesPre,
      ctLymphNodesPost: data.ctLymphNodesPost.present
          ? data.ctLymphNodesPost.value
          : this.ctLymphNodesPost,
      kelimScore: data.kelimScore.present
          ? data.kelimScore.value
          : this.kelimScore,
      crsOmentum: data.crsOmentum.present
          ? data.crsOmentum.value
          : this.crsOmentum,
      crsAdnexa: data.crsAdnexa.present ? data.crsAdnexa.value : this.crsAdnexa,
      crsOtherSites: data.crsOtherSites.present
          ? data.crsOtherSites.value
          : this.crsOtherSites,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CytoreductionCtFinding(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('chemoResponseScore: $chemoResponseScore, ')
          ..write('pci: $pci, ')
          ..write('cytoreductiveLevel: $cytoreductiveLevel, ')
          ..write('ctLiverPre: $ctLiverPre, ')
          ..write('ctLiverPost: $ctLiverPost, ')
          ..write('ctGallBladderPre: $ctGallBladderPre, ')
          ..write('ctGallBladderPost: $ctGallBladderPost, ')
          ..write('ctSpleenPre: $ctSpleenPre, ')
          ..write('ctSpleenPost: $ctSpleenPost, ')
          ..write('ctPancreasPre: $ctPancreasPre, ')
          ..write('ctPancreasPost: $ctPancreasPost, ')
          ..write('ctSuprarenalsPre: $ctSuprarenalsPre, ')
          ..write('ctSuprarenalsPost: $ctSuprarenalsPost, ')
          ..write('ctKidneyPre: $ctKidneyPre, ')
          ..write('ctKidneyPost: $ctKidneyPost, ')
          ..write('ctBowelPre: $ctBowelPre, ')
          ..write('ctBowelPost: $ctBowelPost, ')
          ..write('ctAortaIvcPre: $ctAortaIvcPre, ')
          ..write('ctAortaIvcPost: $ctAortaIvcPost, ')
          ..write('ctUrinaryBladderPre: $ctUrinaryBladderPre, ')
          ..write('ctUrinaryBladderPost: $ctUrinaryBladderPost, ')
          ..write('ctUterusOvariesPre: $ctUterusOvariesPre, ')
          ..write('ctUterusOvariesPost: $ctUterusOvariesPost, ')
          ..write('ctLymphNodesPre: $ctLymphNodesPre, ')
          ..write('ctLymphNodesPost: $ctLymphNodesPost, ')
          ..write('kelimScore: $kelimScore, ')
          ..write('crsOmentum: $crsOmentum, ')
          ..write('crsAdnexa: $crsAdnexa, ')
          ..write('crsOtherSites: $crsOtherSites, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    patientId,
    chemoResponseScore,
    pci,
    cytoreductiveLevel,
    ctLiverPre,
    ctLiverPost,
    ctGallBladderPre,
    ctGallBladderPost,
    ctSpleenPre,
    ctSpleenPost,
    ctPancreasPre,
    ctPancreasPost,
    ctSuprarenalsPre,
    ctSuprarenalsPost,
    ctKidneyPre,
    ctKidneyPost,
    ctBowelPre,
    ctBowelPost,
    ctAortaIvcPre,
    ctAortaIvcPost,
    ctUrinaryBladderPre,
    ctUrinaryBladderPost,
    ctUterusOvariesPre,
    ctUterusOvariesPost,
    ctLymphNodesPre,
    ctLymphNodesPost,
    kelimScore,
    crsOmentum,
    crsAdnexa,
    crsOtherSites,
    recordedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CytoreductionCtFinding &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.chemoResponseScore == this.chemoResponseScore &&
          other.pci == this.pci &&
          other.cytoreductiveLevel == this.cytoreductiveLevel &&
          other.ctLiverPre == this.ctLiverPre &&
          other.ctLiverPost == this.ctLiverPost &&
          other.ctGallBladderPre == this.ctGallBladderPre &&
          other.ctGallBladderPost == this.ctGallBladderPost &&
          other.ctSpleenPre == this.ctSpleenPre &&
          other.ctSpleenPost == this.ctSpleenPost &&
          other.ctPancreasPre == this.ctPancreasPre &&
          other.ctPancreasPost == this.ctPancreasPost &&
          other.ctSuprarenalsPre == this.ctSuprarenalsPre &&
          other.ctSuprarenalsPost == this.ctSuprarenalsPost &&
          other.ctKidneyPre == this.ctKidneyPre &&
          other.ctKidneyPost == this.ctKidneyPost &&
          other.ctBowelPre == this.ctBowelPre &&
          other.ctBowelPost == this.ctBowelPost &&
          other.ctAortaIvcPre == this.ctAortaIvcPre &&
          other.ctAortaIvcPost == this.ctAortaIvcPost &&
          other.ctUrinaryBladderPre == this.ctUrinaryBladderPre &&
          other.ctUrinaryBladderPost == this.ctUrinaryBladderPost &&
          other.ctUterusOvariesPre == this.ctUterusOvariesPre &&
          other.ctUterusOvariesPost == this.ctUterusOvariesPost &&
          other.ctLymphNodesPre == this.ctLymphNodesPre &&
          other.ctLymphNodesPost == this.ctLymphNodesPost &&
          other.kelimScore == this.kelimScore &&
          other.crsOmentum == this.crsOmentum &&
          other.crsAdnexa == this.crsAdnexa &&
          other.crsOtherSites == this.crsOtherSites &&
          other.recordedAt == this.recordedAt);
}

class CytoreductionCtFindingsCompanion
    extends UpdateCompanion<CytoreductionCtFinding> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<String?> chemoResponseScore;
  final Value<double?> pci;
  final Value<String?> cytoreductiveLevel;
  final Value<String?> ctLiverPre;
  final Value<String?> ctLiverPost;
  final Value<String?> ctGallBladderPre;
  final Value<String?> ctGallBladderPost;
  final Value<String?> ctSpleenPre;
  final Value<String?> ctSpleenPost;
  final Value<String?> ctPancreasPre;
  final Value<String?> ctPancreasPost;
  final Value<String?> ctSuprarenalsPre;
  final Value<String?> ctSuprarenalsPost;
  final Value<String?> ctKidneyPre;
  final Value<String?> ctKidneyPost;
  final Value<String?> ctBowelPre;
  final Value<String?> ctBowelPost;
  final Value<String?> ctAortaIvcPre;
  final Value<String?> ctAortaIvcPost;
  final Value<String?> ctUrinaryBladderPre;
  final Value<String?> ctUrinaryBladderPost;
  final Value<String?> ctUterusOvariesPre;
  final Value<String?> ctUterusOvariesPost;
  final Value<String?> ctLymphNodesPre;
  final Value<String?> ctLymphNodesPost;
  final Value<double?> kelimScore;
  final Value<String?> crsOmentum;
  final Value<String?> crsAdnexa;
  final Value<String?> crsOtherSites;
  final Value<DateTime> recordedAt;
  const CytoreductionCtFindingsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.chemoResponseScore = const Value.absent(),
    this.pci = const Value.absent(),
    this.cytoreductiveLevel = const Value.absent(),
    this.ctLiverPre = const Value.absent(),
    this.ctLiverPost = const Value.absent(),
    this.ctGallBladderPre = const Value.absent(),
    this.ctGallBladderPost = const Value.absent(),
    this.ctSpleenPre = const Value.absent(),
    this.ctSpleenPost = const Value.absent(),
    this.ctPancreasPre = const Value.absent(),
    this.ctPancreasPost = const Value.absent(),
    this.ctSuprarenalsPre = const Value.absent(),
    this.ctSuprarenalsPost = const Value.absent(),
    this.ctKidneyPre = const Value.absent(),
    this.ctKidneyPost = const Value.absent(),
    this.ctBowelPre = const Value.absent(),
    this.ctBowelPost = const Value.absent(),
    this.ctAortaIvcPre = const Value.absent(),
    this.ctAortaIvcPost = const Value.absent(),
    this.ctUrinaryBladderPre = const Value.absent(),
    this.ctUrinaryBladderPost = const Value.absent(),
    this.ctUterusOvariesPre = const Value.absent(),
    this.ctUterusOvariesPost = const Value.absent(),
    this.ctLymphNodesPre = const Value.absent(),
    this.ctLymphNodesPost = const Value.absent(),
    this.kelimScore = const Value.absent(),
    this.crsOmentum = const Value.absent(),
    this.crsAdnexa = const Value.absent(),
    this.crsOtherSites = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  CytoreductionCtFindingsCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.chemoResponseScore = const Value.absent(),
    this.pci = const Value.absent(),
    this.cytoreductiveLevel = const Value.absent(),
    this.ctLiverPre = const Value.absent(),
    this.ctLiverPost = const Value.absent(),
    this.ctGallBladderPre = const Value.absent(),
    this.ctGallBladderPost = const Value.absent(),
    this.ctSpleenPre = const Value.absent(),
    this.ctSpleenPost = const Value.absent(),
    this.ctPancreasPre = const Value.absent(),
    this.ctPancreasPost = const Value.absent(),
    this.ctSuprarenalsPre = const Value.absent(),
    this.ctSuprarenalsPost = const Value.absent(),
    this.ctKidneyPre = const Value.absent(),
    this.ctKidneyPost = const Value.absent(),
    this.ctBowelPre = const Value.absent(),
    this.ctBowelPost = const Value.absent(),
    this.ctAortaIvcPre = const Value.absent(),
    this.ctAortaIvcPost = const Value.absent(),
    this.ctUrinaryBladderPre = const Value.absent(),
    this.ctUrinaryBladderPost = const Value.absent(),
    this.ctUterusOvariesPre = const Value.absent(),
    this.ctUterusOvariesPost = const Value.absent(),
    this.ctLymphNodesPre = const Value.absent(),
    this.ctLymphNodesPost = const Value.absent(),
    this.kelimScore = const Value.absent(),
    this.crsOmentum = const Value.absent(),
    this.crsAdnexa = const Value.absent(),
    this.crsOtherSites = const Value.absent(),
    this.recordedAt = const Value.absent(),
  }) : patientId = Value(patientId);
  static Insertable<CytoreductionCtFinding> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<String>? chemoResponseScore,
    Expression<double>? pci,
    Expression<String>? cytoreductiveLevel,
    Expression<String>? ctLiverPre,
    Expression<String>? ctLiverPost,
    Expression<String>? ctGallBladderPre,
    Expression<String>? ctGallBladderPost,
    Expression<String>? ctSpleenPre,
    Expression<String>? ctSpleenPost,
    Expression<String>? ctPancreasPre,
    Expression<String>? ctPancreasPost,
    Expression<String>? ctSuprarenalsPre,
    Expression<String>? ctSuprarenalsPost,
    Expression<String>? ctKidneyPre,
    Expression<String>? ctKidneyPost,
    Expression<String>? ctBowelPre,
    Expression<String>? ctBowelPost,
    Expression<String>? ctAortaIvcPre,
    Expression<String>? ctAortaIvcPost,
    Expression<String>? ctUrinaryBladderPre,
    Expression<String>? ctUrinaryBladderPost,
    Expression<String>? ctUterusOvariesPre,
    Expression<String>? ctUterusOvariesPost,
    Expression<String>? ctLymphNodesPre,
    Expression<String>? ctLymphNodesPost,
    Expression<double>? kelimScore,
    Expression<String>? crsOmentum,
    Expression<String>? crsAdnexa,
    Expression<String>? crsOtherSites,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (chemoResponseScore != null)
        'chemo_response_score': chemoResponseScore,
      if (pci != null) 'pci': pci,
      if (cytoreductiveLevel != null) 'cytoreductive_level': cytoreductiveLevel,
      if (ctLiverPre != null) 'ct_liver_pre': ctLiverPre,
      if (ctLiverPost != null) 'ct_liver_post': ctLiverPost,
      if (ctGallBladderPre != null) 'ct_gall_bladder_pre': ctGallBladderPre,
      if (ctGallBladderPost != null) 'ct_gall_bladder_post': ctGallBladderPost,
      if (ctSpleenPre != null) 'ct_spleen_pre': ctSpleenPre,
      if (ctSpleenPost != null) 'ct_spleen_post': ctSpleenPost,
      if (ctPancreasPre != null) 'ct_pancreas_pre': ctPancreasPre,
      if (ctPancreasPost != null) 'ct_pancreas_post': ctPancreasPost,
      if (ctSuprarenalsPre != null) 'ct_suprarenals_pre': ctSuprarenalsPre,
      if (ctSuprarenalsPost != null) 'ct_suprarenals_post': ctSuprarenalsPost,
      if (ctKidneyPre != null) 'ct_kidney_pre': ctKidneyPre,
      if (ctKidneyPost != null) 'ct_kidney_post': ctKidneyPost,
      if (ctBowelPre != null) 'ct_bowel_pre': ctBowelPre,
      if (ctBowelPost != null) 'ct_bowel_post': ctBowelPost,
      if (ctAortaIvcPre != null) 'ct_aorta_ivc_pre': ctAortaIvcPre,
      if (ctAortaIvcPost != null) 'ct_aorta_ivc_post': ctAortaIvcPost,
      if (ctUrinaryBladderPre != null)
        'ct_urinary_bladder_pre': ctUrinaryBladderPre,
      if (ctUrinaryBladderPost != null)
        'ct_urinary_bladder_post': ctUrinaryBladderPost,
      if (ctUterusOvariesPre != null)
        'ct_uterus_ovaries_pre': ctUterusOvariesPre,
      if (ctUterusOvariesPost != null)
        'ct_uterus_ovaries_post': ctUterusOvariesPost,
      if (ctLymphNodesPre != null) 'ct_lymph_nodes_pre': ctLymphNodesPre,
      if (ctLymphNodesPost != null) 'ct_lymph_nodes_post': ctLymphNodesPost,
      if (kelimScore != null) 'kelim_score': kelimScore,
      if (crsOmentum != null) 'crs_omentum': crsOmentum,
      if (crsAdnexa != null) 'crs_adnexa': crsAdnexa,
      if (crsOtherSites != null) 'crs_other_sites': crsOtherSites,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  CytoreductionCtFindingsCompanion copyWith({
    Value<int>? id,
    Value<int>? patientId,
    Value<String?>? chemoResponseScore,
    Value<double?>? pci,
    Value<String?>? cytoreductiveLevel,
    Value<String?>? ctLiverPre,
    Value<String?>? ctLiverPost,
    Value<String?>? ctGallBladderPre,
    Value<String?>? ctGallBladderPost,
    Value<String?>? ctSpleenPre,
    Value<String?>? ctSpleenPost,
    Value<String?>? ctPancreasPre,
    Value<String?>? ctPancreasPost,
    Value<String?>? ctSuprarenalsPre,
    Value<String?>? ctSuprarenalsPost,
    Value<String?>? ctKidneyPre,
    Value<String?>? ctKidneyPost,
    Value<String?>? ctBowelPre,
    Value<String?>? ctBowelPost,
    Value<String?>? ctAortaIvcPre,
    Value<String?>? ctAortaIvcPost,
    Value<String?>? ctUrinaryBladderPre,
    Value<String?>? ctUrinaryBladderPost,
    Value<String?>? ctUterusOvariesPre,
    Value<String?>? ctUterusOvariesPost,
    Value<String?>? ctLymphNodesPre,
    Value<String?>? ctLymphNodesPost,
    Value<double?>? kelimScore,
    Value<String?>? crsOmentum,
    Value<String?>? crsAdnexa,
    Value<String?>? crsOtherSites,
    Value<DateTime>? recordedAt,
  }) {
    return CytoreductionCtFindingsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      chemoResponseScore: chemoResponseScore ?? this.chemoResponseScore,
      pci: pci ?? this.pci,
      cytoreductiveLevel: cytoreductiveLevel ?? this.cytoreductiveLevel,
      ctLiverPre: ctLiverPre ?? this.ctLiverPre,
      ctLiverPost: ctLiverPost ?? this.ctLiverPost,
      ctGallBladderPre: ctGallBladderPre ?? this.ctGallBladderPre,
      ctGallBladderPost: ctGallBladderPost ?? this.ctGallBladderPost,
      ctSpleenPre: ctSpleenPre ?? this.ctSpleenPre,
      ctSpleenPost: ctSpleenPost ?? this.ctSpleenPost,
      ctPancreasPre: ctPancreasPre ?? this.ctPancreasPre,
      ctPancreasPost: ctPancreasPost ?? this.ctPancreasPost,
      ctSuprarenalsPre: ctSuprarenalsPre ?? this.ctSuprarenalsPre,
      ctSuprarenalsPost: ctSuprarenalsPost ?? this.ctSuprarenalsPost,
      ctKidneyPre: ctKidneyPre ?? this.ctKidneyPre,
      ctKidneyPost: ctKidneyPost ?? this.ctKidneyPost,
      ctBowelPre: ctBowelPre ?? this.ctBowelPre,
      ctBowelPost: ctBowelPost ?? this.ctBowelPost,
      ctAortaIvcPre: ctAortaIvcPre ?? this.ctAortaIvcPre,
      ctAortaIvcPost: ctAortaIvcPost ?? this.ctAortaIvcPost,
      ctUrinaryBladderPre: ctUrinaryBladderPre ?? this.ctUrinaryBladderPre,
      ctUrinaryBladderPost: ctUrinaryBladderPost ?? this.ctUrinaryBladderPost,
      ctUterusOvariesPre: ctUterusOvariesPre ?? this.ctUterusOvariesPre,
      ctUterusOvariesPost: ctUterusOvariesPost ?? this.ctUterusOvariesPost,
      ctLymphNodesPre: ctLymphNodesPre ?? this.ctLymphNodesPre,
      ctLymphNodesPost: ctLymphNodesPost ?? this.ctLymphNodesPost,
      kelimScore: kelimScore ?? this.kelimScore,
      crsOmentum: crsOmentum ?? this.crsOmentum,
      crsAdnexa: crsAdnexa ?? this.crsAdnexa,
      crsOtherSites: crsOtherSites ?? this.crsOtherSites,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (chemoResponseScore.present) {
      map['chemo_response_score'] = Variable<String>(chemoResponseScore.value);
    }
    if (pci.present) {
      map['pci'] = Variable<double>(pci.value);
    }
    if (cytoreductiveLevel.present) {
      map['cytoreductive_level'] = Variable<String>(cytoreductiveLevel.value);
    }
    if (ctLiverPre.present) {
      map['ct_liver_pre'] = Variable<String>(ctLiverPre.value);
    }
    if (ctLiverPost.present) {
      map['ct_liver_post'] = Variable<String>(ctLiverPost.value);
    }
    if (ctGallBladderPre.present) {
      map['ct_gall_bladder_pre'] = Variable<String>(ctGallBladderPre.value);
    }
    if (ctGallBladderPost.present) {
      map['ct_gall_bladder_post'] = Variable<String>(ctGallBladderPost.value);
    }
    if (ctSpleenPre.present) {
      map['ct_spleen_pre'] = Variable<String>(ctSpleenPre.value);
    }
    if (ctSpleenPost.present) {
      map['ct_spleen_post'] = Variable<String>(ctSpleenPost.value);
    }
    if (ctPancreasPre.present) {
      map['ct_pancreas_pre'] = Variable<String>(ctPancreasPre.value);
    }
    if (ctPancreasPost.present) {
      map['ct_pancreas_post'] = Variable<String>(ctPancreasPost.value);
    }
    if (ctSuprarenalsPre.present) {
      map['ct_suprarenals_pre'] = Variable<String>(ctSuprarenalsPre.value);
    }
    if (ctSuprarenalsPost.present) {
      map['ct_suprarenals_post'] = Variable<String>(ctSuprarenalsPost.value);
    }
    if (ctKidneyPre.present) {
      map['ct_kidney_pre'] = Variable<String>(ctKidneyPre.value);
    }
    if (ctKidneyPost.present) {
      map['ct_kidney_post'] = Variable<String>(ctKidneyPost.value);
    }
    if (ctBowelPre.present) {
      map['ct_bowel_pre'] = Variable<String>(ctBowelPre.value);
    }
    if (ctBowelPost.present) {
      map['ct_bowel_post'] = Variable<String>(ctBowelPost.value);
    }
    if (ctAortaIvcPre.present) {
      map['ct_aorta_ivc_pre'] = Variable<String>(ctAortaIvcPre.value);
    }
    if (ctAortaIvcPost.present) {
      map['ct_aorta_ivc_post'] = Variable<String>(ctAortaIvcPost.value);
    }
    if (ctUrinaryBladderPre.present) {
      map['ct_urinary_bladder_pre'] = Variable<String>(
        ctUrinaryBladderPre.value,
      );
    }
    if (ctUrinaryBladderPost.present) {
      map['ct_urinary_bladder_post'] = Variable<String>(
        ctUrinaryBladderPost.value,
      );
    }
    if (ctUterusOvariesPre.present) {
      map['ct_uterus_ovaries_pre'] = Variable<String>(ctUterusOvariesPre.value);
    }
    if (ctUterusOvariesPost.present) {
      map['ct_uterus_ovaries_post'] = Variable<String>(
        ctUterusOvariesPost.value,
      );
    }
    if (ctLymphNodesPre.present) {
      map['ct_lymph_nodes_pre'] = Variable<String>(ctLymphNodesPre.value);
    }
    if (ctLymphNodesPost.present) {
      map['ct_lymph_nodes_post'] = Variable<String>(ctLymphNodesPost.value);
    }
    if (kelimScore.present) {
      map['kelim_score'] = Variable<double>(kelimScore.value);
    }
    if (crsOmentum.present) {
      map['crs_omentum'] = Variable<String>(crsOmentum.value);
    }
    if (crsAdnexa.present) {
      map['crs_adnexa'] = Variable<String>(crsAdnexa.value);
    }
    if (crsOtherSites.present) {
      map['crs_other_sites'] = Variable<String>(crsOtherSites.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CytoreductionCtFindingsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('chemoResponseScore: $chemoResponseScore, ')
          ..write('pci: $pci, ')
          ..write('cytoreductiveLevel: $cytoreductiveLevel, ')
          ..write('ctLiverPre: $ctLiverPre, ')
          ..write('ctLiverPost: $ctLiverPost, ')
          ..write('ctGallBladderPre: $ctGallBladderPre, ')
          ..write('ctGallBladderPost: $ctGallBladderPost, ')
          ..write('ctSpleenPre: $ctSpleenPre, ')
          ..write('ctSpleenPost: $ctSpleenPost, ')
          ..write('ctPancreasPre: $ctPancreasPre, ')
          ..write('ctPancreasPost: $ctPancreasPost, ')
          ..write('ctSuprarenalsPre: $ctSuprarenalsPre, ')
          ..write('ctSuprarenalsPost: $ctSuprarenalsPost, ')
          ..write('ctKidneyPre: $ctKidneyPre, ')
          ..write('ctKidneyPost: $ctKidneyPost, ')
          ..write('ctBowelPre: $ctBowelPre, ')
          ..write('ctBowelPost: $ctBowelPost, ')
          ..write('ctAortaIvcPre: $ctAortaIvcPre, ')
          ..write('ctAortaIvcPost: $ctAortaIvcPost, ')
          ..write('ctUrinaryBladderPre: $ctUrinaryBladderPre, ')
          ..write('ctUrinaryBladderPost: $ctUrinaryBladderPost, ')
          ..write('ctUterusOvariesPre: $ctUterusOvariesPre, ')
          ..write('ctUterusOvariesPost: $ctUterusOvariesPost, ')
          ..write('ctLymphNodesPre: $ctLymphNodesPre, ')
          ..write('ctLymphNodesPost: $ctLymphNodesPost, ')
          ..write('kelimScore: $kelimScore, ')
          ..write('crsOmentum: $crsOmentum, ')
          ..write('crsAdnexa: $crsAdnexa, ')
          ..write('crsOtherSites: $crsOtherSites, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

class $RelapseFollowupsTable extends RelapseFollowups
    with TableInfo<$RelapseFollowupsTable, RelapseFollowup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelapseFollowupsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patients (id)',
    ),
  );
  static const VerificationMeta _recurrenceDateMeta = const VerificationMeta(
    'recurrenceDate',
  );
  @override
  late final GeneratedColumn<DateTime> recurrenceDate =
      GeneratedColumn<DateTime>(
        'recurrence_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _relapseTypeMeta = const VerificationMeta(
    'relapseType',
  );
  @override
  late final GeneratedColumn<String> relapseType = GeneratedColumn<String>(
    'relapse_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _secondLineNeedMeta = const VerificationMeta(
    'secondLineNeed',
  );
  @override
  late final GeneratedColumn<String> secondLineNeed = GeneratedColumn<String>(
    'second_line_need',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pfiMeta = const VerificationMeta('pfi');
  @override
  late final GeneratedColumn<String> pfi = GeneratedColumn<String>(
    'pfi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tfiMeta = const VerificationMeta('tfi');
  @override
  late final GeneratedColumn<String> tfi = GeneratedColumn<String>(
    'tfi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _osMeta = const VerificationMeta('os');
  @override
  late final GeneratedColumn<String> os = GeneratedColumn<String>(
    'os',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    recurrenceDate,
    relapseType,
    secondLineNeed,
    pfi,
    tfi,
    os,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relapse_followups';
  @override
  VerificationContext validateIntegrity(
    Insertable<RelapseFollowup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('recurrence_date')) {
      context.handle(
        _recurrenceDateMeta,
        recurrenceDate.isAcceptableOrUnknown(
          data['recurrence_date']!,
          _recurrenceDateMeta,
        ),
      );
    }
    if (data.containsKey('relapse_type')) {
      context.handle(
        _relapseTypeMeta,
        relapseType.isAcceptableOrUnknown(
          data['relapse_type']!,
          _relapseTypeMeta,
        ),
      );
    }
    if (data.containsKey('second_line_need')) {
      context.handle(
        _secondLineNeedMeta,
        secondLineNeed.isAcceptableOrUnknown(
          data['second_line_need']!,
          _secondLineNeedMeta,
        ),
      );
    }
    if (data.containsKey('pfi')) {
      context.handle(
        _pfiMeta,
        pfi.isAcceptableOrUnknown(data['pfi']!, _pfiMeta),
      );
    }
    if (data.containsKey('tfi')) {
      context.handle(
        _tfiMeta,
        tfi.isAcceptableOrUnknown(data['tfi']!, _tfiMeta),
      );
    }
    if (data.containsKey('os')) {
      context.handle(_osMeta, os.isAcceptableOrUnknown(data['os']!, _osMeta));
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RelapseFollowup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelapseFollowup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      recurrenceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recurrence_date'],
      ),
      relapseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relapse_type'],
      ),
      secondLineNeed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}second_line_need'],
      ),
      pfi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pfi'],
      ),
      tfi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tfi'],
      ),
      os: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}os'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $RelapseFollowupsTable createAlias(String alias) {
    return $RelapseFollowupsTable(attachedDatabase, alias);
  }
}

class RelapseFollowup extends DataClass implements Insertable<RelapseFollowup> {
  final int id;
  final int patientId;
  final DateTime? recurrenceDate;
  final String? relapseType;
  final String? secondLineNeed;
  final String? pfi;
  final String? tfi;
  final String? os;
  final DateTime recordedAt;
  const RelapseFollowup({
    required this.id,
    required this.patientId,
    this.recurrenceDate,
    this.relapseType,
    this.secondLineNeed,
    this.pfi,
    this.tfi,
    this.os,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    if (!nullToAbsent || recurrenceDate != null) {
      map['recurrence_date'] = Variable<DateTime>(recurrenceDate);
    }
    if (!nullToAbsent || relapseType != null) {
      map['relapse_type'] = Variable<String>(relapseType);
    }
    if (!nullToAbsent || secondLineNeed != null) {
      map['second_line_need'] = Variable<String>(secondLineNeed);
    }
    if (!nullToAbsent || pfi != null) {
      map['pfi'] = Variable<String>(pfi);
    }
    if (!nullToAbsent || tfi != null) {
      map['tfi'] = Variable<String>(tfi);
    }
    if (!nullToAbsent || os != null) {
      map['os'] = Variable<String>(os);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  RelapseFollowupsCompanion toCompanion(bool nullToAbsent) {
    return RelapseFollowupsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      recurrenceDate: recurrenceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceDate),
      relapseType: relapseType == null && nullToAbsent
          ? const Value.absent()
          : Value(relapseType),
      secondLineNeed: secondLineNeed == null && nullToAbsent
          ? const Value.absent()
          : Value(secondLineNeed),
      pfi: pfi == null && nullToAbsent ? const Value.absent() : Value(pfi),
      tfi: tfi == null && nullToAbsent ? const Value.absent() : Value(tfi),
      os: os == null && nullToAbsent ? const Value.absent() : Value(os),
      recordedAt: Value(recordedAt),
    );
  }

  factory RelapseFollowup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelapseFollowup(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      recurrenceDate: serializer.fromJson<DateTime?>(json['recurrenceDate']),
      relapseType: serializer.fromJson<String?>(json['relapseType']),
      secondLineNeed: serializer.fromJson<String?>(json['secondLineNeed']),
      pfi: serializer.fromJson<String?>(json['pfi']),
      tfi: serializer.fromJson<String?>(json['tfi']),
      os: serializer.fromJson<String?>(json['os']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'recurrenceDate': serializer.toJson<DateTime?>(recurrenceDate),
      'relapseType': serializer.toJson<String?>(relapseType),
      'secondLineNeed': serializer.toJson<String?>(secondLineNeed),
      'pfi': serializer.toJson<String?>(pfi),
      'tfi': serializer.toJson<String?>(tfi),
      'os': serializer.toJson<String?>(os),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  RelapseFollowup copyWith({
    int? id,
    int? patientId,
    Value<DateTime?> recurrenceDate = const Value.absent(),
    Value<String?> relapseType = const Value.absent(),
    Value<String?> secondLineNeed = const Value.absent(),
    Value<String?> pfi = const Value.absent(),
    Value<String?> tfi = const Value.absent(),
    Value<String?> os = const Value.absent(),
    DateTime? recordedAt,
  }) => RelapseFollowup(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    recurrenceDate: recurrenceDate.present
        ? recurrenceDate.value
        : this.recurrenceDate,
    relapseType: relapseType.present ? relapseType.value : this.relapseType,
    secondLineNeed: secondLineNeed.present
        ? secondLineNeed.value
        : this.secondLineNeed,
    pfi: pfi.present ? pfi.value : this.pfi,
    tfi: tfi.present ? tfi.value : this.tfi,
    os: os.present ? os.value : this.os,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  RelapseFollowup copyWithCompanion(RelapseFollowupsCompanion data) {
    return RelapseFollowup(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      recurrenceDate: data.recurrenceDate.present
          ? data.recurrenceDate.value
          : this.recurrenceDate,
      relapseType: data.relapseType.present
          ? data.relapseType.value
          : this.relapseType,
      secondLineNeed: data.secondLineNeed.present
          ? data.secondLineNeed.value
          : this.secondLineNeed,
      pfi: data.pfi.present ? data.pfi.value : this.pfi,
      tfi: data.tfi.present ? data.tfi.value : this.tfi,
      os: data.os.present ? data.os.value : this.os,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelapseFollowup(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('recurrenceDate: $recurrenceDate, ')
          ..write('relapseType: $relapseType, ')
          ..write('secondLineNeed: $secondLineNeed, ')
          ..write('pfi: $pfi, ')
          ..write('tfi: $tfi, ')
          ..write('os: $os, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    patientId,
    recurrenceDate,
    relapseType,
    secondLineNeed,
    pfi,
    tfi,
    os,
    recordedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelapseFollowup &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.recurrenceDate == this.recurrenceDate &&
          other.relapseType == this.relapseType &&
          other.secondLineNeed == this.secondLineNeed &&
          other.pfi == this.pfi &&
          other.tfi == this.tfi &&
          other.os == this.os &&
          other.recordedAt == this.recordedAt);
}

class RelapseFollowupsCompanion extends UpdateCompanion<RelapseFollowup> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<DateTime?> recurrenceDate;
  final Value<String?> relapseType;
  final Value<String?> secondLineNeed;
  final Value<String?> pfi;
  final Value<String?> tfi;
  final Value<String?> os;
  final Value<DateTime> recordedAt;
  const RelapseFollowupsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.recurrenceDate = const Value.absent(),
    this.relapseType = const Value.absent(),
    this.secondLineNeed = const Value.absent(),
    this.pfi = const Value.absent(),
    this.tfi = const Value.absent(),
    this.os = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  RelapseFollowupsCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.recurrenceDate = const Value.absent(),
    this.relapseType = const Value.absent(),
    this.secondLineNeed = const Value.absent(),
    this.pfi = const Value.absent(),
    this.tfi = const Value.absent(),
    this.os = const Value.absent(),
    this.recordedAt = const Value.absent(),
  }) : patientId = Value(patientId);
  static Insertable<RelapseFollowup> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<DateTime>? recurrenceDate,
    Expression<String>? relapseType,
    Expression<String>? secondLineNeed,
    Expression<String>? pfi,
    Expression<String>? tfi,
    Expression<String>? os,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (recurrenceDate != null) 'recurrence_date': recurrenceDate,
      if (relapseType != null) 'relapse_type': relapseType,
      if (secondLineNeed != null) 'second_line_need': secondLineNeed,
      if (pfi != null) 'pfi': pfi,
      if (tfi != null) 'tfi': tfi,
      if (os != null) 'os': os,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  RelapseFollowupsCompanion copyWith({
    Value<int>? id,
    Value<int>? patientId,
    Value<DateTime?>? recurrenceDate,
    Value<String?>? relapseType,
    Value<String?>? secondLineNeed,
    Value<String?>? pfi,
    Value<String?>? tfi,
    Value<String?>? os,
    Value<DateTime>? recordedAt,
  }) {
    return RelapseFollowupsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      recurrenceDate: recurrenceDate ?? this.recurrenceDate,
      relapseType: relapseType ?? this.relapseType,
      secondLineNeed: secondLineNeed ?? this.secondLineNeed,
      pfi: pfi ?? this.pfi,
      tfi: tfi ?? this.tfi,
      os: os ?? this.os,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (recurrenceDate.present) {
      map['recurrence_date'] = Variable<DateTime>(recurrenceDate.value);
    }
    if (relapseType.present) {
      map['relapse_type'] = Variable<String>(relapseType.value);
    }
    if (secondLineNeed.present) {
      map['second_line_need'] = Variable<String>(secondLineNeed.value);
    }
    if (pfi.present) {
      map['pfi'] = Variable<String>(pfi.value);
    }
    if (tfi.present) {
      map['tfi'] = Variable<String>(tfi.value);
    }
    if (os.present) {
      map['os'] = Variable<String>(os.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelapseFollowupsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('recurrenceDate: $recurrenceDate, ')
          ..write('relapseType: $relapseType, ')
          ..write('secondLineNeed: $secondLineNeed, ')
          ..write('pfi: $pfi, ')
          ..write('tfi: $tfi, ')
          ..write('os: $os, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $PreChemoAssessmentsTable preChemoAssessments =
      $PreChemoAssessmentsTable(this);
  late final $PostChemoAssessmentsTable postChemoAssessments =
      $PostChemoAssessmentsTable(this);
  late final $CytoreductionCtFindingsTable cytoreductionCtFindings =
      $CytoreductionCtFindingsTable(this);
  late final $RelapseFollowupsTable relapseFollowups = $RelapseFollowupsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    patients,
    preChemoAssessments,
    postChemoAssessments,
    cytoreductionCtFindings,
    relapseFollowups,
  ];
}

typedef $$PatientsTableCreateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      required String serialNumber,
      required String hospitalNumber,
      required String unit,
      required String name,
      required int age,
      required String parity,
      Value<String?> address,
      Value<String?> phone,
      required String menstrualStatus,
      Value<int?> ageAtMenarche,
      Value<int?> ageAtMenopause,
      required String presentingComplaints,
      Value<String?> complaintsDetails,
      required String medicalHistory,
      Value<String?> medicalHistoryOthers,
      required String surgicalHistory,
      Value<String?> surgicalHistoryOthers,
      required String familyHistory,
      Value<String?> familyHistoryOthers,
      Value<DateTime> createdAt,
    });
typedef $$PatientsTableUpdateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      Value<String> serialNumber,
      Value<String> hospitalNumber,
      Value<String> unit,
      Value<String> name,
      Value<int> age,
      Value<String> parity,
      Value<String?> address,
      Value<String?> phone,
      Value<String> menstrualStatus,
      Value<int?> ageAtMenarche,
      Value<int?> ageAtMenopause,
      Value<String> presentingComplaints,
      Value<String?> complaintsDetails,
      Value<String> medicalHistory,
      Value<String?> medicalHistoryOthers,
      Value<String> surgicalHistory,
      Value<String?> surgicalHistoryOthers,
      Value<String> familyHistory,
      Value<String?> familyHistoryOthers,
      Value<DateTime> createdAt,
    });

final class $$PatientsTableReferences
    extends BaseReferences<_$AppDatabase, $PatientsTable, Patient> {
  $$PatientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $PreChemoAssessmentsTable,
    List<PreChemoAssessment>
  >
  _preChemoAssessmentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.preChemoAssessments,
        aliasName: 'patients__id__pre_chemo_assessments__patient_id',
      );

  $$PreChemoAssessmentsTableProcessedTableManager get preChemoAssessmentsRefs {
    final manager = $$PreChemoAssessmentsTableTableManager(
      $_db,
      $_db.preChemoAssessments,
    ).filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _preChemoAssessmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PostChemoAssessmentsTable,
    List<PostChemoAssessment>
  >
  _postChemoAssessmentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.postChemoAssessments,
        aliasName: 'patients__id__post_chemo_assessments__patient_id',
      );

  $$PostChemoAssessmentsTableProcessedTableManager
  get postChemoAssessmentsRefs {
    final manager = $$PostChemoAssessmentsTableTableManager(
      $_db,
      $_db.postChemoAssessments,
    ).filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _postChemoAssessmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CytoreductionCtFindingsTable,
    List<CytoreductionCtFinding>
  >
  _cytoreductionCtFindingsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cytoreductionCtFindings,
        aliasName: 'patients__id__cytoreduction_ct_findings__patient_id',
      );

  $$CytoreductionCtFindingsTableProcessedTableManager
  get cytoreductionCtFindingsRefs {
    final manager = $$CytoreductionCtFindingsTableTableManager(
      $_db,
      $_db.cytoreductionCtFindings,
    ).filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cytoreductionCtFindingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RelapseFollowupsTable, List<RelapseFollowup>>
  _relapseFollowupsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.relapseFollowups,
    aliasName: 'patients__id__relapse_followups__patient_id',
  );

  $$RelapseFollowupsTableProcessedTableManager get relapseFollowupsRefs {
    final manager = $$RelapseFollowupsTableTableManager(
      $_db,
      $_db.relapseFollowups,
    ).filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _relapseFollowupsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PatientsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
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

  ColumnFilters<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hospitalNumber => $composableBuilder(
    column: $table.hospitalNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parity => $composableBuilder(
    column: $table.parity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get menstrualStatus => $composableBuilder(
    column: $table.menstrualStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageAtMenarche => $composableBuilder(
    column: $table.ageAtMenarche,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageAtMenopause => $composableBuilder(
    column: $table.ageAtMenopause,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get presentingComplaints => $composableBuilder(
    column: $table.presentingComplaints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get complaintsDetails => $composableBuilder(
    column: $table.complaintsDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicalHistory => $composableBuilder(
    column: $table.medicalHistory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicalHistoryOthers => $composableBuilder(
    column: $table.medicalHistoryOthers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surgicalHistory => $composableBuilder(
    column: $table.surgicalHistory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surgicalHistoryOthers => $composableBuilder(
    column: $table.surgicalHistoryOthers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get familyHistory => $composableBuilder(
    column: $table.familyHistory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get familyHistoryOthers => $composableBuilder(
    column: $table.familyHistoryOthers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> preChemoAssessmentsRefs(
    Expression<bool> Function($$PreChemoAssessmentsTableFilterComposer f) f,
  ) {
    final $$PreChemoAssessmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.preChemoAssessments,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreChemoAssessmentsTableFilterComposer(
            $db: $db,
            $table: $db.preChemoAssessments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> postChemoAssessmentsRefs(
    Expression<bool> Function($$PostChemoAssessmentsTableFilterComposer f) f,
  ) {
    final $$PostChemoAssessmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.postChemoAssessments,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PostChemoAssessmentsTableFilterComposer(
            $db: $db,
            $table: $db.postChemoAssessments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cytoreductionCtFindingsRefs(
    Expression<bool> Function($$CytoreductionCtFindingsTableFilterComposer f) f,
  ) {
    final $$CytoreductionCtFindingsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cytoreductionCtFindings,
          getReferencedColumn: (t) => t.patientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CytoreductionCtFindingsTableFilterComposer(
                $db: $db,
                $table: $db.cytoreductionCtFindings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> relapseFollowupsRefs(
    Expression<bool> Function($$RelapseFollowupsTableFilterComposer f) f,
  ) {
    final $$RelapseFollowupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relapseFollowups,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelapseFollowupsTableFilterComposer(
            $db: $db,
            $table: $db.relapseFollowups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PatientsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
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

  ColumnOrderings<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hospitalNumber => $composableBuilder(
    column: $table.hospitalNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parity => $composableBuilder(
    column: $table.parity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get menstrualStatus => $composableBuilder(
    column: $table.menstrualStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageAtMenarche => $composableBuilder(
    column: $table.ageAtMenarche,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageAtMenopause => $composableBuilder(
    column: $table.ageAtMenopause,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get presentingComplaints => $composableBuilder(
    column: $table.presentingComplaints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get complaintsDetails => $composableBuilder(
    column: $table.complaintsDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicalHistory => $composableBuilder(
    column: $table.medicalHistory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicalHistoryOthers => $composableBuilder(
    column: $table.medicalHistoryOthers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surgicalHistory => $composableBuilder(
    column: $table.surgicalHistory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surgicalHistoryOthers => $composableBuilder(
    column: $table.surgicalHistoryOthers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get familyHistory => $composableBuilder(
    column: $table.familyHistory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get familyHistoryOthers => $composableBuilder(
    column: $table.familyHistoryOthers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hospitalNumber => $composableBuilder(
    column: $table.hospitalNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get parity =>
      $composableBuilder(column: $table.parity, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get menstrualStatus => $composableBuilder(
    column: $table.menstrualStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ageAtMenarche => $composableBuilder(
    column: $table.ageAtMenarche,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ageAtMenopause => $composableBuilder(
    column: $table.ageAtMenopause,
    builder: (column) => column,
  );

  GeneratedColumn<String> get presentingComplaints => $composableBuilder(
    column: $table.presentingComplaints,
    builder: (column) => column,
  );

  GeneratedColumn<String> get complaintsDetails => $composableBuilder(
    column: $table.complaintsDetails,
    builder: (column) => column,
  );

  GeneratedColumn<String> get medicalHistory => $composableBuilder(
    column: $table.medicalHistory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get medicalHistoryOthers => $composableBuilder(
    column: $table.medicalHistoryOthers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get surgicalHistory => $composableBuilder(
    column: $table.surgicalHistory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get surgicalHistoryOthers => $composableBuilder(
    column: $table.surgicalHistoryOthers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get familyHistory => $composableBuilder(
    column: $table.familyHistory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get familyHistoryOthers => $composableBuilder(
    column: $table.familyHistoryOthers,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> preChemoAssessmentsRefs<T extends Object>(
    Expression<T> Function($$PreChemoAssessmentsTableAnnotationComposer a) f,
  ) {
    final $$PreChemoAssessmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.preChemoAssessments,
          getReferencedColumn: (t) => t.patientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PreChemoAssessmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.preChemoAssessments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> postChemoAssessmentsRefs<T extends Object>(
    Expression<T> Function($$PostChemoAssessmentsTableAnnotationComposer a) f,
  ) {
    final $$PostChemoAssessmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.postChemoAssessments,
          getReferencedColumn: (t) => t.patientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PostChemoAssessmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.postChemoAssessments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> cytoreductionCtFindingsRefs<T extends Object>(
    Expression<T> Function($$CytoreductionCtFindingsTableAnnotationComposer a)
    f,
  ) {
    final $$CytoreductionCtFindingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cytoreductionCtFindings,
          getReferencedColumn: (t) => t.patientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CytoreductionCtFindingsTableAnnotationComposer(
                $db: $db,
                $table: $db.cytoreductionCtFindings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> relapseFollowupsRefs<T extends Object>(
    Expression<T> Function($$RelapseFollowupsTableAnnotationComposer a) f,
  ) {
    final $$RelapseFollowupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.relapseFollowups,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RelapseFollowupsTableAnnotationComposer(
            $db: $db,
            $table: $db.relapseFollowups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PatientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientsTable,
          Patient,
          $$PatientsTableFilterComposer,
          $$PatientsTableOrderingComposer,
          $$PatientsTableAnnotationComposer,
          $$PatientsTableCreateCompanionBuilder,
          $$PatientsTableUpdateCompanionBuilder,
          (Patient, $$PatientsTableReferences),
          Patient,
          PrefetchHooks Function({
            bool preChemoAssessmentsRefs,
            bool postChemoAssessmentsRefs,
            bool cytoreductionCtFindingsRefs,
            bool relapseFollowupsRefs,
          })
        > {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> serialNumber = const Value.absent(),
                Value<String> hospitalNumber = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<String> parity = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String> menstrualStatus = const Value.absent(),
                Value<int?> ageAtMenarche = const Value.absent(),
                Value<int?> ageAtMenopause = const Value.absent(),
                Value<String> presentingComplaints = const Value.absent(),
                Value<String?> complaintsDetails = const Value.absent(),
                Value<String> medicalHistory = const Value.absent(),
                Value<String?> medicalHistoryOthers = const Value.absent(),
                Value<String> surgicalHistory = const Value.absent(),
                Value<String?> surgicalHistoryOthers = const Value.absent(),
                Value<String> familyHistory = const Value.absent(),
                Value<String?> familyHistoryOthers = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PatientsCompanion(
                id: id,
                serialNumber: serialNumber,
                hospitalNumber: hospitalNumber,
                unit: unit,
                name: name,
                age: age,
                parity: parity,
                address: address,
                phone: phone,
                menstrualStatus: menstrualStatus,
                ageAtMenarche: ageAtMenarche,
                ageAtMenopause: ageAtMenopause,
                presentingComplaints: presentingComplaints,
                complaintsDetails: complaintsDetails,
                medicalHistory: medicalHistory,
                medicalHistoryOthers: medicalHistoryOthers,
                surgicalHistory: surgicalHistory,
                surgicalHistoryOthers: surgicalHistoryOthers,
                familyHistory: familyHistory,
                familyHistoryOthers: familyHistoryOthers,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String serialNumber,
                required String hospitalNumber,
                required String unit,
                required String name,
                required int age,
                required String parity,
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                required String menstrualStatus,
                Value<int?> ageAtMenarche = const Value.absent(),
                Value<int?> ageAtMenopause = const Value.absent(),
                required String presentingComplaints,
                Value<String?> complaintsDetails = const Value.absent(),
                required String medicalHistory,
                Value<String?> medicalHistoryOthers = const Value.absent(),
                required String surgicalHistory,
                Value<String?> surgicalHistoryOthers = const Value.absent(),
                required String familyHistory,
                Value<String?> familyHistoryOthers = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PatientsCompanion.insert(
                id: id,
                serialNumber: serialNumber,
                hospitalNumber: hospitalNumber,
                unit: unit,
                name: name,
                age: age,
                parity: parity,
                address: address,
                phone: phone,
                menstrualStatus: menstrualStatus,
                ageAtMenarche: ageAtMenarche,
                ageAtMenopause: ageAtMenopause,
                presentingComplaints: presentingComplaints,
                complaintsDetails: complaintsDetails,
                medicalHistory: medicalHistory,
                medicalHistoryOthers: medicalHistoryOthers,
                surgicalHistory: surgicalHistory,
                surgicalHistoryOthers: surgicalHistoryOthers,
                familyHistory: familyHistory,
                familyHistoryOthers: familyHistoryOthers,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PatientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                preChemoAssessmentsRefs = false,
                postChemoAssessmentsRefs = false,
                cytoreductionCtFindingsRefs = false,
                relapseFollowupsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (preChemoAssessmentsRefs) db.preChemoAssessments,
                    if (postChemoAssessmentsRefs) db.postChemoAssessments,
                    if (cytoreductionCtFindingsRefs) db.cytoreductionCtFindings,
                    if (relapseFollowupsRefs) db.relapseFollowups,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (preChemoAssessmentsRefs)
                        await $_getPrefetchedData<
                          Patient,
                          $PatientsTable,
                          PreChemoAssessment
                        >(
                          currentTable: table,
                          referencedTable: $$PatientsTableReferences
                              ._preChemoAssessmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientsTableReferences(
                                db,
                                table,
                                p0,
                              ).preChemoAssessmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (postChemoAssessmentsRefs)
                        await $_getPrefetchedData<
                          Patient,
                          $PatientsTable,
                          PostChemoAssessment
                        >(
                          currentTable: table,
                          referencedTable: $$PatientsTableReferences
                              ._postChemoAssessmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientsTableReferences(
                                db,
                                table,
                                p0,
                              ).postChemoAssessmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cytoreductionCtFindingsRefs)
                        await $_getPrefetchedData<
                          Patient,
                          $PatientsTable,
                          CytoreductionCtFinding
                        >(
                          currentTable: table,
                          referencedTable: $$PatientsTableReferences
                              ._cytoreductionCtFindingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientsTableReferences(
                                db,
                                table,
                                p0,
                              ).cytoreductionCtFindingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (relapseFollowupsRefs)
                        await $_getPrefetchedData<
                          Patient,
                          $PatientsTable,
                          RelapseFollowup
                        >(
                          currentTable: table,
                          referencedTable: $$PatientsTableReferences
                              ._relapseFollowupsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientsTableReferences(
                                db,
                                table,
                                p0,
                              ).relapseFollowupsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientId == item.id,
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

typedef $$PatientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientsTable,
      Patient,
      $$PatientsTableFilterComposer,
      $$PatientsTableOrderingComposer,
      $$PatientsTableAnnotationComposer,
      $$PatientsTableCreateCompanionBuilder,
      $$PatientsTableUpdateCompanionBuilder,
      (Patient, $$PatientsTableReferences),
      Patient,
      PrefetchHooks Function({
        bool preChemoAssessmentsRefs,
        bool postChemoAssessmentsRefs,
        bool cytoreductionCtFindingsRefs,
        bool relapseFollowupsRefs,
      })
    >;
typedef $$PreChemoAssessmentsTableCreateCompanionBuilder =
    PreChemoAssessmentsCompanion Function({
      Value<int> id,
      required int patientId,
      Value<double?> height,
      Value<double?> weight,
      Value<double?> bmi,
      Value<String?> pallor,
      Value<String?> icterus,
      Value<String?> lymphadenopathy,
      Value<String?> abdominalExam,
      Value<String?> pelvicExam,
      Value<String?> perRectalExam,
      Value<String?> otherExam,
      Value<double?> hemoglobin,
      Value<double?> plateletCount,
      Value<double?> plr,
      Value<double?> albumin,
      Value<double?> neutrophil,
      Value<double?> lymphocyte,
      Value<double?> nlr,
      Value<double?> sii,
      Value<DateTime> recordedAt,
    });
typedef $$PreChemoAssessmentsTableUpdateCompanionBuilder =
    PreChemoAssessmentsCompanion Function({
      Value<int> id,
      Value<int> patientId,
      Value<double?> height,
      Value<double?> weight,
      Value<double?> bmi,
      Value<String?> pallor,
      Value<String?> icterus,
      Value<String?> lymphadenopathy,
      Value<String?> abdominalExam,
      Value<String?> pelvicExam,
      Value<String?> perRectalExam,
      Value<String?> otherExam,
      Value<double?> hemoglobin,
      Value<double?> plateletCount,
      Value<double?> plr,
      Value<double?> albumin,
      Value<double?> neutrophil,
      Value<double?> lymphocyte,
      Value<double?> nlr,
      Value<double?> sii,
      Value<DateTime> recordedAt,
    });

final class $$PreChemoAssessmentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PreChemoAssessmentsTable,
          PreChemoAssessment
        > {
  $$PreChemoAssessmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PatientsTable _patientIdTable(_$AppDatabase db) => db.patients
      .createAlias('pre_chemo_assessments__patient_id__patients__id');

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PreChemoAssessmentsTableFilterComposer
    extends Composer<_$AppDatabase, $PreChemoAssessmentsTable> {
  $$PreChemoAssessmentsTableFilterComposer({
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

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bmi => $composableBuilder(
    column: $table.bmi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pallor => $composableBuilder(
    column: $table.pallor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icterus => $composableBuilder(
    column: $table.icterus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lymphadenopathy => $composableBuilder(
    column: $table.lymphadenopathy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abdominalExam => $composableBuilder(
    column: $table.abdominalExam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pelvicExam => $composableBuilder(
    column: $table.pelvicExam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get perRectalExam => $composableBuilder(
    column: $table.perRectalExam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get otherExam => $composableBuilder(
    column: $table.otherExam,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hemoglobin => $composableBuilder(
    column: $table.hemoglobin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get plateletCount => $composableBuilder(
    column: $table.plateletCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get plr => $composableBuilder(
    column: $table.plr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get albumin => $composableBuilder(
    column: $table.albumin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get neutrophil => $composableBuilder(
    column: $table.neutrophil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lymphocyte => $composableBuilder(
    column: $table.lymphocyte,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nlr => $composableBuilder(
    column: $table.nlr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sii => $composableBuilder(
    column: $table.sii,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreChemoAssessmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PreChemoAssessmentsTable> {
  $$PreChemoAssessmentsTableOrderingComposer({
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

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bmi => $composableBuilder(
    column: $table.bmi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pallor => $composableBuilder(
    column: $table.pallor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icterus => $composableBuilder(
    column: $table.icterus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lymphadenopathy => $composableBuilder(
    column: $table.lymphadenopathy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abdominalExam => $composableBuilder(
    column: $table.abdominalExam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pelvicExam => $composableBuilder(
    column: $table.pelvicExam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get perRectalExam => $composableBuilder(
    column: $table.perRectalExam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get otherExam => $composableBuilder(
    column: $table.otherExam,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hemoglobin => $composableBuilder(
    column: $table.hemoglobin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get plateletCount => $composableBuilder(
    column: $table.plateletCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get plr => $composableBuilder(
    column: $table.plr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get albumin => $composableBuilder(
    column: $table.albumin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get neutrophil => $composableBuilder(
    column: $table.neutrophil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lymphocyte => $composableBuilder(
    column: $table.lymphocyte,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get nlr => $composableBuilder(
    column: $table.nlr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sii => $composableBuilder(
    column: $table.sii,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableOrderingComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreChemoAssessmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreChemoAssessmentsTable> {
  $$PreChemoAssessmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get bmi =>
      $composableBuilder(column: $table.bmi, builder: (column) => column);

  GeneratedColumn<String> get pallor =>
      $composableBuilder(column: $table.pallor, builder: (column) => column);

  GeneratedColumn<String> get icterus =>
      $composableBuilder(column: $table.icterus, builder: (column) => column);

  GeneratedColumn<String> get lymphadenopathy => $composableBuilder(
    column: $table.lymphadenopathy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get abdominalExam => $composableBuilder(
    column: $table.abdominalExam,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pelvicExam => $composableBuilder(
    column: $table.pelvicExam,
    builder: (column) => column,
  );

  GeneratedColumn<String> get perRectalExam => $composableBuilder(
    column: $table.perRectalExam,
    builder: (column) => column,
  );

  GeneratedColumn<String> get otherExam =>
      $composableBuilder(column: $table.otherExam, builder: (column) => column);

  GeneratedColumn<double> get hemoglobin => $composableBuilder(
    column: $table.hemoglobin,
    builder: (column) => column,
  );

  GeneratedColumn<double> get plateletCount => $composableBuilder(
    column: $table.plateletCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get plr =>
      $composableBuilder(column: $table.plr, builder: (column) => column);

  GeneratedColumn<double> get albumin =>
      $composableBuilder(column: $table.albumin, builder: (column) => column);

  GeneratedColumn<double> get neutrophil => $composableBuilder(
    column: $table.neutrophil,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lymphocyte => $composableBuilder(
    column: $table.lymphocyte,
    builder: (column) => column,
  );

  GeneratedColumn<double> get nlr =>
      $composableBuilder(column: $table.nlr, builder: (column) => column);

  GeneratedColumn<double> get sii =>
      $composableBuilder(column: $table.sii, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreChemoAssessmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreChemoAssessmentsTable,
          PreChemoAssessment,
          $$PreChemoAssessmentsTableFilterComposer,
          $$PreChemoAssessmentsTableOrderingComposer,
          $$PreChemoAssessmentsTableAnnotationComposer,
          $$PreChemoAssessmentsTableCreateCompanionBuilder,
          $$PreChemoAssessmentsTableUpdateCompanionBuilder,
          (PreChemoAssessment, $$PreChemoAssessmentsTableReferences),
          PreChemoAssessment,
          PrefetchHooks Function({bool patientId})
        > {
  $$PreChemoAssessmentsTableTableManager(
    _$AppDatabase db,
    $PreChemoAssessmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreChemoAssessmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreChemoAssessmentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PreChemoAssessmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> bmi = const Value.absent(),
                Value<String?> pallor = const Value.absent(),
                Value<String?> icterus = const Value.absent(),
                Value<String?> lymphadenopathy = const Value.absent(),
                Value<String?> abdominalExam = const Value.absent(),
                Value<String?> pelvicExam = const Value.absent(),
                Value<String?> perRectalExam = const Value.absent(),
                Value<String?> otherExam = const Value.absent(),
                Value<double?> hemoglobin = const Value.absent(),
                Value<double?> plateletCount = const Value.absent(),
                Value<double?> plr = const Value.absent(),
                Value<double?> albumin = const Value.absent(),
                Value<double?> neutrophil = const Value.absent(),
                Value<double?> lymphocyte = const Value.absent(),
                Value<double?> nlr = const Value.absent(),
                Value<double?> sii = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => PreChemoAssessmentsCompanion(
                id: id,
                patientId: patientId,
                height: height,
                weight: weight,
                bmi: bmi,
                pallor: pallor,
                icterus: icterus,
                lymphadenopathy: lymphadenopathy,
                abdominalExam: abdominalExam,
                pelvicExam: pelvicExam,
                perRectalExam: perRectalExam,
                otherExam: otherExam,
                hemoglobin: hemoglobin,
                plateletCount: plateletCount,
                plr: plr,
                albumin: albumin,
                neutrophil: neutrophil,
                lymphocyte: lymphocyte,
                nlr: nlr,
                sii: sii,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientId,
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> bmi = const Value.absent(),
                Value<String?> pallor = const Value.absent(),
                Value<String?> icterus = const Value.absent(),
                Value<String?> lymphadenopathy = const Value.absent(),
                Value<String?> abdominalExam = const Value.absent(),
                Value<String?> pelvicExam = const Value.absent(),
                Value<String?> perRectalExam = const Value.absent(),
                Value<String?> otherExam = const Value.absent(),
                Value<double?> hemoglobin = const Value.absent(),
                Value<double?> plateletCount = const Value.absent(),
                Value<double?> plr = const Value.absent(),
                Value<double?> albumin = const Value.absent(),
                Value<double?> neutrophil = const Value.absent(),
                Value<double?> lymphocyte = const Value.absent(),
                Value<double?> nlr = const Value.absent(),
                Value<double?> sii = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => PreChemoAssessmentsCompanion.insert(
                id: id,
                patientId: patientId,
                height: height,
                weight: weight,
                bmi: bmi,
                pallor: pallor,
                icterus: icterus,
                lymphadenopathy: lymphadenopathy,
                abdominalExam: abdominalExam,
                pelvicExam: pelvicExam,
                perRectalExam: perRectalExam,
                otherExam: otherExam,
                hemoglobin: hemoglobin,
                plateletCount: plateletCount,
                plr: plr,
                albumin: albumin,
                neutrophil: neutrophil,
                lymphocyte: lymphocyte,
                nlr: nlr,
                sii: sii,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PreChemoAssessmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (patientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patientId,
                                referencedTable:
                                    $$PreChemoAssessmentsTableReferences
                                        ._patientIdTable(db),
                                referencedColumn:
                                    $$PreChemoAssessmentsTableReferences
                                        ._patientIdTable(db)
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

typedef $$PreChemoAssessmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreChemoAssessmentsTable,
      PreChemoAssessment,
      $$PreChemoAssessmentsTableFilterComposer,
      $$PreChemoAssessmentsTableOrderingComposer,
      $$PreChemoAssessmentsTableAnnotationComposer,
      $$PreChemoAssessmentsTableCreateCompanionBuilder,
      $$PreChemoAssessmentsTableUpdateCompanionBuilder,
      (PreChemoAssessment, $$PreChemoAssessmentsTableReferences),
      PreChemoAssessment,
      PrefetchHooks Function({bool patientId})
    >;
typedef $$PostChemoAssessmentsTableCreateCompanionBuilder =
    PostChemoAssessmentsCompanion Function({
      Value<int> id,
      required int patientId,
      Value<int?> nactCycles,
      Value<String?> nactDates,
      Value<String?> nactNature,
      Value<String?> secondLine,
      Value<String?> fnacAscitic,
      Value<String?> complications,
      Value<bool?> needGcsf,
      Value<bool?> needBloodTransfusion,
      Value<double?> hemoglobin,
      Value<double?> plateletCount,
      Value<double?> plr,
      Value<double?> albumin,
      Value<double?> neutrophil,
      Value<double?> lymphocyte,
      Value<double?> nlr,
      Value<double?> sii,
      Value<double?> ca125Reading1,
      Value<double?> ca125Reading2,
      Value<double?> ca125Reading3,
      Value<DateTime> recordedAt,
    });
typedef $$PostChemoAssessmentsTableUpdateCompanionBuilder =
    PostChemoAssessmentsCompanion Function({
      Value<int> id,
      Value<int> patientId,
      Value<int?> nactCycles,
      Value<String?> nactDates,
      Value<String?> nactNature,
      Value<String?> secondLine,
      Value<String?> fnacAscitic,
      Value<String?> complications,
      Value<bool?> needGcsf,
      Value<bool?> needBloodTransfusion,
      Value<double?> hemoglobin,
      Value<double?> plateletCount,
      Value<double?> plr,
      Value<double?> albumin,
      Value<double?> neutrophil,
      Value<double?> lymphocyte,
      Value<double?> nlr,
      Value<double?> sii,
      Value<double?> ca125Reading1,
      Value<double?> ca125Reading2,
      Value<double?> ca125Reading3,
      Value<DateTime> recordedAt,
    });

final class $$PostChemoAssessmentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PostChemoAssessmentsTable,
          PostChemoAssessment
        > {
  $$PostChemoAssessmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PatientsTable _patientIdTable(_$AppDatabase db) => db.patients
      .createAlias('post_chemo_assessments__patient_id__patients__id');

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PostChemoAssessmentsTableFilterComposer
    extends Composer<_$AppDatabase, $PostChemoAssessmentsTable> {
  $$PostChemoAssessmentsTableFilterComposer({
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

  ColumnFilters<int> get nactCycles => $composableBuilder(
    column: $table.nactCycles,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nactDates => $composableBuilder(
    column: $table.nactDates,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nactNature => $composableBuilder(
    column: $table.nactNature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secondLine => $composableBuilder(
    column: $table.secondLine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fnacAscitic => $composableBuilder(
    column: $table.fnacAscitic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get complications => $composableBuilder(
    column: $table.complications,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get needGcsf => $composableBuilder(
    column: $table.needGcsf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get needBloodTransfusion => $composableBuilder(
    column: $table.needBloodTransfusion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hemoglobin => $composableBuilder(
    column: $table.hemoglobin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get plateletCount => $composableBuilder(
    column: $table.plateletCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get plr => $composableBuilder(
    column: $table.plr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get albumin => $composableBuilder(
    column: $table.albumin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get neutrophil => $composableBuilder(
    column: $table.neutrophil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lymphocyte => $composableBuilder(
    column: $table.lymphocyte,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nlr => $composableBuilder(
    column: $table.nlr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sii => $composableBuilder(
    column: $table.sii,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ca125Reading1 => $composableBuilder(
    column: $table.ca125Reading1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ca125Reading2 => $composableBuilder(
    column: $table.ca125Reading2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ca125Reading3 => $composableBuilder(
    column: $table.ca125Reading3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PostChemoAssessmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PostChemoAssessmentsTable> {
  $$PostChemoAssessmentsTableOrderingComposer({
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

  ColumnOrderings<int> get nactCycles => $composableBuilder(
    column: $table.nactCycles,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nactDates => $composableBuilder(
    column: $table.nactDates,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nactNature => $composableBuilder(
    column: $table.nactNature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secondLine => $composableBuilder(
    column: $table.secondLine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fnacAscitic => $composableBuilder(
    column: $table.fnacAscitic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get complications => $composableBuilder(
    column: $table.complications,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get needGcsf => $composableBuilder(
    column: $table.needGcsf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get needBloodTransfusion => $composableBuilder(
    column: $table.needBloodTransfusion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hemoglobin => $composableBuilder(
    column: $table.hemoglobin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get plateletCount => $composableBuilder(
    column: $table.plateletCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get plr => $composableBuilder(
    column: $table.plr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get albumin => $composableBuilder(
    column: $table.albumin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get neutrophil => $composableBuilder(
    column: $table.neutrophil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lymphocyte => $composableBuilder(
    column: $table.lymphocyte,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get nlr => $composableBuilder(
    column: $table.nlr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sii => $composableBuilder(
    column: $table.sii,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ca125Reading1 => $composableBuilder(
    column: $table.ca125Reading1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ca125Reading2 => $composableBuilder(
    column: $table.ca125Reading2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ca125Reading3 => $composableBuilder(
    column: $table.ca125Reading3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableOrderingComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PostChemoAssessmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PostChemoAssessmentsTable> {
  $$PostChemoAssessmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get nactCycles => $composableBuilder(
    column: $table.nactCycles,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nactDates =>
      $composableBuilder(column: $table.nactDates, builder: (column) => column);

  GeneratedColumn<String> get nactNature => $composableBuilder(
    column: $table.nactNature,
    builder: (column) => column,
  );

  GeneratedColumn<String> get secondLine => $composableBuilder(
    column: $table.secondLine,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fnacAscitic => $composableBuilder(
    column: $table.fnacAscitic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get complications => $composableBuilder(
    column: $table.complications,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get needGcsf =>
      $composableBuilder(column: $table.needGcsf, builder: (column) => column);

  GeneratedColumn<bool> get needBloodTransfusion => $composableBuilder(
    column: $table.needBloodTransfusion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get hemoglobin => $composableBuilder(
    column: $table.hemoglobin,
    builder: (column) => column,
  );

  GeneratedColumn<double> get plateletCount => $composableBuilder(
    column: $table.plateletCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get plr =>
      $composableBuilder(column: $table.plr, builder: (column) => column);

  GeneratedColumn<double> get albumin =>
      $composableBuilder(column: $table.albumin, builder: (column) => column);

  GeneratedColumn<double> get neutrophil => $composableBuilder(
    column: $table.neutrophil,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lymphocyte => $composableBuilder(
    column: $table.lymphocyte,
    builder: (column) => column,
  );

  GeneratedColumn<double> get nlr =>
      $composableBuilder(column: $table.nlr, builder: (column) => column);

  GeneratedColumn<double> get sii =>
      $composableBuilder(column: $table.sii, builder: (column) => column);

  GeneratedColumn<double> get ca125Reading1 => $composableBuilder(
    column: $table.ca125Reading1,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ca125Reading2 => $composableBuilder(
    column: $table.ca125Reading2,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ca125Reading3 => $composableBuilder(
    column: $table.ca125Reading3,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PostChemoAssessmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PostChemoAssessmentsTable,
          PostChemoAssessment,
          $$PostChemoAssessmentsTableFilterComposer,
          $$PostChemoAssessmentsTableOrderingComposer,
          $$PostChemoAssessmentsTableAnnotationComposer,
          $$PostChemoAssessmentsTableCreateCompanionBuilder,
          $$PostChemoAssessmentsTableUpdateCompanionBuilder,
          (PostChemoAssessment, $$PostChemoAssessmentsTableReferences),
          PostChemoAssessment,
          PrefetchHooks Function({bool patientId})
        > {
  $$PostChemoAssessmentsTableTableManager(
    _$AppDatabase db,
    $PostChemoAssessmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PostChemoAssessmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PostChemoAssessmentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PostChemoAssessmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<int?> nactCycles = const Value.absent(),
                Value<String?> nactDates = const Value.absent(),
                Value<String?> nactNature = const Value.absent(),
                Value<String?> secondLine = const Value.absent(),
                Value<String?> fnacAscitic = const Value.absent(),
                Value<String?> complications = const Value.absent(),
                Value<bool?> needGcsf = const Value.absent(),
                Value<bool?> needBloodTransfusion = const Value.absent(),
                Value<double?> hemoglobin = const Value.absent(),
                Value<double?> plateletCount = const Value.absent(),
                Value<double?> plr = const Value.absent(),
                Value<double?> albumin = const Value.absent(),
                Value<double?> neutrophil = const Value.absent(),
                Value<double?> lymphocyte = const Value.absent(),
                Value<double?> nlr = const Value.absent(),
                Value<double?> sii = const Value.absent(),
                Value<double?> ca125Reading1 = const Value.absent(),
                Value<double?> ca125Reading2 = const Value.absent(),
                Value<double?> ca125Reading3 = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => PostChemoAssessmentsCompanion(
                id: id,
                patientId: patientId,
                nactCycles: nactCycles,
                nactDates: nactDates,
                nactNature: nactNature,
                secondLine: secondLine,
                fnacAscitic: fnacAscitic,
                complications: complications,
                needGcsf: needGcsf,
                needBloodTransfusion: needBloodTransfusion,
                hemoglobin: hemoglobin,
                plateletCount: plateletCount,
                plr: plr,
                albumin: albumin,
                neutrophil: neutrophil,
                lymphocyte: lymphocyte,
                nlr: nlr,
                sii: sii,
                ca125Reading1: ca125Reading1,
                ca125Reading2: ca125Reading2,
                ca125Reading3: ca125Reading3,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientId,
                Value<int?> nactCycles = const Value.absent(),
                Value<String?> nactDates = const Value.absent(),
                Value<String?> nactNature = const Value.absent(),
                Value<String?> secondLine = const Value.absent(),
                Value<String?> fnacAscitic = const Value.absent(),
                Value<String?> complications = const Value.absent(),
                Value<bool?> needGcsf = const Value.absent(),
                Value<bool?> needBloodTransfusion = const Value.absent(),
                Value<double?> hemoglobin = const Value.absent(),
                Value<double?> plateletCount = const Value.absent(),
                Value<double?> plr = const Value.absent(),
                Value<double?> albumin = const Value.absent(),
                Value<double?> neutrophil = const Value.absent(),
                Value<double?> lymphocyte = const Value.absent(),
                Value<double?> nlr = const Value.absent(),
                Value<double?> sii = const Value.absent(),
                Value<double?> ca125Reading1 = const Value.absent(),
                Value<double?> ca125Reading2 = const Value.absent(),
                Value<double?> ca125Reading3 = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => PostChemoAssessmentsCompanion.insert(
                id: id,
                patientId: patientId,
                nactCycles: nactCycles,
                nactDates: nactDates,
                nactNature: nactNature,
                secondLine: secondLine,
                fnacAscitic: fnacAscitic,
                complications: complications,
                needGcsf: needGcsf,
                needBloodTransfusion: needBloodTransfusion,
                hemoglobin: hemoglobin,
                plateletCount: plateletCount,
                plr: plr,
                albumin: albumin,
                neutrophil: neutrophil,
                lymphocyte: lymphocyte,
                nlr: nlr,
                sii: sii,
                ca125Reading1: ca125Reading1,
                ca125Reading2: ca125Reading2,
                ca125Reading3: ca125Reading3,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PostChemoAssessmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (patientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patientId,
                                referencedTable:
                                    $$PostChemoAssessmentsTableReferences
                                        ._patientIdTable(db),
                                referencedColumn:
                                    $$PostChemoAssessmentsTableReferences
                                        ._patientIdTable(db)
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

typedef $$PostChemoAssessmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PostChemoAssessmentsTable,
      PostChemoAssessment,
      $$PostChemoAssessmentsTableFilterComposer,
      $$PostChemoAssessmentsTableOrderingComposer,
      $$PostChemoAssessmentsTableAnnotationComposer,
      $$PostChemoAssessmentsTableCreateCompanionBuilder,
      $$PostChemoAssessmentsTableUpdateCompanionBuilder,
      (PostChemoAssessment, $$PostChemoAssessmentsTableReferences),
      PostChemoAssessment,
      PrefetchHooks Function({bool patientId})
    >;
typedef $$CytoreductionCtFindingsTableCreateCompanionBuilder =
    CytoreductionCtFindingsCompanion Function({
      Value<int> id,
      required int patientId,
      Value<String?> chemoResponseScore,
      Value<double?> pci,
      Value<String?> cytoreductiveLevel,
      Value<String?> ctLiverPre,
      Value<String?> ctLiverPost,
      Value<String?> ctGallBladderPre,
      Value<String?> ctGallBladderPost,
      Value<String?> ctSpleenPre,
      Value<String?> ctSpleenPost,
      Value<String?> ctPancreasPre,
      Value<String?> ctPancreasPost,
      Value<String?> ctSuprarenalsPre,
      Value<String?> ctSuprarenalsPost,
      Value<String?> ctKidneyPre,
      Value<String?> ctKidneyPost,
      Value<String?> ctBowelPre,
      Value<String?> ctBowelPost,
      Value<String?> ctAortaIvcPre,
      Value<String?> ctAortaIvcPost,
      Value<String?> ctUrinaryBladderPre,
      Value<String?> ctUrinaryBladderPost,
      Value<String?> ctUterusOvariesPre,
      Value<String?> ctUterusOvariesPost,
      Value<String?> ctLymphNodesPre,
      Value<String?> ctLymphNodesPost,
      Value<double?> kelimScore,
      Value<String?> crsOmentum,
      Value<String?> crsAdnexa,
      Value<String?> crsOtherSites,
      Value<DateTime> recordedAt,
    });
typedef $$CytoreductionCtFindingsTableUpdateCompanionBuilder =
    CytoreductionCtFindingsCompanion Function({
      Value<int> id,
      Value<int> patientId,
      Value<String?> chemoResponseScore,
      Value<double?> pci,
      Value<String?> cytoreductiveLevel,
      Value<String?> ctLiverPre,
      Value<String?> ctLiverPost,
      Value<String?> ctGallBladderPre,
      Value<String?> ctGallBladderPost,
      Value<String?> ctSpleenPre,
      Value<String?> ctSpleenPost,
      Value<String?> ctPancreasPre,
      Value<String?> ctPancreasPost,
      Value<String?> ctSuprarenalsPre,
      Value<String?> ctSuprarenalsPost,
      Value<String?> ctKidneyPre,
      Value<String?> ctKidneyPost,
      Value<String?> ctBowelPre,
      Value<String?> ctBowelPost,
      Value<String?> ctAortaIvcPre,
      Value<String?> ctAortaIvcPost,
      Value<String?> ctUrinaryBladderPre,
      Value<String?> ctUrinaryBladderPost,
      Value<String?> ctUterusOvariesPre,
      Value<String?> ctUterusOvariesPost,
      Value<String?> ctLymphNodesPre,
      Value<String?> ctLymphNodesPost,
      Value<double?> kelimScore,
      Value<String?> crsOmentum,
      Value<String?> crsAdnexa,
      Value<String?> crsOtherSites,
      Value<DateTime> recordedAt,
    });

final class $$CytoreductionCtFindingsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CytoreductionCtFindingsTable,
          CytoreductionCtFinding
        > {
  $$CytoreductionCtFindingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PatientsTable _patientIdTable(_$AppDatabase db) => db.patients
      .createAlias('cytoreduction_ct_findings__patient_id__patients__id');

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CytoreductionCtFindingsTableFilterComposer
    extends Composer<_$AppDatabase, $CytoreductionCtFindingsTable> {
  $$CytoreductionCtFindingsTableFilterComposer({
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

  ColumnFilters<String> get chemoResponseScore => $composableBuilder(
    column: $table.chemoResponseScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pci => $composableBuilder(
    column: $table.pci,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cytoreductiveLevel => $composableBuilder(
    column: $table.cytoreductiveLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctLiverPre => $composableBuilder(
    column: $table.ctLiverPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctLiverPost => $composableBuilder(
    column: $table.ctLiverPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctGallBladderPre => $composableBuilder(
    column: $table.ctGallBladderPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctGallBladderPost => $composableBuilder(
    column: $table.ctGallBladderPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctSpleenPre => $composableBuilder(
    column: $table.ctSpleenPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctSpleenPost => $composableBuilder(
    column: $table.ctSpleenPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctPancreasPre => $composableBuilder(
    column: $table.ctPancreasPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctPancreasPost => $composableBuilder(
    column: $table.ctPancreasPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctSuprarenalsPre => $composableBuilder(
    column: $table.ctSuprarenalsPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctSuprarenalsPost => $composableBuilder(
    column: $table.ctSuprarenalsPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctKidneyPre => $composableBuilder(
    column: $table.ctKidneyPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctKidneyPost => $composableBuilder(
    column: $table.ctKidneyPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctBowelPre => $composableBuilder(
    column: $table.ctBowelPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctBowelPost => $composableBuilder(
    column: $table.ctBowelPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctAortaIvcPre => $composableBuilder(
    column: $table.ctAortaIvcPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctAortaIvcPost => $composableBuilder(
    column: $table.ctAortaIvcPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctUrinaryBladderPre => $composableBuilder(
    column: $table.ctUrinaryBladderPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctUrinaryBladderPost => $composableBuilder(
    column: $table.ctUrinaryBladderPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctUterusOvariesPre => $composableBuilder(
    column: $table.ctUterusOvariesPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctUterusOvariesPost => $composableBuilder(
    column: $table.ctUterusOvariesPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctLymphNodesPre => $composableBuilder(
    column: $table.ctLymphNodesPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ctLymphNodesPost => $composableBuilder(
    column: $table.ctLymphNodesPost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get kelimScore => $composableBuilder(
    column: $table.kelimScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crsOmentum => $composableBuilder(
    column: $table.crsOmentum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crsAdnexa => $composableBuilder(
    column: $table.crsAdnexa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crsOtherSites => $composableBuilder(
    column: $table.crsOtherSites,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CytoreductionCtFindingsTableOrderingComposer
    extends Composer<_$AppDatabase, $CytoreductionCtFindingsTable> {
  $$CytoreductionCtFindingsTableOrderingComposer({
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

  ColumnOrderings<String> get chemoResponseScore => $composableBuilder(
    column: $table.chemoResponseScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pci => $composableBuilder(
    column: $table.pci,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cytoreductiveLevel => $composableBuilder(
    column: $table.cytoreductiveLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctLiverPre => $composableBuilder(
    column: $table.ctLiverPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctLiverPost => $composableBuilder(
    column: $table.ctLiverPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctGallBladderPre => $composableBuilder(
    column: $table.ctGallBladderPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctGallBladderPost => $composableBuilder(
    column: $table.ctGallBladderPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctSpleenPre => $composableBuilder(
    column: $table.ctSpleenPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctSpleenPost => $composableBuilder(
    column: $table.ctSpleenPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctPancreasPre => $composableBuilder(
    column: $table.ctPancreasPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctPancreasPost => $composableBuilder(
    column: $table.ctPancreasPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctSuprarenalsPre => $composableBuilder(
    column: $table.ctSuprarenalsPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctSuprarenalsPost => $composableBuilder(
    column: $table.ctSuprarenalsPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctKidneyPre => $composableBuilder(
    column: $table.ctKidneyPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctKidneyPost => $composableBuilder(
    column: $table.ctKidneyPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctBowelPre => $composableBuilder(
    column: $table.ctBowelPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctBowelPost => $composableBuilder(
    column: $table.ctBowelPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctAortaIvcPre => $composableBuilder(
    column: $table.ctAortaIvcPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctAortaIvcPost => $composableBuilder(
    column: $table.ctAortaIvcPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctUrinaryBladderPre => $composableBuilder(
    column: $table.ctUrinaryBladderPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctUrinaryBladderPost => $composableBuilder(
    column: $table.ctUrinaryBladderPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctUterusOvariesPre => $composableBuilder(
    column: $table.ctUterusOvariesPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctUterusOvariesPost => $composableBuilder(
    column: $table.ctUterusOvariesPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctLymphNodesPre => $composableBuilder(
    column: $table.ctLymphNodesPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ctLymphNodesPost => $composableBuilder(
    column: $table.ctLymphNodesPost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kelimScore => $composableBuilder(
    column: $table.kelimScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crsOmentum => $composableBuilder(
    column: $table.crsOmentum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crsAdnexa => $composableBuilder(
    column: $table.crsAdnexa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crsOtherSites => $composableBuilder(
    column: $table.crsOtherSites,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableOrderingComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CytoreductionCtFindingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CytoreductionCtFindingsTable> {
  $$CytoreductionCtFindingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get chemoResponseScore => $composableBuilder(
    column: $table.chemoResponseScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pci =>
      $composableBuilder(column: $table.pci, builder: (column) => column);

  GeneratedColumn<String> get cytoreductiveLevel => $composableBuilder(
    column: $table.cytoreductiveLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctLiverPre => $composableBuilder(
    column: $table.ctLiverPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctLiverPost => $composableBuilder(
    column: $table.ctLiverPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctGallBladderPre => $composableBuilder(
    column: $table.ctGallBladderPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctGallBladderPost => $composableBuilder(
    column: $table.ctGallBladderPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctSpleenPre => $composableBuilder(
    column: $table.ctSpleenPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctSpleenPost => $composableBuilder(
    column: $table.ctSpleenPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctPancreasPre => $composableBuilder(
    column: $table.ctPancreasPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctPancreasPost => $composableBuilder(
    column: $table.ctPancreasPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctSuprarenalsPre => $composableBuilder(
    column: $table.ctSuprarenalsPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctSuprarenalsPost => $composableBuilder(
    column: $table.ctSuprarenalsPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctKidneyPre => $composableBuilder(
    column: $table.ctKidneyPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctKidneyPost => $composableBuilder(
    column: $table.ctKidneyPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctBowelPre => $composableBuilder(
    column: $table.ctBowelPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctBowelPost => $composableBuilder(
    column: $table.ctBowelPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctAortaIvcPre => $composableBuilder(
    column: $table.ctAortaIvcPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctAortaIvcPost => $composableBuilder(
    column: $table.ctAortaIvcPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctUrinaryBladderPre => $composableBuilder(
    column: $table.ctUrinaryBladderPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctUrinaryBladderPost => $composableBuilder(
    column: $table.ctUrinaryBladderPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctUterusOvariesPre => $composableBuilder(
    column: $table.ctUterusOvariesPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctUterusOvariesPost => $composableBuilder(
    column: $table.ctUterusOvariesPost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctLymphNodesPre => $composableBuilder(
    column: $table.ctLymphNodesPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ctLymphNodesPost => $composableBuilder(
    column: $table.ctLymphNodesPost,
    builder: (column) => column,
  );

  GeneratedColumn<double> get kelimScore => $composableBuilder(
    column: $table.kelimScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get crsOmentum => $composableBuilder(
    column: $table.crsOmentum,
    builder: (column) => column,
  );

  GeneratedColumn<String> get crsAdnexa =>
      $composableBuilder(column: $table.crsAdnexa, builder: (column) => column);

  GeneratedColumn<String> get crsOtherSites => $composableBuilder(
    column: $table.crsOtherSites,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CytoreductionCtFindingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CytoreductionCtFindingsTable,
          CytoreductionCtFinding,
          $$CytoreductionCtFindingsTableFilterComposer,
          $$CytoreductionCtFindingsTableOrderingComposer,
          $$CytoreductionCtFindingsTableAnnotationComposer,
          $$CytoreductionCtFindingsTableCreateCompanionBuilder,
          $$CytoreductionCtFindingsTableUpdateCompanionBuilder,
          (CytoreductionCtFinding, $$CytoreductionCtFindingsTableReferences),
          CytoreductionCtFinding,
          PrefetchHooks Function({bool patientId})
        > {
  $$CytoreductionCtFindingsTableTableManager(
    _$AppDatabase db,
    $CytoreductionCtFindingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CytoreductionCtFindingsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CytoreductionCtFindingsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CytoreductionCtFindingsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<String?> chemoResponseScore = const Value.absent(),
                Value<double?> pci = const Value.absent(),
                Value<String?> cytoreductiveLevel = const Value.absent(),
                Value<String?> ctLiverPre = const Value.absent(),
                Value<String?> ctLiverPost = const Value.absent(),
                Value<String?> ctGallBladderPre = const Value.absent(),
                Value<String?> ctGallBladderPost = const Value.absent(),
                Value<String?> ctSpleenPre = const Value.absent(),
                Value<String?> ctSpleenPost = const Value.absent(),
                Value<String?> ctPancreasPre = const Value.absent(),
                Value<String?> ctPancreasPost = const Value.absent(),
                Value<String?> ctSuprarenalsPre = const Value.absent(),
                Value<String?> ctSuprarenalsPost = const Value.absent(),
                Value<String?> ctKidneyPre = const Value.absent(),
                Value<String?> ctKidneyPost = const Value.absent(),
                Value<String?> ctBowelPre = const Value.absent(),
                Value<String?> ctBowelPost = const Value.absent(),
                Value<String?> ctAortaIvcPre = const Value.absent(),
                Value<String?> ctAortaIvcPost = const Value.absent(),
                Value<String?> ctUrinaryBladderPre = const Value.absent(),
                Value<String?> ctUrinaryBladderPost = const Value.absent(),
                Value<String?> ctUterusOvariesPre = const Value.absent(),
                Value<String?> ctUterusOvariesPost = const Value.absent(),
                Value<String?> ctLymphNodesPre = const Value.absent(),
                Value<String?> ctLymphNodesPost = const Value.absent(),
                Value<double?> kelimScore = const Value.absent(),
                Value<String?> crsOmentum = const Value.absent(),
                Value<String?> crsAdnexa = const Value.absent(),
                Value<String?> crsOtherSites = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => CytoreductionCtFindingsCompanion(
                id: id,
                patientId: patientId,
                chemoResponseScore: chemoResponseScore,
                pci: pci,
                cytoreductiveLevel: cytoreductiveLevel,
                ctLiverPre: ctLiverPre,
                ctLiverPost: ctLiverPost,
                ctGallBladderPre: ctGallBladderPre,
                ctGallBladderPost: ctGallBladderPost,
                ctSpleenPre: ctSpleenPre,
                ctSpleenPost: ctSpleenPost,
                ctPancreasPre: ctPancreasPre,
                ctPancreasPost: ctPancreasPost,
                ctSuprarenalsPre: ctSuprarenalsPre,
                ctSuprarenalsPost: ctSuprarenalsPost,
                ctKidneyPre: ctKidneyPre,
                ctKidneyPost: ctKidneyPost,
                ctBowelPre: ctBowelPre,
                ctBowelPost: ctBowelPost,
                ctAortaIvcPre: ctAortaIvcPre,
                ctAortaIvcPost: ctAortaIvcPost,
                ctUrinaryBladderPre: ctUrinaryBladderPre,
                ctUrinaryBladderPost: ctUrinaryBladderPost,
                ctUterusOvariesPre: ctUterusOvariesPre,
                ctUterusOvariesPost: ctUterusOvariesPost,
                ctLymphNodesPre: ctLymphNodesPre,
                ctLymphNodesPost: ctLymphNodesPost,
                kelimScore: kelimScore,
                crsOmentum: crsOmentum,
                crsAdnexa: crsAdnexa,
                crsOtherSites: crsOtherSites,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientId,
                Value<String?> chemoResponseScore = const Value.absent(),
                Value<double?> pci = const Value.absent(),
                Value<String?> cytoreductiveLevel = const Value.absent(),
                Value<String?> ctLiverPre = const Value.absent(),
                Value<String?> ctLiverPost = const Value.absent(),
                Value<String?> ctGallBladderPre = const Value.absent(),
                Value<String?> ctGallBladderPost = const Value.absent(),
                Value<String?> ctSpleenPre = const Value.absent(),
                Value<String?> ctSpleenPost = const Value.absent(),
                Value<String?> ctPancreasPre = const Value.absent(),
                Value<String?> ctPancreasPost = const Value.absent(),
                Value<String?> ctSuprarenalsPre = const Value.absent(),
                Value<String?> ctSuprarenalsPost = const Value.absent(),
                Value<String?> ctKidneyPre = const Value.absent(),
                Value<String?> ctKidneyPost = const Value.absent(),
                Value<String?> ctBowelPre = const Value.absent(),
                Value<String?> ctBowelPost = const Value.absent(),
                Value<String?> ctAortaIvcPre = const Value.absent(),
                Value<String?> ctAortaIvcPost = const Value.absent(),
                Value<String?> ctUrinaryBladderPre = const Value.absent(),
                Value<String?> ctUrinaryBladderPost = const Value.absent(),
                Value<String?> ctUterusOvariesPre = const Value.absent(),
                Value<String?> ctUterusOvariesPost = const Value.absent(),
                Value<String?> ctLymphNodesPre = const Value.absent(),
                Value<String?> ctLymphNodesPost = const Value.absent(),
                Value<double?> kelimScore = const Value.absent(),
                Value<String?> crsOmentum = const Value.absent(),
                Value<String?> crsAdnexa = const Value.absent(),
                Value<String?> crsOtherSites = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => CytoreductionCtFindingsCompanion.insert(
                id: id,
                patientId: patientId,
                chemoResponseScore: chemoResponseScore,
                pci: pci,
                cytoreductiveLevel: cytoreductiveLevel,
                ctLiverPre: ctLiverPre,
                ctLiverPost: ctLiverPost,
                ctGallBladderPre: ctGallBladderPre,
                ctGallBladderPost: ctGallBladderPost,
                ctSpleenPre: ctSpleenPre,
                ctSpleenPost: ctSpleenPost,
                ctPancreasPre: ctPancreasPre,
                ctPancreasPost: ctPancreasPost,
                ctSuprarenalsPre: ctSuprarenalsPre,
                ctSuprarenalsPost: ctSuprarenalsPost,
                ctKidneyPre: ctKidneyPre,
                ctKidneyPost: ctKidneyPost,
                ctBowelPre: ctBowelPre,
                ctBowelPost: ctBowelPost,
                ctAortaIvcPre: ctAortaIvcPre,
                ctAortaIvcPost: ctAortaIvcPost,
                ctUrinaryBladderPre: ctUrinaryBladderPre,
                ctUrinaryBladderPost: ctUrinaryBladderPost,
                ctUterusOvariesPre: ctUterusOvariesPre,
                ctUterusOvariesPost: ctUterusOvariesPost,
                ctLymphNodesPre: ctLymphNodesPre,
                ctLymphNodesPost: ctLymphNodesPost,
                kelimScore: kelimScore,
                crsOmentum: crsOmentum,
                crsAdnexa: crsAdnexa,
                crsOtherSites: crsOtherSites,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CytoreductionCtFindingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (patientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patientId,
                                referencedTable:
                                    $$CytoreductionCtFindingsTableReferences
                                        ._patientIdTable(db),
                                referencedColumn:
                                    $$CytoreductionCtFindingsTableReferences
                                        ._patientIdTable(db)
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

typedef $$CytoreductionCtFindingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CytoreductionCtFindingsTable,
      CytoreductionCtFinding,
      $$CytoreductionCtFindingsTableFilterComposer,
      $$CytoreductionCtFindingsTableOrderingComposer,
      $$CytoreductionCtFindingsTableAnnotationComposer,
      $$CytoreductionCtFindingsTableCreateCompanionBuilder,
      $$CytoreductionCtFindingsTableUpdateCompanionBuilder,
      (CytoreductionCtFinding, $$CytoreductionCtFindingsTableReferences),
      CytoreductionCtFinding,
      PrefetchHooks Function({bool patientId})
    >;
typedef $$RelapseFollowupsTableCreateCompanionBuilder =
    RelapseFollowupsCompanion Function({
      Value<int> id,
      required int patientId,
      Value<DateTime?> recurrenceDate,
      Value<String?> relapseType,
      Value<String?> secondLineNeed,
      Value<String?> pfi,
      Value<String?> tfi,
      Value<String?> os,
      Value<DateTime> recordedAt,
    });
typedef $$RelapseFollowupsTableUpdateCompanionBuilder =
    RelapseFollowupsCompanion Function({
      Value<int> id,
      Value<int> patientId,
      Value<DateTime?> recurrenceDate,
      Value<String?> relapseType,
      Value<String?> secondLineNeed,
      Value<String?> pfi,
      Value<String?> tfi,
      Value<String?> os,
      Value<DateTime> recordedAt,
    });

final class $$RelapseFollowupsTableReferences
    extends
        BaseReferences<_$AppDatabase, $RelapseFollowupsTable, RelapseFollowup> {
  $$RelapseFollowupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias('relapse_followups__patient_id__patients__id');

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RelapseFollowupsTableFilterComposer
    extends Composer<_$AppDatabase, $RelapseFollowupsTable> {
  $$RelapseFollowupsTableFilterComposer({
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

  ColumnFilters<DateTime> get recurrenceDate => $composableBuilder(
    column: $table.recurrenceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relapseType => $composableBuilder(
    column: $table.relapseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secondLineNeed => $composableBuilder(
    column: $table.secondLineNeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pfi => $composableBuilder(
    column: $table.pfi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tfi => $composableBuilder(
    column: $table.tfi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get os => $composableBuilder(
    column: $table.os,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelapseFollowupsTableOrderingComposer
    extends Composer<_$AppDatabase, $RelapseFollowupsTable> {
  $$RelapseFollowupsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get recurrenceDate => $composableBuilder(
    column: $table.recurrenceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relapseType => $composableBuilder(
    column: $table.relapseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secondLineNeed => $composableBuilder(
    column: $table.secondLineNeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pfi => $composableBuilder(
    column: $table.pfi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tfi => $composableBuilder(
    column: $table.tfi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get os => $composableBuilder(
    column: $table.os,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableOrderingComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelapseFollowupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RelapseFollowupsTable> {
  $$RelapseFollowupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get recurrenceDate => $composableBuilder(
    column: $table.recurrenceDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relapseType => $composableBuilder(
    column: $table.relapseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get secondLineNeed => $composableBuilder(
    column: $table.secondLineNeed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pfi =>
      $composableBuilder(column: $table.pfi, builder: (column) => column);

  GeneratedColumn<String> get tfi =>
      $composableBuilder(column: $table.tfi, builder: (column) => column);

  GeneratedColumn<String> get os =>
      $composableBuilder(column: $table.os, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RelapseFollowupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelapseFollowupsTable,
          RelapseFollowup,
          $$RelapseFollowupsTableFilterComposer,
          $$RelapseFollowupsTableOrderingComposer,
          $$RelapseFollowupsTableAnnotationComposer,
          $$RelapseFollowupsTableCreateCompanionBuilder,
          $$RelapseFollowupsTableUpdateCompanionBuilder,
          (RelapseFollowup, $$RelapseFollowupsTableReferences),
          RelapseFollowup,
          PrefetchHooks Function({bool patientId})
        > {
  $$RelapseFollowupsTableTableManager(
    _$AppDatabase db,
    $RelapseFollowupsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelapseFollowupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelapseFollowupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelapseFollowupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<DateTime?> recurrenceDate = const Value.absent(),
                Value<String?> relapseType = const Value.absent(),
                Value<String?> secondLineNeed = const Value.absent(),
                Value<String?> pfi = const Value.absent(),
                Value<String?> tfi = const Value.absent(),
                Value<String?> os = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => RelapseFollowupsCompanion(
                id: id,
                patientId: patientId,
                recurrenceDate: recurrenceDate,
                relapseType: relapseType,
                secondLineNeed: secondLineNeed,
                pfi: pfi,
                tfi: tfi,
                os: os,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientId,
                Value<DateTime?> recurrenceDate = const Value.absent(),
                Value<String?> relapseType = const Value.absent(),
                Value<String?> secondLineNeed = const Value.absent(),
                Value<String?> pfi = const Value.absent(),
                Value<String?> tfi = const Value.absent(),
                Value<String?> os = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => RelapseFollowupsCompanion.insert(
                id: id,
                patientId: patientId,
                recurrenceDate: recurrenceDate,
                relapseType: relapseType,
                secondLineNeed: secondLineNeed,
                pfi: pfi,
                tfi: tfi,
                os: os,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RelapseFollowupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (patientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patientId,
                                referencedTable:
                                    $$RelapseFollowupsTableReferences
                                        ._patientIdTable(db),
                                referencedColumn:
                                    $$RelapseFollowupsTableReferences
                                        ._patientIdTable(db)
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

typedef $$RelapseFollowupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelapseFollowupsTable,
      RelapseFollowup,
      $$RelapseFollowupsTableFilterComposer,
      $$RelapseFollowupsTableOrderingComposer,
      $$RelapseFollowupsTableAnnotationComposer,
      $$RelapseFollowupsTableCreateCompanionBuilder,
      $$RelapseFollowupsTableUpdateCompanionBuilder,
      (RelapseFollowup, $$RelapseFollowupsTableReferences),
      RelapseFollowup,
      PrefetchHooks Function({bool patientId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$PreChemoAssessmentsTableTableManager get preChemoAssessments =>
      $$PreChemoAssessmentsTableTableManager(_db, _db.preChemoAssessments);
  $$PostChemoAssessmentsTableTableManager get postChemoAssessments =>
      $$PostChemoAssessmentsTableTableManager(_db, _db.postChemoAssessments);
  $$CytoreductionCtFindingsTableTableManager get cytoreductionCtFindings =>
      $$CytoreductionCtFindingsTableTableManager(
        _db,
        _db.cytoreductionCtFindings,
      );
  $$RelapseFollowupsTableTableManager get relapseFollowups =>
      $$RelapseFollowupsTableTableManager(_db, _db.relapseFollowups);
}
