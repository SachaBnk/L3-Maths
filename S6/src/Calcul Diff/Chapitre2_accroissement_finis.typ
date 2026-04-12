#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Calcul Différentiel*])
#align(center, text(15pt)[Chapitre 2 : Accroissements finis et applications]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()


$dim E < oo$
= I. Préliminaires

#def() on qu'une fonction $f:Omega subset E -_> F$ est dite *de classe $C1$* si elle est différentiable en tout point $x in Omega$, et que l'application $df : func(Omega &--> Lr(E, F), x &ass df(x))$ est continue (sur $Omega$)\
C'est-a-dire $norm(x_n - x)_E -->_(n-->pinf)0 imp norm(df(x_n) - df(x))_LEF -->_(n-->pinf) 0$ $(star)$

#rq() Pour vérifier $(star)$, on cherche une constante $C_n > 0$\
telle que $forall h in E, norm(df(x_n)(h) - df(x)(h))_F <= C_n norm(h)_E$ et $C_n -->_(n-->oo)0$

#ex()[
Si $f:E-->F$ est linéaire\
On a deja vu que $f$ est différentiable en tout point $x in E$,\
et de différentielle $df(x) = f$\
L'application $df$ est constante (de $Omega dans LEF$) et donc continue.
]

#prop() Si $f : Omega --> F in C1 et g : Omega' --> G in C1$\
($Omega in E, Omega' in F$)\
Alors $g rond f$ est de classe $C1$ sur $Omega$

#demo()[
On sait deja que $g rond f$ est différentiable en tout point de $x in Omega$,\ 
et que $dif(g rond f)(x) = dg(f(x)) rond df(x)$\
On veut alors montrer que si $norm(x_n - x)_E --> 0$,\
alors $norm(dif(g rond f)(x_n) - dif(g rond f)(x))_LEG --> 0$ pour n'importe quel $x in Omega$

Soient $x in Omega, (x_n) in Omega^NN tq norm(x_n - x)_E --> 0$

$norm(dif(g rond f)(x_n) - dif(g rond f)(x))_LEG = norm(dg(f(x_n))rond df(x_n) - dg(f(x)) rond df(x))_LEG\
<= norm([dg(f(x_n)) - dg(f(x))]rond df(x_n))_LEG + norm(dg(f(x)) rond [df(x_n) - df(x)])_LEG\
<= norm(dg(f(x_n)) - dg(f(x)))_LFG times norm(df(x_n))_LEF + norm(dg(f(x)))_LFG times norm(df(x_n) - df(x))\
--> 0$
]

#corollaire() Soit $f : Omega --> F$ de classe $C1$\ 
soient $x, y in Omega tq [x, y] subset Omega$\
(avec $[x, y] = {t x + (1-t)y | t in [0, 1]}$)\
Alors la fonction $phi$ définie sur $[0, 1]$ par $phi(t) = f(t x + (1-t)y)$ est de classe $C1$,\
et de dérivée $phi'(t) = df(t x + (1-t)y)(x-y) in F$
#pagebreak()
#demo()[

$g : func([0, 1] &--> Omega, t & ass t x + (1-t)y)$ tq $phi = f rond g$

$g in C1$ ok\
Donc $phi$ est de classe $C1$,

$et forall t in [0, 1], forall h in RR, dif phi(t)(h) &= df(g(t))(dg(t)(h))\
&= df(t x + (1-t) y)(h(x-y))\
&= h dot df(t x + (1-t)y)(x-y)$
]

#lemme() Si $u : [a, b] --> F$ est continue, alors

$norm(int_a^b u(t)dt) <= int_a^b norm(u(t))dt$

#preuve()[

$int_a^b norm(u(t))dt = lim_(n-->oo) 1/n sum_(k = 1)^n norm(u(a + k(b-a)/n))$

inégalité triangulaire + passage a la limite : ok
]
#pagebreak()
= II. Inégalité des accroissements finis

#thm("- inégalité des accroissements finis")\
Soit $f : Omega --> F$ de classe $C1$\
soient $x, y in Omega tq [x, y] subset Omega$\
Alors $norm(f(x) - f(y))_F <= sup_(t in [0, 1]) norm(df(t x + (1-t)y))_LEG times norm(x-y)_E$

#preuve()[
Soit $phi : [0, 1] --> F$ la fonction définie par $phi(t) = f(t x + (1-t)y)$\
On a vu que $phi$ est de classe $C1$\
et que $phi'(t) = df(t x + (1-t)y)(x-y)$

On veut estimer $norm(f(x)-f(y))_F = norm(phi(1) - phi(0))_F$

Comme $phi in C1$, on a $phi(1)-phi(0) = int_0^1 phi'(t)dt$

$et donc norm(phi(1)-phi(0)) &= norm(int_0^1 phi'(t)dt)_F\
&<= int_0^1norm(phi'(t))_F dt$

Or $t ass norm(phi'(t))_F$ est continue sur $[0, 1]$ donc bornée\
$et forall t in [0, 1], norm(phi'(t))_F <= sup_(0<=s<=1) norm(phi'(s))_F$

$donc int_0^1 norm(phi'(t))_F dt &<= sup_(s in [0, 1])norm(phi'(s))_F int_0^1dt\
&<= sup_(s in [0, 1])norm(phi'(s))_F$

$Donc norm(f(x)-f(y))_F <= sup_(s in [0,1]) norm(df(s x + (1-s)y)(x-y))_F$

$forall s in [0, 1], norm(df(s x + (1-s)y)(x-y))_F &<= norm(df(s x + (1-s)y))_LEF norm((x-y))_E\
&<= sup_(t in [0, 1]) norm(df(t x + (1-t)y))_LEF norm(x-y)_E$

Finalement en passant au sup pour $s$ : \
$sup_(s in [0,1]) norm(df(s x + (1-s)y)(x-y))_F <= sup_(t in [0, 1]) norm(df(t x + (1-t)y))_LEF norm(x-y)_E$

Donc $norm(f(x)-f(y))_F <= sup_(t in [0, 1]) norm(df(t x + (1-t)y))_LEF norm(x-y)_E$
]
#pagebreak()
= III. Applications

#thm() On suppose que $Omega$ est un ouvert connexe de $E$.\ 
Si $f : Omega --> F$ est différentiable en tout point de $Omega$ et telle que $df = 0$\
alors $f$ est constante.

#demo()[
Soit $x_0 in Omega$\
On définit le sous ensemble $Er subset Omega$ par $Er = {x in Omega | f(x) = f(x_0)}!=es$\
On va mq cet ensemble est à la fois ouvert et fermé ce qui permet de dire, comme $Omega$ est connexe, que $Er = Omega$

$Er$ est fermé si pour toute suite $(x_n) in Er^NN x_n --> x in Omega, alors x in Er$ 

*$Er$ est fermé*\
En effet, si $(x_n)$ est une suite d'éléments de $Er$ qui converge vers un certain $x in Omega$, alors par continuité de $f$, $f(x) = lim_(n-->pinf) f(x_n) = lim_(n-->pinf) f(x_0) = f(x_0) in Er$

*$Er$ est ouvert*\
but : $forall x in Er, exists r > 0, B(x, r) subset Er$\
Soit $x in Er, r > 0 tq B(x, r) subset Omega$\
Soit $y in B(x, r)$\
On a $[x, y] subset B(x, r)$\
$"En effet" forall t in [0, 1], norm((t x + (1-t)y)-x) &= norm(1-t)dot norm(y-x)$

On applique l'IAF à f sur l'ouvert $B(x, r)$au segment $[x, y]$ :\
$norm(f(x)-f(y))_E <= sup_(t in [0, 1]) norm(df(t x + (1-t)y))_LEF dot norm(x - y)$

$donc norm(f(x) - f(y)) = 0$ d'ou $f(y) = f(x) = f(x_0)$\
donc $y in Er$\
donc $B(x, r) subset Er$
]

#rq() On considère maintenant le cas $E = RRn$\
$Omega in RRn$\
Si $f : Omega --> F$ est différentiable en $x in Omega$, alors $f$ admet des dérivées partielles données par

$derp(f, x_i)(x) = D_e_i f(x) = df(x)(e_i)$

Si de plus $f$ est $C1, "ie" norm(u_k - x)_E -->_(k-->pinf) 0 imp norm(df(u_k)-df(x))_LEF -->_(k-->pinf) 0$\
Alors $forall i in [|1, n|], x ass derp(f, x_i)(x)$ est continue

#pagebreak()
#demo()[
*2.*\
Si $norm(u_k-x)_E-->0$

$alors norm(derp(f, x_i)(u_k)-derp(f, x_i)(x))&= norm(df(u_k)(e_i)-df(x)(e_i))_F\
&= norm((df(u_k)-df(x))(e_i))_F\
&<= norm(df(u_k)-df(x))_LEF norm(e_i)$

Autrement dit si $f in C1,$ alors ses dérivées partielles sont continues.
]

#thm() Soit $f : Omega subset RRn --> F$ une fonction qui admet des dérivées partielles continues sur $Omega$\
Alors $f in C1(Omega)$

#demo()[
*Dans le cas $n=2$*

Il s'agit de mq $f$ est différentiable sur $Omega$, de différentielle $df(x) = sum_(i=1)^2 derp(f,x_i)(x)dx_i$\
$"ie" forall h in RR2, df(x)(h) = sum_(i=0)^2 h_i derp(f, x_i)(x)$

$Soit x = mat(x_1; x_2) in RR2$

On veut montrer que $f(x+h)-f(x)-h_1derp(f, x_1)(x)-h_2 derp(f, x_2)(x) = o_(h-->0)(h)$

(flemme)
]

