# Estado del proyecto

**Última actualización:** 30-09-2026 · **Entrega:** E1 — documentación y recorrido visual demo

## Hecho

* PRD, backlog con IDs/criterios/dependencias/evidencia, arquitectura y forma de trabajo creados.
* Portal Next.js navegable: resumen, selección de tienda, selección/captura de archivo, galería y revisión visual.
* Fixtures de tiendas, capturas, detecciones y métricas marcados `DEMO`; la interfaz declara que no son IA.
* Esqueleto Flutter del recorrido tienda → cámara/archivo → galería local (sin API todavía).
* Plan temprano de datos reales y evaluación descrito en `FORMA_DE_TRABAJO.md`.

## Decisiones vigentes

Producto completamente independiente de SICOM; cuentas e IDs propios. Next.js y Flutter para clientes; backend objetivo FastAPI/Postgres, objetos privados S3/R2 y Redis/ARQ con outbox. Inferencia en servidor y revisión humana. No se eligió detector, OCR, embeddings, proveedor, GPU ni umbral: requieren benchmark y revisión de licencia/costo.

## Qué es demostración hoy

Todo contenido del portal (`lib/demo-data.ts`) y las tiendas del móvil es ficticio. La ilustración de anaquel es CSS, las cajas son decorativas, el selector web no carga a un servidor y el botón guardar sólo navega. **No existe resultado de modelo ni API real en esta entrega.**

## Riesgos / pendientes

* Sin datos reales no es posible medir viabilidad, clases confundibles ni suficiencia del catálogo.
* Falta definir retención, alojamiento, identidad y autorización contractual de imágenes.
* El móvil aún requiere SQLite/outbox y pruebas en dispositivos; el entorno de esta sesión no incluye Flutter.
* La maqueta web necesita pruebas de accesibilidad/UX con usuarios antes de considerarse diseño final.

## Siguiente entrega recomendada (E2)

Implementar el corte real mínimo: FastAPI + migración Postgres + registro idempotente + almacenamiento local compatible S3 + confirmación, y Flutter SQLite/outbox. Mostrar una foto real seleccionada en móvil que sobrevive reinicio, se sincroniza y aparece en galería del portal, todavía con estado `uploaded/sin análisis`.

## Aclaraciones solicitadas al responsable del piloto

1. ¿Cuál es la **marca y categoría** inicial?
2. ¿Existe catálogo exportable con 20–50 SKU, presentaciones y fotos de referencia?
3. ¿Hay fotos reales de anaquel con permiso de uso? Indicar cantidad aproximada, tiendas/fechas, etiquetas existentes y política de retención.

No bloquean E2, pero sí bloquean VR-012/VR-013 y cualquier afirmación sobre precisión.

