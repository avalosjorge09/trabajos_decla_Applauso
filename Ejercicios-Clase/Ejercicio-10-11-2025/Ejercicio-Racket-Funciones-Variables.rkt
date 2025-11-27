#lang racket

;; ============================================================
;; Actividad: Funciones y Variables en Racket
;; ============================================================

;; ============================================================
;; PARTE A – Comprensión básica
;; ============================================================

;; 1. Asociaciones simples
(displayln "=== PARTE A - Ejercicio 1 ===")
(define a 5)
(define b (+ a 3))
(define c (* b 2))

(displayln (string-append "a) Valores: a = " (number->string a) 
                          ", b = " (number->string b) 
                          ", c = " (number->string c)))
;; Respuesta:
;; a) a = 5, b = 8, c = 16
;; b) Si se define (define a 10) después, b NO cambia porque
;;    las definiciones son estáticas. Una vez que b se evalúa
;;    como (+ a 3) = 8, mantiene ese valor.

;; Verificación:
(define a-nuevo 10)
(displayln (string-append "Después de definir a = 10, b sigue siendo: " (number->string b)))
(newline)

;; 2. Sustitución simbólica
(displayln "=== PARTE A - Ejercicio 2 ===")
(define x 4)
(define (doble n) (* 2 n))
(define (suma3 m) (+ m 3))

;; Evalúa: (suma3 (doble x))
;; Paso 1: (doble x) → (doble 4) → (* 2 4) → 8
;; Paso 2: (suma3 8) → (+ 8 3) → 11
(displayln (string-append "Resultado de (suma3 (doble x)): " 
                          (number->string (suma3 (doble x)))))
(newline)

;; 3. Definiciones equivalentes
(displayln "=== PARTE A - Ejercicio 3 ===")
(define (cuadrado x) (* x x))
(define cuadrado-lambda (lambda (x) (* x x)))

;; Sí son equivalentes. Ambas definen funciones que toman un
;; argumento x y devuelven x². La primera es azúcar sintáctico
;; de la segunda. Ambas son funciones de primera clase.

(displayln "¿Son equivalentes? Sí, ambas crean la misma función.")
(displayln (string-append "(cuadrado 5) = " (number->string (cuadrado 5))))
(displayln (string-append "(cuadrado-lambda 5) = " (number->string (cuadrado-lambda 5))))
(newline)

;; ============================================================
;; PARTE B – Aplicación práctica
;; ============================================================

(displayln "=== PARTE B ===")

;; 4. Área de un rectángulo
(displayln "--- Ejercicio 4: Área de un rectángulo ---")
(define base 10)
(define altura 5)

(define (area base altura)
  (* base altura))

(displayln (string-append "Área del rectángulo (base=" (number->string base) 
                          ", altura=" (number->string altura) "): " 
                          (number->string (area base altura))))
(newline)

;; 5. Conversión de grados Celsius a Fahrenheit
(displayln "--- Ejercicio 5: Conversión de grados ---")
(define (celsius->fahrenheit c)
  (+ (* (/ 9 5) c) 32))

(displayln (string-append "0°C = " (number->string (celsius->fahrenheit 0)) "°F"))
(displayln (string-append "100°C = " (number->string (celsius->fahrenheit 100)) "°F"))
(newline)

;; 6. Precio con impuesto
(displayln "--- Ejercicio 6: Precio con impuesto ---")
(define precio-base 100)

(define (iva monto)
  (* monto 0.13))

(define (precio-final p)
  (+ p (iva p)))

(displayln (string-append "Precio base: $" (number->string precio-base)))
(displayln (string-append "IVA (13%): $" (number->string (iva precio-base))))
(displayln (string-append "Precio final: $" (number->string (precio-final precio-base))))
(newline)

;; 7. Descuento encadenado
(displayln "--- Ejercicio 7: Descuento encadenado ---")
(define (descuento10 p)
  (* p (- 1 0.10)))  ; Aplica 10% de descuento

(define (iva13 p)
  (* p (+ 1 0.13)))  ; Aplica 13% de IVA

(define (precio-total p)
  (iva13 (descuento10 p)))

(displayln (string-append "Precio original: $100"))
(displayln (string-append "Después de descuento 10%: $" 
                          (number->string (descuento10 100))))
(displayln (string-append "Después de aplicar IVA 13%: $" 
                          (number->string (precio-total 100))))
(newline)

;; ============================================================
;; PARTE C – Análisis y razonamiento
;; ============================================================

(displayln "=== PARTE C ===")

;; 8. Explicación sobre set!
(displayln "--- Ejercicio 8: Por qué no tiene sentido set! ---")
(displayln "En el paradigma funcional puro de Racket:")
(displayln "- Las variables son inmutables (no se reasignan)")
(displayln "- set! es mutación de estado, va contra la programación funcional")
(displayln "- Si necesitas un nuevo valor, defines una nueva variable")
(displayln "- Esto hace el código más predecible y sin efectos secundarios")
(newline)

;; 9. Función como valor
(displayln "--- Ejercicio 9: Función como valor ---")
(define sumar (lambda (a b) (+ a b)))
(define operar sumar)

(displayln (string-append "a) 'operar' es una variable que contiene la función 'sumar'"))
(displayln (string-append "   (operar 4 5) = " (number->string (operar 4 5))))
(displayln "b) Racket permite esto porque las funciones son valores de primera clase:")
(displayln "   - Pueden asignarse a variables")
(displayln "   - Pueden pasarse como argumentos")
(displayln "   - Pueden retornarse como resultados")
(displayln "   - Pueden almacenarse en estructuras de datos")
(newline)

;; 10. Diferencia entre (define x 5) y (define (x) 5)
(displayln "--- Ejercicio 10: Diferencia entre definiciones ---")
(displayln "(define x 5):")
(displayln "  - Define una VARIABLE llamada 'x' con el valor 5")
(displayln "  - x es inmediatamente 5 (no requiere paréntesis para acceder)")
(displayln "  - Uso: x")
(displayln "")
(displayln "(define (x) 5):")
(displayln "  - Define una FUNCIÓN llamada 'x' que no toma argumentos y devuelve 5")
(displayln "  - x es una función (requiere paréntesis para invocar)")
(displayln "  - Uso: (x)")

;; Ejemplo práctico:
(define valor-directo 5)
(define (valor-funcion) 5)

(displayln (string-append "\nEjemplo:"))
(displayln (string-append "valor-directo = " (number->string valor-directo)))
(displayln (string-append "(valor-funcion) = " (number->string (valor-funcion))))
(newline)

;; ============================================================
;; PARTE D – Desafío final (integrador)
;; ============================================================

(displayln "=== PARTE D - Desafío Final ===")

(define (calcular-total precio descuento impuesto)
  ;; Primero aplica el descuento (resta el porcentaje)
  ;; Luego aplica el impuesto (suma el porcentaje)
  (let ([precio-con-descuento (* precio (- 1 descuento))])
    (* precio-con-descuento (+ 1 impuesto))))

(displayln "Función: (calcular-total precio descuento impuesto)")
(displayln "  - Aplica primero el descuento")
(displayln "  - Luego aplica el impuesto")
(displayln "")

(displayln "Ejemplo: (calcular-total 100 0.1 0.13)")
(displayln (string-append "  Paso 1: 100 * (1 - 0.1) = 100 * 0.9 = 90"))
(displayln (string-append "  Paso 2: 90 * (1 + 0.13) = 90 * 1.13 = 101.7"))
(displayln (string-append "  Resultado: " (number->string (calcular-total 100 0.1 0.13))))

;; Más ejemplos para verificar
(displayln "")
(displayln "Más ejemplos:")
(displayln (string-append "  (calcular-total 200 0.15 0.13) = " 
                          (number->string (calcular-total 200 0.15 0.13))))
(displayln (string-append "  (calcular-total 50 0.05 0.13) = " 
                          (number->string (calcular-total 50 0.05 0.13))))

