# Base de Conocimiento: Sistema de Razonamiento para Misterio

## Tema
Programación Lógica: Base de Conocimiento y Razonamiento con Reglas en Prolog

## Descripción
Este ejercicio implementa un sistema de razonamiento lógico para resolver un misterio de asesinato. Se define una base de conocimiento con hechos sobre personas, relaciones, motivos, medios y oportunidades, luego se crean reglas lógicas para identificar al culpable basándose en la combinación de estos factores.

## Contenido del Archivo

### Base de Conocimiento (BaseDeConociemiento.pl)

#### Hechos Básicos

1. **Personas presentes**: `persona/1`
   - alice, robert, clara, james

2. **Relaciones**: Definiciones de relaciones familiares y profesionales
   - `esposo/2`: alice es esposa de lord_henry
   - `sobrina/2`: clara es sobrina de lord_henry
   - `socio/2`: james es socio de lord_henry
   - `empleado/2`: robert es empleado de lord_henry

3. **Motivos**: `motivo/2`
   - alice: herencia
   - robert: maltrato
   - clara: deuda
   - james: negocios

4. **Medios (acceso a armas)**: `acceso/2`
   - alice: veneno
   - robert: cuchillo
   - clara: cuerda
   - james: pistola

5. **Oportunidad (ubicación)**: `estuvo/2`
   - alice: sala
   - robert: cocina
   - clara: biblioteca
   - james: estudio

#### Reglas Lógicas

1. **`oportunidad/1`**
   - Determina si alguien tuvo oportunidad (estuvo en la biblioteca)

2. **`motivo_oportunidad/1`**
   - Combina motivo y oportunidad para un sospechoso

3. **`arma/1`**
   - Identifica quién tuvo acceso a la cuerda (arma del crimen)

4. **`culpable/1`**
   - Regla principal que identifica al culpable combinando:
     - Motivo
     - Oportunidad (estuvo en biblioteca)
     - Acceso al arma (cuerda)

### Archivo de Consultas (Consulas.pl)

Contiene consultas de ejemplo para explorar la base de conocimiento:
- Consultas sobre personas
- Consultas sobre motivos
- Consultas sobre oportunidades
- Identificación del culpable

## Conceptos Aprendidos

- **Razonamiento Lógico**: Combinación de hechos y reglas para llegar a conclusiones
- **Reglas Compuestas**: Uso de múltiples condiciones en un predicado
- **Conjunción Lógica**: Combinación de condiciones con `,` (AND)
- **Base de Conocimiento**: Organización de hechos relacionados
- **Razonamiento Deductivo**: Derivar conclusiones de premisas

## Lógica del Misterio

Para ser culpable, una persona debe cumplir **todos** estos criterios:
1. ✅ Tener un **motivo**
2. ✅ Estar en el **lugar del crimen** (biblioteca)
3. ✅ Tener **acceso al arma** utilizada (cuerda)

### Análisis de Sospechosos

- **alice**: Motivo ✓, Oportunidad ✗ (estuvo en sala), Arma ✗
- **robert**: Motivo ✓, Oportunidad ✗ (estuvo en cocina), Arma ✗
- **clara**: Motivo ✓, Oportunidad ✓ (estuvo en biblioteca), Arma ✓
- **james**: Motivo ✓, Oportunidad ✗ (estuvo en estudio), Arma ✗

**Resultado**: clara es la culpable

## Ejemplos de Consultas

```prolog
% Verificar oportunidades
?- oportunidad(clara).
true

?- oportunidad(alice).
false

% Verificar motivo y oportunidad
?- motivo_oportunidad(clara).
true

% Identificar quién tiene el arma
?- arma(clara).
true

% Encontrar al culpable
?- culpable(X).
Culpable: X = clara
```

## Aplicaciones del Razonamiento Lógico

Este tipo de sistemas se utilizan en:
- **Sistemas Expertos**: Diagnóstico médico, análisis legal
- **Procesamiento de Lenguaje Natural**: Inferencia semántica
- **Bases de Datos Deductivas**: Consultas complejas con reglas
- **Verificación de Restricciones**: Validación de datos
- **Juegos**: Inteligencia artificial para resolver puzzles

## Objetivos de Aprendizaje

- Construir bases de conocimiento estructuradas
- Combinar hechos y reglas para razonamiento lógico
- Modelar problemas del mundo real con lógica proposicional
- Aplicar razonamiento deductivo para resolver problemas
- Organizar información de manera que permita consultas eficientes

## Ventajas de Este Enfoque

- **Declarativo**: Se describe el problema, no cómo resolverlo
- **Modular**: Fácil agregar nuevos hechos y reglas
- **Inferencia Automática**: Prolog encuentra las respuestas automáticamente
- **Mantenible**: Cambios en hechos se reflejan automáticamente en conclusiones

## Extensión del Ejercicio

Para mejorar el sistema se podría:
- Agregar más evidencia (huellas, testimonios)
- Implementar niveles de certeza (probabilidades)
- Crear reglas de exclusión (coartadas)
- Añadir múltiples escenarios o casos
- Implementar explicaciones de razonamiento

