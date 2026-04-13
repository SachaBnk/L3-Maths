#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[Chapitre 4 — Construction de l'intégrale de Lebesgue]) 
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
$(E, Ar, mu)$ un espace mesuré\

= I. Fonctions étagées positives

#def() l'ensemble des *fonctions étagées* positives est :\
$epsilon_+ = {f = sum_(i = 1)^n alpha_i ind_A_i | A_i in Ar, alpha_i >= 0, i in [|1, n|], alpha_i "distincts"}$

#def() Soit $f in etpos$, $f = sum_(i=1)^n alpha_i ind_A_i$\
On définit l'*intégrale au sens de Lebesgue* de $f$ contre $mu$ par :\
$integral_E f d mu = sum_(i = 1)^n alpha_i mu(A_i) in overline(RR)_+$

#rq() $int_E ind_A d mu = mu(A), et int_E alpha ind_A d mu = alpha mu(A)$

#rq() Par convention :\ 
- $0 times (pinf) = 0$
- $ind_[0, 1] + ind_[1/2, 2] = ind_([0, 1/2[union]1, 2]) + 2.ind_[1/2, 1]$

#rq() $A_i = fm({alpha_i})$

#prop() $forall lambda in RRPE, forall f, g in etpos$
- $int_E (lambda f + g) d mu = lambda int_E f d mu + int_E g d mu$

- $f <= g imp int_E f d mu <= int_E g d mu$

#tdemo()
#text(blue)[
*1.*\
On peut supposer $lambda = 1$\
$f = sum_(i = 1)^n alpha_i ind_A_i, n in NN, alpha_i "distincts", et g = sum_(i = 1)^m beta_i ind_B_i, m in NN, beta_i "distincts"$\
Notons $gamma_1, ..., gamma_l$ les différentes valeurs prises par $f + g,$\

$et C_k &= (f+g)^(-1)({gamma_k})\
&= union.big_((i, j) in I_k)(A_i inter B_i), "avec" I_k = {(i, j) | alpha_i + beta_j = gamma_k}$

$int_E (f+g) d mu &= sum_(k=1)^l gamma_k mu(C_k)\
&= sum_(k=1)^l gamma_k sum_((i, j) in I_k) mu(A_i inter B_j)\
&= sum_(k=1)^l sum_((i, j) in I_k) (alpha_i + beta_j)mu(A_i inter B_i)\
&= sum_(k=1)^l sum_((i, j) in I_k) alpha_i mu(A_i inter B_j) + sum_(k=1)^l sum_((i, j) in I_k) beta_i mu(A_i inter B_j)\
&= sum_(i = 1)^n sum_(j = 1)^m alpha_i mu(A_i inter B_i) + sum_(j = 1)^j sum_(i = 1)^n\
&= sum_(i = 1)^n alpha_i mu(A_i) + sum_(j=1)^m beta_j mu(B_j)\
&= int_E f d mu + int_E g d mu$

#texo() #text(green)[Refaire la démo avec \ 

$f = ind_[-1, 2],\ g = 2.ind_[-1/2, sqrt(2)],\ mu = delta_0 + 2.delta_1$]

*2.* (parce que oui on a fait que la moitié de la preuve encore)\
Soient $f, g in E, f <= g$, on remarque que $g - f in etpos$\
Donc d'après *1.* :\
$g = f + (g-f)$

$int_E g d mu = int_E f d mu + int_E (g - f) dmu$

et $int_E (g - f) dmu in RRP$

#finpreuve()
]
#pagebreak()
= II. Fonctions mesurables positives

#def() Soit $f$ *mesurable* à valeurs dans $RRPB$

$int_E f d mu = sup {int_E g dmu | g in etpos, g <= f}$

#rq() oh putain la definition de fou c'est swag de bz 

#prop() Si $f et g$ sont mesurables positives
\ $f <= g imp int_E f d mu <= int_E g dmu$

#tdemo() #text(blue)[
${u in etpos | u <= f} subset {u in etpos | u <= g}$

#finpreuve()
]

#thm("de convergence monotone") (ou théoreme de Beppo-Levi) <beppo-levi>\
Soit $(f_n)_n$ une #text(red)[suite croissante] de fonctions mesurables #text(red)[positives]\
$int_E limn f_n dmu = limn int_E f_n dmu$

#tdemo()
#text(blue)[
Notons $f = limn f_n$\
$forall n in NN, f_n <= f$\
On note $forall n in NN, u_n = int_E f_n dmu$\
$(un)$ est croissante (et majorée), elle converge dans $RRP$\
$Soit u in etpos tq u <= f et lambda in ]0, 1[$\
Notons $E_n = {x in E | f_n (x) >= lambda u(x)}$\
On remarque que $E_n subset E_(n+1),"càd" (E_n)$ est croissante.

- Soit $x in E$,
 - Si $u(x) = 0, alors 0 = u(x) <= f_n (x) et x in E_n pour n in NN$
 
 - Si $u(x) > 0, f_n (x) -->_(n-->pinf) f(x) >= u(x)$\ donc pour n assez grand, $f_n(x) >= u(x) >= lambda u(x)$ 

 On a donc $union.big_(n in NN) E_n = E$

- $f_n >= lambda u(ind_E_n)$ par définition de $E_n$\
 Donc $int_E lambda u(ind_E_n) dmu <= int_E f_n dmu$
#pagebreak()
- On a donc $limn int_E lambda u ind_E_n dmu <= limn int_E f_n dmu$\
 $u = sum_(i=1)^m alpha_i ind_A_i$\
 Donc $lambda u ind_E_n = sum_(i=1)^m lambda alpha_i ind_(A_i inter E_n)$

 $int_E lambda u ind_E_n dmu = sum_(i=1)^m lambda alpha_i mu(A_i inter E_n)$\
 $(A_i inter E_n)_(n in NN)$ est une suite croissante qui tend vers $A_i$\
 $mu(A_i inter E_n) -->_(n --> pinf) mu(union.big_n (A_i inter E_n)) = mu(A_i)$\
 Ainsi $int_E lambda u ind_E_n dmu -->_(n --> pinf) lambda sum_(i=1)^m alpha_i mu(A_i) = lambda int_E u dmu$

- Bilan :\
 $lambda int_E u dmu <= limn int_E f_n dmu$\
 On prend le sup en $u in etpos, u <=f$\
 $lambda int_E f dmu <= limn int_E f_n dmu$\
 Ceci est vrai pour tout $lambda < 1$. On fait tendre $lambda$ vers $1$ et c'est win

 #finpreuve()
]

#corollaire() $f, g in Mr_+$\
$int_E (f+g) dmu = int_E f dmu + int_E g dmu$

#tdemo()
#text(blue)[
Il existe deux suites $(f_n), (g_n)$ croissantes de fonctions étagées positives qui convergent respectivement vers $f et g$.

$int_E (f_n + g_n) dmu = int_E f_n dmu + int_E g_n dmu$\
Passage à la limite, c'est win

#finpreuve()
]
#pagebreak()
= III. Fonctions mesurables

#def() $f : E --> RR$ mesurable #text(gray)[(sous entendu pour les tribus $Ar et Br(RR)$)]\
$f$ est dite *intégrable* si $int_E |f|dmu < pinf$\
On note $Lr1_KK (E, Ar, mu)$ les fonctions intégrables à valeur dans $KK$

#rq() $f, g$ mesurables, $si |f| <= |g|, et g$ intégrable, alors $f$ intégrable

#prop() Soit $f : E --> RR$ mesurable.\
$f$ est intégrable $ssi f^+ et f^-$ sont intégrables

#demo()[
$f^+ = max(f, 0) >= 0$\
$f^- = -min(f, 0) >= 0$\
$|f| = f^+ + f^-$\
$0 <= f^+ <= |f| et f^- <= |f|$
]

#def() Soit $f in Lr1_RR$

$int_E d dmu = int_E f^+ dmu - int_E f^- dmu$

#prop() $Lr1_RR$ est un sev de l'ensemble des fonctions mesurables,

et $f ass int_E f dmu$ est une forme linéaire tq :

- $f in Lr1_RR, f >= 0 => int_E f d mu >= 0$

- $f, g in Lr1_RR, f >= g => int_E f dmu = int_E g dmu$

- $f in Lr1_RR, abs(int_E f dmu) <= int_E abs(f) dmu$

#demo()[
*$f ass int_E f dmu$ est une forme linéaire*\

- $abs(lambda f + g) <= abs(lambda)abs(f) + abs(g)$\
 $lambda f + g in Lr1_RR si f, g in Lr1_RR$

- Soit $f, g in Lr1_RR$

 $cases(f + g = (f+g)^+ - (f+g)^-, f+g = f^+ -f^- +g^+-g^-)$

 Donc $(f+g)^+ + f^- + g^+ = (f+g)^-+f^++g^-$\
 On intègre et on utilise la linéarité de l'intégrale pour les fonctions positives.\
 $int_E (f+g)^+dmu + int_E f^-dmu + int_E g^+dmu=int_E (f+g)^-dmu + int_E f^+dmu + int_E g^-dmu$

 Les 6 intégrales sont finies, on a bien $int_E (f+g)dmu = int_E f dmu + int_E g dmu$

*3.*\
$int_E f dmu &= abs(int_E f^+ dmu - int_E fn dmu)\
&<= int_E fp dmu + int_E fn dmu "(inégalité triangulaire)"\
&<= int_E (fp + fn)dmu "(linéarité")\
&= int_E abs(f)dmu$
]

#rq() $pour f in Lr1_(#text(red)[$CC$])$\ $int_E abs(f)dmu = int_E sqrt(Re(f)^2 + Im(f)^2)dmu $

#exo()[
\
+ $f$ intégrable $ssi Re(f) et Im(f)$ intégrables
+ $int_E f dmu = int_E Re(f)dmu + int_E Im(f) dmu$][]
#pagebreak()
= IV. Mesures discrètes

$(E, Ar, mu), mu = sum_(i=1)^pinf alpha_i delta_a_i$\
$ Pour i in NNE, a_i in E, alpha_i >=0$

#prop() 
- Si $f$ est mesurable positive,

 $int_E f dmu = sum_(i=1)^pinf alpha_i f(a_i) in RRB$ 

- Soit $f$ mesurable

 $f$ est intégrable $ssi sum_(i=0)^pinf alpha_i f(a_i) in RR$

#demo()[
*1.*\
- Supposons $f = ind_A, A in Ar$

  $int_E f dmu &= mu(A)\
  &= sum_(i=1)^pinf alpha_i delta_a_i (A)\
  &= sum_(i=1)^pinf alpha_i ind_A (a)\
  &= sum_(i=1)^pinf alpha_i f(a_i)$

- Si $f in etpos$

 $int_E f dmu = sum_(i=0)^pinf alpha_i f(a_i)$ par linéarité

- On étend la relation aux fonctions mesurables positives par convergence monotone

*2.*

$sum_(i=1)^pinf alpha_i abs(f(a_i)) = int_E abs(f) dmu$ (d'après *1.*)
]
#pagebreak()
= V. Mesure de Lebesgue et Intégrale de Riemann

#rappel() #theoreme("fondamental du calcul intégral")\
Si $f$ est continue par morceaux sur $[a, b]$, elle est *Riemann-intégrable*\
Si f est continue, $F : x ass int_a^x f(t)dt$ est dérivable, et $F' = f$

#rq() Intégrale de Riemann généralisée : on intègre sur un compact et on fait tendre les bornes d'intérgation vers les points problématiques

#prop() Soient $f$ continue sur $[a, b]$, $lambda$ la mesure de Lebesgue sur $RR$

$f ind_[a, b]$ est intégrable et $int_RR f ind_[a, b]dlambda = int_a^b f(t) dt$

#demo()[
- $f ind_[a, b]$ est mesurable comme produit de fonctions mesurables.\
  $f$ est continue sur $[a, b]$ donc bornée.\
  $exists M tq sup_[a, b] abs(f) <= M$

  $abs(f ind_[a, b]) <= M ind_[a, b] et int_RR M ind_[a, b] dlambda = M(b-a)$\
  Donc $f ind_[a, b]$ est intégrable

- De même, pour $x in [a, b], f ind_[a, x]$ est intégrable.\
 Soit $F(x) = int_R f ind_[a, x] dlambda$\
 $F(a) = 0$\
 Soit $x_0 in ]a, b[ et h > 0 tq x_0+h <=b$\
 $f ind_[a, x_0 + h] = f ind_[a, x_0] + f ind_[x_0, x_0+h]$\
 On intègre contre $lambda$ :

 $F(x_0 + h) = F(x_0) + int_RR f ind_[x_, x_0+h] dlambda$

 $(F(x_0+h) - F(x_0))/h - f(x_0) = 1/h int_RR f ind_(\]x_0, x_0+h\]) dlambda - f(x_0)$

 ($f$ continue en $x_0$) Soit $epsilon > 0$,\ $exists delta >0, abs(x - x_0) < delta => abs(f(x) - f(x_0)) < epsilon$\
 Pour $h < delta$

 $f(x_0) = 1/h int_RR f(x_0)ind_(\]x_0, x_0+h\]) dlambda$
#pagebreak()
 $"Donc" 1/h int_RR f ind_(\]x_0, x_0+h\])dlambda - f(x_0) &= 1/h int_RR (f -f(x_0)) ind_(\]x_0, x_0+h\])dlambda$

 $abs(1/h int_RR (f -f(x_0)) ind_(\]x_0, x_0+h\])dlambda) &<= 1/h int_RR abs(f -f(x_0)) ind_(\]x_0, x_0+h\])dlambda\
 &<= epsilon "(car" abs(f(x)-f(x_0)) <= epsilon")"$

 Donc $F'(x_0) = f(x_0)$
]

#rq() Plus généralement, on note indifféremment :

$int_E f dmu = int_E f(a)dmu(x) = int_E f(a)mu(d x)$

#prop() Soit $f : [a, b[ --> RR$ une fonction continue

$f ind_(\[a, b\[) in Lr1(lambda) ssi int_a^b f(t) dt$ est absoluement convergente

#demo()[
- Soient une suite $(b_n)_n$ croissante de réels dans $[a, b[$ qui converge vers $b$, et $f$ positive.

  $int f ind_[a, b_n]dlambda = int_a^b_n f(t)dt$ (dp le cours précédent)

  $int f ind_[a, b_n] dlambda -->_pinf int f ind_(\[a, b\[) dlambda$ (par #link(<beppo-levi>)[#underline("convergence monotone")]))

  et $int_a^b_n f(t)dt -->_(pinf) int_a^b f(t)dt$ (intégrale de Riemann généralisée)

- Soit $f$ de signe quelconque, $f$ est intégrable pour $lambda$ si $abs(f)$ l'est (par def)\
 càd si $int_a^b abs(f(t))dt < pinf$\
 Si $int abs(f)ind_(\[a, b\[) dlambda < pinf$\ 
 $alors int f ind_(\[a, b\[)dlambda &= int fp ind_(\[a, b\[)dlambda - int fn ind_(\[a, b\[)dlambda\
 &= int_a^b fp(t)dt - int_a^b fn(t)dt$
]
#pagebreak()
#ex(1)[ $f : x ass x^2025 e^(-x)ind_RRP (x)$\
$f$ est positive et continue donc mesurable.\
$f(x) = g(x)e^(-x/2), pour x >=0 avec g(x) = x^2025 e^(x/2)$\
$g$ est contine sur $RRP$ et $lim_(x--> pinf) g(x) = 0$ par croissances comparées.\
Donc il existe $M in RR tq 0 <= g(x) <= M$.\ En effet, il existe $A>0 tq x>=A => g(x) <=1$.\
De plus $sup_[0, A] g < pinf$ par continuité de $g "sur" [0, A]$

$M = max(1, sup_[0, A] g)$

$0 <= f(x) <= M e^(-x/2)ind_RRP (x) = h(x)$\
$h$ est intégrable par $lambda$\
$int_RR h dlambda = int_RR M e^(-x/2)ind_RRP dlambda$

$int_0^A e^(-x/2) dx = [-2e^(-x/2)]_0^A -->_(A-->pinf) 2$

$int_RR h dlambda = 2 M$
]
\ \ \ \
#ex(2)[$I_n = int_RR 1/(1+x^n) ind_[0, 1] (x)dx = int_RR f_n (x)dx$

$f_n$ est mesurable car continue par morceaux sur $RR$ et positive.\
$(x^n)_(n in NN)$ est une suite décroissante pour $x in [0, 1]$.\
Pour tout $x in [0, 1], (f_n (x))_n$ est croissante.

$f_n -->_(n --> pinf) f : x ass cases(
  0 &si x < 0 ou x > 1,
  1 &si x in \[0\, 1\[,
  1/2 &si x = 1
)$

D'après le #link(<beppo-levi>)[#underline("théorème de convergence monotone")] : 

$lim_(n-->pinf) I_n &= int f dlambda\ 
&= int (ind_(\[0, 1\[) (x) + 1/2 ind_{1} (x)) dx\
&= 1$
]

#pagebreak()
#ex(3)[$J_n = int 1/(x + 1/x^n) ind_(\[1, pinf\[)(x) dx = int f_n (x) lambda(dx)$

$f$ est positive et continue par morceaux doc mesurable.\
Pour tout $x in RR, (f_n (x))_n$ est croissante ($x >=1$)\
D'après le #link(<beppo-levi>)[#underline("théorème de convergence monotone")] :

$lim_(n-->pinf) J_n = int lim_(n-->pinf)f_n (x)lambda(dx)$

on note $forall x in RR, f(x) = lim_(n --> pinf) f_n (x)$

$f(x) = cases(
  0 &si x < 1,
  1/2 &si x = 1,
  1/x &si x >1
)$

$J_n -->_(n-->pinf) int 1/x ind_(\]1, pinf\[) (x) lambda(dx)$

$int_1^a 1/x dx &= [ln(x)]_1^a\ 
&= ln(a)\ 
&-->_(a-->pinf) pinf$
]

= VI. Intégration par rapport à une mesure image

#rappel() $(E, Ar, mu) -->^phi_("mesurable") (F, Br)$\
$nu$, la mesure image de $mu$ par $phi$, est définie par : $forall B in Br, nu(B) = mu(phim(B))$

#prop() 
- Soit $f : F --> RR_(#text(red)[+])$ mesurable (par rapport à $Br et Br(RR)$)

 $int f dnu = int_E f rond phi dmu in RRPB$

- Soit $f : F --> CC$ mesurable.\
 $f$ est intégrable par rapport à $nu$ $ssi$ $f rond phi$ est intégrable par rapport à $mu$

 Dans ce cas, $int f dmu = int_E f rond phi dmu in CC$
#pagebreak()
#demo()[
*1.*\
- Soit $f = ind_B, avec B in Br$

  $int_F f dnu &= int_F ind_B dnu = nu(B) "(par def de l'integrale)"\
  &= mu(phim(B)) "(par def de" nu")"\
  &= int_E ind_(phim(B))dmu "(par def de l'intérgale)"$ 

  $"En effet, " ind_(phim(B))(x) &= cases(1 si x in phim(x), 0 sinon)\
  &= cases(1 si phi(x) in B, 0 sinon)\
  &= ind_B (phi(x))\
  &= f rond phi (x)$

  d'où $int_F f dnu = int_E f rond phi dmu$

- Soit $f = sum_(i=1)^d alpha_i ind_B_i$\
  $"Par linéarité", int_F f dnu &= int_F sum_(i=1)^d alpha_i ind_B_i dnu\
  &= sum_(i=1)^d alpha_i int_F ind_B_i dnu\
  &= sum_(i=1)^d alpha_i int_E ind_B_i rond phi dmu\
  &= int_E (sum_(i=1)^d alpha_i ind_B_i)rond phi dmu\
  &= int_E f rond phi dmu$
#pagebreak()
- Soit $f$ mesurable positive.\
  Il existe uune suite croissante de fonctions positives $(f_n)$ qui converge simplement vers $f$\
  Pour tout $n in NN$\
  $int_F f_n dnu = int_E f_n rond phi dmu$

  limite pour $n-->pinf$ :\
  $int_F f dnu = int_E f rond phi dmu$
\ \ 
*2.*\
$f in Lr1 (nu) si int_F abs(f)dnu < pinf$\
càd $si int_E abs(f rond phi) dmu < pinf$

$abs(f rond phi) = abs(f) rond phi$

$Si f in Lr1 (nu) alors:\
int_F fp dnu = int_E fp rond phi dmu < pinf\
int_F fn dnu = int_E fn rond phi dmu < pinf$

$et int_F f dnu &= int_F fp dnu - int_F fn dnu\
&= int_E fp rond phi dmu - int_E fn rond phi dmu\
&= int_E f rond phi dmu$
]

#exemple("pour la route")[$pour x in RR, h_n (x) = e^(-x/n)/(1+x^2)ind_RRP (x)$

$I_n = int_RR h_n dlambda$

Pour tout $x in RRP, (e^(-x/n))_n$ est croissante et tend vers 1\

$I_n -->_(n-->pinf) int_RRP 1/(1+x^2)dx = pi/2$
]

#text(red, 1.5em)[*Le programme du CC1 d'inté s'arrète ici*]