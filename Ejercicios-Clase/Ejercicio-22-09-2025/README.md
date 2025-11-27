# Repaso de Prolog: Manipulación Algebraica y Matemática

## Tema
Expresiones Algebraicas: Simplificación, Derivación y Evaluación en Prolog

## Descripción
Este ejercicio avanzado demuestra cómo trabajar con expresiones algebraicas y matemáticas en Prolog. Se implementan sistemas para simplificar expresiones, calcular derivadas, evaluar expresiones con variables, operar con fracciones y resolver ecuaciones lineales simples. Es un ejercicio integrador que combina múltiples conceptos de programación lógica aplicados a matemáticas.

## Contenido del Archivo

### 1. Simplificación de Expresiones (`simplifica/2`)

Simplifica expresiones aritméticas aplicando reglas algebraicas básicas:

- Elimina sumas con cero: `0 + X` → `X`
- Elimina multiplicaciones con uno: `1 * X` → `X`
- Simplifica multiplicaciones con cero: `0 * X` → `0`
- Mantiene expresiones que no pueden simplificarse más

**Ejemplos:**
```prolog
?- simplifica(+(0, X), R).
R = X

?- simplifica(*(1, X), R).
R = X

?- simplifica(*(0, +(X, 3)), R).
R = 0
```

### 2. Cálculo de Derivadas (`derivada/3`)

Calcula derivadas de expresiones algebraicas respecto a una variable:

- Derivada de una variable: `derivada(X, X, 1)`
- Derivada de constantes: `derivada(C, _, 0)`
- Regla de la suma: `derivada(A + B, X, DA + DB)`
- Regla del producto: `derivada(A * B, X, A*DB + B*DA)`
- Regla de la resta: `derivada(A - B, X, DA - DB)`

**Ejemplos:**
```prolog
?- derivada(x*x + 3*x + 2, x, D).
D = x*1 + x*1 + 3*1 + 0

?- derivada(x*x*x, x, D).
D = x*x*1 + x*(x*1 + x*1)
```

### 3. Evaluación de Expresiones (`evalua/4`)

Evalúa expresiones algebraicas sustituyendo una variable por un valor numérico:

- Sustituye la variable por el valor dado
- Evalúa constantes directamente
- Resuelve operaciones aritméticas

**Ejemplos:**
```prolog
?- evalua(x*x + 3*x + 2, x, 3, R).
R = 20

?- evalua(x*x - 4*x + 4, x, 2, R).
R = 0
```

### 4. Operaciones con Fracciones

#### Suma de Fracciones (`suma/3`)
- Calcula: (A/B) + (C/D) = (AD + BC) / (BD)

#### Resta de Fracciones (`resta/3`)
- Calcula: (A/B) - (C/D) = (AD - BC) / (BD)

**Ejemplos:**
```prolog
?- suma(frac(1,2), frac(1,3), R).
R = frac(5, 6)

?- resta(frac(2,5), frac(3,10), R).
R = frac(5, 50)
```

### 5. Resolución de Ecuaciones Lineales (`resuelve/3`)

Resuelve ecuaciones lineales simples de la forma: `X + N = M`

- Despeja la variable X
- Calcula el valor: `V = M - N`

**Ejemplos:**
```prolog
?- resuelve(x + 3 = 7, x, V).
V = 4

?- resuelve(5 + x = 10, x, V).
V = 5
```

## Conceptos Aprendidos

- **Manipulación Simbólica**: Trabajar con expresiones como datos
- **Pattern Matching**: Reconocer estructuras de expresiones
- **Recursión Estructural**: Procesar expresiones recursivamente
- **Reglas Algebraicas**: Aplicar identidades matemáticas
- **Cálculo Simbólico**: Derivación y simplificación sin evaluar
- **Evaluación Condicional**: Sustituir variables por valores

## Aplicaciones Prácticas

Este tipo de sistemas se utilizan en:
- **Sistemas de Álgebra Computacional**: Como Mathematica, Maple
- **Compiladores**: Optimización de expresiones
- **Verificación Formal**: Simplificación de fórmulas lógicas
- **Educación**: Calculadoras simbólicas para enseñanza
- **Inteligencia Artificial**: Razonamiento matemático

## Integración de Funcionalidades

El ejercicio demuestra cómo combinar múltiples operaciones:

```prolog
% Derivar y luego evaluar
?- derivada(x*x + 3*x + 2, x, D), evalua(D, x, 2, R).
D = x*1 + x*1 + 3*1 + 0,
R = 7
```

## Objetivos de Aprendizaje

- Manipular expresiones algebraicas como estructuras de datos
- Implementar reglas matemáticas como reglas lógicas
- Combinar cálculo simbólico con evaluación numérica
- Aplicar recursión a estructuras complejas
- Crear sistemas que trabajen con matemáticas simbólicas
- Entender la diferencia entre representación y evaluación

## Ventajas del Enfoque en Prolog

- **Declarativo**: Las reglas matemáticas se expresan naturalmente
- **Extensible**: Fácil agregar nuevas reglas de simplificación
- **Simbólico**: Permite manipular expresiones sin evaluarlas
- **Recursivo**: Estructura natural para expresiones anidadas

## Extensiones Posibles

Para mejorar el sistema se podría:
- Agregar más reglas de simplificación
- Implementar derivadas de funciones trigonométricas
- Agregar integración simbólica
- Simplificar expresiones derivadas automáticamente
- Resolver sistemas de ecuaciones
- Trabajar con polinomios y factorización

