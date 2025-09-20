# SQL Data Warehouse Project

## 🧱 Descripción
Este proyecto implementa un Data Warehouse modular utilizando SQL, inspirado en arquitecturas como Medallion y Data Vault. Se prioriza la trazabilidad, la compatibilidad técnica (nomenclatura, carga, modelado) y la validación cruzada entre capas.

## 🧠 Objetivos
- Diseñar un flujo de datos reproducible desde capa Bronze hasta capa Gold.
- Aplicar auditoría técnica en cada etapa del pipeline.
- Simular escenarios empresariales con enfoque en resiliencia operativa.
- Documentar decisiones, nomenclatura y transformaciones con bitácoras técnicas.

## 🗂️ Estructura del proyecto
📁 /bronze
→ Datos crudos, sin transformación.
→ Carga tipo FULL (truncate & insert).
→ Trazabilidad total, sin modelado.
📁 /silver
→ Datos limpios, normalizados y enriquecidos.
→ Transformaciones: limpieza, derivación, estandarización.
→ Preparación para análisis técnico.
📁 /gold
→ Datos listos para análisis de negocio.
→ Modelado: esquema estrella, agregaciones, lógica empresarial.
→ Capa semántica para usuarios finales.
📁 /etl
→ Scripts SQL para carga y transformación.
→ Separación por capa y tipo de carga.
📁 /docs
→ Bitácoras técnicas, decisiones de diseño, nomenclatura.
→ Registro de cambios y validaciones cruzadas.

## ⚙️ Tecnologías utilizadas
- SQL (SQL Server)
- Git & GitHub

## 🧪 Auditoría y trazabilidad
Cada capa incluye:
- Criterios de carga (`FULL`, `INCREMENTAL`)
- Validación cruzada de columnas y tipos
- Nomenclatura técnica (`snake_case`, `kebab-case`)
- Registro de decisiones y transformaciones

## 📬 Autor
**Geudis Martínez**   
