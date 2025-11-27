# Funciones y Variables en Racket

## Tema
Programación Funcional: Definición de Variables, Funciones y Análisis de Evaluación en Racket

## Descripción
Este ejercicio completo cubre los fundamentos de la programación funcional en Racket, explorando cómo se definen y evalúan las variables y funciones. Se divide en cuatro partes: comprensión básica, aplicación práctica, análisis teórico y un desafío integrador. El ejercicio demuestra conceptos clave del paradigma funcional como inmutabilidad, funciones de primera clase y evaluación por sustitución.

## Contenido del Archivo

### PARTE A – Comprensión Básica

#### 1. Asociaciones Simples
Explora cómo se evalúan y mantienen los valores de variables:
```racket
(define a 5)
(define b (+ a 3))    ; b = 8
(define c (* b 2))    ; c = 16
```

**Conceptos clave:**
- Las variables son inmutables una vez definidas
- Si se redefine `a` después, `b` no cambia (las definiciones son estáticas)
- Demuestra el modelo de evaluación de Racket

#### 2. Sustitución Simbólica
Evalúa paso a paso una expresión compuesta:
```racket
(define x 4)
(define (doble n) (* 2 n))
(define (suma3 m) (+ m 3))
(suma3 (doble x))  ; → 11
```

**Proceso de evaluación:**
- Paso 1: `(doble x)` → `(doble 4)` → `(* 2 4)` → `8`
- Paso 2: `(suma3 8)` → `(+ 8 3)` → `11`

#### 3. Definiciones Equivalentes
Demuestra que estas dos definiciones son equivalentes:
```racket
(define (cuadrado x) (* x x))
(define cuadrado (lambda (x) (* x x)))
```

Ambas crean la misma función. La primera es "azúcar sintáctico" de la segunda.

### PARTE B – Aplicación Práctica

#### 4. Área de un Rectángulo
```racket
(define base 10)
(define altura 5)
(define (area base altura)
  (* base altura))
```

#### 5. Conversión de Grados Celsius a Fahrenheit
```racket
(define (celsius->fahrenheit c)
  (+ (* (/ 9 5) c) 32))
```
Fórmula: F = (9/5) × C + 32

#### 6. Precio con Impuesto
```racket
(define precio-base 100)
(define (iva monto)
  (* monto 0.13))
(define (precio-final p)
  (+ p (iva p)))
```

#### 7. Descuento Encadenado
```racket
(define (descuento10 p)
  (* p (- 1 0.10)))
(define (iva13 p)
  (* p (+ 1 0.13)))
(define (precio-total p)
  (iva13 (descuento10 p)))
```

Aplica primero el descuento del 10%, luego el IVA del 13%.

### PARTE C – Análisis y Razonamiento

#### 8. Por qué `set!` no tiene sentido
En programación funcional pura:
- Las variables son inmutables (no se reasignan)
- `set!` es mutación de estado, va contra el paradigma funcional
- Si necesitas un nuevo valor, defines una nueva variable
- Esto hace el código más predecible y sin efectos secundarios

#### 9. Función como Valor
```racket
(define sumar (lambda (a b) (+ a b)))
(define operar sumar)
(operar 4 5)  ; → 9
```

**Conceptos:**
- `operar` es una variable que contiene la función `sumar`
- Racket permite esto porque las funciones son valores de primera clase:
  - Pueden asignarse a variables
  - Pueden pasarse como argumentos
  - Pueden retornarse como resultados
  - Pueden almacenarse en estructuras de datos

#### 10. Diferencia entre `(define x 5)` y `(define (x) 5)`

**`(define x 5)`:**
- Define una **VARIABLE** llamada 'x' con el valor 5
- `x` es inmediatamente 5 (no requiere paréntesis)
- Uso: `x`

**`(define (x) 5)`:**
- Define una **FUNCIÓN** llamada 'x' que no toma argumentos y devuelve 5
- `x` es una función (requiere paréntesis para invocar)
- Uso: `(x)`

### PARTE D – Desafío Final (Integrador)

#### Función `calcular-total`
```racket
(define (calcular-total precio descuento impuesto)
  (let ([precio-con-descuento (* precio (- 1 descuento))])
    (* precio-con-descuento (+ 1 impuesto))))
```

**Funcionalidad:**
- Aplica primero el descuento (resta el porcentaje)
- Luego aplica el impuesto (suma el porcentaje)

**Ejemplo:**
```racket
(calcular-total 100 0.1 0.13)
; Paso 1: 100 * (1 - 0.1) = 90
; Paso 2: 90 * (1 + 0.13) = 101.7
; Resultado: 101.7
```

## Conceptos Aprendidos

### Programación Funcional

- **Inmutabilidad**: Las variables no cambian después de definirse
- **Evaluación por Sustitución**: Reemplazo paso a paso de expresiones
- **Funciones de Primera Clase**: Las funciones son valores como cualquier otro
- **Azúcar Sintáctico**: Sintaxis alternativa que se traduce a formas más básicas
- **Sin Efectos Secundarios**: Las funciones puras no modifican el estado

### Racket Específico

- **`define`**: Para definir variables y funciones
- **`lambda`**: Para crear funciones anónimas
- **`let`**: Para crear variables locales con alcance limitado
- **Expresiones S**: Todo en Racket es una expresión que se evalúa

## Ejemplos de Uso

```racket
;; Variables
a        ; → 5
b        ; → 8
c        ; → 16

;; Funciones
(cuadrado 5)              ; → 25
(celsius->fahrenheit 100) ; → 212
(precio-final 100)        ; → 113
(precio-total 100)        ; → 101.7
(calcular-total 100 0.1 0.13) ; → 101.7

;; Funciones como valores
operar                    ; → #<procedure:sumar>
(operar 4 5)              ; → 9
```

## Objetivos de Aprendizaje

- Comprender el modelo de evaluación de Racket
- Diferenciar entre variables y funciones
- Aplicar funciones de manera práctica
- Entender la inmutabilidad en programación funcional
- Reconocer funciones como valores de primera clase
- Combinar funciones para crear soluciones complejas
- Aplicar razonamiento sobre evaluación paso a paso

## Ventajas del Paradigma Funcional

- **Predecibilidad**: Sin mutaciones inesperadas
- **Testabilidad**: Funciones puras son fáciles de probar
- **Composición**: Funciones pequeñas se combinan fácilmente
- **Razonamiento**: Más fácil entender qué hace el código
- **Paralelización**: Sin estado compartido, más fácil paralelizar

## Aplicaciones

La programación funcional se utiliza en:
- **Lenguajes Funcionales**: Haskell, Lisp, Clojure, F#
- **Programación Web**: JavaScript (funciones de primera clase), React (componentes funcionales)
- **Análisis de Datos**: MapReduce, procesamiento de streams
- **Sistemas Distribuidos**: Sin estado compartido facilita la distribución
- **Lenguajes Híbridos**: Python, Java, C# incorporan características funcionales

## Extensión del Ejercicio

Para mejorar las habilidades se podría:
- Implementar funciones de orden superior (map, filter, reduce)
- Crear funciones recursivas para listas
- Implementar currying y aplicación parcial
- Trabajar con estructuras de datos inmutables
- Crear funciones que retornan otras funciones
- Implementar patrones funcionales avanzados

