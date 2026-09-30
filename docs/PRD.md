# PRD — Visión Retail

**Estado:** borrador operativo · **Actualizado:** 30-09-2026 · **Producto independiente de SICOM**

## Problema y resultado esperado

Los equipos de retail cuentan manualmente productos visibles en anaqueles. El proceso consume tiempo, es difícil de auditar y no conserva de forma estructurada las correcciones. Visión Retail permitirá capturar una zona delimitada, sugerir SKU de un catálogo controlado, contar **frentes visibles** y someter ambigüedades a revisión humana.

El MVP se considerará útil si, en un piloto de un cliente y una categoría, reduce tiempo frente a auditoría manual sin ocultar errores. No inferirá inventario, profundidad ni agotados a partir de una foto.

## Usuarios y recorridos

* **Persona de campo:** elige tienda y categoría, toma una foto guiada, puede guardarla sin conexión, sincroniza y consulta su estado.
* **Revisor:** inspecciona cajas y candidatos, cambia el SKU, marca desconocido/no evaluable, agrega omisiones y elimina falsos positivos.
* **Administrador:** gestiona tiendas, accesos, catálogo y referencias; consulta resultados y exporta.
* **Responsable del modelo:** versiona datasets/modelos y compara métricas sobre un conjunto reservado.

Recorrido principal: **tienda → categoría/exhibición → foto → guardado local → carga → proceso → revisión → resultado**. La primera entrega navegable usa fixtures inequívocamente marcados como `DEMO`; no es una validación de IA.

## Alcance MVP

1. Cuentas propias y permisos por tenant/tienda.
2. 20–50 SKU de una categoría, sujetos al material disponible.
3. Captura de anaquel, persistencia local, sincronización idempotente y galería.
4. Análisis asíncrono con estados, control de calidad, detecciones, candidatos y versión.
5. Corrección humana trazable e historial.
6. Conteos de frentes, presencia, filtros y exportación.

### Fuera de alcance

Asistencia/rutas; inventario total; catálogo abierto; planogramas completos; precios/promociones; unión automática de fotos; despliegue productivo; conexión o modificación de SICOM. La integración futura será un conector explícito y sólo tras validar el piloto.

## Requisitos funcionales

| ID | Requisito |
|---|---|
| RF-01 | Buscar y seleccionar sólo tiendas autorizadas. |
| RF-02 | Capturar/importar foto y registrar categoría, exhibición, `captured_at` e ID estable del dispositivo. |
| RF-03 | Guardar localmente, reintentar sin duplicar y distinguir captura de carga. |
| RF-04 | Mostrar `guardada`, `pendiente`, `procesando`, `requiere revisión`, `terminada` o `error recuperable`. |
| RF-05 | Mostrar foto, regiones, candidatos y conteo; nunca llamar “certeza” a un score sin calibrar. |
| RF-06 | Auditar antes/después, autor, motivo y fecha de cada corrección. |
| RF-07 | Filtrar historial por tienda, usuario, fecha, categoría y estado; exportar resultados. |
| RF-08 | Mantener versión de catálogo, modelo y resultado usada en cada análisis. |

## Requisitos no funcionales y seguridad

* Aislamiento por `tenant_id` en autorización y datos; objetos privados con URLs breves.
* Ninguna clave de almacenamiento/visión en Flutter. Cifrado en tránsito y política de retención por acordar.
* Registro y confirmación de carga idempotentes. Outbox transaccional para trabajo de análisis y conciliador.
* Respuesta rápida al registrar/consultar; análisis fuera de la petición web. Accesibilidad y estados comprensibles.
* Metadatos mínimos; consentimiento contractual para reutilizar imágenes en modelos compartidos.

## Éxito del piloto

Reportar por SKU y tienda: precision/recall de detección, top-1/top-3, cobertura automática, porcentaje revisado, error absoluto de conteo, tiempo humano, latencia de servidor separada del retraso de red, costo por captura y ahorro contra línea base manual. La aspiración de ≥95% de precisión aplica **sólo a detecciones autoaceptadas** y se acompaña siempre de cobertura; el umbral se calibra, no se fija por intuición.

## Datos pendientes del responsable del piloto

Se requiere confirmar **marca/categoría**, lista de tiendas y participantes, catálogo (clave, descripción, marca, presentación, vigencia/variante), fotos de referencia y disponibilidad/permiso de fotos reales de campo. También: retención, región de alojamiento, presupuesto, línea base manual y metas finales. Estas respuestas no bloquean el prototipo independiente.

