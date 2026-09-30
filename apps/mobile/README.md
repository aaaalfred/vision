# App Flutter

Prototipo navegable independiente: tienda demo → cámara/selector nativo → galería local. En E1 el estado vive en memoria y se identifica como demo; no hay carga ni inferencia.

```bash
flutter pub get
flutter run
```

Para generar carpetas nativas en un checkout nuevo: `flutter create --platforms=android,ios .` y conservar `lib/main.dart`. E2 añadirá SQLite, archivos privados, UUID y outbox.

