# Rutinas, Actividades y Relaciones Sociales en Prolog

## Tema
Modelado de Comportamientos Humanos: Rutinas Diarias, Actividades y Relaciones Sociales

## Descripción
Este ejercicio implementa un sistema completo para modelar la vida diaria de personas, incluyendo sus actividades, rutinas semanales, relaciones familiares y de amistad. Se utilizan hechos para representar información básica y reglas recursivas para modelar relaciones complejas y comportamientos que dependen del tiempo. Este es un ejercicio de clase que demuestra el modelado de comportamientos temporales y relaciones sociales en Prolog.

## Contenido del Archivo

### Hechos Básicos

#### 1. Actividades (`actividad/1`)

Define qué actividades realizan las personas:
- `cocina/1`: ana, jorge
- `estudia/1`: juan, maria, sofia
- `trabaja/1`: pedro, sofia, jorge
- `juega/1`: pedro, jorge
- `descansa/1`: maria, juan

#### 2. Relaciones Sociales

**Amistades** (`amigo/2`):
- juan es amigo de: ana, maria
- jorge es amigo de: pedro

**Relaciones Familiares**:
- `hermana/2`: ana es hermana de pedro
- `prima/2`: maria es prima de sofia, sofia es prima de jorge

### Rutinas Semanales (`rutina/3`)

Sistema completo de rutinas con formato: `rutina(Persona, Actividad, Tiempo)`

**Tipos de Tiempo:**
- Días específicos: `lunes`, `martes`, `miercoles`, `jueves`, `viernes`, `sabado`, `domingo`
- Categorías: `entre_semana`, `fin_semana`, `todos_dias`, `noches`

**Ejemplos:**
- ana: cocinar (todos los días)
- juan: estudiar (entre semana), descansar (fin de semana)
- pedro: trabajar (entre semana), jugar (sábado)
- sofia: estudiar (noches), trabajar (todos los días)
- maria: estudiar (entre semana), descansar (domingo)
- jorge: trabajar (lunes, martes), cocinar (miércoles), jugar (viernes), descansar (domingo)

### Reglas Derivadas

#### 1. Actividad General (`actividad/1`)

Agrupa todas las actividades específicas:
```prolog
actividad(X) :- cocina(X)
actividad(X) :- estudia(X)
actividad(X) :- trabaja(X)
actividad(X) :- juega(X)
actividad(X) :- descansa(X)
```

#### 2. Descanso por Defecto (`descansa/1`)

Si alguien no tiene actividad, descansa:
```prolog
descansa(X) :- \+ actividad(X)
```

#### 3. Parentesco (`parentesco/2`)

Relaciones familiares bidireccionales:
```prolog
parentesco(X, Y) :- hermana(X, Y)
parentesco(X, Y) :- hermana(Y, X)
parentesco(X, Y) :- prima(X, Y)
parentesco(X, Y) :- prima(Y, X)
```

#### 4. Amistad Extendida (`amistad/2`)

Amistad bidireccional y transitiva:
```prolog
amistad(X, Y) :- amigo(X, Y)
amistad(X, Y) :- amigo(Y, X)
amistad(X, Y) :- amigo(X, Z), amistad(Z, Y), X \= Y
```

La transitividad permite que si juan es amigo de ana, y ana es hermana de pedro, entonces juan puede tener una relación indirecta con pedro.

#### 5. Operaciones con Listas

**`miembro/2`**: Verificar si un elemento está en una lista
```prolog
miembro(X, [X|_])
miembro(X, [_|T]) :- miembro(X, T)
```

**`invertir/2`**: Invertir una lista recursivamente
```prolog
invertir([], [])
invertir([H|T], R) :- invertir(T, RT), append(RT, [H], R)
```

#### 6. Actividad por Día (`actividad_dia/3`)

Determina qué actividad tiene una persona en un día específico:
- Consulta rutinas directas del día
- Consulta categorías (entre_semana, fin_semana)
- Utiliza `miembro/2` para verificar días en categorías

```prolog
actividad_dia(Persona, Dia, Actividad) :-
    rutina(Persona, Actividad, Dia).
actividad_dia(Persona, Dia, Actividad) :-
    rutina(Persona, Actividad, entre_semana),
    miembro(Dia, [lunes, martes, miercoles, jueves, viernes]).
actividad_dia(Persona, Dia, Actividad) :-
    rutina(Persona, Actividad, fin_semana),
    miembro(Dia, [sabado, domingo]).
```

#### 7. Agenda Completa (`agenda_completa/3`)

Genera una agenda semanal completa para una persona:
- Toma una lista de días de la semana
- Devuelve una lista de tuplas `(Día, Actividad)`
- Si no hay rutina para un día, asigna `ninguna`

**Formato de salida:**
```prolog
Agenda = [(lunes, trabajar),
          (martes, trabajar),
          (miercoles, cocinar),
          (jueves, ninguna),
          (viernes, jugar),
          (sabado, ninguna),
          (domingo, descansar)]
```

**Implementación:**
```prolog
agenda_completa(_, [], []).
agenda_completa(Persona, [D|DiasResto], [(D,Act)|R]) :-
    rutina(Persona, Act, D),
    agenda_completa(Persona, DiasResto, R).
agenda_completa(Persona, [D|DiasResto], [(D,ninguna)|R]) :-
    \+ rutina(Persona, _, D),
    agenda_completa(Persona, DiasResto, R).
```

## Conceptos Aprendidos

- **Modelado de Comportamiento Temporal**: Rutinas que dependen del tiempo
- **Relaciones Recursivas**: Amistad transitiva que se propaga automáticamente
- **Manipulación de Listas**: Operaciones básicas sobre listas en Prolog
- **Predicados Bidireccionales**: Relaciones que funcionan en ambas direcciones
- **Consultas Condicionales**: Actividades que dependen de categorías de días
- **Generación de Datos Estructurados**: Crear agendas completas automáticamente
- **Recursión Estructural**: Procesar listas mediante recursión
- **Backtracking**: Explorar todas las posibilidades de relaciones

## Ejemplos de Consultas

```prolog
% Verificar actividades
?- cocina(ana).
true

?- actividad(pedro).
true

% Consultar rutinas
?- rutina(juan, Actividad, Tiempo).
Actividad = estudiar, Tiempo = entre_semana ;
Actividad = descansar, Tiempo = fin_semana

% Actividad en día específico
?- actividad_dia(pedro, sabado, Actividad).
Actividad = jugar

?- actividad_dia(juan, lunes, Actividad).
Actividad = estudiar  % Porque lunes está en entre_semana

% Consultar parentesco
?- parentesco(ana, pedro).
true

?- parentesco(maria, sofia).
true

% Amistad transitiva
?- amistad(juan, X).
X = ana ;
X = maria

% Operaciones con listas
?- miembro(estudiar, [cocinar, estudiar, jugar]).
true

?- invertir([cocinar, estudiar, jugar], R).
R = [jugar, estudiar, cocinar]

% Agenda completa para jorge
?- dias(Semana), agenda_completa(jorge, Semana, Agenda).
Semana = [lunes, martes, miercoles, jueves, viernes, sabado, domingo],
Agenda = [(lunes, trabajar),
          (martes, trabajar),
          (miercoles, cocinar),
          (jueves, ninguna),
          (viernes, jugar),
          (sabado, ninguna),
          (domingo, descansar)]
```

## Estructura de Datos

### Listas en Prolog

Las listas se representan como:
- `[]`: Lista vacía
- `[H|T]`: Lista con cabeza `H` y cola `T`
- `[a, b, c]`: Notación sintáctica para listas

### Tuplas

Las tuplas `(Día, Actividad)` se usan para representar eventos planificados en la agenda.

### Predicado `dias/1`

Define la lista completa de días de la semana:
```prolog
dias([lunes, martes, miercoles, jueves, viernes, sabado, domingo]).
```

## Notas sobre el Código

El archivo incluye algunos comentarios explicativos en español al final:
> "Las rutinas por día se modelaron con hechos del tipo `rutina(Persona, Actividad, Dia)`, donde cada persona tiene asociada una acción y un día o categoría de días (ej. `entre_semana`, `fin_semana`). Para consultas más flexibles, se usaron reglas que relacionan estas categorías con listas de días específicos mediante recursión. De esta forma, es posible preguntar qué hace alguien en un día dado y obtener la actividad correspondiente."

## Aplicaciones del Modelado de Comportamiento

Este tipo de sistemas se utilizan en:
- **Sistemas de Planificación**: Calendarios y agendas personales
- **Simulaciones Sociales**: Modelar comportamientos grupales
- **Asistentes Personales**: Recomendar actividades y horarios
- **Análisis de Patrones**: Identificar rutinas comunes
- **Aplicaciones de Productividad**: Optimizar horarios y tareas
- **Sistemas de Recomendación**: Sugerir actividades basadas en patrones

## Imágenes Incluidas

El directorio incluye capturas de pantalla (`image.png`, `image-1.png`, `image-2.png`, `image-3.png`, `image-4.png`) que muestran ejemplos de consultas ejecutadas en Prolog, demostrando:
- Consultas sobre actividades
- Verificación de amistades y relaciones
- Operaciones con listas
- Consultas sobre rutinas diarias
- Resultados de consultas complejas

## Objetivos de Aprendizaje

- Modelar comportamientos que dependen del tiempo
- Implementar relaciones sociales complejas (amistad transitiva)
- Manipular listas y estructuras de datos recursivamente
- Crear consultas flexibles sobre actividades temporales
- Generar datos estructurados (agendas) automáticamente
- Combinar múltiples tipos de información (actividades, relaciones, tiempo)
- Aplicar recursión a problemas de modelado de comportamiento
- Entender el concepto de relaciones transitivas

## Ventajas del Enfoque

- **Expresivo**: Captura la complejidad de la vida diaria humana
- **Flexible**: Permite consultas sobre diferentes aspectos (tiempo, relaciones, actividades)
- **Extensible**: Fácil agregar nuevas personas, actividades y rutinas
- **Temporal**: Maneja rutinas que varían por día de manera elegante
- **Relacional**: Integra actividades con relaciones sociales de forma natural
- **Declarativo**: Describe qué relaciones existen, no cómo buscarlas

## Características Destacadas

1. **Sistema de Categorías de Tiempo**: Permite definir rutinas por categorías (`entre_semana`, `fin_semana`) además de días específicos
2. **Amistad Transitiva**: Las relaciones de amistad se propagan automáticamente
3. **Generación Automática de Agendas**: Crea agendas completas incluso para días sin rutina definida
4. **Bidireccionalidad**: Las relaciones familiares funcionan en ambas direcciones
5. **Valores por Defecto**: Sistema de descanso automático cuando no hay actividad

## Extensión del Ejercicio

Para mejorar el sistema se podría:
- Agregar conflictos de horarios entre personas
- Implementar sistema de preferencias y prioridades
- Crear consultas de optimización ("¿cuándo pueden encontrarse dos amigos?")
- Agregar duración de actividades
- Implementar sistema de recordatorios
- Crear análisis de patrones de actividad
- Agregar ubicaciones a las actividades
- Implementar sistema de energía/cansancio
- Crear predicados para encontrar momentos libres compartidos

