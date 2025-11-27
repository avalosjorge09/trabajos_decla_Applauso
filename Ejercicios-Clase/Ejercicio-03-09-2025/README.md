# Operadores Aritméticos y Condicionales en Prolog

## Tema
Operaciones Aritméticas, Expresiones Condicionales y Predicados de Comparación en Prolog

## Descripción
Este ejercicio cubre el uso de operadores aritméticos en Prolog, la implementación de expresiones condicionales y la creación de predicados que realizan cálculos matemáticos. Se incluyen ejercicios prácticos sobre geometría, clasificación numérica y relaciones familiares.

## Contenido del Archivo

### Predicados Geométricos

1. **`rectangulo/2`**
   - Calcula el área y perímetro de un rectángulo
   - Utiliza el operador `is` para evaluar expresiones aritméticas
   - Ejemplo: `rectangulo(5, 10)`

### Predicados Numéricos

2. **`par_impar/1`**
   - Determina si un número es par o impar usando el operador módulo (`mod`)
   - Ejemplo: `par_impar(7)` → "Es impar"

3. **`tabla/1`**
   - Genera la tabla de multiplicar de un número del 1 al 10
   - Utiliza `between/3` y backtracking con `fail`
   - Ejemplo: `tabla(5)`

### Predicados Interactivos

4. **`mayor/0`**
   - Compara dos números ingresados por el usuario
   - Valida que los valores sean números
   - Muestra cuál es el mayor

5. **`categoria_edad/0`**
   - Clasifica a una persona según su edad:
     - Niño: < 15 años
     - Adolescente: 15-17 años
     - Adulto: ≥ 18 años
   - Utiliza múltiples condiciones con operadores lógicos

6. **`aprobacion/0`**
   - Determina si una nota es aprobatoria (> 6)
   - Ejemplo de operador condicional simple

### Predicados de Relaciones

7. **`es_hermano/2`**
   - Determina si dos personas son hermanos basándose en tener el mismo padre
   - Ejemplo: `es_hermano(alex, ana)`

### Predicados Matemáticos Adicionales

8. **`distancia/5`**
   - Calcula la distancia euclidiana entre dos puntos en un plano
   - Utiliza la fórmula: √[(x₂-x₁)² + (y₂-y₁)²]
   - Ejemplo: `distancia(0, 3, 0, 4, D)` → D = 5.0

9. **`conversor/2`**
   - Convierte grados a radianes
   - Fórmula: radianes = grados × π / 180
   - Ejemplo: `conversor(180, R)` → R = 3.14159...

## Conceptos Aprendidos

- **Operador `is`**: Para evaluar expresiones aritméticas
- **Operadores Aritméticos**: `+`, `-`, `*`, `/`, `mod`
- **Operadores de Comparación**: `>`, `<`, `>=`, `=<`, `=:=`, `=\=`
- **Expresiones Condicionales**: Operadores `->` y `;` (if-then-else)
- **Validación de Datos**: Verificación de tipos con `number/1`
- **Backtracking Controlado**: Uso de `fail` para generar múltiples soluciones
- **Predicado `between/3`**: Para generar números en un rango

## Ejemplos de Uso

```prolog
% Calcular área y perímetro
?- rectangulo(5, 10).
El area es 50
El perimetro es 30

% Verificar par/impar
?- par_impar(8).
Es par

% Tabla de multiplicar
?- tabla(7).
7
14
21
28
...

% Comparar números
?- mayor.
Digite el primer numero: |: 15
Digite el segundo numero: |: 23
23 es mayor que 15

% Clasificar por edad
?- categoria_edad.
Digite la edad: |: 16
Categoria: Adolescente

% Calcular distancia
?- distancia(0, 3, 0, 4, D).
D = 5.0

% Convertir grados a radianes
?- conversor(90, R).
R = 1.5708
```

## Objetivos de Aprendizaje

- Dominar operaciones aritméticas en Prolog
- Implementar lógica condicional compleja
- Validar entrada del usuario
- Crear predicados que realicen cálculos matemáticos
- Aplicar backtracking para generar múltiples resultados
- Trabajar con expresiones matemáticas avanzadas (distancia, conversiones)

