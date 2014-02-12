pais(dayse,felipe).
pais(rogerio,felipe).
pais(dayse,gabriela).
pais(rogerio,gabriela).
pais(joao,dayse).
pais(joao,julio).
pais(joao,denise).
pais(julio,amanda).
pais(julita,dayse).
pais(julita,denise).
pais(julita,julio).
pais(julita,bianca).
pais(denis,bianca).
homem(rogerio).
homem(joao).
homem(julio).
homem(denis).
homem(felipe).
mulher(dayse).
mulher(denise).
mulher(amanda).
mulher(gabriela).
mulher(julita).
mulher(bianca).


pai(X,Y) :- homem(X),pais(X,Y).
mae(X,Y) :- mulher(X),pais(X,Y).

tio(X,Y) :- homem(X),pais(W,Z),pais(W,X),pais(Z,Y),\+pais(X,Y). /* Por que trocando a ordem desse nao da certo*/

tia(X,Y) :- mulher(X),pais(Z,Y),pais(W,Z),pais(W,X),\+pais(X,Y).

prima(X,Y) :- mulher(X),pais(Z,Y),pais(W,Z),pais(W,K),pais(K,X),X\==Y.

primo(X,Y) :- homem(X),pais(Z,Y),pais(W,Z),pais(W,K),pais(K,X),X\==Y.

irmao(X,Y) :- homem(X),pai(P,X),pai(P,Y),mae(M,X),mae(M,Y),X\==Y.

irma(X,Y) :- mulher(X),pai(P,X),pai(P,Y),mae(M,X),mae(M,Y), X\==Y.

meiairma(X,Y) :- mulher(X),pais(Z,X),pais(Z,Y),\+irma(X,Y), X\==Y.

sobrinho(X,Y) :- homem(X), mae(Z,X), irma(Z,Y); homem(X), pai(Z,X), irmao(Z,Y).

sum(2).
sum(3).
sum(X+Y).
soma(X,Y,Z) :- Z is X + Y.

append([],L,L).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

p([1,2,3,4]).

/* Saber se um elemento faz parte de uma lista. 
Se o elemento está na lista, ou ele está na cabeça da lista
ou está na calda da lista*/
member(X,[X|_]). 
member(X,[_|Y]) :- member(X,Y).

/* Programando a funcao member usando append*/
member(X,Y) :- append(_,[X|_],Y). /*Um elemento é membro de uma lista se ele é a cabeça de uma parte dessa lista, ou seja, a concatenação
de uma lista que nao me interessa qual seja, com a lista que o elemento é a cabeça (cuja calda nao me interessa), é igual a lista incial, 
onde esta sendo a busca */
