%Syntaxe Abstraite Heidi Prolog

%on commence par définir les ordres de Heidi

hOrder(deponer).
hOrder(dretg).
hOrder(sanester).
hOrder(davent).
hOrder(davos).
hOrder(plaun).
hOrder(returnar).
hOrder(sa_fermar).

% Ces ordres peuvent être testées sur prolog en faisant
% hOrder(X).
% X étant un des ordres crées, dans ce cas on devrait avoir "true" comme résultat (testé sur http://swish.swi-prolog.org)


%Ordres de Tita

tOrder(court).
tOrder(whee).
tOrder(who).
tOrder(wheet).
tOrder(wheeo).
tOrder(hee).
tOrder(long).

%On teste de la même façons qu'avant, en affichant toutes les combinaisons que Prolog trouve


%Maintenant on définit la tradution des ordres


trad_h_to_t(deponer, [court, court]).
trad_h_to_t(dretg, [whee, who]).
trad_h_to_t(sanester, [wheet, wheeo]).
trad_h_to_t(davent, [wheet, wheeo, wheet, wheet]).
trad_h_to_t(davos, [who, hee, who]).
trad_h_to_t(plaun, [hee, hee, hee, hee]).
trad_h_to_t(returnar, [whee, whee, wheet]).
trad_h_to_t(sa_fermar, [long]).

%On teste en trouvant toutes les combinaisons que prolog trouve avec trad_h_to_t(X,Y)

%fonction donnant la trad dans le langage de tita

% définiton pause entre les ordres

t_pause(pause).

%ma fonction n'accepte que les listes
%Cas 1: Liste vite

h_to_t([], []).

%Cas 2: Plus d'un élément

h_to_t([H | T], Y):- trad_h_to_t(H, H_translated), %traduction du 1er élément
    h_to_t(T, T_translated), %trad reste de la liste de façon récursive
    T_var = [Pause | T_translated],
    t_pause(Pause),%Pause entre les ordres
    append(H_translated, T_var, Y).%Ajout du résultat dans le reste des éléments tr

%Cas 3: un seul élément
%common on a crées une fonction qui ne marche qu'avec des liste, si on a qu'un argument il faut juste rajouter la ligne suivante
%  h_to_t(X, Y):- trad_h_to_t(X,Y).


%TESTS
/*On remarque facilement que la comandet h_to_t([A],X) traduira chaqe commande de heidi A en commande de Tita X
Cela marche évidemment pour une succession de  commandes ex : h_to_t([A,B,C,D,..],X)

exemple de test donnant TRUE:

h_to_t([davos, returnar],[who, hee, who, pause, whee, whee, wheet, pause])

exemple de test donnant False

h_to_t([plaun, returnar],[who, hee, who, pause, whee, whee, wheet, pause])

Les formes des tests des autres fonctions est donné plus haut, il me semble donc pas nécessaire de donner d'autre exemples de tests.
*/
