// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TecnicosTable extends Tecnicos with TableInfo<$TecnicosTable, Tecnico> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TecnicosTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, telefono];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tecnicos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tecnico> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    } else if (isInserting) {
      context.missing(_telefonoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tecnico map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tecnico(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      )!,
    );
  }

  @override
  $TecnicosTable createAlias(String alias) {
    return $TecnicosTable(attachedDatabase, alias);
  }
}

class Tecnico extends DataClass implements Insertable<Tecnico> {
  final int id;
  final String nombre;
  final String telefono;
  const Tecnico({
    required this.id,
    required this.nombre,
    required this.telefono,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['telefono'] = Variable<String>(telefono);
    return map;
  }

  TecnicosCompanion toCompanion(bool nullToAbsent) {
    return TecnicosCompanion(
      id: Value(id),
      nombre: Value(nombre),
      telefono: Value(telefono),
    );
  }

  factory Tecnico.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tecnico(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      telefono: serializer.fromJson<String>(json['telefono']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'telefono': serializer.toJson<String>(telefono),
    };
  }

  Tecnico copyWith({int? id, String? nombre, String? telefono}) => Tecnico(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    telefono: telefono ?? this.telefono,
  );
  Tecnico copyWithCompanion(TecnicosCompanion data) {
    return Tecnico(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tecnico(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, telefono);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tecnico &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.telefono == this.telefono);
}

class TecnicosCompanion extends UpdateCompanion<Tecnico> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> telefono;
  const TecnicosCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
  });
  TecnicosCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String telefono,
  }) : nombre = Value(nombre),
       telefono = Value(telefono);
  static Insertable<Tecnico> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? telefono,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (telefono != null) 'telefono': telefono,
    });
  }

  TecnicosCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? telefono,
  }) {
    return TecnicosCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TecnicosCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono')
          ..write(')'))
        .toString();
  }
}

class $ClientesTable extends Clientes with TableInfo<$ClientesTable, Cliente> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, telefono];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clientes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cliente> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    } else if (isInserting) {
      context.missing(_telefonoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cliente map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cliente(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      )!,
    );
  }

  @override
  $ClientesTable createAlias(String alias) {
    return $ClientesTable(attachedDatabase, alias);
  }
}

class Cliente extends DataClass implements Insertable<Cliente> {
  final int id;
  final String nombre;
  final String telefono;
  const Cliente({
    required this.id,
    required this.nombre,
    required this.telefono,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['telefono'] = Variable<String>(telefono);
    return map;
  }

  ClientesCompanion toCompanion(bool nullToAbsent) {
    return ClientesCompanion(
      id: Value(id),
      nombre: Value(nombre),
      telefono: Value(telefono),
    );
  }

  factory Cliente.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cliente(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      telefono: serializer.fromJson<String>(json['telefono']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'telefono': serializer.toJson<String>(telefono),
    };
  }

  Cliente copyWith({int? id, String? nombre, String? telefono}) => Cliente(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    telefono: telefono ?? this.telefono,
  );
  Cliente copyWithCompanion(ClientesCompanion data) {
    return Cliente(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cliente(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, telefono);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cliente &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.telefono == this.telefono);
}

class ClientesCompanion extends UpdateCompanion<Cliente> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> telefono;
  const ClientesCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
  });
  ClientesCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String telefono,
  }) : nombre = Value(nombre),
       telefono = Value(telefono);
  static Insertable<Cliente> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? telefono,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (telefono != null) 'telefono': telefono,
    });
  }

  ClientesCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? telefono,
  }) {
    return ClientesCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientesCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono')
          ..write(')'))
        .toString();
  }
}

class $RepuestosTable extends Repuestos
    with TableInfo<$RepuestosTable, Repuesto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RepuestosTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<String> codigo = GeneratedColumn<String>(
    'codigo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _precioMeta = const VerificationMeta('precio');
  @override
  late final GeneratedColumn<double> precio = GeneratedColumn<double>(
    'precio',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _existenciasMeta = const VerificationMeta(
    'existencias',
  );
  @override
  late final GeneratedColumn<int> existencias = GeneratedColumn<int>(
    'existencias',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    codigo,
    precio,
    existencias,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'repuestos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Repuesto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('codigo')) {
      context.handle(
        _codigoMeta,
        codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta),
      );
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('precio')) {
      context.handle(
        _precioMeta,
        precio.isAcceptableOrUnknown(data['precio']!, _precioMeta),
      );
    } else if (isInserting) {
      context.missing(_precioMeta);
    }
    if (data.containsKey('existencias')) {
      context.handle(
        _existenciasMeta,
        existencias.isAcceptableOrUnknown(
          data['existencias']!,
          _existenciasMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_existenciasMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Repuesto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Repuesto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      codigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo'],
      )!,
      precio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio'],
      )!,
      existencias: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}existencias'],
      )!,
    );
  }

  @override
  $RepuestosTable createAlias(String alias) {
    return $RepuestosTable(attachedDatabase, alias);
  }
}

class Repuesto extends DataClass implements Insertable<Repuesto> {
  final int id;
  final String nombre;
  final String codigo;
  final double precio;
  final int existencias;
  const Repuesto({
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.precio,
    required this.existencias,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['codigo'] = Variable<String>(codigo);
    map['precio'] = Variable<double>(precio);
    map['existencias'] = Variable<int>(existencias);
    return map;
  }

  RepuestosCompanion toCompanion(bool nullToAbsent) {
    return RepuestosCompanion(
      id: Value(id),
      nombre: Value(nombre),
      codigo: Value(codigo),
      precio: Value(precio),
      existencias: Value(existencias),
    );
  }

  factory Repuesto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Repuesto(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      codigo: serializer.fromJson<String>(json['codigo']),
      precio: serializer.fromJson<double>(json['precio']),
      existencias: serializer.fromJson<int>(json['existencias']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'codigo': serializer.toJson<String>(codigo),
      'precio': serializer.toJson<double>(precio),
      'existencias': serializer.toJson<int>(existencias),
    };
  }

  Repuesto copyWith({
    int? id,
    String? nombre,
    String? codigo,
    double? precio,
    int? existencias,
  }) => Repuesto(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    codigo: codigo ?? this.codigo,
    precio: precio ?? this.precio,
    existencias: existencias ?? this.existencias,
  );
  Repuesto copyWithCompanion(RepuestosCompanion data) {
    return Repuesto(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      codigo: data.codigo.present ? data.codigo.value : this.codigo,
      precio: data.precio.present ? data.precio.value : this.precio,
      existencias: data.existencias.present
          ? data.existencias.value
          : this.existencias,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Repuesto(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('codigo: $codigo, ')
          ..write('precio: $precio, ')
          ..write('existencias: $existencias')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, codigo, precio, existencias);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Repuesto &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.codigo == this.codigo &&
          other.precio == this.precio &&
          other.existencias == this.existencias);
}

class RepuestosCompanion extends UpdateCompanion<Repuesto> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> codigo;
  final Value<double> precio;
  final Value<int> existencias;
  const RepuestosCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.codigo = const Value.absent(),
    this.precio = const Value.absent(),
    this.existencias = const Value.absent(),
  });
  RepuestosCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String codigo,
    required double precio,
    required int existencias,
  }) : nombre = Value(nombre),
       codigo = Value(codigo),
       precio = Value(precio),
       existencias = Value(existencias);
  static Insertable<Repuesto> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? codigo,
    Expression<double>? precio,
    Expression<int>? existencias,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (codigo != null) 'codigo': codigo,
      if (precio != null) 'precio': precio,
      if (existencias != null) 'existencias': existencias,
    });
  }

  RepuestosCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? codigo,
    Value<double>? precio,
    Value<int>? existencias,
  }) {
    return RepuestosCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      codigo: codigo ?? this.codigo,
      precio: precio ?? this.precio,
      existencias: existencias ?? this.existencias,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (precio.present) {
      map['precio'] = Variable<double>(precio.value);
    }
    if (existencias.present) {
      map['existencias'] = Variable<int>(existencias.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepuestosCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('codigo: $codigo, ')
          ..write('precio: $precio, ')
          ..write('existencias: $existencias')
          ..write(')'))
        .toString();
  }
}

class $EquiposTable extends Equipos with TableInfo<$EquiposTable, Equipo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquiposTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _idClienteMeta = const VerificationMeta(
    'idCliente',
  );
  @override
  late final GeneratedColumn<int> idCliente = GeneratedColumn<int>(
    'id_cliente',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoEquipoMeta = const VerificationMeta(
    'tipoEquipo',
  );
  @override
  late final GeneratedColumn<String> tipoEquipo = GeneratedColumn<String>(
    'tipo_equipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marcaMeta = const VerificationMeta('marca');
  @override
  late final GeneratedColumn<String> marca = GeneratedColumn<String>(
    'marca',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeloMeta = const VerificationMeta('modelo');
  @override
  late final GeneratedColumn<String> modelo = GeneratedColumn<String>(
    'modelo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroSerieMeta = const VerificationMeta(
    'numeroSerie',
  );
  @override
  late final GeneratedColumn<String> numeroSerie = GeneratedColumn<String>(
    'numero_serie',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idCliente,
    tipoEquipo,
    marca,
    modelo,
    numeroSerie,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Equipo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_cliente')) {
      context.handle(
        _idClienteMeta,
        idCliente.isAcceptableOrUnknown(data['id_cliente']!, _idClienteMeta),
      );
    } else if (isInserting) {
      context.missing(_idClienteMeta);
    }
    if (data.containsKey('tipo_equipo')) {
      context.handle(
        _tipoEquipoMeta,
        tipoEquipo.isAcceptableOrUnknown(data['tipo_equipo']!, _tipoEquipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoEquipoMeta);
    }
    if (data.containsKey('marca')) {
      context.handle(
        _marcaMeta,
        marca.isAcceptableOrUnknown(data['marca']!, _marcaMeta),
      );
    } else if (isInserting) {
      context.missing(_marcaMeta);
    }
    if (data.containsKey('modelo')) {
      context.handle(
        _modeloMeta,
        modelo.isAcceptableOrUnknown(data['modelo']!, _modeloMeta),
      );
    } else if (isInserting) {
      context.missing(_modeloMeta);
    }
    if (data.containsKey('numero_serie')) {
      context.handle(
        _numeroSerieMeta,
        numeroSerie.isAcceptableOrUnknown(
          data['numero_serie']!,
          _numeroSerieMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Equipo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Equipo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idCliente: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_cliente'],
      )!,
      tipoEquipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_equipo'],
      )!,
      marca: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marca'],
      )!,
      modelo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modelo'],
      )!,
      numeroSerie: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_serie'],
      ),
    );
  }

  @override
  $EquiposTable createAlias(String alias) {
    return $EquiposTable(attachedDatabase, alias);
  }
}

class Equipo extends DataClass implements Insertable<Equipo> {
  final int id;
  final int idCliente;
  final String tipoEquipo;
  final String marca;
  final String modelo;
  final String? numeroSerie;
  const Equipo({
    required this.id,
    required this.idCliente,
    required this.tipoEquipo,
    required this.marca,
    required this.modelo,
    this.numeroSerie,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_cliente'] = Variable<int>(idCliente);
    map['tipo_equipo'] = Variable<String>(tipoEquipo);
    map['marca'] = Variable<String>(marca);
    map['modelo'] = Variable<String>(modelo);
    if (!nullToAbsent || numeroSerie != null) {
      map['numero_serie'] = Variable<String>(numeroSerie);
    }
    return map;
  }

  EquiposCompanion toCompanion(bool nullToAbsent) {
    return EquiposCompanion(
      id: Value(id),
      idCliente: Value(idCliente),
      tipoEquipo: Value(tipoEquipo),
      marca: Value(marca),
      modelo: Value(modelo),
      numeroSerie: numeroSerie == null && nullToAbsent
          ? const Value.absent()
          : Value(numeroSerie),
    );
  }

  factory Equipo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Equipo(
      id: serializer.fromJson<int>(json['id']),
      idCliente: serializer.fromJson<int>(json['idCliente']),
      tipoEquipo: serializer.fromJson<String>(json['tipoEquipo']),
      marca: serializer.fromJson<String>(json['marca']),
      modelo: serializer.fromJson<String>(json['modelo']),
      numeroSerie: serializer.fromJson<String?>(json['numeroSerie']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCliente': serializer.toJson<int>(idCliente),
      'tipoEquipo': serializer.toJson<String>(tipoEquipo),
      'marca': serializer.toJson<String>(marca),
      'modelo': serializer.toJson<String>(modelo),
      'numeroSerie': serializer.toJson<String?>(numeroSerie),
    };
  }

  Equipo copyWith({
    int? id,
    int? idCliente,
    String? tipoEquipo,
    String? marca,
    String? modelo,
    Value<String?> numeroSerie = const Value.absent(),
  }) => Equipo(
    id: id ?? this.id,
    idCliente: idCliente ?? this.idCliente,
    tipoEquipo: tipoEquipo ?? this.tipoEquipo,
    marca: marca ?? this.marca,
    modelo: modelo ?? this.modelo,
    numeroSerie: numeroSerie.present ? numeroSerie.value : this.numeroSerie,
  );
  Equipo copyWithCompanion(EquiposCompanion data) {
    return Equipo(
      id: data.id.present ? data.id.value : this.id,
      idCliente: data.idCliente.present ? data.idCliente.value : this.idCliente,
      tipoEquipo: data.tipoEquipo.present
          ? data.tipoEquipo.value
          : this.tipoEquipo,
      marca: data.marca.present ? data.marca.value : this.marca,
      modelo: data.modelo.present ? data.modelo.value : this.modelo,
      numeroSerie: data.numeroSerie.present
          ? data.numeroSerie.value
          : this.numeroSerie,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Equipo(')
          ..write('id: $id, ')
          ..write('idCliente: $idCliente, ')
          ..write('tipoEquipo: $tipoEquipo, ')
          ..write('marca: $marca, ')
          ..write('modelo: $modelo, ')
          ..write('numeroSerie: $numeroSerie')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idCliente, tipoEquipo, marca, modelo, numeroSerie);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Equipo &&
          other.id == this.id &&
          other.idCliente == this.idCliente &&
          other.tipoEquipo == this.tipoEquipo &&
          other.marca == this.marca &&
          other.modelo == this.modelo &&
          other.numeroSerie == this.numeroSerie);
}

class EquiposCompanion extends UpdateCompanion<Equipo> {
  final Value<int> id;
  final Value<int> idCliente;
  final Value<String> tipoEquipo;
  final Value<String> marca;
  final Value<String> modelo;
  final Value<String?> numeroSerie;
  const EquiposCompanion({
    this.id = const Value.absent(),
    this.idCliente = const Value.absent(),
    this.tipoEquipo = const Value.absent(),
    this.marca = const Value.absent(),
    this.modelo = const Value.absent(),
    this.numeroSerie = const Value.absent(),
  });
  EquiposCompanion.insert({
    this.id = const Value.absent(),
    required int idCliente,
    required String tipoEquipo,
    required String marca,
    required String modelo,
    this.numeroSerie = const Value.absent(),
  }) : idCliente = Value(idCliente),
       tipoEquipo = Value(tipoEquipo),
       marca = Value(marca),
       modelo = Value(modelo);
  static Insertable<Equipo> custom({
    Expression<int>? id,
    Expression<int>? idCliente,
    Expression<String>? tipoEquipo,
    Expression<String>? marca,
    Expression<String>? modelo,
    Expression<String>? numeroSerie,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCliente != null) 'id_cliente': idCliente,
      if (tipoEquipo != null) 'tipo_equipo': tipoEquipo,
      if (marca != null) 'marca': marca,
      if (modelo != null) 'modelo': modelo,
      if (numeroSerie != null) 'numero_serie': numeroSerie,
    });
  }

  EquiposCompanion copyWith({
    Value<int>? id,
    Value<int>? idCliente,
    Value<String>? tipoEquipo,
    Value<String>? marca,
    Value<String>? modelo,
    Value<String?>? numeroSerie,
  }) {
    return EquiposCompanion(
      id: id ?? this.id,
      idCliente: idCliente ?? this.idCliente,
      tipoEquipo: tipoEquipo ?? this.tipoEquipo,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      numeroSerie: numeroSerie ?? this.numeroSerie,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCliente.present) {
      map['id_cliente'] = Variable<int>(idCliente.value);
    }
    if (tipoEquipo.present) {
      map['tipo_equipo'] = Variable<String>(tipoEquipo.value);
    }
    if (marca.present) {
      map['marca'] = Variable<String>(marca.value);
    }
    if (modelo.present) {
      map['modelo'] = Variable<String>(modelo.value);
    }
    if (numeroSerie.present) {
      map['numero_serie'] = Variable<String>(numeroSerie.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquiposCompanion(')
          ..write('id: $id, ')
          ..write('idCliente: $idCliente, ')
          ..write('tipoEquipo: $tipoEquipo, ')
          ..write('marca: $marca, ')
          ..write('modelo: $modelo, ')
          ..write('numeroSerie: $numeroSerie')
          ..write(')'))
        .toString();
  }
}

class $OrdenesTable extends Ordenes with TableInfo<$OrdenesTable, Ordene> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdenesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _idEquipoMeta = const VerificationMeta(
    'idEquipo',
  );
  @override
  late final GeneratedColumn<int> idEquipo = GeneratedColumn<int>(
    'id_equipo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idTecnicoMeta = const VerificationMeta(
    'idTecnico',
  );
  @override
  late final GeneratedColumn<int> idTecnico = GeneratedColumn<int>(
    'id_tecnico',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fallaReportadaMeta = const VerificationMeta(
    'fallaReportada',
  );
  @override
  late final GeneratedColumn<String> fallaReportada = GeneratedColumn<String>(
    'falla_reportada',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('recibida'),
  );
  static const VerificationMeta _fechaRecepcionMeta = const VerificationMeta(
    'fechaRecepcion',
  );
  @override
  late final GeneratedColumn<DateTime> fechaRecepcion =
      GeneratedColumn<DateTime>(
        'fecha_recepcion',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _fechaEntregaMeta = const VerificationMeta(
    'fechaEntrega',
  );
  @override
  late final GeneratedColumn<DateTime> fechaEntrega = GeneratedColumn<DateTime>(
    'fecha_entrega',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idEquipo,
    idTecnico,
    fallaReportada,
    estado,
    fechaRecepcion,
    fechaEntrega,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ordenes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ordene> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_equipo')) {
      context.handle(
        _idEquipoMeta,
        idEquipo.isAcceptableOrUnknown(data['id_equipo']!, _idEquipoMeta),
      );
    } else if (isInserting) {
      context.missing(_idEquipoMeta);
    }
    if (data.containsKey('id_tecnico')) {
      context.handle(
        _idTecnicoMeta,
        idTecnico.isAcceptableOrUnknown(data['id_tecnico']!, _idTecnicoMeta),
      );
    }
    if (data.containsKey('falla_reportada')) {
      context.handle(
        _fallaReportadaMeta,
        fallaReportada.isAcceptableOrUnknown(
          data['falla_reportada']!,
          _fallaReportadaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fallaReportadaMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    }
    if (data.containsKey('fecha_recepcion')) {
      context.handle(
        _fechaRecepcionMeta,
        fechaRecepcion.isAcceptableOrUnknown(
          data['fecha_recepcion']!,
          _fechaRecepcionMeta,
        ),
      );
    }
    if (data.containsKey('fecha_entrega')) {
      context.handle(
        _fechaEntregaMeta,
        fechaEntrega.isAcceptableOrUnknown(
          data['fecha_entrega']!,
          _fechaEntregaMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ordene map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ordene(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idEquipo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_equipo'],
      )!,
      idTecnico: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_tecnico'],
      ),
      fallaReportada: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}falla_reportada'],
      )!,
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      fechaRecepcion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_recepcion'],
      )!,
      fechaEntrega: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_entrega'],
      ),
    );
  }

  @override
  $OrdenesTable createAlias(String alias) {
    return $OrdenesTable(attachedDatabase, alias);
  }
}

class Ordene extends DataClass implements Insertable<Ordene> {
  final int id;
  final int idEquipo;
  final int? idTecnico;
  final String fallaReportada;
  final String estado;
  final DateTime fechaRecepcion;
  final DateTime? fechaEntrega;
  const Ordene({
    required this.id,
    required this.idEquipo,
    this.idTecnico,
    required this.fallaReportada,
    required this.estado,
    required this.fechaRecepcion,
    this.fechaEntrega,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_equipo'] = Variable<int>(idEquipo);
    if (!nullToAbsent || idTecnico != null) {
      map['id_tecnico'] = Variable<int>(idTecnico);
    }
    map['falla_reportada'] = Variable<String>(fallaReportada);
    map['estado'] = Variable<String>(estado);
    map['fecha_recepcion'] = Variable<DateTime>(fechaRecepcion);
    if (!nullToAbsent || fechaEntrega != null) {
      map['fecha_entrega'] = Variable<DateTime>(fechaEntrega);
    }
    return map;
  }

  OrdenesCompanion toCompanion(bool nullToAbsent) {
    return OrdenesCompanion(
      id: Value(id),
      idEquipo: Value(idEquipo),
      idTecnico: idTecnico == null && nullToAbsent
          ? const Value.absent()
          : Value(idTecnico),
      fallaReportada: Value(fallaReportada),
      estado: Value(estado),
      fechaRecepcion: Value(fechaRecepcion),
      fechaEntrega: fechaEntrega == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaEntrega),
    );
  }

  factory Ordene.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ordene(
      id: serializer.fromJson<int>(json['id']),
      idEquipo: serializer.fromJson<int>(json['idEquipo']),
      idTecnico: serializer.fromJson<int?>(json['idTecnico']),
      fallaReportada: serializer.fromJson<String>(json['fallaReportada']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaRecepcion: serializer.fromJson<DateTime>(json['fechaRecepcion']),
      fechaEntrega: serializer.fromJson<DateTime?>(json['fechaEntrega']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idEquipo': serializer.toJson<int>(idEquipo),
      'idTecnico': serializer.toJson<int?>(idTecnico),
      'fallaReportada': serializer.toJson<String>(fallaReportada),
      'estado': serializer.toJson<String>(estado),
      'fechaRecepcion': serializer.toJson<DateTime>(fechaRecepcion),
      'fechaEntrega': serializer.toJson<DateTime?>(fechaEntrega),
    };
  }

  Ordene copyWith({
    int? id,
    int? idEquipo,
    Value<int?> idTecnico = const Value.absent(),
    String? fallaReportada,
    String? estado,
    DateTime? fechaRecepcion,
    Value<DateTime?> fechaEntrega = const Value.absent(),
  }) => Ordene(
    id: id ?? this.id,
    idEquipo: idEquipo ?? this.idEquipo,
    idTecnico: idTecnico.present ? idTecnico.value : this.idTecnico,
    fallaReportada: fallaReportada ?? this.fallaReportada,
    estado: estado ?? this.estado,
    fechaRecepcion: fechaRecepcion ?? this.fechaRecepcion,
    fechaEntrega: fechaEntrega.present ? fechaEntrega.value : this.fechaEntrega,
  );
  Ordene copyWithCompanion(OrdenesCompanion data) {
    return Ordene(
      id: data.id.present ? data.id.value : this.id,
      idEquipo: data.idEquipo.present ? data.idEquipo.value : this.idEquipo,
      idTecnico: data.idTecnico.present ? data.idTecnico.value : this.idTecnico,
      fallaReportada: data.fallaReportada.present
          ? data.fallaReportada.value
          : this.fallaReportada,
      estado: data.estado.present ? data.estado.value : this.estado,
      fechaRecepcion: data.fechaRecepcion.present
          ? data.fechaRecepcion.value
          : this.fechaRecepcion,
      fechaEntrega: data.fechaEntrega.present
          ? data.fechaEntrega.value
          : this.fechaEntrega,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ordene(')
          ..write('id: $id, ')
          ..write('idEquipo: $idEquipo, ')
          ..write('idTecnico: $idTecnico, ')
          ..write('fallaReportada: $fallaReportada, ')
          ..write('estado: $estado, ')
          ..write('fechaRecepcion: $fechaRecepcion, ')
          ..write('fechaEntrega: $fechaEntrega')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    idEquipo,
    idTecnico,
    fallaReportada,
    estado,
    fechaRecepcion,
    fechaEntrega,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ordene &&
          other.id == this.id &&
          other.idEquipo == this.idEquipo &&
          other.idTecnico == this.idTecnico &&
          other.fallaReportada == this.fallaReportada &&
          other.estado == this.estado &&
          other.fechaRecepcion == this.fechaRecepcion &&
          other.fechaEntrega == this.fechaEntrega);
}

class OrdenesCompanion extends UpdateCompanion<Ordene> {
  final Value<int> id;
  final Value<int> idEquipo;
  final Value<int?> idTecnico;
  final Value<String> fallaReportada;
  final Value<String> estado;
  final Value<DateTime> fechaRecepcion;
  final Value<DateTime?> fechaEntrega;
  const OrdenesCompanion({
    this.id = const Value.absent(),
    this.idEquipo = const Value.absent(),
    this.idTecnico = const Value.absent(),
    this.fallaReportada = const Value.absent(),
    this.estado = const Value.absent(),
    this.fechaRecepcion = const Value.absent(),
    this.fechaEntrega = const Value.absent(),
  });
  OrdenesCompanion.insert({
    this.id = const Value.absent(),
    required int idEquipo,
    this.idTecnico = const Value.absent(),
    required String fallaReportada,
    this.estado = const Value.absent(),
    this.fechaRecepcion = const Value.absent(),
    this.fechaEntrega = const Value.absent(),
  }) : idEquipo = Value(idEquipo),
       fallaReportada = Value(fallaReportada);
  static Insertable<Ordene> custom({
    Expression<int>? id,
    Expression<int>? idEquipo,
    Expression<int>? idTecnico,
    Expression<String>? fallaReportada,
    Expression<String>? estado,
    Expression<DateTime>? fechaRecepcion,
    Expression<DateTime>? fechaEntrega,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idEquipo != null) 'id_equipo': idEquipo,
      if (idTecnico != null) 'id_tecnico': idTecnico,
      if (fallaReportada != null) 'falla_reportada': fallaReportada,
      if (estado != null) 'estado': estado,
      if (fechaRecepcion != null) 'fecha_recepcion': fechaRecepcion,
      if (fechaEntrega != null) 'fecha_entrega': fechaEntrega,
    });
  }

  OrdenesCompanion copyWith({
    Value<int>? id,
    Value<int>? idEquipo,
    Value<int?>? idTecnico,
    Value<String>? fallaReportada,
    Value<String>? estado,
    Value<DateTime>? fechaRecepcion,
    Value<DateTime?>? fechaEntrega,
  }) {
    return OrdenesCompanion(
      id: id ?? this.id,
      idEquipo: idEquipo ?? this.idEquipo,
      idTecnico: idTecnico ?? this.idTecnico,
      fallaReportada: fallaReportada ?? this.fallaReportada,
      estado: estado ?? this.estado,
      fechaRecepcion: fechaRecepcion ?? this.fechaRecepcion,
      fechaEntrega: fechaEntrega ?? this.fechaEntrega,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idEquipo.present) {
      map['id_equipo'] = Variable<int>(idEquipo.value);
    }
    if (idTecnico.present) {
      map['id_tecnico'] = Variable<int>(idTecnico.value);
    }
    if (fallaReportada.present) {
      map['falla_reportada'] = Variable<String>(fallaReportada.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (fechaRecepcion.present) {
      map['fecha_recepcion'] = Variable<DateTime>(fechaRecepcion.value);
    }
    if (fechaEntrega.present) {
      map['fecha_entrega'] = Variable<DateTime>(fechaEntrega.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdenesCompanion(')
          ..write('id: $id, ')
          ..write('idEquipo: $idEquipo, ')
          ..write('idTecnico: $idTecnico, ')
          ..write('fallaReportada: $fallaReportada, ')
          ..write('estado: $estado, ')
          ..write('fechaRecepcion: $fechaRecepcion, ')
          ..write('fechaEntrega: $fechaEntrega')
          ..write(')'))
        .toString();
  }
}

class $TrabajosRealizadosTable extends TrabajosRealizados
    with TableInfo<$TrabajosRealizadosTable, TrabajosRealizado> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrabajosRealizadosTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _idOrdenMeta = const VerificationMeta(
    'idOrden',
  );
  @override
  late final GeneratedColumn<int> idOrden = GeneratedColumn<int>(
    'id_orden',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costoManoObraMeta = const VerificationMeta(
    'costoManoObra',
  );
  @override
  late final GeneratedColumn<double> costoManoObra = GeneratedColumn<double>(
    'costo_mano_obra',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idOrden,
    descripcion,
    costoManoObra,
    fecha,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trabajos_realizados';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrabajosRealizado> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_orden')) {
      context.handle(
        _idOrdenMeta,
        idOrden.isAcceptableOrUnknown(data['id_orden']!, _idOrdenMeta),
      );
    } else if (isInserting) {
      context.missing(_idOrdenMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('costo_mano_obra')) {
      context.handle(
        _costoManoObraMeta,
        costoManoObra.isAcceptableOrUnknown(
          data['costo_mano_obra']!,
          _costoManoObraMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_costoManoObraMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrabajosRealizado map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrabajosRealizado(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idOrden: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_orden'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      costoManoObra: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}costo_mano_obra'],
      )!,
      fecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
    );
  }

  @override
  $TrabajosRealizadosTable createAlias(String alias) {
    return $TrabajosRealizadosTable(attachedDatabase, alias);
  }
}

class TrabajosRealizado extends DataClass
    implements Insertable<TrabajosRealizado> {
  final int id;
  final int idOrden;
  final String descripcion;
  final double costoManoObra;
  final DateTime fecha;
  const TrabajosRealizado({
    required this.id,
    required this.idOrden,
    required this.descripcion,
    required this.costoManoObra,
    required this.fecha,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_orden'] = Variable<int>(idOrden);
    map['descripcion'] = Variable<String>(descripcion);
    map['costo_mano_obra'] = Variable<double>(costoManoObra);
    map['fecha'] = Variable<DateTime>(fecha);
    return map;
  }

  TrabajosRealizadosCompanion toCompanion(bool nullToAbsent) {
    return TrabajosRealizadosCompanion(
      id: Value(id),
      idOrden: Value(idOrden),
      descripcion: Value(descripcion),
      costoManoObra: Value(costoManoObra),
      fecha: Value(fecha),
    );
  }

  factory TrabajosRealizado.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrabajosRealizado(
      id: serializer.fromJson<int>(json['id']),
      idOrden: serializer.fromJson<int>(json['idOrden']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      costoManoObra: serializer.fromJson<double>(json['costoManoObra']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idOrden': serializer.toJson<int>(idOrden),
      'descripcion': serializer.toJson<String>(descripcion),
      'costoManoObra': serializer.toJson<double>(costoManoObra),
      'fecha': serializer.toJson<DateTime>(fecha),
    };
  }

  TrabajosRealizado copyWith({
    int? id,
    int? idOrden,
    String? descripcion,
    double? costoManoObra,
    DateTime? fecha,
  }) => TrabajosRealizado(
    id: id ?? this.id,
    idOrden: idOrden ?? this.idOrden,
    descripcion: descripcion ?? this.descripcion,
    costoManoObra: costoManoObra ?? this.costoManoObra,
    fecha: fecha ?? this.fecha,
  );
  TrabajosRealizado copyWithCompanion(TrabajosRealizadosCompanion data) {
    return TrabajosRealizado(
      id: data.id.present ? data.id.value : this.id,
      idOrden: data.idOrden.present ? data.idOrden.value : this.idOrden,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      costoManoObra: data.costoManoObra.present
          ? data.costoManoObra.value
          : this.costoManoObra,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrabajosRealizado(')
          ..write('id: $id, ')
          ..write('idOrden: $idOrden, ')
          ..write('descripcion: $descripcion, ')
          ..write('costoManoObra: $costoManoObra, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idOrden, descripcion, costoManoObra, fecha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrabajosRealizado &&
          other.id == this.id &&
          other.idOrden == this.idOrden &&
          other.descripcion == this.descripcion &&
          other.costoManoObra == this.costoManoObra &&
          other.fecha == this.fecha);
}

class TrabajosRealizadosCompanion extends UpdateCompanion<TrabajosRealizado> {
  final Value<int> id;
  final Value<int> idOrden;
  final Value<String> descripcion;
  final Value<double> costoManoObra;
  final Value<DateTime> fecha;
  const TrabajosRealizadosCompanion({
    this.id = const Value.absent(),
    this.idOrden = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.costoManoObra = const Value.absent(),
    this.fecha = const Value.absent(),
  });
  TrabajosRealizadosCompanion.insert({
    this.id = const Value.absent(),
    required int idOrden,
    required String descripcion,
    required double costoManoObra,
    this.fecha = const Value.absent(),
  }) : idOrden = Value(idOrden),
       descripcion = Value(descripcion),
       costoManoObra = Value(costoManoObra);
  static Insertable<TrabajosRealizado> custom({
    Expression<int>? id,
    Expression<int>? idOrden,
    Expression<String>? descripcion,
    Expression<double>? costoManoObra,
    Expression<DateTime>? fecha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idOrden != null) 'id_orden': idOrden,
      if (descripcion != null) 'descripcion': descripcion,
      if (costoManoObra != null) 'costo_mano_obra': costoManoObra,
      if (fecha != null) 'fecha': fecha,
    });
  }

  TrabajosRealizadosCompanion copyWith({
    Value<int>? id,
    Value<int>? idOrden,
    Value<String>? descripcion,
    Value<double>? costoManoObra,
    Value<DateTime>? fecha,
  }) {
    return TrabajosRealizadosCompanion(
      id: id ?? this.id,
      idOrden: idOrden ?? this.idOrden,
      descripcion: descripcion ?? this.descripcion,
      costoManoObra: costoManoObra ?? this.costoManoObra,
      fecha: fecha ?? this.fecha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idOrden.present) {
      map['id_orden'] = Variable<int>(idOrden.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (costoManoObra.present) {
      map['costo_mano_obra'] = Variable<double>(costoManoObra.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrabajosRealizadosCompanion(')
          ..write('id: $id, ')
          ..write('idOrden: $idOrden, ')
          ..write('descripcion: $descripcion, ')
          ..write('costoManoObra: $costoManoObra, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }
}

class $OrdenRepuestosTable extends OrdenRepuestos
    with TableInfo<$OrdenRepuestosTable, OrdenRepuesto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdenRepuestosTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _idOrdenMeta = const VerificationMeta(
    'idOrden',
  );
  @override
  late final GeneratedColumn<int> idOrden = GeneratedColumn<int>(
    'id_orden',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idRepuestoMeta = const VerificationMeta(
    'idRepuesto',
  );
  @override
  late final GeneratedColumn<int> idRepuesto = GeneratedColumn<int>(
    'id_repuesto',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cantidadMeta = const VerificationMeta(
    'cantidad',
  );
  @override
  late final GeneratedColumn<int> cantidad = GeneratedColumn<int>(
    'cantidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precioUnitarioMeta = const VerificationMeta(
    'precioUnitario',
  );
  @override
  late final GeneratedColumn<double> precioUnitario = GeneratedColumn<double>(
    'precio_unitario',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idOrden,
    idRepuesto,
    cantidad,
    precioUnitario,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orden_repuestos';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrdenRepuesto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_orden')) {
      context.handle(
        _idOrdenMeta,
        idOrden.isAcceptableOrUnknown(data['id_orden']!, _idOrdenMeta),
      );
    } else if (isInserting) {
      context.missing(_idOrdenMeta);
    }
    if (data.containsKey('id_repuesto')) {
      context.handle(
        _idRepuestoMeta,
        idRepuesto.isAcceptableOrUnknown(data['id_repuesto']!, _idRepuestoMeta),
      );
    } else if (isInserting) {
      context.missing(_idRepuestoMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(
        _cantidadMeta,
        cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta),
      );
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('precio_unitario')) {
      context.handle(
        _precioUnitarioMeta,
        precioUnitario.isAcceptableOrUnknown(
          data['precio_unitario']!,
          _precioUnitarioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precioUnitarioMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrdenRepuesto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrdenRepuesto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idOrden: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_orden'],
      )!,
      idRepuesto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_repuesto'],
      )!,
      cantidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cantidad'],
      )!,
      precioUnitario: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio_unitario'],
      )!,
    );
  }

  @override
  $OrdenRepuestosTable createAlias(String alias) {
    return $OrdenRepuestosTable(attachedDatabase, alias);
  }
}

class OrdenRepuesto extends DataClass implements Insertable<OrdenRepuesto> {
  final int id;
  final int idOrden;
  final int idRepuesto;
  final int cantidad;
  final double precioUnitario;
  const OrdenRepuesto({
    required this.id,
    required this.idOrden,
    required this.idRepuesto,
    required this.cantidad,
    required this.precioUnitario,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_orden'] = Variable<int>(idOrden);
    map['id_repuesto'] = Variable<int>(idRepuesto);
    map['cantidad'] = Variable<int>(cantidad);
    map['precio_unitario'] = Variable<double>(precioUnitario);
    return map;
  }

  OrdenRepuestosCompanion toCompanion(bool nullToAbsent) {
    return OrdenRepuestosCompanion(
      id: Value(id),
      idOrden: Value(idOrden),
      idRepuesto: Value(idRepuesto),
      cantidad: Value(cantidad),
      precioUnitario: Value(precioUnitario),
    );
  }

  factory OrdenRepuesto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrdenRepuesto(
      id: serializer.fromJson<int>(json['id']),
      idOrden: serializer.fromJson<int>(json['idOrden']),
      idRepuesto: serializer.fromJson<int>(json['idRepuesto']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      precioUnitario: serializer.fromJson<double>(json['precioUnitario']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idOrden': serializer.toJson<int>(idOrden),
      'idRepuesto': serializer.toJson<int>(idRepuesto),
      'cantidad': serializer.toJson<int>(cantidad),
      'precioUnitario': serializer.toJson<double>(precioUnitario),
    };
  }

  OrdenRepuesto copyWith({
    int? id,
    int? idOrden,
    int? idRepuesto,
    int? cantidad,
    double? precioUnitario,
  }) => OrdenRepuesto(
    id: id ?? this.id,
    idOrden: idOrden ?? this.idOrden,
    idRepuesto: idRepuesto ?? this.idRepuesto,
    cantidad: cantidad ?? this.cantidad,
    precioUnitario: precioUnitario ?? this.precioUnitario,
  );
  OrdenRepuesto copyWithCompanion(OrdenRepuestosCompanion data) {
    return OrdenRepuesto(
      id: data.id.present ? data.id.value : this.id,
      idOrden: data.idOrden.present ? data.idOrden.value : this.idOrden,
      idRepuesto: data.idRepuesto.present
          ? data.idRepuesto.value
          : this.idRepuesto,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
      precioUnitario: data.precioUnitario.present
          ? data.precioUnitario.value
          : this.precioUnitario,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrdenRepuesto(')
          ..write('id: $id, ')
          ..write('idOrden: $idOrden, ')
          ..write('idRepuesto: $idRepuesto, ')
          ..write('cantidad: $cantidad, ')
          ..write('precioUnitario: $precioUnitario')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idOrden, idRepuesto, cantidad, precioUnitario);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrdenRepuesto &&
          other.id == this.id &&
          other.idOrden == this.idOrden &&
          other.idRepuesto == this.idRepuesto &&
          other.cantidad == this.cantidad &&
          other.precioUnitario == this.precioUnitario);
}

class OrdenRepuestosCompanion extends UpdateCompanion<OrdenRepuesto> {
  final Value<int> id;
  final Value<int> idOrden;
  final Value<int> idRepuesto;
  final Value<int> cantidad;
  final Value<double> precioUnitario;
  const OrdenRepuestosCompanion({
    this.id = const Value.absent(),
    this.idOrden = const Value.absent(),
    this.idRepuesto = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.precioUnitario = const Value.absent(),
  });
  OrdenRepuestosCompanion.insert({
    this.id = const Value.absent(),
    required int idOrden,
    required int idRepuesto,
    required int cantidad,
    required double precioUnitario,
  }) : idOrden = Value(idOrden),
       idRepuesto = Value(idRepuesto),
       cantidad = Value(cantidad),
       precioUnitario = Value(precioUnitario);
  static Insertable<OrdenRepuesto> custom({
    Expression<int>? id,
    Expression<int>? idOrden,
    Expression<int>? idRepuesto,
    Expression<int>? cantidad,
    Expression<double>? precioUnitario,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idOrden != null) 'id_orden': idOrden,
      if (idRepuesto != null) 'id_repuesto': idRepuesto,
      if (cantidad != null) 'cantidad': cantidad,
      if (precioUnitario != null) 'precio_unitario': precioUnitario,
    });
  }

  OrdenRepuestosCompanion copyWith({
    Value<int>? id,
    Value<int>? idOrden,
    Value<int>? idRepuesto,
    Value<int>? cantidad,
    Value<double>? precioUnitario,
  }) {
    return OrdenRepuestosCompanion(
      id: id ?? this.id,
      idOrden: idOrden ?? this.idOrden,
      idRepuesto: idRepuesto ?? this.idRepuesto,
      cantidad: cantidad ?? this.cantidad,
      precioUnitario: precioUnitario ?? this.precioUnitario,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idOrden.present) {
      map['id_orden'] = Variable<int>(idOrden.value);
    }
    if (idRepuesto.present) {
      map['id_repuesto'] = Variable<int>(idRepuesto.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (precioUnitario.present) {
      map['precio_unitario'] = Variable<double>(precioUnitario.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdenRepuestosCompanion(')
          ..write('id: $id, ')
          ..write('idOrden: $idOrden, ')
          ..write('idRepuesto: $idRepuesto, ')
          ..write('cantidad: $cantidad, ')
          ..write('precioUnitario: $precioUnitario')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TecnicosTable tecnicos = $TecnicosTable(this);
  late final $ClientesTable clientes = $ClientesTable(this);
  late final $RepuestosTable repuestos = $RepuestosTable(this);
  late final $EquiposTable equipos = $EquiposTable(this);
  late final $OrdenesTable ordenes = $OrdenesTable(this);
  late final $TrabajosRealizadosTable trabajosRealizados =
      $TrabajosRealizadosTable(this);
  late final $OrdenRepuestosTable ordenRepuestos = $OrdenRepuestosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tecnicos,
    clientes,
    repuestos,
    equipos,
    ordenes,
    trabajosRealizados,
    ordenRepuestos,
  ];
}

typedef $$TecnicosTableCreateCompanionBuilder =
    TecnicosCompanion Function({
      Value<int> id,
      required String nombre,
      required String telefono,
    });
typedef $$TecnicosTableUpdateCompanionBuilder =
    TecnicosCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> telefono,
    });

class $$TecnicosTableFilterComposer
    extends Composer<_$AppDatabase, $TecnicosTable> {
  $$TecnicosTableFilterComposer({
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

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TecnicosTableOrderingComposer
    extends Composer<_$AppDatabase, $TecnicosTable> {
  $$TecnicosTableOrderingComposer({
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

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TecnicosTableAnnotationComposer
    extends Composer<_$AppDatabase, $TecnicosTable> {
  $$TecnicosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);
}

class $$TecnicosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TecnicosTable,
          Tecnico,
          $$TecnicosTableFilterComposer,
          $$TecnicosTableOrderingComposer,
          $$TecnicosTableAnnotationComposer,
          $$TecnicosTableCreateCompanionBuilder,
          $$TecnicosTableUpdateCompanionBuilder,
          (Tecnico, BaseReferences<_$AppDatabase, $TecnicosTable, Tecnico>),
          Tecnico,
          PrefetchHooks Function()
        > {
  $$TecnicosTableTableManager(_$AppDatabase db, $TecnicosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TecnicosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TecnicosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TecnicosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> telefono = const Value.absent(),
              }) =>
                  TecnicosCompanion(id: id, nombre: nombre, telefono: telefono),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required String telefono,
              }) => TecnicosCompanion.insert(
                id: id,
                nombre: nombre,
                telefono: telefono,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TecnicosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TecnicosTable,
      Tecnico,
      $$TecnicosTableFilterComposer,
      $$TecnicosTableOrderingComposer,
      $$TecnicosTableAnnotationComposer,
      $$TecnicosTableCreateCompanionBuilder,
      $$TecnicosTableUpdateCompanionBuilder,
      (Tecnico, BaseReferences<_$AppDatabase, $TecnicosTable, Tecnico>),
      Tecnico,
      PrefetchHooks Function()
    >;
typedef $$ClientesTableCreateCompanionBuilder =
    ClientesCompanion Function({
      Value<int> id,
      required String nombre,
      required String telefono,
    });
typedef $$ClientesTableUpdateCompanionBuilder =
    ClientesCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> telefono,
    });

class $$ClientesTableFilterComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableFilterComposer({
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

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientesTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableOrderingComposer({
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

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);
}

class $$ClientesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientesTable,
          Cliente,
          $$ClientesTableFilterComposer,
          $$ClientesTableOrderingComposer,
          $$ClientesTableAnnotationComposer,
          $$ClientesTableCreateCompanionBuilder,
          $$ClientesTableUpdateCompanionBuilder,
          (Cliente, BaseReferences<_$AppDatabase, $ClientesTable, Cliente>),
          Cliente,
          PrefetchHooks Function()
        > {
  $$ClientesTableTableManager(_$AppDatabase db, $ClientesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> telefono = const Value.absent(),
              }) =>
                  ClientesCompanion(id: id, nombre: nombre, telefono: telefono),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required String telefono,
              }) => ClientesCompanion.insert(
                id: id,
                nombre: nombre,
                telefono: telefono,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientesTable,
      Cliente,
      $$ClientesTableFilterComposer,
      $$ClientesTableOrderingComposer,
      $$ClientesTableAnnotationComposer,
      $$ClientesTableCreateCompanionBuilder,
      $$ClientesTableUpdateCompanionBuilder,
      (Cliente, BaseReferences<_$AppDatabase, $ClientesTable, Cliente>),
      Cliente,
      PrefetchHooks Function()
    >;
typedef $$RepuestosTableCreateCompanionBuilder =
    RepuestosCompanion Function({
      Value<int> id,
      required String nombre,
      required String codigo,
      required double precio,
      required int existencias,
    });
typedef $$RepuestosTableUpdateCompanionBuilder =
    RepuestosCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> codigo,
      Value<double> precio,
      Value<int> existencias,
    });

class $$RepuestosTableFilterComposer
    extends Composer<_$AppDatabase, $RepuestosTable> {
  $$RepuestosTableFilterComposer({
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

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get existencias => $composableBuilder(
    column: $table.existencias,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RepuestosTableOrderingComposer
    extends Composer<_$AppDatabase, $RepuestosTable> {
  $$RepuestosTableOrderingComposer({
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

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get existencias => $composableBuilder(
    column: $table.existencias,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RepuestosTableAnnotationComposer
    extends Composer<_$AppDatabase, $RepuestosTable> {
  $$RepuestosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get codigo =>
      $composableBuilder(column: $table.codigo, builder: (column) => column);

  GeneratedColumn<double> get precio =>
      $composableBuilder(column: $table.precio, builder: (column) => column);

  GeneratedColumn<int> get existencias => $composableBuilder(
    column: $table.existencias,
    builder: (column) => column,
  );
}

class $$RepuestosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RepuestosTable,
          Repuesto,
          $$RepuestosTableFilterComposer,
          $$RepuestosTableOrderingComposer,
          $$RepuestosTableAnnotationComposer,
          $$RepuestosTableCreateCompanionBuilder,
          $$RepuestosTableUpdateCompanionBuilder,
          (Repuesto, BaseReferences<_$AppDatabase, $RepuestosTable, Repuesto>),
          Repuesto,
          PrefetchHooks Function()
        > {
  $$RepuestosTableTableManager(_$AppDatabase db, $RepuestosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RepuestosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RepuestosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RepuestosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> codigo = const Value.absent(),
                Value<double> precio = const Value.absent(),
                Value<int> existencias = const Value.absent(),
              }) => RepuestosCompanion(
                id: id,
                nombre: nombre,
                codigo: codigo,
                precio: precio,
                existencias: existencias,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required String codigo,
                required double precio,
                required int existencias,
              }) => RepuestosCompanion.insert(
                id: id,
                nombre: nombre,
                codigo: codigo,
                precio: precio,
                existencias: existencias,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RepuestosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RepuestosTable,
      Repuesto,
      $$RepuestosTableFilterComposer,
      $$RepuestosTableOrderingComposer,
      $$RepuestosTableAnnotationComposer,
      $$RepuestosTableCreateCompanionBuilder,
      $$RepuestosTableUpdateCompanionBuilder,
      (Repuesto, BaseReferences<_$AppDatabase, $RepuestosTable, Repuesto>),
      Repuesto,
      PrefetchHooks Function()
    >;
typedef $$EquiposTableCreateCompanionBuilder =
    EquiposCompanion Function({
      Value<int> id,
      required int idCliente,
      required String tipoEquipo,
      required String marca,
      required String modelo,
      Value<String?> numeroSerie,
    });
typedef $$EquiposTableUpdateCompanionBuilder =
    EquiposCompanion Function({
      Value<int> id,
      Value<int> idCliente,
      Value<String> tipoEquipo,
      Value<String> marca,
      Value<String> modelo,
      Value<String?> numeroSerie,
    });

class $$EquiposTableFilterComposer
    extends Composer<_$AppDatabase, $EquiposTable> {
  $$EquiposTableFilterComposer({
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

  ColumnFilters<int> get idCliente => $composableBuilder(
    column: $table.idCliente,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoEquipo => $composableBuilder(
    column: $table.tipoEquipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelo => $composableBuilder(
    column: $table.modelo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroSerie => $composableBuilder(
    column: $table.numeroSerie,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EquiposTableOrderingComposer
    extends Composer<_$AppDatabase, $EquiposTable> {
  $$EquiposTableOrderingComposer({
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

  ColumnOrderings<int> get idCliente => $composableBuilder(
    column: $table.idCliente,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoEquipo => $composableBuilder(
    column: $table.tipoEquipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelo => $composableBuilder(
    column: $table.modelo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroSerie => $composableBuilder(
    column: $table.numeroSerie,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EquiposTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquiposTable> {
  $$EquiposTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idCliente =>
      $composableBuilder(column: $table.idCliente, builder: (column) => column);

  GeneratedColumn<String> get tipoEquipo => $composableBuilder(
    column: $table.tipoEquipo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get marca =>
      $composableBuilder(column: $table.marca, builder: (column) => column);

  GeneratedColumn<String> get modelo =>
      $composableBuilder(column: $table.modelo, builder: (column) => column);

  GeneratedColumn<String> get numeroSerie => $composableBuilder(
    column: $table.numeroSerie,
    builder: (column) => column,
  );
}

class $$EquiposTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquiposTable,
          Equipo,
          $$EquiposTableFilterComposer,
          $$EquiposTableOrderingComposer,
          $$EquiposTableAnnotationComposer,
          $$EquiposTableCreateCompanionBuilder,
          $$EquiposTableUpdateCompanionBuilder,
          (Equipo, BaseReferences<_$AppDatabase, $EquiposTable, Equipo>),
          Equipo,
          PrefetchHooks Function()
        > {
  $$EquiposTableTableManager(_$AppDatabase db, $EquiposTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquiposTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquiposTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EquiposTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idCliente = const Value.absent(),
                Value<String> tipoEquipo = const Value.absent(),
                Value<String> marca = const Value.absent(),
                Value<String> modelo = const Value.absent(),
                Value<String?> numeroSerie = const Value.absent(),
              }) => EquiposCompanion(
                id: id,
                idCliente: idCliente,
                tipoEquipo: tipoEquipo,
                marca: marca,
                modelo: modelo,
                numeroSerie: numeroSerie,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idCliente,
                required String tipoEquipo,
                required String marca,
                required String modelo,
                Value<String?> numeroSerie = const Value.absent(),
              }) => EquiposCompanion.insert(
                id: id,
                idCliente: idCliente,
                tipoEquipo: tipoEquipo,
                marca: marca,
                modelo: modelo,
                numeroSerie: numeroSerie,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EquiposTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquiposTable,
      Equipo,
      $$EquiposTableFilterComposer,
      $$EquiposTableOrderingComposer,
      $$EquiposTableAnnotationComposer,
      $$EquiposTableCreateCompanionBuilder,
      $$EquiposTableUpdateCompanionBuilder,
      (Equipo, BaseReferences<_$AppDatabase, $EquiposTable, Equipo>),
      Equipo,
      PrefetchHooks Function()
    >;
typedef $$OrdenesTableCreateCompanionBuilder =
    OrdenesCompanion Function({
      Value<int> id,
      required int idEquipo,
      Value<int?> idTecnico,
      required String fallaReportada,
      Value<String> estado,
      Value<DateTime> fechaRecepcion,
      Value<DateTime?> fechaEntrega,
    });
typedef $$OrdenesTableUpdateCompanionBuilder =
    OrdenesCompanion Function({
      Value<int> id,
      Value<int> idEquipo,
      Value<int?> idTecnico,
      Value<String> fallaReportada,
      Value<String> estado,
      Value<DateTime> fechaRecepcion,
      Value<DateTime?> fechaEntrega,
    });

class $$OrdenesTableFilterComposer
    extends Composer<_$AppDatabase, $OrdenesTable> {
  $$OrdenesTableFilterComposer({
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

  ColumnFilters<int> get idEquipo => $composableBuilder(
    column: $table.idEquipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idTecnico => $composableBuilder(
    column: $table.idTecnico,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fallaReportada => $composableBuilder(
    column: $table.fallaReportada,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaRecepcion => $composableBuilder(
    column: $table.fechaRecepcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaEntrega => $composableBuilder(
    column: $table.fechaEntrega,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrdenesTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdenesTable> {
  $$OrdenesTableOrderingComposer({
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

  ColumnOrderings<int> get idEquipo => $composableBuilder(
    column: $table.idEquipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idTecnico => $composableBuilder(
    column: $table.idTecnico,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fallaReportada => $composableBuilder(
    column: $table.fallaReportada,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaRecepcion => $composableBuilder(
    column: $table.fechaRecepcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaEntrega => $composableBuilder(
    column: $table.fechaEntrega,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrdenesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdenesTable> {
  $$OrdenesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idEquipo =>
      $composableBuilder(column: $table.idEquipo, builder: (column) => column);

  GeneratedColumn<int> get idTecnico =>
      $composableBuilder(column: $table.idTecnico, builder: (column) => column);

  GeneratedColumn<String> get fallaReportada => $composableBuilder(
    column: $table.fallaReportada,
    builder: (column) => column,
  );

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaRecepcion => $composableBuilder(
    column: $table.fechaRecepcion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaEntrega => $composableBuilder(
    column: $table.fechaEntrega,
    builder: (column) => column,
  );
}

class $$OrdenesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrdenesTable,
          Ordene,
          $$OrdenesTableFilterComposer,
          $$OrdenesTableOrderingComposer,
          $$OrdenesTableAnnotationComposer,
          $$OrdenesTableCreateCompanionBuilder,
          $$OrdenesTableUpdateCompanionBuilder,
          (Ordene, BaseReferences<_$AppDatabase, $OrdenesTable, Ordene>),
          Ordene,
          PrefetchHooks Function()
        > {
  $$OrdenesTableTableManager(_$AppDatabase db, $OrdenesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdenesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdenesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdenesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idEquipo = const Value.absent(),
                Value<int?> idTecnico = const Value.absent(),
                Value<String> fallaReportada = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<DateTime> fechaRecepcion = const Value.absent(),
                Value<DateTime?> fechaEntrega = const Value.absent(),
              }) => OrdenesCompanion(
                id: id,
                idEquipo: idEquipo,
                idTecnico: idTecnico,
                fallaReportada: fallaReportada,
                estado: estado,
                fechaRecepcion: fechaRecepcion,
                fechaEntrega: fechaEntrega,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idEquipo,
                Value<int?> idTecnico = const Value.absent(),
                required String fallaReportada,
                Value<String> estado = const Value.absent(),
                Value<DateTime> fechaRecepcion = const Value.absent(),
                Value<DateTime?> fechaEntrega = const Value.absent(),
              }) => OrdenesCompanion.insert(
                id: id,
                idEquipo: idEquipo,
                idTecnico: idTecnico,
                fallaReportada: fallaReportada,
                estado: estado,
                fechaRecepcion: fechaRecepcion,
                fechaEntrega: fechaEntrega,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrdenesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrdenesTable,
      Ordene,
      $$OrdenesTableFilterComposer,
      $$OrdenesTableOrderingComposer,
      $$OrdenesTableAnnotationComposer,
      $$OrdenesTableCreateCompanionBuilder,
      $$OrdenesTableUpdateCompanionBuilder,
      (Ordene, BaseReferences<_$AppDatabase, $OrdenesTable, Ordene>),
      Ordene,
      PrefetchHooks Function()
    >;
typedef $$TrabajosRealizadosTableCreateCompanionBuilder =
    TrabajosRealizadosCompanion Function({
      Value<int> id,
      required int idOrden,
      required String descripcion,
      required double costoManoObra,
      Value<DateTime> fecha,
    });
typedef $$TrabajosRealizadosTableUpdateCompanionBuilder =
    TrabajosRealizadosCompanion Function({
      Value<int> id,
      Value<int> idOrden,
      Value<String> descripcion,
      Value<double> costoManoObra,
      Value<DateTime> fecha,
    });

class $$TrabajosRealizadosTableFilterComposer
    extends Composer<_$AppDatabase, $TrabajosRealizadosTable> {
  $$TrabajosRealizadosTableFilterComposer({
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

  ColumnFilters<int> get idOrden => $composableBuilder(
    column: $table.idOrden,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costoManoObra => $composableBuilder(
    column: $table.costoManoObra,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrabajosRealizadosTableOrderingComposer
    extends Composer<_$AppDatabase, $TrabajosRealizadosTable> {
  $$TrabajosRealizadosTableOrderingComposer({
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

  ColumnOrderings<int> get idOrden => $composableBuilder(
    column: $table.idOrden,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costoManoObra => $composableBuilder(
    column: $table.costoManoObra,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrabajosRealizadosTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrabajosRealizadosTable> {
  $$TrabajosRealizadosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idOrden =>
      $composableBuilder(column: $table.idOrden, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costoManoObra => $composableBuilder(
    column: $table.costoManoObra,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);
}

class $$TrabajosRealizadosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrabajosRealizadosTable,
          TrabajosRealizado,
          $$TrabajosRealizadosTableFilterComposer,
          $$TrabajosRealizadosTableOrderingComposer,
          $$TrabajosRealizadosTableAnnotationComposer,
          $$TrabajosRealizadosTableCreateCompanionBuilder,
          $$TrabajosRealizadosTableUpdateCompanionBuilder,
          (
            TrabajosRealizado,
            BaseReferences<
              _$AppDatabase,
              $TrabajosRealizadosTable,
              TrabajosRealizado
            >,
          ),
          TrabajosRealizado,
          PrefetchHooks Function()
        > {
  $$TrabajosRealizadosTableTableManager(
    _$AppDatabase db,
    $TrabajosRealizadosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrabajosRealizadosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrabajosRealizadosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrabajosRealizadosTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idOrden = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<double> costoManoObra = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => TrabajosRealizadosCompanion(
                id: id,
                idOrden: idOrden,
                descripcion: descripcion,
                costoManoObra: costoManoObra,
                fecha: fecha,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idOrden,
                required String descripcion,
                required double costoManoObra,
                Value<DateTime> fecha = const Value.absent(),
              }) => TrabajosRealizadosCompanion.insert(
                id: id,
                idOrden: idOrden,
                descripcion: descripcion,
                costoManoObra: costoManoObra,
                fecha: fecha,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrabajosRealizadosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrabajosRealizadosTable,
      TrabajosRealizado,
      $$TrabajosRealizadosTableFilterComposer,
      $$TrabajosRealizadosTableOrderingComposer,
      $$TrabajosRealizadosTableAnnotationComposer,
      $$TrabajosRealizadosTableCreateCompanionBuilder,
      $$TrabajosRealizadosTableUpdateCompanionBuilder,
      (
        TrabajosRealizado,
        BaseReferences<
          _$AppDatabase,
          $TrabajosRealizadosTable,
          TrabajosRealizado
        >,
      ),
      TrabajosRealizado,
      PrefetchHooks Function()
    >;
typedef $$OrdenRepuestosTableCreateCompanionBuilder =
    OrdenRepuestosCompanion Function({
      Value<int> id,
      required int idOrden,
      required int idRepuesto,
      required int cantidad,
      required double precioUnitario,
    });
typedef $$OrdenRepuestosTableUpdateCompanionBuilder =
    OrdenRepuestosCompanion Function({
      Value<int> id,
      Value<int> idOrden,
      Value<int> idRepuesto,
      Value<int> cantidad,
      Value<double> precioUnitario,
    });

class $$OrdenRepuestosTableFilterComposer
    extends Composer<_$AppDatabase, $OrdenRepuestosTable> {
  $$OrdenRepuestosTableFilterComposer({
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

  ColumnFilters<int> get idOrden => $composableBuilder(
    column: $table.idOrden,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idRepuesto => $composableBuilder(
    column: $table.idRepuesto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precioUnitario => $composableBuilder(
    column: $table.precioUnitario,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrdenRepuestosTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdenRepuestosTable> {
  $$OrdenRepuestosTableOrderingComposer({
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

  ColumnOrderings<int> get idOrden => $composableBuilder(
    column: $table.idOrden,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idRepuesto => $composableBuilder(
    column: $table.idRepuesto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precioUnitario => $composableBuilder(
    column: $table.precioUnitario,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrdenRepuestosTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdenRepuestosTable> {
  $$OrdenRepuestosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idOrden =>
      $composableBuilder(column: $table.idOrden, builder: (column) => column);

  GeneratedColumn<int> get idRepuesto => $composableBuilder(
    column: $table.idRepuesto,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);

  GeneratedColumn<double> get precioUnitario => $composableBuilder(
    column: $table.precioUnitario,
    builder: (column) => column,
  );
}

class $$OrdenRepuestosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrdenRepuestosTable,
          OrdenRepuesto,
          $$OrdenRepuestosTableFilterComposer,
          $$OrdenRepuestosTableOrderingComposer,
          $$OrdenRepuestosTableAnnotationComposer,
          $$OrdenRepuestosTableCreateCompanionBuilder,
          $$OrdenRepuestosTableUpdateCompanionBuilder,
          (
            OrdenRepuesto,
            BaseReferences<_$AppDatabase, $OrdenRepuestosTable, OrdenRepuesto>,
          ),
          OrdenRepuesto,
          PrefetchHooks Function()
        > {
  $$OrdenRepuestosTableTableManager(
    _$AppDatabase db,
    $OrdenRepuestosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdenRepuestosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdenRepuestosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdenRepuestosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idOrden = const Value.absent(),
                Value<int> idRepuesto = const Value.absent(),
                Value<int> cantidad = const Value.absent(),
                Value<double> precioUnitario = const Value.absent(),
              }) => OrdenRepuestosCompanion(
                id: id,
                idOrden: idOrden,
                idRepuesto: idRepuesto,
                cantidad: cantidad,
                precioUnitario: precioUnitario,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idOrden,
                required int idRepuesto,
                required int cantidad,
                required double precioUnitario,
              }) => OrdenRepuestosCompanion.insert(
                id: id,
                idOrden: idOrden,
                idRepuesto: idRepuesto,
                cantidad: cantidad,
                precioUnitario: precioUnitario,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrdenRepuestosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrdenRepuestosTable,
      OrdenRepuesto,
      $$OrdenRepuestosTableFilterComposer,
      $$OrdenRepuestosTableOrderingComposer,
      $$OrdenRepuestosTableAnnotationComposer,
      $$OrdenRepuestosTableCreateCompanionBuilder,
      $$OrdenRepuestosTableUpdateCompanionBuilder,
      (
        OrdenRepuesto,
        BaseReferences<_$AppDatabase, $OrdenRepuestosTable, OrdenRepuesto>,
      ),
      OrdenRepuesto,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TecnicosTableTableManager get tecnicos =>
      $$TecnicosTableTableManager(_db, _db.tecnicos);
  $$ClientesTableTableManager get clientes =>
      $$ClientesTableTableManager(_db, _db.clientes);
  $$RepuestosTableTableManager get repuestos =>
      $$RepuestosTableTableManager(_db, _db.repuestos);
  $$EquiposTableTableManager get equipos =>
      $$EquiposTableTableManager(_db, _db.equipos);
  $$OrdenesTableTableManager get ordenes =>
      $$OrdenesTableTableManager(_db, _db.ordenes);
  $$TrabajosRealizadosTableTableManager get trabajosRealizados =>
      $$TrabajosRealizadosTableTableManager(_db, _db.trabajosRealizados);
  $$OrdenRepuestosTableTableManager get ordenRepuestos =>
      $$OrdenRepuestosTableTableManager(_db, _db.ordenRepuestos);
}
