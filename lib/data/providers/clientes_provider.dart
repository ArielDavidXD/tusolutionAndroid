
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final clientesProvider =
AsyncNotifierProvider<ClientesViewModel, List<Cliente>>(
  ClientesViewModel.new,
);

class ClientesViewModel extends AsyncNotifier<List<Cliente>> {
  @override
  Future<List<Cliente>> build() async {
    final db = ref.watch(databaseProvider);

    return db.select(db.clientes).get();
  }

  // INSERTAR
  Future<int> agregarCliente({
    required String nombre,
    required String telefono,
  }) async {
    final db = ref.read(databaseProvider);

    final id = await db.into(db.clientes).insert(
      ClientesCompanion.insert(
        nombre: nombre,
        telefono: telefono,
      ),
    );

    state = await AsyncValue.guard(
          () => db.select(db.clientes).get(),
    );

    return id;
  }

  // ACTUALIZAR
  Future<void> actualizarCliente({
    required int id,
    required String nombre,
    required String telefono,
  }) async {
    final db = ref.read(databaseProvider);

    await (db.update(db.clientes)
      ..where((cliente) => cliente.id.equals(id)))
        .write(
      ClientesCompanion(
        nombre: Value(nombre),
        telefono: Value(telefono),
      ),
    );

    state = await AsyncValue.guard(
          () => db.select(db.clientes).get(),
    );
  }

  // ELIMINAR
  Future<void> eliminarCliente(int id) async {
    final db = ref.read(databaseProvider);

    await (db.delete(db.clientes)
      ..where((cliente) => cliente.id.equals(id)))
        .go();

    state = await AsyncValue.guard(
          () => db.select(db.clientes).get(),
    );
  }
}
