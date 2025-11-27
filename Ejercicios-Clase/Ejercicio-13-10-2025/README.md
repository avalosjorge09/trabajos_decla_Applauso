# Sistema de Gestión de Empleados con Base de Datos Dinámica

## Tema
Bases de Datos Dinámicas en Prolog: assertz, retract y retractall

## Descripción
Este ejercicio implementa un sistema completo de gestión de empleados utilizando una base de datos dinámica en Prolog. Permite agregar, eliminar, actualizar y consultar empleados mediante un menú interactivo. Se utiliza la directiva `dynamic` para permitir modificaciones en tiempo de ejecución.

## Contenido del Archivo

### Estructura de Datos

- **Predicado dinámico**: `empleado/3`
  - Formato: `empleado(Nombre, Salario, Departamento)`
  - Declarado como dinámico con `:- dynamic empleado/3`
  - Ejemplo: `empleado('ana', '$900', contabilidad)`

### Funcionalidades Implementadas

#### 1. **Menú Principal (`menu/0`)**
   - Interfaz de usuario que muestra opciones numeradas
   - Permite selección interactiva de operaciones
   - Se ejecuta recursivamente hasta que el usuario seleccione salir

#### 2. **Listar Empleados (`listar_empleados/0`)**
   - Muestra todos los empleados registrados
   - Utiliza backtracking con `fail` para recorrer todas las soluciones
   - Formato de salida estructurado

#### 3. **Agregar Empleado (`agregar_empleado/0`)**
   - Solicita datos del empleado al usuario
   - Utiliza `assertz/1` para agregar el nuevo hecho a la base de datos
   - Confirma la operación al usuario

#### 4. **Eliminar Empleado (`eliminar_empleado/0`)**
   - Busca un empleado por nombre
   - Utiliza `retract/1` para eliminar el hecho
   - Valida si el empleado existe antes de eliminar

#### 5. **Actualizar Empleado (`actualizar_empleado/0`)**
   - Busca un empleado existente
   - Elimina el registro anterior con `retractall/1`
   - Agrega el nuevo registro con los datos actualizados

#### 6. **Agregar con Validación (`agregar_con_validacion/0`)**
   - Verifica si el empleado ya existe antes de agregarlo
   - Previene duplicados en la base de datos
   - Muestra mensaje de error si el empleado ya existe

#### 7. **Eliminar Todos (`eliminar_todos/0`)**
   - Utiliza `retractall/1` para eliminar todos los empleados
   - Útil para reiniciar la base de datos

## Conceptos Aprendidos

- **Bases de Datos Dinámicas**: Uso de la directiva `:- dynamic`
- **Assertz/1**: Agregar hechos a la base de datos en tiempo de ejecución
- **Retract/1**: Eliminar un hecho específico de la base de datos
- **Retractall/1**: Eliminar todos los hechos que coinciden con un patrón
- **Programación Interactiva**: Menús y entrada/salida del usuario
- **Validación de Datos**: Verificar existencia antes de operaciones
- **Recursión**: Menú recursivo para mantener el programa en ejecución

## Diferencias entre Operadores

- **`assertz/1`**: Agrega al final de la base de datos
- **`asserta/1`**: Agrega al principio de la base de datos
- **`retract/1`**: Elimina la primera ocurrencia encontrada
- **`retractall/1`**: Elimina todas las ocurrencias que coinciden

## Ejemplos de Uso

```prolog
% Iniciar el sistema
?- menu.
% ======== MENU ========
% 1. Listar empleados
% 2. Agregar empleado
% 3. Eliminar empleado
% 4. Actualizar empleado
% 5. Agregar con validación
% 6. Eliminar todos
% 0. Salir
% =====================
% Seleccione una opcion: |: 1

% Listar empleados
Nombre: ana | Salario: $900 | Departamento: contabilidad
Nombre: luis | Salario: $900 | Departamento: sistemas
Nombre: sofia | Salario: $900 | Departamento: marketing
--- Fin de la lista ---

% Agregar empleado
% Seleccione una opcion: |: 2
Ingrese nombre: |: carlos
Ingrese salario (ej: '$900'): |: '$1100'
Ingrese departamento: |: recursos_humanos
Empleado agregado correctamente.

% Eliminar empleado
% Seleccione una opcion: |: 3
Ingrese nombre del empleado a eliminar: |: ana
Empleado eliminado correctamente.
```

## Objetivos de Aprendizaje

- Comprender el concepto de bases de datos dinámicas en Prolog
- Dominar las operaciones CRUD (Create, Read, Update, Delete)
- Implementar interfaces interactivas para usuarios
- Aplicar validación de datos en predicados dinámicos
- Gestionar estado mutable en un lenguaje declarativo
- Diseñar sistemas modulares con menús y opciones

## Ventajas de las Bases de Datos Dinámicas

- Permiten modificar el conocimiento durante la ejecución
- Útiles para sistemas que necesitan actualización constante
- Facilitan la creación de programas interactivos
- Permiten simular bases de datos relacionales simples

