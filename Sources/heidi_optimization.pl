%on commence par définir les ordres de Heidi

hOrder(deponer).
hOrder(dretg).
hOrder(sanester).
hOrder(davent).
hOrder(davos).
hOrder(plaun).
hOrder(returnar).
hOrder(sa_fermar).

%Maintenant on déclare les 3 types de sifflets que Heidi veut utiliser

tOrder(hee).
tOrder(wheet).
tOrder(wheeo).

%Définion des traductions


trad_h_to_t(deponer, [wheeo, hee, wheet]).
trad_h_to_t(dretg, [hee, wheet]).
trad_h_to_t(sanester, [wheet, wheeo]).
trad_h_to_t(davent, [wheet, hee, wheet]).
trad_h_to_t(davos, [wheet, wheeo, wheet]).
trad_h_to_t(plaun, [wheet, wheeo, wheeo]).
trad_h_to_t(returnar, [wheeo, wheet]).
trad_h_to_t(safermar, [wheeo, wheeo]).

%Les test pour ces 3 fonctions se réalisent de la même façons que dans la partie 1
%On teste les combinaisons que prolog trouve pour
%hOrdex(X).
%tOrder(X).
%trad_h_to_t(X,Y).

%Traduction dans le langage de Tita

%Cas 1 : 0 éléments

h_to_t([], []).

%Cas 2 : un seul élément

h_to_t(X, Y):- X = [L],
    trad_h_to_t(L, Y).

%Cas 3 : plus d'un élément

h_to_t([H | T], Y):- htoT_oneorder(H, H_translated),
    htoT(T, T_translated),
    append(H_translated, T_translated, Y).

t_to_h([], []).

% 2 sifflets

t_to_h(X, Y):- X = [A | B],
    B =  [C | D],
    t_to_h(D, Restesol),
    trad_h_to_t(Sol, [A , C]), %ordre avec deux sifflets
    			Y = [Sol | Restesol].

% 3 sifflets

t_to_h(X, Y):- X = [A | B],
    B =  [C | D],
    D =  [E | F],
    t_to_h(F, Restesol),
    trad_h_to_t(Sol, [A , C, E]), %ordre avec trois sifflets
    Y = [Sol | Restesol].

/*TESTS
 *
 * Test identiques au fichier Heidi
 *
 * tests pour t_to_h
 *
 * exemples donnant TRUE
 *
 * t_to_h([wheeo, hee, wheet, wheeo, wheeo], [deponer,  safermar]).
 *
 * exemple donnant FALSE
 *
 * t_to_h([wheeo, hee, wheet, wheeo, wheeo], [deponer,  deponer]).
 */

%Accéleration

% traduction
h_to_t([plaun, dretg, plaun, deponer, safermar], X).
% traduction2
t_to_h([wheet, wheeo, wheeo, hee, wheet, wheet, wheeo, wheeo, wheeo, hee, wheet, wheeo, wheeo], X).
% résultat obtenu:
% X = [sanester, deponer, sanester, safermar, dretg, safermar]
% X = [sanester, deponer, plaun, deponer, safermar]
% X = [plaun, dretg, sanester, safermar, dretg, safermar]
% X = [plaun, dretg, plaun, deponer, safermar] % interprétation de départ
