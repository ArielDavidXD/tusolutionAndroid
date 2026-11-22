import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  static const _claveTema = 'tema';

  @override
  ThemeMode build() {
    _cargar();
    return ThemeMode.system;
  }

  Future<void> _cargar() async {
    final db = ref.read(databaseProvider);
    final row = await (db.select(db.ajustes)
          ..where((a) => a.clave.equals(_claveTema)))
        .getSingleOrNull();
    final valor = row?.valor;
    if (valor != null) {
      state = _parsear(valor);
    }
  }

  Future<void> cambiarTema(ThemeMode mode) async {
    state = mode;
    final db = ref.read(databaseProvider);
    await db.into(db.ajustes).insertOnConflictUpdate(
      AjustesCompanion.insert(clave: _claveTema, valor: Value(mode.name)),
    );
  }

  ThemeMode _parsear(String valor) {
    switch (valor) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
