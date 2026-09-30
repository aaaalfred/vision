# Backlog del producto

Prioridades: **P0** imprescindible para piloto, **P1** importante, **P2** posterior. Evidencia significa algo concreto que la persona revisora puede observar; una simulación se etiqueta como tal.

| ID | P | Historia / entrega | Depende de | Criterios de aceptación | Evidencia visible |
|---|---|---|---|---|---|
| VR-001 | P0 | Como responsable, quiero alcance y métricas acordados. | — | PRD, exclusiones y dudas documentadas. | `docs/PRD.md`. |
| VR-002 | P0 | Como usuario, navego el portal demo. | VR-001 | Resumen, tiendas, captura, galería y revisión enlazados; responsive; todo fixture dice DEMO. | Recorrido local completo. |
| VR-003 | P0 | Como persona de campo, selecciono tienda en Flutter. | VR-001 | Busca fixture local y conserva selección. | App muestra tienda y paso actual. |
| VR-004 | P0 | Como persona de campo, tomo/elijo una foto. | VR-003 | Permiso/cancelación manejados; categoría y exhibición registradas; archivo queda local. | Foto aparece en galería local. |
| VR-005 | P0 | Como usuario offline, no pierdo una captura. | VR-004 | SQLite + archivo privado, UUID estable, estados y reintento sobreviven reinicio. | Modo avión → captura pendiente → reconexión. |
| VR-006 | P0 | Como móvil, sincronizo de forma idempotente. | VR-005, VR-010 | Registrar, URL temporal, cargar y confirmar; repetir no duplica. | Misma captura/objeto tras reintento. |
| VR-007 | P0 | Como usuario, consulto la galería real. | VR-006 | API pagina/filtra respetando tenant y Flutter/portal muestran estado. | Captura móvil visible en portal. |
| VR-008 | P0 | Como administrador, gestiono catálogo visual. | VR-010 | CRUD/versiones/referencias privadas; CSV validado. | 20–50 SKU piloto importados. |
| VR-009 | P0 | Como administrador, controlo usuarios y tiendas. | VR-010 | Cuenta propia, roles y acceso por tienda/tenant; sin dependencia SICOM. | Usuario no ve tienda ajena. |
| VR-010 | P0 | Como equipo, dispongo de API y esquema propios. | VR-001 | FastAPI/Postgres; migraciones; health; auth; OpenAPI; `tenant_id`. | Pruebas de API y diagrama vigentes. |
| VR-011 | P0 | Como sistema, proceso sin perder trabajos. | VR-006, VR-010 | Outbox en misma transacción; publicador/conciliador; job único y reintentable. | Test reproduce caída Redis y recuperación. |
| VR-012 | P0 | Como analista, preparo dataset real y etiquetado. | Datos del piloto | Convenio de etiquetas; consentimiento; deduplicación; tiendas/fechas reservadas antes de entrenar. | Inventario del dataset y muestra QA. |
| VR-013 | P0 | Como responsable IA, comparo una línea base. | VR-008, VR-012 | Calidad + detector + identificación; unknown; top-k; evaluación por SKU/tienda sobre test reservado. | Reporte versionado, errores y costo; no demo. |
| VR-014 | P0 | Como revisor, corrijo detecciones. | VR-007, VR-013 | Cambiar SKU, unknown, agregar/eliminar; auditoría inmutable; concurrencia controlada. | Antes/después y autor visibles. |
| VR-015 | P0 | Como responsable, valido el piloto. | VR-013, VR-014 | Métricas PRD, línea base, tiendas no vistas, latencia/costo/cobertura. | Informe go/no-go reproducible. |
| VR-016 | P1 | Como usuario, veo resultados y exporto. | VR-014 | Conteos/presencia con alcance explícito; CSV filtrado. | Exportación coincide con vista. |
| VR-017 | P1 | Como operador, observo salud y fallos. | VR-011 | Logs correlacionados, métricas, alertas y reintento manual autorizado. | Captura → job trazable. |
| VR-018 | P1 | Como responsable, aplico retención. | Política aprobada | Borrado de original/derivados y auditoría; backups probados. | Ejercicio de recuperación/borrado. |
| VR-019 | P2 | Como cliente, cargo surtido esperado. | VR-016 | No declara faltante sin cobertura válida. | Indicador explica condición. |
| VR-020 | P2 | Como sistema externo, integro SICOM. | VR-015 + acuerdo | Conector versionado por API/CSV, IDs propios y sin compartir contraseñas/BD. | Prueba contractual aislada. |

## Secuencia de entregas pequeñas

1. **E1 (actual):** VR-001/002 y esqueleto VR-003/004; navegación y documentación.
2. **E2:** VR-005/006/010, recorrido real offline → API → almacenamiento → galería.
3. **E3 (en paralelo al backend cuando lleguen fotos):** VR-008/012 y línea base VR-013.
4. **E4:** VR-011/014, procesamiento recuperable y revisión auditada.
5. **E5:** VR-015/016/017/018 y decisión de piloto. VR-020 queda bloqueada deliberadamente hasta el go/no-go.

La referencia de 10–14 semanas se reestimará al conocer equipo, datos y criterios; no es compromiso.

