% Determinación de excelente o enfermedades relacionadas
%Álvaro Varón 
 evaluar:-
rendimiento(Rendimiento),
write('El rendimiento del estudiante ha sido '),
write(Rendimiento),
nl,
write('Sigue esforzandote!'),
deshacer.

/*Definición de clasificaciones de rendimiento*/
rendimiento(muy_bajo) :- muy_bajo.
rendimiento(bajo) :- bajo.
rendimiento(regular) :- regular.
rendimiento(bueno) :- bueno.
rendimiento(sobresaliente) :- sobresaliente.
rendimiento(excelente) :- excelente.
rendimiento(deficiente):- deficiente. 

/*Reglas de identificacion*/
muy_bajo :-
 clasificacion('Ha perdido algun parcial' ),
 clasificacion('Ha perdido más de un parcial' ),
nl.

bajo :-
 clasificacion('Ha asistido a todas las clases'),
 clasificacion('Ha entregado todos los trabajos' ),
 clasificacion('Ha perdido algun parcial' ),
nl.

regular :-
 clasificacion('Ha entregado todos los trabajos' ),
 clasificacion('Ha perdido algun trabajo' ),
nl.

bueno :-
 clasificacion('Ha asistido a todas las clases'),
 clasificacion('Ha entregado todos los trabajos' ),
 clasificacion('Ha pasado todos los quizes y examenes' ), 
 clasificacion('Tiene alguna nota inferior a 4' ), 
nl.

sobresaliente :-
 clasificacion('Ha asistido a todas las clases'),
 clasificacion('Ha entregado todos los trabajos' ),
 clasificacion('Ha pasado todos los quizes y examenes' ), 
 clasificacion('Ha dedicado jornada extracurricular para estudiar' ), 
 clasificacion(' tiene una nota inferior a 4.5' ),  
nl.

excelente :-
 clasificacion('Ha asistido a todas las clases'),
 clasificacion('Ha entregado todos los trabajos' ),
 clasificacion('Ha pasado todos los quizes y examenes' ),
 clasificacion('Ha dedicado jornada extracurricular para estudiar' ),  
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
 clasificacion(S) :-
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