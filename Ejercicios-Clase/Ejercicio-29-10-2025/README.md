# Clase: Árboles Genealógicos y Relaciones Familiares en Prolog

## Tema
Modelado Complejo de Relaciones: Árboles Genealógicos con Múltiples Familias y Relaciones Sociales

## Descripción
Este ejercicio implementa un sistema completo de genealogía que modela múltiples familias nobles medievales (Rivoria, Montelar, Durania) con sus relaciones familiares, oficios, tradiciones y conflictos. Combina relaciones de parentesco, herencias de oficios, alianzas y rivalidades, creando un modelo complejo del mundo real aplicado a un contexto histórico-fantástico.

## Contenido del Archivo

### Familias Modeladas

#### 1. Familia de Rivoria

**Miembros:**
- Esteban y Mariela (padres fundadores)
- Hijos: Clara, Rodolfo, Ismael
- Clara casada con Andrés → Hija: Sofía
- Rodolfo casado con Teresa → Hijos: Lucas, Martina
- Héctor (amigo de Ismael)

**Relaciones:**
- `esposo/2`, `hijo/2`: Relaciones familiares básicas
- `descendiente/2`: Regla recursiva para descendencia
- `familia/2`: Determina pertenencia a la familia

#### 2. Familia de Montelar

**Miembros:**
- Alonso y Beatriz (padres fundadores)
- Hijos: Felipe, Catalina, Emilio
- Catalina casada con Andrés (vínculo con Rivoria)

**Relaciones:**
- Misma estructura de relaciones que Rivoria
- Relación de matrimonio cruzado con Rivoria

#### 3. Familia de Durania

**Miembros:**
- Mateo y Irene (padres fundadores)
- Ofrece: Agricultura y crianza

**Relaciones:**
- Familia más pequeña pero con oficios importantes

### Oficios y Herencias

#### Sistema de Oficios

Cada persona tiene un oficio registrado con `trabaja/2`:
- **Rivoria**: Héctor (herrero), Teresa (tejedora), Clara (maestra)
- **Montelar**: Catalina (curandera), Felipe (explorador)
- **Durania**: Mateo (agricultor), Irene (criadora)

#### Sistema de Herencia (`herencia/2`)

Los oficios se heredan de padres a hijos:
```prolog
herencia(X, Y) :- descendiente(X, Z), trabaja(Z, Y), X \= lucas
```

**Excepción especial:**
- Lucas hereda el oficio de herrero de Héctor (amigo de su tío)

### Sistema de Alianzas y Conflictos

#### Alianzas (`alianza/2`)
- Alianza entre Rivoria y Durania

#### Rivalidades (`rival/2`)
- Rodolfo (Rivoria) rival de Felipe (Montelar)
- Clara (Rivoria) rival de Catalina (Montelar)

### Sistema de Festividades y Creencias

#### Festividades (`celebra/2`)
- **Fiesta del Río**: Familia de Rivoria
- **Fiesta de la Luna**: Familia de Montelar
- **Fiesta del Grano**: Familia de Durania

#### Creencias (`cree/2`)
Derivadas de las festividades:
- Quien celebra Fiesta del Río → Cree en el agua
- Quien celebra Fiesta de la Luna → Cree en la montaña
- Quien celebra Fiesta del Grano → Cree en la tierra

## Conceptos Aprendidos

- **Modelado de Múltiples Entidades**: Varias familias independientes
- **Relaciones Cruzadas**: Matrimonios entre familias diferentes
- **Herencia de Propiedades**: Oficios que se transmiten generacionalmente
- **Relaciones Sociales Complejas**: Amistades, alianzas, rivalidades
- **Sistemas de Creencias**: Valores culturales asociados a familias
- **Reglas Recursivas Complejas**: Descendencia multi-generacional

## Reglas Clave Implementadas

### 1. Descendencia Recursiva
```prolog
descendiente(X, Y) :- hijo(X, Y)
descendiente(X, Y) :- hijo(X, Z), descendiente(Z, Y)
```

### 2. Pertenencia a Familia
```prolog
familia(X, deRivoria) :- 
    hijo(X, esteban) ; 
    hijo(X, mariela) ; 
    descendiente(X, esteban) ; 
    descendiente(X, mariela) ; 
    amigo(hector, _)
```

### 3. Herencia de Oficios
```prolog
herencia(X, Y) :- 
    descendiente(X, Z), 
    trabaja(Z, Y), 
    X \= lucas
```

## Ejemplos de Consultas

```prolog
% Consultar miembros de una familia
?- familia(X, deRivoria).
X = clara ;
X = rodolfo ;
X = ismael ;
X = sofia ;
...

% Consultar oficios heredados
?- herencia(lucas, Oficio).
Oficio = herrero

% Consultar celebraciones
?- celebra(X, fiestaRio).
X = clara ;
X = rodolfo ;
...

% Consultar creencias
?- cree(clara, Creencia).
Creencia = agua

% Consultar rivalidades
?- rival(Rodolfo, Quien).
Quien = felipe
```

## Aplicaciones del Modelado Complejo

Este tipo de sistemas se utilizan en:
- **Juegos de Rol**: Modelado de mundos de fantasía
- **Simulaciones Históricas**: Recrear sociedades pasadas
- **Lenguajes de Dominio Específico**: Representar conocimiento especializado
- **Sistemas de Narrativa**: Generar historias basadas en relaciones
- **Antropología Computacional**: Estudiar estructuras sociales

## Objetivos de Aprendizaje

- Modelar sistemas sociales complejos con múltiples entidades
- Implementar herencia y transmisión de propiedades
- Combinar relaciones familiares con relaciones sociales
- Crear sistemas de valores y creencias culturales
- Aplicar recursión a problemas de múltiples niveles
- Diseñar bases de conocimiento extensas y organizadas

## Ventajas del Enfoque

- **Modular**: Cada familia puede modelarse independientemente
- **Extensible**: Fácil agregar nuevas familias y relaciones
- **Expresivo**: Captura relaciones complejas del mundo real
- **Inferencial**: Deriva información implícita automáticamente
- **Narrativo**: Permite generar historias basadas en relaciones

## Estructura del Sistema

El modelo combina:
1. **Estructura Familiar**: Árboles genealógicos por familia
2. **Sistema de Oficios**: Profesiones y herencias
3. **Red Social**: Amistades, alianzas, rivalidades
4. **Cultura**: Festividades y creencias por familia
5. **Relaciones Cruzadas**: Matrimonios entre familias

## Extensión del Ejercicio

Para mejorar el sistema se podría:
- Agregar eventos históricos y fechas
- Implementar economía y recursos
- Crear sistema de conflictos y resolución
- Agregar más familias y territorios
- Implementar consultas temporales (qué pasó en un año)
- Crear sistema de reputación y honor

