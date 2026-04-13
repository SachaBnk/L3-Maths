#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[Chapitre 6 — Intégrale à paramètre])


#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
#ex[
$F(x) = int_E f(x, t) mu(dt)$\
-> x : paramètre\
-> t : variable d'intégration]

#rq() ⚠️ ça va etre le zbeul de faire la différence entre paramètre et variable d'intégration

= I. Régularité d'une intégrale à paramètre

#thm("de continuité")<continuite> $Soit (E, Ar, mu)$ un espace mesuré. $(G, d)$ un espace métrique (ou un intervalle de $RR$ ou un ouvert de $CC$)\
Soit $f : E times G --> KK tq$ :
+ pour $mu$-presque tout $x in E, t ass f(x, t)$ est continue
+ pour tout $t in G, x ass f(x, t)$ est mesurable
+ il existe $g : E ass RRP$ intégrable tq $forall t in G, abs(f(t, x)) <=^mupp g(x)$

Alors $t ass F(t) = int_E f(x, t) mu(dx)$ est continue sur G

#rq() ⚠️ ici la variable d'intégration c'est x

#demo()[
$forall t in G, x ass f(x, t)$ est intégrable car mesurable et de module inférieur à $g$ intégrable\
Soit $t_star in G et (t_n)_n$ une suite de G qui converge vers $t_star$\
On va mq $F(t_n) -->_(n-->pinf)F(t_star)$\
Pour $n in NN ,x in E, f_n (x) = f(x, t_n)$\
On applique le théorème de convergence dominée à $(f_n)$ et c'est win
]

#thm("de dérivabilité")<derivabilite> $f : E times I --> CC, I "intrvalle de" RR$
+ Pour $mu$ presque tout $x, t ass f(x, t)$ est de classe $C1$
+ $forall t in I, x ass f(x, t)$ est intégrable
+ Il existe $g : E --> RRP$ mesurable tq $forall t in I, abs(derp(f, t)(x, t)) <=^mupp g(x) $

Alors $t ass F(t) = int_E f(x, t) mu(dx)$ est de classe $C1$ sur $I$
#pagebreak()
#demo()[
Soit $t_star in I, et (t_n)_n$ une suite de $I tq t_n -->_(n-->pinf)t_star$\
D'après le théorème des accroissements finis :

$abs(f(x, t_n) - f(x, t_star)) &<= sup_(t in I) abs(derp(f, t)(x, t))abs(t_n - t_star)\
&<=^((i i i)) g(x) abs(t_n - t_star)$

Posons $f_n (x) = (f(x, t_n) - f(x, t_star))/(t_n - t_star) -->_(n-->pinf)^mupp derp(f, t)(x, t_star)$\
$abs(f_n (x)) <= g(x)$ intégrable\
D'après le thm de convergence dominée : 

$lim_(n-->pinf) int f_n(x) mu(dx) &= int lim_(n-->pinf) f_n (x) mu(dx)\
(F(t_n) - F(t_star))/(t_n - t_star) &= int derp(f, t)(x, t_star) mu(dx)$
]

#ex(1)[
Pour $t, x >= 0,$ on pose $ f(x, t) = sqrt(x + t)/(1+t^2) >= 0$\
$et F(x) = int_RRP sqrt(x + t)/(1+t^2) dt$\
⚠️ paramètre : $x$, var d'inté : $t$\
#lien(<continuite>)[*Continuité*]\
+ $forall t >= 0, x ass f(t, x) "continue"$
+ $forall x >= 0, t ass f(t, x) "mesurable car continue"$
+ pour $x in [0, M]$, avec $M$ fixé, $abs(f(t, x)) <= g(t) = sqrt(M + t)/(1+t^2)$\
  $g$ est continue sur $RRP$ et $g(t) tilde_pinf 1/t^(3/2)$\
  $3/2 >=1$ donc d'après Riemann, $g$ est intégrable sur $RRP$\

Donc $F$ est continue sur $[0, M]$ d'après le thm de #lien(<continuite>)[continuité d'une intégrale à paramètre]\
Ceci est vrai pour tout $M >= 0$, donc $F$ est continue sur $RRP$

#lien(<derivabilite>)[*Dérivabilité*]\
+ $forall t > 0, x ass f(x, t) "est de classe" C1 "sur" RR, et derp(f, x)(x, t) &= 1/(2(1+t^2)sqrt(x+t))\
abs(derp(x, t)(x, t)) &<=^(("pour" x>=0)) h(t) = 1/(2(1+t^2)sqrt(t))$\
  $h$ est continue sur $RRPE$\
  $h(t) tilde_0 1/(2sqrt(t))$\
  $h(t) tilde_pinf 1/(2t^5/2)$\
  Donc $h$ est intégrable
  
$F$ est de classe $C1$ et $F'(x) = int_RRP 1/(2(1+t^2)sqrt(x+t))dt$
]

#ex(2)[
Pour $t >= 0, f(t, x) = e^(-x t^2)/(1+t^2)$\
$F(x) = int_RR f(t, x) = e^(-x t^2)/(1+t^2) d text(red, t)$

#lien(<continuite>)[*Continuité*]\
+ pour $t in RR, x ass f(t, x)$ est continue
+ pour $x in RRP, t ass f(t, x)$ est mesurable car continue
+ $forall x in RRP, abs(f(t, x)) <= 1/(1+t^2)$ qui est intégrable sur $RRP$

Donc $F$ continue sur $RRP$

#lien(<derivabilite>)[*Dérivabilité*]\
+ $forall t in RR, derp(f, x)(t, x) = (-t^2e^(-x t^2))/(1+t^2)$
+ ok

+ $abs(derp(f, x)(t, x)) &<= t^2/(1+t^2)\
&<= t^2/(1+t^2)e^(-epsilon t^2) "pour" x >= epsilon\
&<= e^(-epsilon t^2) "intégrable sur" RRP$
$F$ est de classe $C1$ sur $]epsilon, pinf[, et F'(x) =^((*)) - int_RRP t^2/(1+t^2)e^(-x t^2)dt$\
Ceci est vrai pour tout $epsilon > 0$ donc $F$ est de classe $C1$ sur $RRPE$, et $(*)$ est vraie sur $RRPE$

*Le théorème ne dit rien sur la dérivabilité en 0*\
Pour $x > 0$\
$F(x) - F'(x) &= int_RRP e^(-x t^2)/(1+t^2) + t^2/(1+t^2)e^(-x t^2)dt\
&= int_RRP e^(- x t^2)dt\ &= int_0^pinf e^(-(sqrt(x)t^2))dt = int_0^pinf e^(-u^2) (d u)/sqrt(x)\
&= 1/sqrt(x) int_0^pinf e^(-u^2)du\
&= sqrt(pi)/(2sqrt(x))$\
Pour $x > 0, F'(x) = -sqrt(pi)/(2sqrt(x)) + F(x)$

$F(x) -->_(x-->0) F(0) = int_RRP 1/(1+t^2)dt = pi/2$

$F'(x) tilde_0 -sqrt(pi)/(2sqrt(x))$

$F'(x) &= -int_RRP t^2/(1+t^2)r^(-(sqrt(x)t)^2)dt\
&=^(u = sqrt(x)t) -1/(x sqrt(x))int_RRP u^2/(1+u^2/x^2)e^(-u^2)du\
F'(x) &-->_(x-->pinf) -1/(1+t^2)u^2e^(-u^2)$\
]
#pagebreak()
#ex(3)[
$x > 0$

$F(x) = int_0^(pi/2) (cos t)/(x + t)d #text(red)[$t$] = int_0^(pi/2) f(x, t)dt$

#lien(<continuite>)[*Continuité*]\
- pour $t in [0, pi/2], x ass f(x, t)$ est continue sur $RRPE$

- pour $x > 0, t ass f(x, t)$ est continue donc mesurable

- $forall x > epsilon, abs(f(x, t)) &<= 1/(x + t) "    "(<= 1/t "pas intégrable")\
&<= 1/(epsilon + t)$

Donc $F$ est continue sur $]epsilon, pinf[$, pour tout $epsilon$ donc ok sur $]0, pinf[$

#lien(<derivabilite>)[*Dérivabilité*]\
- $forall t in [0, pi/2], x ass f(x, t)$ est de classe $C1$ sur $RRPE$, \
  et $derp(f, x)(x, t) = - (cos t)/(x+t)^2$

- $forall x > 0, t ass f(x, t)$ est continue et bornée sur $[0, pi/2]$, donc intégrable

- $Soit epsilon > 0, forall x> epsilon, forall t in [0, pi/2], abs(derp(f, x)(x, t)) <= 1/(epsilon+t)^2 <= 1/epsilon^2$\
  et $t ass 1/(epsilon+t)^2$ est intégrable sur $[0, pi/2]$ car continue et bornée

Donc $F$ est de classe $C1$ sur $]epsilon, pinf[$ et $F'(x) = -int_0^(pi/2) (cos t)/(x+t)^2dt$

*Limite en $pinf$*\
$abs(F(x)) <= int_0^(pi/2) 1/x dt = pi/(2x) -->_(x-->pinf) 0$

$1/(x+pi/2) = int_0^(pi/2) (cot t)/x+pi/2) dt <= F(x) <= int_0^(pi/2) (cos t)/x dt = 1/x [sin t]_0^1 = 1/x$

$F(x) tilde_pinf 1/x$

*Limite en $0^+$*\
$forall t in [0, pi/2], 1-t^2/2 <= cos t <= 1$

$int_0^(pi/2) (1-t^2/2)/(x+t)dt <= F(x) <= int_0^(pi/2) (1)/(x+t)dt$

$int_0^(pi/2) (1)/(x+t)dt &= [ln abs(x+t)]_0^(pi/2)\
&= ln(x + pi/2) - ln x$

$int_0^(pi/2) (t^2/2)/(x+t)dt &<= 1/2int_0^(pi/2)t^2/t dt\
&= 1/2[t^2/2]_0^(pi/2)\
&= pi^2/16$

$- ln x +ln(x+pi/2) - pi^2/16 <= F(x) <= -ln(x) + ln(x+pi/2)\
1+ (ln(x+pi/2) - pi^2/16)/(- ln x) <= F(x)/(- ln x) <= 1 + (ln(x+pi/2))/(- ln x)\
F(x) tilde_(0^+) -ln(x)$
]

#ex(4)[
Pour $t, x in RR$\
$f(t, x) = cos(t x) e^(-x^2), F(x) = int_RR f(t, x)d#text(red)[$x$]$

#lien(<derivabilite>)[*Dérivabilité*]\
- $forall x in RR, t ass f(t, x)$ est de classe $C1$ sur $RR$

- $forall t in RR, x ass f(t, x)$ est continue donc mesurable, et $abs(f(t, x)) <= e^(-x^2)$ qui est intégrable sur $RR$

#rq() On peut désormais noter $int f(t, x)dx$ (on a 
prouvé que c'était bien défini genre)

- $forall t in RR, abs(derp(f, t)(t,x)) <= abs(x)e^(-x^2)$ qui est intégrable sur $RR$ car\
  $int_RR abs(x)e^(-x^2)dx = int_RR 2x e^(-x^2) = [-e^(-x^2)]_0^pinf = 1 < pinf$

Donc $F$ est de classe $C1 "sur" RR$, et\ $F'(t) &= -int_RR sin(x t)x e^(-x^2)dx\
&= -t/2 int_RR cos(t x)e^(-x^2) "par ipp"\
F'(t) &= -t/2 F(t)\
"équadiff :" F(t) &= k e^(-int_RR t/2dt)\
&= k e^(-t^2/4)$

$F(t) = F(0)e^(-t^2/4) = sqrt(pi)e^(-t^2/2)$ (wlh on prouvera ça plus tard)
]

= II. Transformée de Laplace

Soit $mu$ une mesure de probabilité sur $RR$\
On pose $pour t in RR, L_mu (t) = int_RR e^(t x) mu(d#text(red)[$x$]) in RRPB$

Dans la suite, on note $L$ pour $L_mu$, $L(0) = int_RR mu(dx) = mu(RR) = 1$

#ex(1)[
$mu = p delta_1+(1-p)delta_2, L(t) = p e^t + 1-p$
]

#ex(2)[
$mu = sum_(n=1)^pinf 6/(pi^2 n^2)delta_n$

$L(t) &= sum_(n=1)^pinf 6/(pi^2 n^2)e^(t n)\
&= pinf si t>0$
]

*L est convexe sur $Dr = {t in RR | L(t) < pinf}$, et $Dr$ est un intervalle*\
Soit $t in RR, x ass e^(t x)$ est convexe\
$Pour t_1, t_2 in RR, alpha in [0, 1], e^(x(alpha t_1 + (1-alpha)t_2)) <= alpha e^(x t_1) + (1-alpha)e^(x t_2)\
int_RR e^(x(alpha t_1 + (1-alpha)t_2)) mu(dx) <= alpha int_RR e^(x t_1) mudx + (1-alpha)int_RR e^(x t_2) mudx\
L(alpha t_1+(1-alpha)t_2) <= alpha L(t_1) + (1-alpha)L(t_2)$\
Si $L(t_1) et L(t_2)$ sont finis, alors $L(alpha t_1 + (1-alpha)t_2)$ l'est aussi.

*L est de classe $Cr^oo$ sur l'intérieur de $Dr$*\
$Soit s_1 < s_2$ dans l'intérieur de $Dr$, Montrons que $L$ est de classe $Cr^oo$ sur $]s_1, s_2[$

$partial^n/(partial t^n) (e^(x t) )= x^n e^(x t)\
abs(x^n e^(x t)) ind_RRP (x) <= x^n e^(-(t_2-t)x) e^(t_2 x) "qui est intégrable"$ 

#prop() Cauchy-Schwarz\
Soient $f, g : RR --> RR$ intégrables tq $int f^2 dmu < pinf et int g^2 dmu < pinf$

Alors $f g$ est intégrable, et $(int f g dmu)^2 = (int f^2 dmu)(int g^2 dmu)$

#demo[
On suppose $f, g > 0$ (quitte a passer a la valeur abs)\
Soit $lambda in RR$\
$0 <= int_RR (f+lambda g)^2dmu = int_RR f^2 dmu + 2 lambda int_RR f g dmu + lambda^2 int_RR g^2dmu$

On reconnait un polynôme en $lambda$\ de discriminant $Delta = 4 (int f g dmu)^2 - 4 (int_RR f^2dmu)(int_RR g^2 dmu)$

Mais $Delta <= 0$ car discriminant d'un polynôme positif\
$donc Delta = 0$
]

#prop() $L$ est log-convexe sur $D$ ($ln rond L$ est convexe)

#demo[
On montre $(ln rond L)^((n)) >= 0$\
$(ln rond L)'(t) = (L'(t))/L(t)$

$et (ln rond L)''(t) = (L''(t)L(t) - L'(t)^2)/L(t)^2$

$L''(t)L(t) - L'(t)^2 = int x^2 e^(t x)mudx int e^(t x) mudx - (int x e^(t x)mudx)^2$

$avec (int x e^(t x) mudx)^2 &= (int x e^(t x) e^((t x)/2)mudx)^2\ &<=^"Cauchy-Schwarz" (int x^2 e^(t x) mudx)(int e^(t x) mudx) >= 0$
]

#pagebreak()
= III. Un peu de transformée de Fourier

== 1. Transformée d'une fonctions
#def() Soit $f in Lr_RR^1(lambda)$\
La *transformée de Fourier* de $f$, notée $fc$ est définie par :\
$fc(t) = int_RR f(x)e^(i t x)lambdadx$

#rq()
- $abs(f(x) e^(i t x)) = abs(f(x))$ donc $fc$ est bien définie
- $fc(t) = int cos(t x)f(x)lambdadx + i int sin(t x) f(x) lambdadx$\
  Si $f$ est impaire, alors $fc$ est à valeurs dans $i RR$

#prop() $fc$ est continue sur $RR$\ et si $x ass x^n f(x)$ est intégrable, alors $fc$ est de classe $Cr^n$\
dans ce cas $fc^((n))(t) = i^n int x^n f(x) e^(i t x)lambdadx$

#exemples()[wlh]

== 2. Transformée de Fourier d'une emsure finie

($mu(RR) < pinf$)

#def() Soit $mu$ une mesure finie sur $RR$

$muc(t) = int_RR e^(i t x) mudx$

Si $int abs(x)^n mudx < pinf$ alors $muc$ est de classe $Cr^n$\

Dans ce cas, $muc^((n))(t) = int_RR (i x)^n e^(i t x)mudx$

En particulier, $muc^((n))(0) = i^n int x^n mudx$

#exemples()[wlh]