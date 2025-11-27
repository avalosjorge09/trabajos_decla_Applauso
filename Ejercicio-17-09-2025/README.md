# Árboles Binarios en Prolog

## Tema
Estructuras de Datos: Representación de Árboles Binarios en Prolog

## Descripción
Este ejercicio demuestra cómo representar y trabajar con árboles binarios en Prolog. Se utiliza una estructura de datos recursiva para representar un árbol genealógico mitológico (basado en la mitología griega), donde cada nodo puede tener un valor y hasta dos hijos (subárboles izquierdo y derecho).

## Contenido del Archivo

### Estructura del Árbol

El árbol binario se representa mediante el predicado `arbol/3`:
- **Formato**: `arbol(Valor, HijoIzquierdo, HijoDerecho)`
- **Hoja (nodo sin hijos)**: `arbol(Valor, null, null)`
- **Nodo interno**: `arbol(Valor, ArbolIzquierdo, ArbolDerecho)`

### Ejemplo Implementado

El archivo contiene un árbol genealógico completo basado en la mitología griega:
- **Raíz**: Caos
- **Rama izquierda**: Línea de Gea (incluye a Cronos, Zeus, Ares, Atenea, etc.)
- **Rama derecha**: Línea de Urano (incluye a Rea, Poseidón, etc.)

### Estructura del Árbol

```
                        Caos
                       /    \
                     Gea    Urano
                    /         \
                Cronos        Rea
                /  \         /   \
            Hestia Demeter Poseidón Ares
                      \
                     Zeus
                    /    \
                  Hera    Ares
                          /    \
                      Hefesto  Atenea
                               /     \
                          Dionisio  Afrodita
                            /
                         Apolo
```

## Conceptos Aprendidos

- **Estructuras Recursivas**: Árboles como estructuras que se definen a sí mismas
- **Representación en Prolog**: Uso de términos compuestos para estructuras complejas
- **Nodos y Hojas**: Diferencia entre nodos internos y nodos terminales
- **Navegación de Árboles**: Acceso a subárboles izquierdo y derecho
- **Valor Null**: Representación de ausencia de hijos con `null`

## Operaciones Típicas en Árboles Binarios

Aunque este archivo solo contiene la estructura, típicamente se pueden implementar:

1. **Búsqueda de un valor**: Recorrer el árbol buscando un nodo
2. **Recorridos**: Preorden, inorden, postorden
3. **Altura del árbol**: Profundidad máxima
4. **Contar nodos**: Total de elementos en el árbol
5. **Insertar nodos**: Agregar nuevos elementos manteniendo la estructura

## Ejemplos de Consultas

```prolog
% Verificar la estructura del árbol
?- arbol(caos, Izq, Der).
Izq = arbol(gea, arbol(cronos, ...), null),
Der = arbol(uranos, arbol(rea, ...), null)

% Acceder a la raíz
?- arbol(Raiz, _, _).
Raiz = caos

% Acceder al hijo izquierdo
?- arbol(caos, HijoIzq, _).
HijoIzq = arbol(gea, arbol(cronos, ...), null)
```

## Ventajas de Esta Representación

- **Simplicidad**: Fácil de entender y visualizar
- **Recursividad**: Facilita operaciones recursivas
- **Flexibilidad**: Permite árboles de cualquier tamaño
- **Navegación**: Acceso directo a subárboles

## Aplicaciones

Los árboles binarios son fundamentales en:
- **Búsqueda eficiente**: Árboles de búsqueda binaria
- **Expresiones matemáticas**: Representación de operaciones
- **Estructuras jerárquicas**: Organigramas, árboles genealógicos
- **Algoritmos de ordenamiento**: Heaps, árboles AVL
- **Compresión de datos**: Árboles de Huffman

## Objetivos de Aprendizaje

- Comprender la representación de estructuras de datos complejas en Prolog
- Visualizar y manipular árboles binarios
- Aplicar conceptos de recursión a estructuras jerárquicas
- Entender la diferencia entre nodos internos y hojas
- Prepararse para implementar algoritmos de árboles más complejos

## Próximos Pasos

Para extender este ejercicio, se pueden agregar:
- Predicados para buscar valores en el árbol
- Función para calcular la altura
- Recorridos (preorden, inorden, postorden)
- Validación de propiedades del árbol
- Balanceo de árboles

