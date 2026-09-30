import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const VisionRetailApp());

class VisionRetailApp extends StatelessWidget {
  const VisionRetailApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Visión Retail',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: const Color(0xff6657e8), useMaterial3: true),
        home: const StorePage(),
      );
}

class DemoStore {
  const DemoStore(this.name, this.code, this.zone);
  final String name;
  final String code;
  final String zone;
}

const demoStores = [
  DemoStore('Mercado Central', 'DEM-001', 'Centro'),
  DemoStore('Super Norte', 'DEM-002', 'Norte'),
  DemoStore('Tienda Alameda', 'DEM-003', 'Poniente'),
];

class DemoBanner extends StatelessWidget {
  const DemoBanner({super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        color: const Color(0xffefedff),
        child: const Text('DATOS DEMO · Sin API ni análisis de IA',
            textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      );
}

class StorePage extends StatefulWidget {
  const StorePage({super.key});
  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  DemoStore selected = demoStores.first;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Seleccionar tienda')),
        body: Column(children: [
          const DemoBanner(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Buscar tienda', border: OutlineInputBorder())),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: demoStores.map((store) => Card(
                child: RadioListTile<DemoStore>(
                  value: store, groupValue: selected, onChanged: (value) => setState(() => selected = value!),
                  title: Text(store.name), subtitle: Text('${store.code} · Zona ${store.zone}'),
                  secondary: const Icon(Icons.storefront_outlined),
                ),
              )).toList(),
            ),
          ),
          SafeArea(child: Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CapturePage(store: selected))),
              icon: const Icon(Icons.arrow_forward), label: const Text('Continuar a captura'),
            ),
          )),
        ]),
      );
}

class LocalCapture {
  LocalCapture({required this.path, required this.store, required this.capturedAt});
  final String path;
  final DemoStore store;
  final DateTime capturedAt;
}

class CapturePage extends StatefulWidget {
  const CapturePage({required this.store, super.key});
  final DemoStore store;
  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  XFile? photo;
  Future<void> pick(ImageSource source) async {
    final result = await ImagePicker().pickImage(source: source, imageQuality: 88);
    if (result != null && mounted) setState(() => photo = result);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(widget.store.name)),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const DemoBanner(), const SizedBox(height: 16),
      const DropdownMenu(label: Text('Categoría'), initialSelection: 'bebidas', dropdownMenuEntries: [DropdownMenuEntry(value: 'bebidas', label: 'Bebidas (demo)')]),
      const SizedBox(height: 12),
      const DropdownMenu(label: Text('Exhibición'), initialSelection: 'anaquel', dropdownMenuEntries: [DropdownMenuEntry(value: 'anaquel', label: 'Anaquel regular')]),
      Container(
        height: 250, margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple.shade200), borderRadius: BorderRadius.circular(16)),
        child: Center(child: photo == null
          ? const Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.center_focus_strong, size: 48), Text('Encuadra el anaquel completo')])
          : Padding(padding: const EdgeInsets.all(20), child: Text('Foto lista\n${photo!.name}', textAlign: TextAlign.center))),
      ),
      Row(children: [
        Expanded(child: OutlinedButton.icon(onPressed: () => pick(ImageSource.gallery), icon: const Icon(Icons.photo_library_outlined), label: const Text('Galería'))),
        const SizedBox(width: 10),
        Expanded(child: FilledButton.icon(onPressed: () => pick(ImageSource.camera), icon: const Icon(Icons.camera_alt_outlined), label: const Text('Cámara'))),
      ]),
      const SizedBox(height: 16),
      FilledButton(
        onPressed: photo == null ? null : () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GalleryPage(capture: LocalCapture(path: photo!.path, store: widget.store, capturedAt: DateTime.now())))),
        child: const Text('Guardar y consultar en galería'),
      )
    ]),
  );
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({required this.capture, super.key});
  final LocalCapture capture;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Galería')),
    body: Column(children: [
      const DemoBanner(),
      Padding(padding: const EdgeInsets.all(16), child: Card(child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.photo_outlined)),
        title: Text(capture.store.name),
        subtitle: Text('Guardada localmente · ${capture.capturedAt.toLocal()}\n${capture.path}'),
        isThreeLine: true, trailing: const Chip(label: Text('PENDIENTE')),
      ))),
      const Padding(padding: EdgeInsets.all(16), child: Text('Persistencia SQLite y sincronización se implementan en E2.', style: TextStyle(color: Colors.black54))),
    ]),
  );
}

