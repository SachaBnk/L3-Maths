#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Calcul Différentiel*])
#align(center, text(15pt)[Chapitre 5 -- Introduction aux équations différentielles]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

= I. Théorie générale, existence, unicité

On s'interesse à des équations différentielles d'ordre 1 dans $RRd$, càd des équations du type
$ X'(t) = f(t, X(t)) $
où l'inconnue est $X$, et $f : I times Omega --> RRE$ est un champ de vecteurs donné sur $I times Omega$ avec $I$ un intervalle ouvert et $Omega$ un ouvert de $RRd$. On supposera toujours $f$ continue.

#def() On appelle *solution* de l'équation différentielle $X' = f(t,X)$, toute fonction $X$ de classe $C1$ sur un intervalle $J subset I$ et à valeurs dans $Omega$, qui satisfait 
$ forall t in J, X'(t) = f(t,X(t)) $

#rq("importante") L'équation $X' = f(t,X)$ est équivalente à la forme intégrale :
$ X(t) = X(t_0)+int_(t_0)^t f(s,X(s))d s $
où $t_0$ est fixé.

#lemme("de Grönwall") Soient $u,a,b$ trois fonctions continues sur un intervalle $[t_0,t_1]$ à valeurs réelles. Si la fonction *$a$ est positive* et que
$ forall t in [t_0,t_1], u(t) <= b(t) + int_(t_0)^t a(s)u(s)d s $ 
alors
$ forall t in [t_0,t_1], u(t) <= b(t) + int_(t_0)^t a(s)b(s) e^(int_s^t a(s')d s')d s $

#demo()[
celene
]
#pagebreak()
#rq() Si $a$ et $b$ sont des fonctions constantes, alors le resultat s'écrit :\
Si
$ forall t in [t_0,t_1], u(t) <= b+a int_(t_0)^t u(s) d s $
alors
$ forall t in [t_0,t_1], u(t) &<= b + b int_(t_0)^t a e^((t-s))d s\
&<= ...\
u(t) &<= b e^(a (t-t_0)) $


= II. Théorème de Cauchy-Lipschitz

#def() On appelle *problème de Cauchy* le système déquations,\ pour $f in Cr(I times Omega, RR^d) et X in C1(J, Omega), J subset I$

$(C) : cases(X' = f(t, X)\, t in J, X(t_0) = x_0)$ avec $(t_0, x_0) in J times Omega$

<lip>
#def() On dit qu'une fonction $f : I times Omega --> RR^d$ est *localement lipschitzienne en sa seconde variable* si pour tout $[t_-, t_+] subset I$ et tout compact $K subset Omega$,\ $exists L > 0, forall t in [t_-, t_+], forall x, y in K, norm(f(t, x) - f(t, y)) <= L norm(x-y)$

#def() $f$ est *globalement lipschitzienne en sa deuxième variable* si  $forall [t_-, t_+] subset I, exists L>0, forall t in [t_-, t_+], forall x, y in RRd, norm(f(t, x) - f(t, y)) <= L norm(x - y)$

#prop() Si $f in C1(I times Omega, RR^d)$ alors $f$ est localement lipschitzienne en sa seconde variable

#demo("dans le cas ou le compact K est convexe")[
on a $forall x, y in K, forall s in [0, 1], s x + (1-s)y in K$\
On utilise l'inégalité des accroissements finis :\ comme $f$ est $C1$ sur $I times Omega$, la fonction $df$ est continue sur $[t_-, t_+] times K$ qui est compact. Elle est donc bornée par une constante $L>0$\
ie $forall (t, x) in [t_-, t_+] times K, norm(df(t,  x))_(Lr(RR^(d+1), RR^d)) <= L$

En applicant l'inégalité des accoroissements finis à $f$ entre $(t, x) et (t, y)$, on a

$norm(f(t, x) - f(t, y)) &<= sup_(0<=s<=1) norm(df(s(t, x)+(1-s)(t, y)))_(Lr(RR^(d+1), RR^d)) norm((t, x)-(t, y))_(RR^(d+1))\
&<= sup_(0<=s<=1) norm(df(s x+(1-s)y))_(Lr(RR^(d+1), RR^d)) norm(x-y)_(RR^(d+1))\
&<= L norm(x-y)_(RR^(d+1))$

avec $L = sup_(0<=s<=1) norm(df(s x+(1-s)y))_(Lr(RR^(d+1), RR^d)) > 0$
]

<cau-lip>
#thm("de Cauchy - Lipschitz") On suppose que $f$ est continue et localement lipschitzienne en sa deuxieme variable, alors pour tout $(t_0, x_0) in I times Omega$ :\
- il existe $tau > 0 et X in C1([t_0-tau, t_0+tau], Omega)$ solution de $(C)$\
  avec $J = [t_0-tau, t_0+tau]$
- si $X_1, X_2$ sont deux solutions de $(C)$ sur les intervalles $J_1 et J_2$ respectivement, alors $forall t in J_1 inter J_2, X_1(t)=X_2(t)$

= III. Solutions maximales, solutions globales et orbites

#def("(de merde)") $Si X_1 in C1(J_1, Omega) et X_2 in C1(J_2, Omega)$ Sont deux solutions de $(C)$, on peut définir une troisième $X_3 in C1(J_1 union J_2, Omega)$ en posant $X_3 : t ass cases(X_1 (t) si t in J_1, X_2(t) si t in J_2)$, cette solution est bien définie par le ii) du thm de #lien(<cau-lip>)[Cauchy-Lipschitz]\
$X_3$ est appelée *concaténation* de $X_1 et X_2$

#let Jr = $cal(J)$
#let Jmax = $J_"max"$
#let Xmax = $X_"max"$

$pour t_0, x_0$\
$Jr = {J tq exists X in C1(J, Omega) "sol de" (C)}$\
$Jmax = Union_(J in Jr) J = {t in RR | exists J in Jr, t in J}\
Xmax : t ass X_J (t) si t in J$

#def() Le thm de #lien(<cau-lip>)[Cauchy-Lipschitz] assure que pour tout $(x_0, t_0) in I times Omega$, il existe une *unique solution maximale* au problème de Cauchy $(C)$, c'est à dire un unique intervalle (maximal) $J subset I$ et une unique unique fonction $X in C1(J, Omega)$\
$tq si tilde(X) in C1(tilde(J), Omega)$ est sol de $(C), alors tilde(J) subset J$

#rq() On appelle *équation autonome* une équation différentielle de la forme $X'=f(X)$\
C'est un cas particulier en identifiant $f : Omega --> RRd$ à la fonction $ft : func(RR times Omega &--> RRd, (t, x) &ass f(x))$

#def() On dit qu'une solution $X in C1(J, Omega)$ est *globale* si $J = I$\
En particulier une solution globale est une fonction maximale

#thm("- Sortie de tout compact") On se place sous les mêmes hypothèses sur $f$ que dans le #lien(<cau-lip>)[thm de Cauchy-Lipschitz], et on considère $X in C1(J, Omega)$ une solution maximale de $(C)$ \
Alors ou bien $sup J = sup I$, ou bien *X sort de tout compact*\
c'est-à-dire que pour tout compact $K subset Omega, exists t_K < sup J, forall t in ]t_K, sup J[, X(t) in.not K$

#rq() On a le même resultat pour les inf

#demo()[
Par l'absurde, on suppose $sup J < sup I et "il existe un compact" K subset Omega, "et une suite" (t_n)_(n in NN), t_n -->_(n-->pinf) sup J, tq forall n in NN, X(t_n) in K$

Comme on l'a montré dans la preuve du i) du #lien(<cau-lip>)[thm de Cauchy-Lipschitz] (oups), il existe $tau >0 tq forall (s_0, y_0) in I times K, exists X in C1([s_0-tau, s_0+tau], Omega) "sol de" cases(x' = f(t, X), X(s_0) = y_0)$

Comme $t_n --> sup J, exists n_0 in NN tq t_n_0 > sup J - tau$\
Comme $x(t_0) in K$, il existe alors une solution $Y in C1([t_0 - tau, t_0 + tau], Omega)$ au problème de cauchy : $cases(Y' = f(t, Y), Y(t_n_0) = X(t_n_0))$

On peut donc prolonger, par concaténation de $Y et X$, la solution $X$ jusqu'au temps $t_n_0 + tau > sup J$, ce qui contredit la maximalité de $X$
]

#corollaire() On considère le cas $Omega = RRd$ et on suppose que $f$ est continue sur $I times RRd$, localement lipschitzienne en sa deuxième variable, et que pour tout $[t_-, t_+] subset I$, il exsiste $M>0 tq forall t in [t_-, t_+], forall x in RRd, norm(f(t, x))<= M (1+norm(x)) " " redstar$\
Alors toute solution maximale est globale

#rq() Dans le cas autonome $f : Omega --> RRd$, $X' = f(X)$\
La condition devient $forall x in RRd, norm(f(x))<= M(1+norm(x))$

#rq() Si $f$ est #lien(<lip>)[globalement lipschitzienne] en sa deuxième variable, alors elle est #lien(<lip>)[localement lipschitzienne] en sa deuxième variable et vérifie également la condition $redstar$

#rq() On considère maintenant (jusqu'à la fin de chapitre), les équation différentielles autonomes, cad $X' = f(X)$ avec $f : Omega --> RRd$ localement lipschitzienne ($I=RR$)

Pour $(t_0, x_0) in RR times Omega$ on appelle $X in C1(J, Omega)$ la solution maximale

#def() Pour $x_0 in Omega$, on appelle *orbite* issue de $x_0$

$O(x_0) &= {X(t), t in J}\
&= X(J)$

#rq("importante") ⚠️ Cette définition dépend de $t_0$\
En effet pour $t_1 != t_0$, la solution maximale au pb de Cauchy avec donnée initiale $Y(t_1) = x_0$ est la fonction $Y(t) = X(t-t_1+t_0)$

#prop() Soit $x in Omega$\
Si $y in O(x)$\
Alors $O(y) = O(x)$

#preuve()[
Soit $y in O(x)$, $exists t_1 in J tq y = X(t_1)$\
$X$ est la solution maximale du pb de cauchy avec donnée initiale $X(t_1) = y$\
Donc $O(y) = X(J) = O(x)$
]