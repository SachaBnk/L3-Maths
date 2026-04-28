#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 3 — Rappels d'algèbre linéaire]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

#import "@preview/commute:0.3.0": node, arr, commutative-diagram

= I. Espaces vectoriels et sous-espaces vectoriels

#def() $K$ corps, $E$ ensemble muni 
- d'une loi interne " $+$"$: E times E --> E$
- d'une loi externe "$dot$" $: K times E --> E$\
E est un *espace vectoriel* sur $K$, ou $K$-ev si 
- $(E, +)$ groupe commutatif
- $lambda dot (x+y) = lambda x + lambda y$
- $(lambda + mu)x = lambda x + mu x$
- $lambda(mu x) = (lambda mu)x$
- $1_K x = x$

#def() Soit E un K-ev\
$F subset E$ est un *sous-espace vectoriel* (sev) si F muni de la restriction de lois de E est un K-ev

#rq() $F subset E$ est un sev si
- $0_E in F$
- $forall x, y in F, forall lambda in K, x + lambda y in F$

#prop() Si $E_1, ..., E_n$ sev d'un K-ev E

alors $inter.big_(i=1)^n E_i et sum_(i=1)^n E_i$ sont des sev de E

De plus, $sum_(i=1)^n E_i$ est le plus petit sev contenant $union.big_(i=1)^n E_i$

#def() Soient $E_1, ..., E_n$ sev de E\
On dit qu'ils sont en *somme directe*\
si $forall x in sum_(i=1)^n E_i, exists!(x_1, ..., x_n)in E_1times...times E_n tq x = sum_(i=1)^n x_i$

On note $dsum_(i=1)^n E_i$ (à la place de $sum_(i=1)^n E_i$)

#prop() $F, G$ deux sev de E\
$F$ et $G$ sont en somme directe $ssi F inter G = {0}$
#pagebreak()
#ex()[
$K$ un corps, $char K != 2$\
(ie $1_K+1_K != 0_K$)

*_but_ : $M_n (K) = Sn (K) po An (K)$*

*$M_n (K) = Sn (K) + An (K)$*\
- *$subset$* ok

- *$supset$* Soit $A in M_n (K)$\
  $A = (A + A^T)(1_K+1_K)^(-1) + (A-A^T)(1_K+1_K)^(-1)$\
  $(A+A^T)(1_K+1_K)^(-1) in Sn$\
  $(A-A^T)(1_K+1_K)^(-1) in An$\
  Donc $M_n (K) subset An(K)+Sn(K)$

*$Sn(K)inter An(K) = {0_(n)}$*\
$A^T = A = -A^T$\
donc $A = -A$\
donc $A = 0$
]

#def() E K-ev et $H subset E$ une partie non-vide\
On appelle *espace vectoriel engendré* par H, noté $Vect H$, le plus petit sev de E contenant H

$#rq() Vect H &= inter.big_(F "sev de" E\ H subset F) F\
&= {sum_(i=1)^n a_i x_i | n in NN, a_i in K, x_i in H}$

#pagebreak()
= II. Familles libres et génératrices

#def() E ev et $e_1, ..., e_ in E$\
On dit que la famille $(e_1, ..., e_n)$ est :

- *libre* si $forall lambda_1, ..., lambda_n in K, (lambda_1 e_1+...+lambda_n e_n = 0_E) imp (lambda_1 = ... = lambda_n = 0_K)$

- *génératrice* si $Vect (e_1, ..., e_n) = E$

- une *base* si elle est libre et génératrice

#prop() E ev, $B = (e_1, ..., e_n)$\
$B$ est une base $ssi forall x in E, exists !(lambda_1, ..., lambda_n) in K^n tq x = lambda_1 e_1 + ... + lambda_n e_n$

#def() $B=(e_1, ..., e_n)$ une base de E\
Soit $x in E, x = lambda_1 e_1 + ...+lambda_n e_n$

On note $[x]_B = mat(lambda_1; dots.v; lambda_n)$ et on dit que les $lambda_i$ sont les *coordonnées* de $x$ dans la base $B$

#ex(1)[
K corps, $E = K^n$

$e_1 = (1, 0, ..., 0)\
e_2 = (0, 1, 0, ..., 0)\
dots.v\
e_n = (0, ..., 0, 1)
$

$B$. est une base de $E$, elle est appelée *base canonique* de $K^n$
]

#exo()[
$K = RR, E = RR^3$\
$[(1,1,1), (-1, 1, 0), (1, 0, -1)]$ est une base de E
][]

#ex(2)[
K corps, $E = KnX$\
$E = Vect(1, X, ..., X^n)$
]

#ex(3)[
K corps, $E = KnX$\
Soient $P_0, ..., P_n in KX tq forall i, deg P_i = i$\
Alors $(P_0, ..., P_n)$ est une base de $KnX$
]

#thm() E ev, G une famille génératrice finie \
Soit $L subset G$ une famille libre\
Alors il existe une base B de E tq $L subset B subset G$

#rq() E ev
- toute famille libre de E peut etre complétée en une base
- on peut extraire une base de toute famille génératrice

#pagebreak()
= III. Dimension 

#def() On appelle *dimension* de E le cardinal des bases de E

#prop() E ev, $dim E = n < pinf$\
Toute famille libre ou génératrice de $n$ vecteurs est ue base de E

#prop() E ev, $dim E = n < pinf$\
Soient $E_1, ..., E_k$ sev de E\
$E = E_1 po ... po E_k ssi E = E_1+...+E_k et sum_(i=1)^n dim E_i = n$

#prop("- dimension d'une somme") F, G sev de E\
E de dim finie\
Alors $dim (F+G) = dim F + dim G - dim(F inter G)$

#def() $(e_1, ..., e_n)$ famille de vecteurs d'un ev E\
Le *rang* de $(e_1, ..., e_n)$, est $Rg(e_1, ..., e_n) = dim Vect(e_1, ..., e_n)$

= IV. Applications linéaires

== 1. Définitions

#def() Soient $E, F$ des K-ev
$f : E --> F$ est une *application linéaire* si pour tous $x, y in E, lambda in K, f(lambda x + y) = lambda f(x) + f(y)$\
On note $LEF$ l'ensemble des applications linéaires de $E$ vers $F$

#def() 
- $Si E = F$, $f$ est appelé *endomorphisme*\
  L'ensemble des endomorphismes de $E$ est noté $LE$
- Si $f : E --> F$ est bijective, $f$ est un *isomorphisme*
- Si $f in Lr(E)$ est bijective, $f$ est un *automorphisme*\  
  On note $GL(E)$ l'ensemble des automorphismes de $E$

#def() Soit $f : E-->F$ isomorphisme\
On dit que E et F sont *isomorphes*\
On note $E tilde F$

#prop() $E, F$ K-ev et $f in LEF$ 
- l'image directe d'un sev de E par $f$ est un sev de F
- l'image réciproque d'un sev de F par $f$ est un sev de E

#corollaire()
- $ker f$ sev de E
- $im f$ sev de F

#pagebreak()
#prop() Soit $f in LEF$, alors
- $f$ surjective $ssi im f = F$
- $f$ injective $ssi ker f = {0_E}$

#def() La dimension de $im f$ s'appelle le *rang* de $f$\
noté $rg f$

#rq() $rg (x_1, ..., x_n) = dim Vect (x_1, ..., x_n)$

#thm("du rang") $E, F$ K-ev tq $dim E < pinf$, $f in LEF$\
alors $rg f < pinf et dim E = dim(ker f)+ rg f$

== 2. Matrice d'une application linéaire

#def() $attach(Mat, bl:B_2, br:B_1)(f) := (a_(i, j))_(1<=i<=n\ 1<=j<=p)$ appelée la *matrice de $f$* dans les bases $B_1$ à $B_2$\
Avec $E=F$ alors $B_1 = B_2$, on note $Mat(f)_B_1$

#prop() $x in E, y in F$\
$f(x) = y ssi attach(Mat, bl:B_2, br:B_1)(f) dot [x]_B_1 = [y]_B_2$

#prop() Soit $f in LEF, g in LFG$\
$attach(Mat, bl:B_G, br:B_E)(g rond f) = attach(Mat, bl:B_G, br:B_F)(g) dot attach(Mat, bl:B_F, br:B_E)(f)$

#prop()$E, F$ K-ev, $dim E = p, dim F = n$\
$LEF$ est un K-ev de dim $n p$

#def() La *matrice de passage* est définie par\
$attach(P, bl:B', br:B) = ([e_1]_B' | ... | [e_n]_B')$

#prop() 
- pour $x in E$, $attach(P, bl:B', br:B) dot [x]_B = [x]_B'$

- $attach(P, bl:B', br:B) = attach(P, bl:B, br:B')^(-1)$

- $attach(P, bl:B', br:B) = attach(Mat, bl:B', br:B)(Id)$

- Si $u in LE, Mat_B (u) = attach(P, bl:B', br:B) dot Mat_B' (u) dot attach(P, bl:B, br:B')$
