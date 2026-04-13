#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true, spacing: 1.5em)
#import "../titres.typ": *
#align(center, text(20pt)[*Préparation CAPES*])
#align(center, text(15pt)[Oral Belaud]) \

#set heading(numbering: "I.1.a.i.")

= Exercice 5
==
Faux : soit $a<b<c<d in RR$, et $I = ]a, b[ union ]c, d[$ un ouvert de $RR$, la fonction $ f : func(I&-->RR, x&ass cases(1 si a<x<b, 2 sinon)) $ est dérivable sur I, sa dérivée est nulle sur I, mais $f$ n'est pas constante sur I\
#rq() ici on répond plutot avec un dessin

== 
On veut résoudre l'équation $ (E_0) : y' = a(x)y $D'après le cours, l'ensemble des solutions de cette equation homogène est $ Sr_0 = {t ass C e^(A(t)) | C in RR} $avec $A$ une primitive de $a$.

#rq() On le prouve en dérivant la fonction $phi : x ass y(x)e^(-A(x))$ comme on a vu en TD

==
===
On résout sur $RRPE$
$ (E) : x y' + (1-x)y = 1 $

On pose $ (E_0) : y' = (1-1/x)y $

Une primitive de $a : x ass 1-1/x$ est $A : x ass x - ln x$

$Pour x in RRPE, e^(A(x)) &= e^(x-ln x)\
&= e^x/x$

On utilise le résultat précédent :
$ Sr_0 ={x ass C e^x/x | C in RR} $

===
On applique la méthode de la variation de la constante à $phi : x ass C(x)mu(x)$,\ avec $mu : x ass e^x/x$, on remplace dans $(E)$
$ &x phi'(x) + (1-x)phi(x) = 1\
ssi &x(C'(x)mu(x) + C(x)mu'(x)) + (1-x)C(x)mu(x) = 1\
ssi &x C'(x)mu(x) + C(x) (cancel(x mu'(x) + (1-x)mu(x)))=1\
ssi &cancel(x) C'(x)e^x/cancel(x) = 1\
ssi &C'(x) = e^(-x) $

Ici $C(x) = -e^(-x)$ convient. On obtient donc la solution particulière 

$ phi(x) &= C(x)mu(x)\
&= -cancel(e^(-x))cancel(e^x)/x\
&= -1/x $

===
D'après le cours, l'ensemble des solutions de $(E)$ est la droite affine $ Sr &= phi + Sr_0\
&= {x ass phi(x) + C e^x/x | C in RR}\
&= {x ass (C e^x -1)/x | C in RR} $
#pagebreak()
#rq() Belaud aime bien la notation "$phi + Sr_0$", elle est bien définie mathématiquement, soit comme "somme de Minkowski" (on somme deux ensembles, on sous entend "${phi}+Sr_0$"), soit comme action de groupe (mais c'est plus dangereux, il faut pouvoir expliquer ce que c'est, c'est chaud)

===
Sur $RRPE$ on avait l'ensemble 
$ Sr = {func(RRPE &--> RR, x &ass (C e^x -1)/x)|C in RR} $
Sur $RRME$, l'ensemble 
$ Sr' = {func(RRME &--> RR, x &ass (C e^x -1)/x)|C in RR} $ convient

#rq() atttention ce n'est pas toujours vrai, ici on a pu primitiver $1/x$ par $ln(abs(x))$ sans pb, mais par exemple $ln(abs(1-x^2))$ aurait pu poser problème et nous aurait forcé a refaire les calculs

===
*Pour $K = 1$* $, pour x != 0$\

$Phi(x)=(e^x-1)/x$ est le taux d'accroissement de $e^x$ en 0. la fonction exponentielle est dérivable en 0 donc $Phi(x) -->_(x-->0) exp'(0) = e^0 = 1$

*Pour $K != 1$*$, x != 0$\

$ Phi(x) &= ((K-1+1)e^x-1)/x\
&= ((K-1)e^x)/x + (e^x-1)/x\
&--> pm oo $

#rq() On peut aussi utiliser les DL mais c'est moins propre

#pagebreak()
=== question bonus : Quelles sont les solutions de $(E)$ sur $RR$ ?

Grace a la question précédente on a prouvé qu'il n'y a qu'une fonction $y in Sr$ continue sur $RR$ (en particulier en 0) : c'est le cas $C = 1$\
Il ne reste plus qu'à prouver que $y : x ass (e^x-1)/x$ est $C1$ \
Pour ce faire on développe $y$ en série entière :
$ y(x) &= 1/x (sum_(n=0)^pinf x^n/n!) -1/x\
&= 1/x (sum_(n=1)^pinf x^n/n!)\
&= sum_(n=1)^pinf x^(n-1)/n!\
&= sum_(n=0)^pinf x^n/(n+1)! $
Par thm de régularité des séries entières, $y$ est $Cr^oo$ sur son espace de définition. Ici son rayon de convergence est $R = oo$. Donc $y$ est $Cr^oo$ sur $RR$, $y$ est bien sol de $(E) "sur" RR$

#pagebreak()
= Exercice 7
== Taylor Reste-intégral
Pour $a<b in RR, f in Cr^(n+1)([a, b], RR)$, on a pour tout $n in NN$ :

$ f(b) = sum_(k=0)^n (b-a)^k/k!f^((k))(a) + int_a^b (b-x)^n/n!f^((n+1))(t)dt $

== Démo

*TLDR : Récurrence et l'hérédité se fait par IPP*

Par récurrence sur $n in NN$, on prouve 
$ H_n : <<forall f in Cr^(n+1)([a, b], RR), f(b) = sum_(k=0)^n (b-a)^k/k!f^((k))(a) + int_a^b (b-t)^n/n!f^((n+1))(t)dt>> $

*Initialisation* : pour $n=0$\
$ f^(b) - f(a) &= int_a^b f'(t)dt "         (dp le tvi)"\
f^(b) &= f(a) + int_a^b f'(t)dt $

*Hérédité* : soit $n in NN$ tel que $H_n$ est vraie, soit $f in Cr^(n+2)([a, b], RR)$\
On a

$ f(b) = sum_(k=0)^n (b-a)^k/k!f^((k))(a) + int_a^b (b-t)^n/n!f^((n+1))(t)dt $
On pose 
$ &u : t ass -(b-t)^(n+1)/(n+1)! "        " &u' : t ass (b-t)^n/n!\
&v : t ass f^((n+1))(t) &v' : t ass f^((n+2))(t) $
Alors 
$ int_a^b (b-t)^n/n!f^((n+1))(t)dt &= [-(b-t)^(n+1)/(n+1)!f^((n+1))(t)]_a^b -int_a^b (-1) (b-t)^(n+1)/(n+1)!f^((n+2))(t)\
&= (b-a)^(n+1)/(n+1)!f^((n+1))(a) + int_a^b (b-t)^(n+1)/(n+1)!f^((n+2))(t) $

Et donc 
$ f(b) = sum_(k=0)^(n+1) (b-a)^k/k!f^((k))(a) + int_a^b (b-t)^(n+1)/(n+1)!f^((n+2))(t)dt $ $H_n imp H_(n+1)$ 

*Conclusion*\
[...]\

$square$

==
On applique le résultat précédent sur $exp in Cr^oo ([0, x], RR) pour x >= 0$
$ e^x = sum_(k=0)^n (x-0)^k/k!e^0 + int_0^x (x-t)^n/n!e^t dt $

Or $(x-t)^n/n!e^t >= 0$ sur $RRP$

Donc $int_0^x (x-t)^n/n!e^t dt > 0$ par croissance de l'intégrale, et on a bien 
$ forall n in NN, e^x >= sum_(k=0)^n x^k/k! $

#rq("- croissance de l'intégrale") $ (forall t in I, f(t)<=g(t)) imp int_I f(t)dt <= int_I g(t)dt $

#pagebreak()
==
Soit $f$ la fonction polynomiale associée à $P$. $f$ est de classe $Cinf$ sur $RR$. Soit $N = deg P$. On applique la formule de Taylor Reste-intégral entre $x_0 et x in [x_0, pinf[$ à l'ordre $N$
$ f(x) = sum_(k=0)^N (x-x_0)^k/k! f^((k))(x_0) + int_(x_0)^x (x-t)^N/N!f^((N+1))(t)dt $

Or $deg P = N donc f^((N+1)) = 0$ donc
$ f(x) &= sum_(k=0)^N (x-x_0)^k/k! f^((k))(x_0)\
&>= f^((0))(x_0) + 0 "        "&("car" forall k in [|1, N|], P^((k))(x_0)>=0)\
&> 0 &("car" P(x_0)>0) $

$f$ ne s'annule donc pas sur $[x_0, pinf[$
==
===
Soit $f$ la fonction polynomiale associée à $P$, $N=deg P$ est impair donc $f$ s'annule en $x_0 in RR$\ (d'après le TVI, et car on peut prouver que les limites de $f$ en $pm oo$ sont $pinf et minf$ en factorisant par $x^N$). On applique la formule de Taylor pour $x in RR$

$ abs(f(x)) &= abs(sum_(k=0)^N (f^((k))(x_0))/k! (x-x_0)^k + int_(x_0)^x (x-t)^N/N! cancel(f^((N+1))(t))dt) \
&<= sum_(k=0)^N abs(cancel(P(x_0))/k!(x-x_0)^k)\
&<= 0 $
Donc $f(x) = 0$ pour tout $x in RR$, donc $f=0$


===
Contre-exemple : $f = cos, P = 1$

#rq() Belaud a redemandé la definition de "polynome", "fonction polynomiale" et "intégrable" (on en a conclu qu'on se contenterait de dire que nos fonctions sont continues sur notre ensemble, et non pas intégrables)