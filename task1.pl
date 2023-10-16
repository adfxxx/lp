% Первая часть задания - предикаты работы со списками

% Получаем длину списка 
list_length([], 0).
list_length([_|T], L) :- list_length(T, L1), L is L1+1.

% Проверить, принадлежит ли элемент списку
is_member(Elem, [Elem|_]).
is_member(Elem, [_|Tail]) :- is_member(Elem, Tail).

% Добавление в список 
list_append([], Elem, Elem).
list_append([Head|Tail], Elem,[Head|TailFinal]) :-list_append(Tail, Elem, TailFinal).

% Удаление из списка
list_remove(Elem, [Elem|Tail], Tail).
list_remove(Elem, [Head|Tail], [Head|TailFinal]) :- list_remove(Elem, Tail, TailFinal).

% Перестановки списка
permute([],[]).
permute(Elem, [Head|Tail1]) :- list_remove(Head, Elem, Tail), permute(Tail,Tail1).

% Проверка на нахождение элементов в списке
is_sublist(List, Slist) :- list_append(List1, _, List), list_append(_,Slist,List1).

% Удаление всех элементов списка по значению с помощью стандартных предикатов
remove_elem1(Elem, List1, List2) :- append(List2, [Elem|_], List1).

% Удаление всех элементов списка по значению без использования стандартных предикатов
remove_elem2(Elem, [Elem|_],[]) :- !.
remove_elem2(Elem, [H|T],[H|T1]) :- remove_elem2(Elem, T, T1).

% Вычисление суммы элементов вариант 1
sum1([], 0).
sum1([H|T], S) :- sum1(T,S1), S is S1 + H.

% Вычисление суммы элементов вариант 2
sum_2([], S, S).
sum_2([H|T],S1,S) :- S2 is H + S1, sum_2(T,S2,S).
sum2(List, S) :- sum_2(List, 0, S).
