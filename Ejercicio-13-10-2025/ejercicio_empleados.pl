% ====== Base de datos dinámica ======
:- dynamic empleado/3.
% empleado(Nombre, Salario, Departamento)

empleado('ana', '$900', contabilidad).
empleado('luis', '$900', sistemas).
empleado('sofia', '$900', marketing).

% ====== Menú principal ======
menu :-
    writeln('% ======== MENU ========'),
    writeln('% 1. Listar empleados'),
    writeln('% 2. Agregar empleado'),
    writeln('% 3. Eliminar empleado'),
    writeln('% 4. Actualizar empleado'),
    writeln('% 5. Agregar con validación'),
    writeln('% 6. Eliminar todos'),
    writeln('% 0. Salir'),
    writeln('% ====================='),
    write('% Seleccione una opcion: '),
    read(Opcion),
    ejecutar_opcion(Opcion),
    (Opcion =\= 0 -> menu ; true).

?-menu.

% ====== Opciones ======
ejecutar_opcion(1) :- listar_empleados.
ejecutar_opcion(2) :- agregar_empleado.
ejecutar_opcion(3) :- eliminar_empleado.
ejecutar_opcion(4) :- actualizar_empleado.
ejecutar_opcion(5) :- agregar_con_validacion.
ejecutar_opcion(6) :- eliminar_todos.
ejecutar_opcion(0) :- writeln('Saliendo del programa...').
ejecutar_opcion(_) :- writeln('Opción no valida.').

% ====== Implementaciones ======

% --- Listar empleados ---
listar_empleados :-
    (empleado(Nombre, Salario, Departamento),
     format('Nombre: ~w | Salario: ~w | Departamento: ~w~n',
            [Nombre, Salario, Departamento]),
     fail;
     writeln('--- Fin de la lista ---')).

% --- Agregar empleado ---
agregar_empleado :-
    write('Ingrese nombre: '), read(Nombre),
    write('Ingrese salario (ej: \'$900\'): '), read(Salario),
    write('Ingrese departamento: '), read(Departamento),
    assertz(empleado(Nombre, Salario, Departamento)),
    writeln('Empleado agregado correctamente.').

% --- Eliminar empleado ---
eliminar_empleado :-
    write('Ingrese nombre del empleado a eliminar: '), read(Nombre),
    (retract(empleado(Nombre, _, _)) ->
        writeln('Empleado eliminado correctamente.');
        writeln('Empleado no encontrado.')).

% --- Actualizar empleado ---
actualizar_empleado :-
    write('Ingrese nombre del empleado a actualizar: '), read(Nombre),
    (empleado(Nombre, _, _) ->
        write('Ingrese nuevo salario (ej: \'$950\'): '), read(NuevoSalario),
        write('Ingrese nuevo departamento: '), read(NuevoDepartamento),
        retractall(empleado(Nombre, _, _)),
        assertz(empleado(Nombre, NuevoSalario, NuevoDepartamento)),
        writeln('Empleado actualizado correctamente.');
        writeln('Empleado no encontrado.')).

% --- Agregar con validación ---
agregar_con_validacion :-
    write('Ingrese nombre: '), read(Nombre),
    (empleado(Nombre, _, _) ->
        writeln('Error: el empleado ya existe.');
        write('Ingrese salario (ej: \'$900\'): '), read(Salario),
        write('Ingrese departamento: '), read(Departamento),
        assertz(empleado(Nombre, Salario, Departamento)),
        writeln('Empleado agregado correctamente.')).

% --- Eliminar todos ---
eliminar_todos :-
    retractall(empleado(_, _, _)),
    writeln('Todos los empleados han sido eliminados.').

% ====== Inicio automático ======
inicio :- writeln('--- Sistema de Empleados ---'), menu.
