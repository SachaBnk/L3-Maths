#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[Chapitre 3 — Applications mesurables]) 
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
= I. Définitions et critères

#def() $f : (E, Ar) --> (F, Br)$ est mesurable si $forall B in Br, fm(B) in Ar$

#rq() $f$ est mesurable si $fm subset Ar$

#texemple()
#set text(green)
$(E, Ar), (RR, Br(RR)), Soit A subset E$\
$bb(1)_A$ est elle mesurable ?\
$bb(1)_A^(-1) (B) = cases(es si 0 in.not B et 1 in.not B,
E si 0 in B et 1 in B,
A si 0 in.not B et 1 in B,
A^C si 0 in B et 1 in.not B)$

$bb(1)_A$ est mesurable ssi $A in Ar$

#set text(black)

#prop() $Soit f : (E, Ar) --> (F, Br) et Fr subset Pr(F) tq sigma(Fr) = Br$\
$f "est mesurable" ssi fm(Fr) subset Ar$

#tdemo()
#set text(blue)
$redimp$\
Puisque $fm(Fr) in Ar, f "mesurable" imp fm(Fr) subset Ar$

$redimprev$\
$Si fm(Fr) subset Ar$, alors la tribu $Ar$ contient la plus petite tribu qui contient $fm(Fr)$, à savoir $sigma(fm(Fr)) = fm(sigma(Fr)) = fm(B)$

#set text(black)
#finpreuve()

#corollaire() $f : (E, Ar) --> (RR, Br(RR))$ est mesurable si l'une des conditions suivantes est vraie :
- $forall a in RR, fm(]minf, a#text(red)[\]]) in Ar$
- $forall a in RR, fm(]minf, a#text(red)[\[])$

#prop() Toute application continue est mesurable pour les tribus engendrées par les ouverts.

#pagebreak()
= II. Stabilité de la mesurabilité

#prop() $f : (E, Ar) --> (F, Br) et g :(F, Br) --> (G, Gr)$\
$Si f et g$ sont mesurables, alors $g rond f$ est mesurable.

#tdemo() deux lignes à rattraper

#prop() $(F_1, Br_1), (F_2, Br_2)$ deux espaces mesurables.\
$p_1, p_2 "les projections de" F_1 times F_2 "sur" F_1 et F_2 "resectivement."$\
On munit $F_1 times F_2$ de la tribu produit $Br_1 times.o Br_2 = sigma({B_1 times B_2 | B_1 in Br_1, B_2 in Br_2})$
- pour $i in {1, 2}, p_i$ est mesurable de $(F_1 times F_2, Br_1 times.o Br_2)$ dans $(F_i, Br_i)$ 
- $f : (E, Ar) --> (F_1 times F_2, Br_1 times.o Br_2)$ est mesurable\ 
 $ssi$\ 
 $p_1 rond f et p_2 rond f$ sont mesurables

#tdemo() #text(blue)[voir notes de cours]

#corollaire() $f + g, f times g, f/g$ sont mesurables.

#prop() La mesurabilité est stable par passage a la limite
- $Soit (f_n)_n$ une suite d'applications mesurables à valeurs dans $overline(RR)$\
 $sup_n f_n, inf_n f_n, limsup_n f_n et liminf_n f_n$ sont mesurables

- $Soit (f_n)_n$ des fonctions à valeusr dans $CC$ mesurables, et $(f_n)$ converge simplement vers $f$.\
 Alors $f$ est mesurable

#set text(blue)
#tdemo()

*1.*\
$Soit a in RR$\
$sup_n (f_n)^(-1)(]minf, a]) &= {x in E | sup_n f_n (x) <= a}\
&= {x in E | forall n in NN, f_n (x) <= a}\
&= inter.big_(n in NN) {x in E | f_n (x) <= a}\
&= inter.big_(n in NN) f_n^(-1) (]minf, a]) in Ar$

$inf_n (f_n)^(-1)([a, pinf[) &= inter.big_(n in NN)f_n^(-1)([a, pinf[)$\
$inf_n (u_n) >= a ssi forall n in NN, u_n >= a$
#set text(black)


#pagebreak()
#def() $f : [a, b] --> RR$ est continue par morceaux\ 
si il existe $a < a_1 < ... < a_(n-1) < b tq$ pour tout $i in {0, 1, ..., n-1}$, la restriction de $f$ à $]a_i, a_(i+1)[$ est continue et admet un prolongement continu sur $[a_i, a_(i+1)]$.\
$f$ est continue par morceaux sur un intervalle $I subset RR$ si elle est continue par morceaux sur tout segment inclus dans $I$.

#prop() Si $f$ est continue par morceaux sur $I$ alors $f$ est mesurable

= III. Approximation

$Mr = { f "mesurable de" (E, Ar) "dans" RR}$\
$Mrp = {f "mesurable de" (E, Ar) "dans" overline(RR)_+}$

#rq() par défaut quand on parle de $RR$ come espace mesurable, on veut dire $(RR, Br(RR))$

#def() On dit que $f : E --> RR$ est *étagée* si elle prend un nombre fini de valeurs
#texemple()
#text(green)[
$ind_[0, 1], ind_[0, 1]+ind_[2, 3]$\
$ind_[0, 2]+2.ind_[1, 3] = ind_(\[0, 1\[) +2.ind_(\]2, 3\])+3.ind_[1, 2]$
]

#thm() Soit $f in Mrp$\
Il existe une suite croissante de fct°s étagées positives $(f_n)_(n in NN)$ qui converge vers $f$\
De plus la convergence est uniforme sur tout ensemble $B$ où $f$ est bornée.

#tdemo()
#text(blue)[
Soit $n in NN, k in [|0, n 2^n-1|]$

$"Posons :"$

- $A_n &= {x in E | f(x) >= n}\
&= {f >= n}$\
 $A_n in Ar car A_n = f^(-1)([n, pinf])$

- $A_(n, k) = {K/(2^n) <= f < (k+1)/(2^n)}$

 $union.big_(k=0)^(n 2^n-1) A_(n, k) union A_n = E$, on remarque que les $A_n, A_(n, 0), ..., A_(n, n 2^n-1)$  2 à 2 disjoints

- $f_n = n ind_A_n + sum_(k=0)^(n 2^n -1) k/2^n ind_A_(n, k)$\
 $f_n$ est étagée positive

#rq() $A_(n, k) = f^(-1)(br k/(2^n), (k+1)/(2^n)br) in Ar$
#pagebreak()
*1. Montrons que la suite $(f_n)_n$ est croissante*\
Soit $x in A_(n, k)$

$f_(n+1)(x) = cases(
  2^k/2^(n+1) = f_n (x) si f(x) in br (2k)/2^(n+1)\, (2k+1)/2^(n+1) br,
  (2k+1)/2^(n+1) > f_n (x) si f(x) in br (2k+1)/2^(n+1)\, (2k+2)/2^(n+1) br
)$

$A_(n, k) = A_(n+1, 2k) union A_(n+1, 2k+1)$

$br k/2^n, (k+1)/2^n br = br (2k)/2^(n+1), (2k+1)/2^(n+1) br union br (2k+1)/2^(n+1), (2(k+1))/2^(n+1) br$

Si $x in A_n = A_(n+1) union (union.big_(k = n 2^(n+1))^((n+1)2^(n+1)-1))$

$f_(n+1) (x) = cases(
  n+1 >= f_n (x) = n si x in A_(n+1),
  k/(2^(n+1)) = f_n (x) = n si x in A_(n+1, k)
)$

Donc $f_(n+1) >= f_n$
\ \ \ 
*2.* \
Si $ x in.not A_n$, il existe $k_0 tq x in A_(n, k_0)$.

Donc $k_0 <= f(x) < (k+1)/2^n = f_n (x) + 1/2^n$

$ 0 <= f(x) - f_n (x) < 1/2^n$

La suite $(A_n)_n$ est décroissante.

$inter.big_(n in NN) A_n = {f = pinf} <--$ notation de schlague

Si $x in inter.big_(n in NN) A_n, (f_n (x) = pinf), alors f_n (x) = m -->_(m --> pinf) pinf = f(x)$

]
#finpreuve()

#corollaire() Une fonction mesurable à valeurs dans $KK$ est limite simple d'une suite de fonctions étagées

#pagebreak()
= IV. Mesure Image

$(E, Ar, mu), (F, Br)$\
$ f : E -> F$ mesurable

#def() L'application

$Br &--> overline(BB)_+\ B &ass mu(f^(-1)(B))$\
est une mesure sur $(F, Br)$ appelée *mesure image* de $mu$

#texemple() 
#text(green)[
$(RR_+, Br(RR_+), lambda), (NN, Pr(NN)), f : x ass floor x floor.r$\
Pour $n in NN$\
$lambda_f ({n}) &= lambda(f^(-1) ({n}))\
&= lambda(br n, n+1 br)\
&= 1$\
$lambda_f$ mesure de comptage sur $NN$\
Soit $B subset NN$\
$lambda_f (B) &= lambda_f (union.big_(b in B) {b})\
&= sum_(b in B) lambda_f ({b})\
&= card B$
]

#texemple()
#text(green)[
$([0, 1], Br([0, 1]), lambda)$\
$f = ind_[0, p]$ avec $p in [0, 1]$\
$lambda_f ({1}) &= lambda(f^(-1)({1}))\
&= lambda([0, p]) = p$\
$lambda_p = p delta_1 + (1-p) delta _0$
]

#texemple() 
#text(green)[
$(br 0, 1 br, Br(br 0, 1 br), lambda), (RR_+, Br(RR_+))$



]