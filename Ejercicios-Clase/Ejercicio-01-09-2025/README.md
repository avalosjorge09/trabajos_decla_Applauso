# Introducción a Hechos, Negación y Corte en Prolog

## Tema
Fundamentos de Prolog: Hechos, Predicados de Negación y Operador de Corte

## Descripción
Este ejercicio introduce los conceptos básicos de Prolog mediante la creación de una base de conocimiento simple sobre estudiantes. Se implementan diferentes predicados para trabajar con hechos y se exploran conceptos fundamentales como la negación lógica y el operador de corte.

## Contenido del Archivo

### Hechos Básicos
- Definición de estudiantes: `estudiante/1`
- Definición de mártires: `martir/1`

### Predicados Implementados

1. **`no_es_estudiante/1`**
   - Utiliza negación lógica (`\+`) para determinar si una persona NO es estudiante
   - Ejemplo: `no_es_estudiante(juan)`

2. **`primer_estudiante/1`**
   - Implementa el operador de corte (`!`) para obtener únicamente el primer estudiante encontrado
   - El corte evita el backtracking y detiene la búsqueda después del primer resultado

3. **`verificar_estudiante/0`**
   - Predicado interactivo que solicita al usuario un nombre
   - Utiliza operadores condicionales (`->` y `;`) para mostrar mensajes según si la persona es estudiante o no

4. **`mostrar_estudiante/0`**
   - Muestra todos los estudiantes mediante backtracking controlado
   - Utiliza `fail` para forzar el backtracking y mostrar todos los resultados

## Conceptos Aprendidos

- **Hechos (Facts)**: Representación de información verdadera
- **Negación Lógica**: Operador `\+` para expresar negación
- **Operador de Corte**: Símbolo `!` para controlar el backtracking
- **Backtracking**: Mecanismo de búsqueda exhaustiva de Prolog
- **Predicados Interactivos**: Uso de `read/1` y `write/1` para entrada/salida

## Ejemplos de Uso

```prolog
% Verificar si alguien es estudiante
?- estudiante(kelvin).
true

% Usar negación
?- no_es_estudiante(carlos).
true

% Obtener primer estudiante (con corte)
?- primer_estudiante(X).
X = kelvin

% Verificar estudiante de forma interactiva
?- verificar_estudiante.
Ingreasa nombre: |: raul
Es estudiante

% Mostrar todos los estudiantes
?- mostrar_estudiante.
Estudiante: kelvin
Estudiante: raul
Estudiante: florence
Estudiante: mauricio
Estudiante: melissa
```

## Objetivos de Aprendizaje

- Comprender la sintaxis básica de Prolog
- Manejar hechos y predicados simples
- Aplicar negación lógica en consultas
- Utilizar el operador de corte para controlar la ejecución
- Crear predicados interactivos con entrada/salida

