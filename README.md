# Tu Solution

Aplicación Android para la gestión de reparaciones del taller **"Tu Solution"** (celulares, tablets y laptops). Permite controlar clientes, equipos, órdenes de reparación, técnicos, trabajos realizados e inventario de repuestos, funcionando **100% offline** con persistencia local en SQLite.

Proyecto desarrollado para la asignatura **Programación para Dispositivos Móviles** (Flutter, arquitectura MVVM).

## Tecnologías

| Componente | Tecnología |
|---|---|
| Framework | Flutter (Android) |
| Persistencia | Drift (SQLite) + drift_flutter |
| Gestión de estado | Riverpod (`flutter_riverpod`) |
| Arquitectura | MVVM (Vistas + ViewModels como providers) |
| Generación de código | build_runner + drift_dev |

## Funcionalidades

- **Dashboard**: total de órdenes, conteos por estado (recibida, en reparación, lista, entregada), órdenes recientes y alertas de inventario bajo (stock ≤ 5).
- **Órdenes de reparación**: creación, edición, cambio de estado (recibida → en reparación → lista → entregada, o cancelada), asignación de técnico responsable y filtros por estado.
- **Clientes y equipos**: registro de clientes (nombre, teléfono) y de sus equipos (tipo, marca, modelo, número de serie). Historial de reparaciones por cliente y por equipo.
- **Técnicos**: registro de técnicos y vista de carga de trabajo (cuántas órdenes tiene asignadas cada uno y en qué estado).
- **Trabajos realizados**: registro de trabajos con su costo de mano de obra.
- **Repuestos**: inventario con código único, precio y existencias. Al usar un repuesto en una orden, el stock se descuenta automáticamente dentro de una **transacción** (si no hay existencias suficientes, la operación se rechaza). Al eliminar el repuesto de la orden, el stock se devuelve.
- **Costo total** de cada orden: mano de obra + repuestos.
- **Tema de la aplicación**: claro, oscuro o según el sistema, con la preferencia guardada en la base de datos local.
- **Accesos rápidos desde el inicio**: tocar una orden reciente abre su detalle; tocar una alerta de stock lleva al inventario.

## Estructura del proyecto

```
lib/
├── main.dart                      # Punto de entrada (ProviderScope)
├── data/
│   ├── database/                  # Drift: tablas y conexión SQLite
│   │   ├── app_database.dart
│   │   ├── app_database.g.dart    # Generado por build_runner
│   │   └── tables/                # 7 tablas (clientes, equipos, órdenes...)
│   ├── providers/                 # ViewModels de Riverpod (MVVM)
│   ├── theme/
│   └── widgets/                   # Widgets reutilizables
└── views/                         # Pantallas de la app
```

## Requisitos

- Flutter SDK 3.x estable (Dart ^3.13.3)
- Android Studio o VS Code con el plugin de Flutter
- Un emulador Android o un teléfono con depuración USB habilitada

## Paso a paso para ejecutar la aplicación

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/ArielDavidXD/tusolutionAndroid.git
   cd tusolutionAndroid
   ```

2. **Instalar las dependencias**

   ```bash
   flutter pub get
   ```

3. **Generar el código de Drift** (el archivo `app_database.g.dart` ya está incluido en el repositorio, así que este paso solo es necesario si se modifica el esquema de la base de datos)

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Conectar un dispositivo o iniciar un emulador**

   ```bash
   flutter devices          # para ver los dispositivos disponibles
   flutter emulators        # para listar emuladores
   flutter emulators --launch <id>   # para abrir un emulador
   ```

5. **Ejecutar la aplicación**

   ```bash
   flutter run
   ```

6. **(Opcional) Compilar el APK de release**

   ```bash
   flutter build apk --release
   ```

   El APK se genera en `build/app/outputs/flutter-apk/app-release.apk`.

## Base de datos

La base de datos SQLite se crea automáticamente la primera vez que se abre la app (archivo local `tu_solution.sqlite`). El esquema consta de 8 tablas: `tecnicos`, `clientes`, `repuestos`, `equipos`, `ordenes`, `trabajos_realizados`, `orden_repuestos` y `ajustes` (preferencias), con sus claves foráneas (equipo → cliente, orden → equipo/técnico, etc.).

## Capturas de pantalla

![Dashboard](screenshots/dashboard.png)
![Órdenes](screenshots/ordenes.png)
![Detalle de orden](screenshots/detalle_orden.png)
![Inventario](screenshots/inventario.png)

*(Más capturas en la carpeta `screenshots/`)*
