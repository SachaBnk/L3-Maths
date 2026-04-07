#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 2 — Anneaux de polynômes]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

#import "@preview/commute:0.3.0": node, arr, commutative-diagram

= I. Généralités

#def() $A$ anneau commutatif, on appelle *polynôme* toute suite $(a_k)_(k>=0)$ nulle à partir d'un certain rang.\ 
Le polynôme $P = (a_k)_k = a_0 + a_1X+...+a_n X^n$\
- En général, si $P!=0$, le *degré* de $P$ est le plus entier $k$ tq $a_k != 0$\
- Par convention $deg(0_A) = minf$\
- Si $P$ constant non null, $deg(P) = 0$
- Le nombre $a_k$ est apppelé *coefficient d'ordre $k$* de $P$
- Le coefficient d'ordre $deg(P)$ est appelé *coefficient dominant*
- Si le coefficient dominant est egal à $1$, le polynôme est dit *unitaire*

L'ensemble des polynômes à coefficients dans $A$ est noté $A[X]$

(rattraper)

#prop() $(A[X], +, dot)$ est un anneau commutatif,

et $Phi: func(A &--> A[X], a &ass a + 0_A X+ 0_A X^2 + ...)$ est un morphisme d'anneaux injectif

#rq() $Phi : A --> A[X]$ injectif $imp^("thm isomorphisme") A tilde im Phi subset A[X]$\
On peut considérer $a in A$ comme polynôme

#rq() $1_AX = 1_A, 0_AX = 0_A$

#prop() $A$ anneau commutatif, $P, Q in A[X]$
- $deg(P+Q) = max(deg P, deg Q)$
- $deg(P Q) <= deg P + deg Q$
- $A$ intègre $ssi A[X]$ est intègre et $deg(P Q) = deg P + deg Q$

#demo()[
*1.* exo

*2.*\
- Cas 1 : $P = 0_A ou Q = 0_A$\
  $deg (P Q) = minf$ ok

- Cas 2 : $P != 0 et Q != 0$\
  On pose $deg P = n et deg Q = m$\
  $P = a_n X^n + ... + a_0, a_n != 0_A$\
  $Q = b_n X^n + ... + b_0, b_n != 0_A$

  $P dot Q = sum_(k=0)^(m+n)(sum_(i=0)^k a_i b_(k-i))X^k$

  $deg (P Q) <= m+n$

*3.*\
- Le terme d'ordre $m+n$ est $a_n b_n$\
  A intègre, $a_n != 0$ et $b_n != 0$\
  alors $a_n b_n != 0_A$, donc $deg (P Q) = n+m$

- $deg (P Q) = deg P + deg Q >= 0$\
  $deg (P Q) != minf imp P Q != 0_A$\
  donc $A$ est intègre
]

#corollaire() $A$ intègre\
$P in A[X]$ inversible $ssi P = a$ avec $a in A^*$\
($A^* = {a in A | a "inversible"}$)\
$A[X]$ n'est jamais un corps

#demo()[
$redimprev$ Soit $P = a in A[X], a in A^*$\
P = $a^(-1) in A[X] et a a^(-1) = 1$

$redimp$\
pour $P in A[X]$ inversible\
il existe $Q in A[X] tq P Q = 1_A$

$deg P Q = 0 &imp deg P + deg Q = 0\
&imp deg P = deg Q = 0\
&imp exists a, b in A\{0_A} tq P = a, Q = b\
&imp a b = 1\
&imp a in A^*$
]

#pagebreak()
= II. Arithmétique dans A[X]

$A$ intègre (donc $A[X]$ intègre)

== 1. Polynomes associés

#def() $P, Q in A[X]$ sont dits *associés* s'il existe $a in A^* tq P = a Q$\
On note $P tilde Q$

#prop()
- "$tilde$" est une relation d'équivalence
- Si $P tilde Q$ et $P$ et $Q$ ont le même coeff dominant, alors $P=Q$
- Si $A$ corps, tout polynôme $P!=0_A$ est associé à un polynôme unitaire

#demo()[TD]

== 2. Division

#def() $P, Q in A[X]$\
$P$ *divise* $Q$ s'il existe $R in A[X] tq Q = P R$\
On note $P | Q$

#prop() 
- $P | Q et Q | R imp P | R$
- $P | Q et P | R imp P | Q + R$
- $P | Q et Q != 0 imp deg P <= deg Q$
- $P | Q et R | S imp P R | Q S$
- $forall n in NN, P | Q imp P^n | Q^n$

#prop() Soient $P, Q, R, S in AX$
- $P | Q et Q| P imp P tilde Q$
- $P tilde R et Q tilde S imp (P | Q ssi R | S)$

#pagebreak()
== 3. Division euclidienne dans $AX$

#thm() Soit $A$ intègre. Soient $M, N in AX tq$ le coefficient dominant de $N$ est inversible\
Alors il existe un unique couple $(Q, R) in AX times AX$\ $tq M = Q N + R et deg R < deg N$

#demo()[
*Unicité*\
On suppose qu'il existe deux tels couples $(Q_1, R_1), (Q_2, R_2) in AX times AX$\
On suppose $Q_1 != Q_2$

$"On a" Q_1 N + R_1 = Q_2 N + R_2\
imp (Q_1-Q_2)N = R_2-R_1\
imp deg((Q_1-Q_2)N) = deg (R_2-R_1)\
imp deg(Q_1 - Q_2) dot deg(N) = deg(R_2-R_1) -> "impossible"$

Donc $Q_1 = Q_2$\
donc $R_1 = R_2$

*Existence*\
On fixe $N$ de degré $n>=0$\
- Cas $n = 0, alors N = a in A^*, M = N a^(-1) M + 0$

- Cas $n > 0$, récurrence sur le degré $m de M$\
  $(H_m)$ : "pour tout $N in AX avec deg N <= m$, il existe $Q, R in AX$ tels que $M = Q N + R et deg R < n$"
  - Initialisation : ok

  - Hérédité : Pour $m < n$ ok\
    sinon :\
    On suppose $H_m$\
    Soit $M tq deg M = m+1$

    $M = sum_(k=0)^(m+1)a_k X^k, N = sum_(k=0)^(n)b_k X^k avec b_n in A^*$\
    ...
]

#corollaire() Soit $K$ un corps\
Pour tout $B != 0 et A in KX$, il existe un unique couple $(Q, R) in KX times KX$ tq $A = B Q + R et deg R < deg B@$

#pagebreak()
#corollaire() $K$ corps\
$KX$ est principal et tout idéal non nul est engendré par un unique polynôme unitaire

#demo()[
On peut choisir un polynôme de plus petit degré, puis /abs + div euclidienne 
]

= III. Polynomes irréductibles

A intègre

#def() Un polynôme $P in AX\\{0_A}$ est *irréductible* s'il n'est pas inversible.\ Si pour tous $Q, R in AX, P = Q R imp Q "inversible" ou R "inversible"$

#rq() Les seuls diviseurs de $P$ sont les inversibles et les associés à $P$. Donc on a que les factorisations triviales : $P = a dot a^(-1) dot P, a in A^*$

#rq() Un polynôme dit *réductible* n'est ni inversible ni irréductible

#ex()[
$P = X^2+1$

*$P$ est irréductible sur $RRX$* \
_indication :_ $P = Q R imp deg P = deg (Q)+deg(R)$

*$P$ est réductible sur $CCX$*\
$P = (X-i)(X+i)$
]

= IV. PGCD

#def() Soient $P_1, ..., P_n in KX$\
Soit $I$ l'idéal $(P_1)+...+(P_n)$\
On peut écrire de manière unique $I = (P)$ ou $P$ unitaire\
Le polynôme $P$ est appelé *plus grand diviseur commun* (pgcd) de $P_1, ..., P_n$, et est noté $pgcd(P_1, ..., P_n)$

#prop() 
Pour $P = pgcd(P_1, ..., P_n)$
- $exists A_1, ..., A_n in KX tq P = A_1 P_1 + ...+A_n P_n$
- $forall i in [|1, n|], P | P_i$
- $(forall i in [|1, n|], Q | P_i) imp Q | P$

#demo()[
*1.*\
$(P_1)+...+(P_n) = (P)$\
$P in (P)$ donc $exists A_1, ..., A_n tq P = A_1 P_1 + ... + A_n P_n$

*2.*\
$P_i in (P) donc P | P_i$

*3.*\
dp 1, $P = A_1 P_1 + ... + A_n P_n$
]

#def() Si $pgcd(P, Q) = 1$, $P et Q$ sont dit *premiers entre eux*

#prop() Si $P, Q$ sont irréductibles et unitaires, alors ils sont égaux ou premiers entre eux

#preuve()[
Soit $D = pgcd(P, Q)$ alors $D$ unitaire et $D | P et D | Q$\
Mais $P et Q$ sont irréducctibles donc $D$ inversible ou $P tilde D et Q tilde D$

- cas 1 : $D "inversible" imp D = u in KE tq P = u D et Q = v D$\
  donc $D = u^(-1)P$\
  donc $Q = v u^(-1)P$\
  mais $P, Q$ unitaires, donc $v u^(-1) = 1_K$\
  donc $u = v et P = Q$
]

#text(rgb(red))[#underline[Algorithme d'Euclide pour calculer le pgcd]]\
Soient $P, Q in KX$ non-nuls $tq deg P >= deg Q$\
- Étape 0 : $P_0 = P, Q_0 = Q$\
  On sait qu'il existe $(S_0, R_0) in KX^2$ tq $P_0 = Q_0S_0 + R_0 et deg R_0 < deg Q_0$

- Étape 1 : $P_1 = Q_0, Q_1 = R_0$\
  $exists (Q_1, R_1) in KX^2 tq P_1 = Q_1S_1 + R_1, deg R_1 < deg Q_1$

- Étape k :\
  $P_k = Q_(k-1), Q_k = R_(k-1)$\
  $exists (S_k, R_k) in KX^2 tq P_k = Q_k S_k + R_k, deg R_k < deg Q_(k)$

On obtient les suites $(P_k) et (Q_k)$\
Le degré de $Q_k$ diminue a chaque étape, il existe donc un $k_0 tq Q_(k_0+1) = 0_A$

Avec $a_n$ le coeff dominant de $Q_k_0$, on a *$pgcd(P, Q) = 1/a_n dot Q_k_0$*

#pagebreak()
#demo()[
Soit $D = pgcd(P, Q)$ par rec on a $forall k in NN, D | P_k et D | Q_k$\

$P_k_0 = S_k_0 Q_k_0 + 0, donc Q_k_0 | P_k_0$

$P_(k_0-1) &= S_(k_0-1) Q_(k_0-1) + R(k_0-1)\
&= S_(k_0-1) P_k_0 + Q_k_0$\
donc $Q_k_0 | P_(k_0-1)$\
$dots.v$\
$Q_k_0 | Q et Q_k_0 | P$

Ainsi $D | 1/a_n Q_k_0 et 1/a_n Q_k_0 | D$

Donc $1/a_n Q_k_0 = D$ (unitaires et associés)
]

#thm("de Bézout") Soient $P, Q in KX$\
$pgcd(P, Q) = 1_K ssi exists A, B in KX tq A P + B Q = 1_K$

#demo()[
$redimp$ vu

$redimprev$ $D = pgcd(P, Q)$\
$D | P et D | Q imp D | A P + B Q = 1_K$\
donc $D tilde 1_K$\
donc $D = 1_K$
]

#corollaire()
- Lemme de Gauss :\
  $P | Q R et pgcd(P, Q) = 1 imp P | R$

- Lemme d'Euclide :\
  $P$ irréductible $et P | Q R imp P | Q ou P | R$

#lemme() Soient $P_1, ..., P_k$ des polynômes irreductibles unitaires 2 à 2 distincts,\
et $alpha_1, ..., alpha_k in NNE$\
Si $P | P_1^alpha_A ... P_k^alpha_k alors P$ divise l'un des $P_i$

#pagebreak()
#thm() $P in KX\\{0}$\
$exists P_1, ..., P_k in KX, exists alpha_1, ..., alpha_k in NNE, alpha in KE tq P = alpha P_1^(alpha_1) ... P_k^(alpha_k)$\
Une telle décomposition est unique

#demo()[
*existence* recurrence

*unicité*\
rattraper\
$P = P_1^(alpha_1) ... P_k^(alpha_k) = P_1^(beta_1) ... P_k^(beta_k)$\
On montre que $forall i, alpha_i = beta_i$\
On note $i_1, ..., i_r$ les indices $i$ tq $alpha_i > beta_i$\
On note $j_1, ..., j_s$ les indices $i$ tq $alpha_j < beta_j$\
On pose $gamma_i = abs(beta_i - alpha_i)$

Donc $P_(i_1)^(gamma_i_1) ... P_(i_r)^(gamma_i_r) = P_(j_1)^(gamma_j_1) ... P_(j_s)^(gamma_j_s)$

Par me même raisonnement, $r = s et {P_i_1, ..., P_i_r} = {P_j_1, ..., P_j_s}$

Mais les $P_i$ sont 2 à 2 disjoints, donc $r. =s = 0$ donc $forall i, alpha_i = beta_i$
]

#prop() soient $P, Q in KX\\{0}$\
$P = alpha P_1^(alpha_1) ... P_k^(alpha_k), Q = beta P_1^(beta_1) ... P_k^(beta_k)$\
$P|Q ssi forall i in [|1, k|], alpha_i <= beta_i$

#demo()[
$redimprev$ Si $alpha_i < beta_i$, on peut écrire  $beta_i = alpha_i+gamma_i$ ... on retrouve bien ce qu'on veut

$redimp$ On suppose $P|Q : Q = R P$\
On suppose que $alpha_i_0 < beta_i_0$ pour un certain rang $i_0$
...
]

#corollaire() Soient\
$P = alpha P_1^(alpha_1) ... P_k^(alpha_k)$\
$Q = beta P_1^(beta_1) ... P_k^(beta_k)$

$pgcd(P, Q) = product_(i=0)^k P_i^(min(alpha_i, beta_i))$

#pagebreak()
= V. Fonctions polynomiales

#def() Pour $P = a_n X^n + ... + a_0 in KX$\
et $u in K$\
On appelle *fonction polynomiale* associée à $P$ la fonction $f_P$ telle que\
$f_P (u) = a_n u^n + ...+ a_0 in K$

#rq() on écrira $P(u)$ plutot que $f_P (u)$

#def() Soit $P in KX et alpha in K$\
$alpha$ est une *racine* de $P$ si $P(alpha) = 0$

#prop() Soit $P in KX et alpha in K$\
$alpha$ est une racine de $P ssi X-alpha | P$

#def() 
- Soit $P in KX, et alpha in K$ une racine de P. On dit que $alpha$ est une racine de *multiplicité* $k in NN$ si $(X-alpha)^k | P$ et $(X-alpha)divides.not P$

- Soit $P = sum_(i=0)^n a_i X^i in KX$\
  Le *polynôme dérivé* de $P$, noté $P'$ est le polynôme\ 
  $P' = cases(0 &"si" deg P = 0,sum_(i=1)^n i dot a_i X^(i-1) &"sinon")$ 

- Par récurrence on définit la *j-ième dériéve* de $P$\
  $cases(P^((0)) = P, P^((j+1)) = (P^((j)))')$


#prop() On suppose $K = CC ou K = RR$\
Soit $P = KX et alpha in K$\
Il y a équivalence entre 
- $alpha$ racine de multiplicité $k$ de $P$
- $exists Q in KX tq P = (X-1)^k Q et Q(alpha) != 0$
- $P^((j))(alpha) = 0$ pour tout $j in [|0, k|] et P^((k))(alpha) != 0$

#demo()[TD]

#thm() $Si alpha_1, ..., alpha_n in K$ sont des racines distinctes de $P in KX$ de multiplicités respectives $k_1, ..., k_n$\
alors $exists Q in KX tq P = (X-alpha_i)^(k_i) ... (X-alpha_n)^(k_n) Q$  et $forall i, Q(alpha_i)!= 0$

#preuve()[
Récurrence sur $n in NN$
]

#pagebreak()
#corollaire() 
- Soit $P in KX$ de degré $n$\
  Alors, $P$ a au plus $n$ racines
- $K$ infini $ssi$ l'application $P ass f_P$ est injective

#demo()[
*1.* ok

*2.*\
$redimp$ $Phi : func(KX &--> Fr(K, K), P &ass f_P : u ass P(u))$\
Soit $P, Q in KX tq Phi(P) = Phi(Q)$\
Alors $f_P = f_Q donc f_P - f_Q = 0_(Fr(K, K))$\
donc $f_(P-Q) = 0$\
donc chaque $u in K$ est racine de $P-Q$\
or $K$ est infini donc $P-Q$ admet une infinité de racines\
donc $P-Q = 0, P = Q, Phi$ injective

$redimprev$ On suppose que $K = {k_1, ..., k_n}$\
Soit $P = (X-k_1)...(X-k_n)$\
$forall i in [|1, n|], f_P(k_i) = 0$\
$Phi(P) = 0$\
Si $Phi$  est injective, $Phi(P) = 0 imp P = 0$\
or $P$ est de degré $n$ $->$ contradiction
]

#thm("de d'Alembert-Gauss") Tout polynôme non-constant de $CCX$ possède au moins une racine

#demo()[

$P = sum_(i=0)^n a_i X^i, deg P = n >= 1, (a_n != 0)$\

Soit $z in CCE$

$P(z) &= a_0 + a_1 z + ... + a_n z^n\
& =^(a_n != 0\ z^n != 0) a_n z^n (a_0/(a_n z^n) + (a_1)/(a_n z^(n-1)) + ... + a_(n-1)/(a_n z) + 1)\
abs(P(z)) &= abs(a_n) dot abs(z^n) dot abs(sum_(i=0)^(n-1) a_i/(a_n z^(n-i))+1)$

donc $lim_(abs(z)-->pinf) abs(P(z)) = pinf$\
#pagebreak()
Ainsi, soit $M = abs(P(0)) > 0$\
$exists R > 0 tq abs(z) > R imp abs(P(z)) > abs(P(0))$

$Soit f : func(CC&--> CC, z &ass abs(P(z)))$ une application continue sur $CC$

$K = {z in CC | abs(z) <= R}$ un compact de $CC$\
$f$ admet un minimum sur $K$ :\
$exists z_0 tq forall z in K, abs(P(z)) >= abs(P(z_0))$\
On a $0 in K donc abs(P(0))>=abs(P(z_0))$\
Donc $abs(z)<=R imp abs(P(z))>=abs(P(z_0))$\
et $abs(z) > R imp abs(P(z)) > abs(P(0)) >= abs(P(z_0))$\
*Donc $forall z in CC, abs(P(z)) >= abs(P(z_0))$*

On suppose que $P$ ne s'annule pas :\
$forall z in CC, abs(P(z)) >= abs(P(z_0)) > 0  "    "(star)$

Il existe $(b_0, ..., b_n) in CC^(n+1) tq P(X+z_0) = sum_(i=0)^n b_i X^i$

De plus, $b_0 = P(0+z_0) = P(z_0) != 0 et b_n != 0 car deg(P(X+z_0)) > 0$

Soit $k = min{i in [|1, n|] | b_i != 0} et soit omega$ une racine $k^"ième"$ de $-b_0/b_k$\
On a alors pour tout $t in RR$

$P(omega t + z_0) &= sum_(i=0)^n b_i (omega t)^i\
&= b_0 + sum_(i=k)^n b_i (omega t)^i\
&= b_0 + b_k omega^k t^k + sum_(i=k+1)^n b_i (omega t)^i\
&= b_0 +b_k (-b_0/b_k)t^k + sum_(i=k+1)^n b_i (omega t)^i\
&= b_0 - b_0 t^k + sum_(i=k+1)^n b_i (omega t)^i\
&= b_0(1-t^k) + sum_(i=k+1)^n b_i (omega t)^i\
&= b_0 (1-t^k + t^k epsilon(t)) avec epsilon(t) -->_(t-->0) 0$

Alors on peut trouver $alpha > 0 tq abs(t) < alpha imp abs(epsilon(t)) < 1/2$\
#pagebreak()
Soit $0 < t < min{1, alpha}$

$abs(P(z_0 + omega t)) &= abs(b_0(1-t^k+t^k epsilon(t)))\
&<= abs(b_0) dot (abs(1+t^k)+abs(t^k epsilon(t)))\
&< abs(b_0)(1-1/2 t^k)\
&< abs(b_0) = abs(P(z_0))$
]

#corollaire() Tout polynôme $P in CCX$ de degré $n >=1$ s'écrit de manière unique

$P = alpha product_(i=1)^n (X-alpha_i)^(k_i)$, où $alpha. in CCE, k_i in NNE et alpha_i$ distincts

#demo()[
2 derniers thm
]

#rq() $K$ corps, les polynomes de $KX$ de degré 1 sont irréductibles

En effet Si $P = A dot B alors deg P = deg A + deg B$\
$imp deg A = 1 et deg B= 0$\
$P != 0 imp B!= 0 imp B in KE$\
$imp P tilde A$

Pas vraie si $K$ n'est pas un corps\
($P = 2X + 4 in ZZX$\
$P = 2(X+2)$ et 2 pas inversible sur $ZZ$\
donc $P$ n'est pas irréductible)


#corollaire()
- Les polynômes irréductibles de $CCX$ sont les polynômes de degré 1
- Les polynômes irréductibles de $RRX$ sont les polynômes de degré 1 et les polynômes de degré 2 à discriminant négatif (noté $Delta$)

$#rq() "on a une racine" &imp "pas irréductible"\
&imprevnot$\
(contrex : les polynômes de deg 2 dans $RRX$)

#demo()[
*1.* ok /abs
#pagebreak()
*2.*\
Soit $P in RRX, deg P >= 2$\
$Soient {alpha_1, ..., alpha_n}$ les racines complèxes de $P$\
${b_1, ..., b_n}$ les racines réelles

On peut écrire $P = alpha product_(i=1)^m (X-alpha_i)^(k_i) product_(i=1)^r (X-b_i)^(l_i)$

Soit $u in CC\\RR tq P(u)=0$

$P = a_0+...+a_n X^n &imp P(u) =a_0+...+a_n u^n\
&imp ol(0) = ol(a_0)+...+ol(a_n)ol(u)^n\
&imp 0 = a_0+...+a_n ol(u)^n\
&imp 0 = P(ol(u))$\
De plus, si $P = (X-u)^k Q$, avec $Q(u)!=0$,\
alors $ol(P) = (X-ol(u))^k ol(Q)$, où $ol(Q)(ol(u)) != 0$\
donc $ol(u)$ est aussi de multiplicité $k$

$Donc P = alpha product_(i=1)^(m/2) (X-alpha_i)^(k_i)(X-ol(alpha_i))^(k_i) product_(i=1)^r (X-b_i)^(l_i)\
P = product_(i=1)^(m/2) (X^2 - 2Re(alpha_i)X + abs(alpha_i)^2)^(k_i)product_(i=1)^r (X-b_i)^(l_i)$



]