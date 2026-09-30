export type CaptureStatus = "Requiere revisión" | "Procesando" | "Completada" | "Pendiente de carga";
export const stores = [
  { id: "demo-store-001", name: "Mercado Central", code: "DEM-001", zone: "Centro", pending: 2 },
  { id: "demo-store-002", name: "Super Norte", code: "DEM-002", zone: "Norte", pending: 1 },
  { id: "demo-store-003", name: "Tienda Alameda", code: "DEM-003", zone: "Poniente", pending: 0 },
];
export const captures = [
  { id: "CAP-DEMO-1042", store: "Mercado Central", user: "Ana Torres", time: "Hoy, 10:32", status: "Requiere revisión" as CaptureStatus, fronts: 18, category: "Bebidas", quality: "Buena" },
  { id: "CAP-DEMO-1041", store: "Super Norte", user: "Luis Pérez", time: "Hoy, 09:18", status: "Procesando" as CaptureStatus, fronts: null, category: "Bebidas", quality: "Evaluando" },
  { id: "CAP-DEMO-1039", store: "Tienda Alameda", user: "Ana Torres", time: "Ayer, 16:45", status: "Completada" as CaptureStatus, fronts: 22, category: "Bebidas", quality: "Buena" },
  { id: "CAP-DEMO-1038", store: "Mercado Central", user: "Luis Pérez", time: "Ayer, 15:20", status: "Pendiente de carga" as CaptureStatus, fronts: null, category: "Bebidas", quality: "Sin evaluar" },
];
export const detections = [
  { sku: "Bebida cítrica 600 ml", code: "SKU-DEMO-01", fronts: 7, color: "#7357ff", review: false },
  { sku: "Bebida cola 600 ml", code: "SKU-DEMO-02", fronts: 6, color: "#ec4899", review: false },
  { sku: "Bebida naranja 600 ml", code: "SKU-DEMO-03", fronts: 4, color: "#f59e0b", review: false },
  { sku: "Producto por confirmar", code: "DESCONOCIDO", fronts: 1, color: "#ef4444", review: true },
];
