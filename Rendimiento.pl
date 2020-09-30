% Determinación de excelente o enfermedades relacionadas
%Álvaro Varón 
diagnosticar:-
rendimiento(Rendimiento),
write('El rendimiento del estudiante ha sido '),
write(Rendimiento),
nl,
write('Esfuerzate mas!'),
deshacer.

/*Definición de enfermedades a probar*/
rendimiento(muy_bajo) :- muy_bajo.
rendimiento(bajo) :- bajo.
rendimiento(bueno) :- bueno.
rendimiento(sobresaliente) :- sobresaliente.
rendimiento(excelente) :- excelente.
rendimiento(deficiente):- deficiente. 

/*Reglas de identificacion*/
muy_bajo :-
sintoma('Ha perdido algun parcial' ),
sintoma('Ha perdido más de un parcial' ),
nl.

bajo :-
sintoma('Ha asistido a todas las clases'),
sintoma('Ha entregado todos los trabajos' ),
sintoma('Ha perdido algun parcial' ),
nl.

bueno :-
sintoma('Ha asistido a todas las clases'),
sintoma('Ha entregado todos los trabajos' ),
sintoma('Ha pasado todos los quizes y examenes' ), 
sintoma('Tiene alguna nota inferior a 4' ), 
nl.

sobresaliente :-
sintoma('Ha asistido a todas las clases'),
sintoma('Ha entregado todos los trabajos' ),
sintoma('Ha pasado todos los quizes y examenes' ), 
sintoma('Ha dedicado jornada extracurricular para estudiar' ), 
sintoma(' tiene una nota inferior a 4.5' ),  
nl.

excelente :-
sintoma('Ha asistido a todas las clases'),
sintoma('Ha entregado todos los trabajos' ),
sintoma('Ha pasado todos los quizes y examenes' ),
sintoma('Ha dedicado jornada extracurricular para estudiar' ),  
nl.

deficiente :-
nl.

/* Se realizan las preguntas entrada-usuario para identificar el rendimiento */
preguntar(Pregunta) :-
write('El estudiante '),
write(Pregunta),
write('? '),
read(Respuesta),
nl,
( (Respuesta == si)
->
assert(si(Pregunta)) ;
assert(no(Pregunta)), fail).

:- dynamic si/1,no/1.
/*Determina si las respuestas coinciden con el rendimiento parametrizado*/
sintoma(S) :-
(si(S)
->
true ;
(no(S)
->
fail ;
preguntar(S))).


/* deshacer all si/no aciertos*/
deshacer :- retract(si(_)),fail.
deshacer :- retract(no(_)),fail.
deshacer.