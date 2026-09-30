# Forma de trabajo

## Principios

1. Entregar recorridos verticales pequeños y navegables; mantener una sola historia en curso.
2. Etiquetar **DEMO**, **API REAL** y **RESULTADO DE MODELO** en UI, evidencia y reporte. Un fixture nunca demuestra precisión.
3. Actualizar `docs/ESTADO.md` en cada entrega: decisiones, evidencia, riesgos, comandos y siguiente corte.
4. No tocar ni consultar SICOM. Toda integración espera la aprobación del piloto.
5. Preferir decisiones reversibles; registrar ADR cuando afecte datos, seguridad, proveedor o costo.

## Definición de terminado

Una historia tiene criterios cumplidos, pruebas relevantes, estados vacío/carga/error, permisos considerados, datos demo señalados, evidencia visible y documentación actualizada. Código revisable y sin secretos; migraciones reversibles; accesibilidad básica (teclado, labels, contraste) y responsive cuando aplique.

## Ciclo de IA con fotos reales

1. Acordar permiso/retención y recibir catálogo más referencias.
2. Definir manual de etiqueta: caja por frente visible, SKU, desconocido, no evaluable y cobertura.
3. Capturar diversidad de tiendas, teléfonos, ángulos, luz, densidad y obstrucciones; registrar procedencia.
4. Deduplicar y separar **por tienda o fecha completa** entrenamiento/validación/test antes de ajustar modelos.
5. Doble revisión de una muestra y resolución de desacuerdos; versionar manifiesto y anotaciones.
6. Crear línea base manual y técnica; comparar detector + recuperación/clasificación y señales OCR/código.
7. Reportar por SKU/tienda, intervalos y errores: precision/recall, top-k, conteo, cobertura/revisión, latencia y costo.
8. Calibrar aceptación con validación y abrir test reservado una vez por candidato. No entrenar automáticamente con correcciones sin QA.

El primer lote útil sugerido es exploratorio (no una cuota de suficiencia): referencias de los 20–50 SKU y fotos de campo diversas, incluyendo negativos/desconocidos. El tamaño final se decide con curvas de aprendizaje y distribución de errores.

## Cómo revisar esta entrega

```bash
npm install
npm run dev
```

Abrir `http://localhost:3000`: Resumen → Capturas → primera captura → revisión; y Tiendas → seleccionar → continuar → elegir foto → guardar → galería. La carga actual es sólo previsualización local del portal. Para Flutter, instalar SDK y ejecutar `cd apps/mobile && flutter pub get && flutter run`; el prototipo móvil persiste metadatos sólo en memoria en esta entrega.

