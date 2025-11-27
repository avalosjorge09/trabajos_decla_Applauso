# Base de Conocimiento Familiar Compleja

## Tema
Modelado de Relaciones Familiares: Árboles Genealógicos y Razonamiento sobre Parentesco

## Descripción
Este ejercicio implementa una base de conocimiento extensa sobre relaciones familiares, permitiendo modelar un árbol genealógico completo con múltiples generaciones. Se definen relaciones básicas (padre, madre, hijo) y luego se derivan relaciones complejas (abuelos, tíos, primos) mediante reglas lógicas recursivas.

## Contenido del Archivo

### Hechos Básicos

#### Personas y Atributos

1. **Personas**: Lista completa de miembros de la familia
   - ernesto, teresa, carlos, ana, lucia, sofia, mateo, valeria, andres, ricardo, daniel, laura, carmen, miguel, felipe, rosa, y más

2. **Ubicaciones**: `vive_en/2`
   - Registra dónde vive cada persona
   - Ejemplo: `vive_en(ernesto, valle_verde)`

3. **Ocupaciones**: `trabaja_en/2`
   - Registra la profesión de cada persona
   - Ejemplo: `trabaja_en(ernesto, profesor)`

#### Relaciones Familiares Básicas

1. **`padre/2`**: Relación padre-hijo
   - ernesto es padre de: carlos, ana, lucia
   - carlos es padre de: mateo, valeria

2. **`madre/2`**: Relación madre-hijo
   - teresa es madre de: ana, lucia, carlos
   - sofia es madre de: mateo, valeria

3. **`hijo/2`**: Relación hijo-padre/madre
   - carlos, ana, lucia son hijos de ernesto

4. **`casado_con/2` y `casado/2`**: Relaciones de matrimonio
   - ernesto casado con teresa
   - carlos casado con sofia

5. **`sobrino/2`**: Relación tío-sobrino
   - mateo, valeria son sobrinos de lucia
   - andres es sobrino de lucia y carlos

6. **`primo/2`**: Relación entre primos
   - carlos, ana, lucia son primos de daniel

7. **`amigo/2`**: Relaciones de amistad
   - carlos amigo de ricardo
   - daniell amigo de mateo

### Reglas Derivadas (Relaciones Complejas)

#### 1. Abuelos (`abuelo/1` y `abuelo/2`)

Define múltiples formas de ser abuelo:
- Por nieto directo: `abuelo(X) :- nieto(Y, X)`
- Por línea paterna-paterna: `abuelo(X) :- padre(Y, Z), padre(X, Y)`
- Por línea paterna-materna: `abuelo(X) :- padre(X, Y), madre(Y, Z)`
- Por línea materna-paterna: `abuelo(X) :- madre(X, Y), padre(Y, Z)`
- Por línea materna-materna: `abuelo(X) :- madre(X, Y), madre(Y, Z)`

#### 2. Hermanos (`hermano/2`)

Dos personas son hermanos si comparten el mismo padre o la misma madre:
```prolog
hermano(X, Y) :- padre(P, X), padre(P, Y), X \= Y
hermano(X, Y) :- madre(M, X), madre(M, Y), X \= Y
```

#### 3. Tíos (`tio/1`)

Un tío es alguien que tiene sobrinos:
```prolog
tio(X) :- sobrino(Y, X)
```

#### 4. Primos (`primo/2`)

Dos personas son primos si sus padres son hermanos:
```prolog
primo(X, Y) :- hermano(A, B), padre(A, X), padre(B, Y)
```

#### 5. Amigo-Primo (`amigo_primo/2`)

Amistad extendida a través de parentesco:
```prolog
amigo_primo(X, Y) :- primo(A, Y), amigo(X, Y)
```

### Consultas y Funciones Adicionales

1. **`mostrar_madres/0`**: Lista todas las madres en la base de conocimiento
   - Utiliza backtracking con `fail` para mostrar todas

2. **`vive_en/2` (extendido)**: Predicado que busca dónde vive alguien considerando:
   - Si vive con un hijo (y ese hijo vive en un lugar)
   - Si vive con un padre (y ese padre vive en un lugar)

3. **`not_padre_madre/1`**: Identifica personas que no son padres ni madres

## Conceptos Aprendidos

- **Modelado de Dominio Complejo**: Representar información del mundo real
- **Relaciones Recursivas**: Definir parentesco mediante múltiples niveles
- **Inferencia Lógica**: Derivar relaciones complejas de relaciones básicas
- **Backtracking Extensivo**: Explorar todas las posibilidades de parentesco
- **Organización de Conocimiento**: Estructurar información de manera lógica

## Ejemplos de Consultas

```prolog
% Consultar hijos
?- hijo(X, ernesto).
X = carlos ;
X = ana ;
X = lucia

% Consultar abuelos
?- abuelo(Quien).
Quien = ernesto ;  % Abuelo de mateo y valeria
Quien = teresa

% Consultar hermanos
?- hermano(carlos, ana).
true

?- hermano(X, Y).
X = carlos, Y = ana ;
X = carlos, Y = lucia ;
...

% Mostrar todas las madres
?- mostrar_madres.
Madre: teresa
Madre: sofia
Madre: ana
Madre: rosa
Madre: laura
true

% Consultar primos
?- primo(andres, fernanda).
true
```

## Aplicaciones del Modelado Familiar

Este tipo de bases de conocimiento se utilizan en:
- **Genealogía**: Árboles familiares profesionales
- **Sistemas Legales**: Herencias y derechos familiares
- **Antropología**: Estudio de relaciones sociales
- **Bases de Datos Médicas**: Historia familiar de enfermedades
- **Redes Sociales**: Conectar familiares

## Objetivos de Aprendizaje

- Modelar relaciones complejas del mundo real
- Derivar información implícita mediante reglas lógicas
- Manejar bases de conocimiento extensas
- Implementar consultas recursivas sobre relaciones
- Organizar hechos y reglas de manera estructurada
- Aplicar razonamiento transitivo (A es padre de B, B es padre de C, entonces A es abuelo de C)

## Ventajas de Este Enfoque

- **Declarativo**: Se describe quién es quién, no cómo buscarlo
- **Extensible**: Fácil agregar nuevas personas y relaciones
- **Automático**: Las relaciones complejas se derivan automáticamente
- **Completo**: Puede responder cualquier pregunta sobre parentesco
- **Mantenible**: Cambios en hechos básicos se reflejan en relaciones derivadas

## Estructura del Árbol Genealógico

El archivo modela múltiples familias interconectadas:
- Familia de Ernesto y Teresa
- Familia de Carlos y Sofía
- Familia de Ricardo y Laura
- Familia de Miguel y Rosa
- Relaciones de amistad entre familias

## Extensión del Ejercicio

Para mejorar el sistema se podría:
- Agregar fechas de nacimiento y defunción
- Implementar cálculo de grados de parentesco
- Agregar relaciones adoptivas
- Implementar consultas temporales (quiénes estaban vivos en una fecha)
- Crear visualizaciones del árbol genealógico

