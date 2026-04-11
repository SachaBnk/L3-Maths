#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 4 — Dualité]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

#import "@preview/pavemat:0.2.0": pavemat
#import "@preview/commute:0.3.0": node, arr, commutative-diagram

= I. Généralités

#def() 
- Une *forme linéaire* sur $E$ est une application linéaire de E dans K
- L'ensemble $LEK$ des formes linéaires de E dans K est appelé *espace dual* de E, et est noté $ED$

#prop() E K-ev, $dim E = n$\
$dim ED = n$

#demo()[$dim K = 1$]

#prop() 
- Soit $Phi in ED, Phi != 0 ssi Phi$ surjective
- Si $dim E = n alors Phi "surjective" ssi dim (ker Phi) = n-1$\
  En particulier si $n >=2, Phi$ n'est pas injective

#demo()[
*1.*\
$redimp$ $Phi in ED, Phi != 0$\
$im Phi != {0} donc dim(im Phi) != 0$\
$im Phi subset K donc dim(im Phi) <= dim K = 1$\
Donc $dim(im Phi) = dim K$\
Donc $phi$ surjective

$redimprev$ $Phi$ surj $=> im Phi = K imp rg Phi = 1$

*2.*

$Phi "surjective" &ssi im Phi = K\
&ssi rg Phi = 1\
&ssi dim(ker Phi) = n-1 "     dp thm du rg"$
]

#def() E K-ev de dim n\
Un *hyperplan* est un sev de dimension $n-1$\
De manière équivalente, un hyperplan est le noyau d'une application linéaire non-nulle 

#pagebreak()
= II. Base duale

#thm("/ définition") $B = (e_1, ..., e_n)$ base de E\
Il existe une unique base $BD = {e_1^*, ..., e^*_n} de ED tq e_i^*(e_j) = delta_(i j) = cases(1 si i = j, 0 sinon)$

$"De plus" &forall Phi in ED, &Phi = sum_(i=1)^n Phi(e_i)e_i^*\
&forall x in E, &x = sum_(i=1)^n e_i^*(x) e_i$\
$BD$ est appelée *base duale* de B

#demo()[
Pour $i in [|1, n|], "on note" e_i^* : func(E &--> K, a_1 e_1 + ...+ a_n e_n &ass a_i)$

$E_i^* in ED et e_i^*(e_j) = delta_(i j)$

Soient $f_1, ..., f_n in ED tq f_i (e_j) = delta_(i j)$
\ Soit $x in E, x = a_1 e_1 + ...+a_n e_n$

$f_i (x) = a_i f_i (e_i)+...+a_n f_i (e_i)\
imp f_i (x) = =a_i = e_i^*(x)\
imp f_i = e_i^*$

*$BD$ base de $ED$*\
- $card BD = n = dim E$
- $BD$ est libre :

  $forall i in [|1, n|], (lambda_1 e_i^* + ... + lambda_n e_n)(e_i) = 0\
  imp lambda_1 e_1^*(e_i) + ...+ lambda_n e_n^*(e_i) = 0\
  imp lambda_i = 0$
]

#ex(1)[

$E = RR^3, &B_0 = (e_1, e_2, e_3) "base canonique"\
&B = (v_1, v_2, v_3) = (e_1, e_2, e_1+e_3) "base"$

$B_0^* = (e_1^*, e_2^*, e_3^*)\
BD = "?"$
\ \
$v_1^*(v_1) = 1 imp v_1^*(e_1) = 1\
v_1^*(v_2) = 0 imp v_1^*(e_2) = 0$

$v_1^*(v_3) = 0 &imp v_1^*(e_1+e_2)=0\
&imp v_1^*(e_1)+v_1^*(e_3) = 0\
&imp 1 + v_1^*(e_3) = 0\
&imp v_1^*(e_3) = -1$\
Donc $v_1^* = e_1^* - e_3^*$

De même :

$v_2^*(v_1) = 0 imp v_2^*(e_1) = 0\
v_2^*(v_1) = 1 imp v_2^*(e_2) = 1$

$v_2^*(v_3) = 0 &imp v_2^*(e_1) + v_2^*(e_3) = 0\
&imp v_2^*(e_3 = 0)$\
Donc $v_2^* = e_2^*$

Enfin $v_3^* = e_3^*$

Donc $BD = (e_1^*-e_3^*, e_2^*, e_3^*)$
]

= III. Base antéduale

<T>
#thm() l'application $T: func(E &--> (E^*)^*, x &ass tilde(x) : Phi ass Phi(x))$ est un morphisme d'ev

#demo()[
*T bien définie* car $T(x) in (E^*)^*$

*T est une application linéaire*\
Soient $x, y in E, lambda in K$\
$T(x + lambda y) = tilde(x+ lambda y)$\
$T(x) + lambda T(y) = tilde(x) + lambda tilde(y)$

$Soit Phi in ED\
(tilde(x+lambda y))(Phi) &= Phi(x+lambda y)\
&= Phi(x) + lambda Phi(y)\
&= tilde(x)(Phi) + lambda tilde(y)(Phi)\
&= (tilde(x) + lambda tilde(y))(Phi)$

$dim (ED)^* = dim ED = dim E$

*Il suffit de mq $ker T = 0$*\

$x in ker T &imp T(x) = 0\
&imp forall Phi in ED, tilde(x)(Phi) = 0\
&imp forall Phi in ED, Phi(x) = 0$\
En particulier, $e_i^*(x) = 0$

Mais $x =^"thm 12" sum_(i=0)^n e_i^*(x)e_i = 0$
]

#def() Le *crochet de dualité* $scal(" ", " ")$ est l'application :

$scal(" ", " ") : func(ED times E &--> K, (Phi, x) &ass Phi(x))$

#rq() $scal(" ", " ")$ est une forme bilinéaire

#thm() Soit $B' = (Phi_1, ..., Phi_n)$ une base de $ED$\
Alors il existe une unique base $B de E$ dont $B'$ est la duale\
On appelle $B$ la *base antéduale* de $B'$
#let Tm = $T^(-1)$

#demo()[
$B' "base de" E$\
On considère $(B')^* = (Phi_1^*, ..., Phi_n^*)$ la base duale de $B' "sur" (ED)^*$\
On pose $e_i = Tm(Phi_i^*)$\
*$B = e_1, ..., e_n$ est une base de $E$*\
- $card B = n = dim E$
- $lambda_1 e_1 + ... + lambda_n e_n = 0 &imp lambda_1 Tm(Phi_1^*)+ ... lambda_n Tm(Phi_n^*) = 0\
&imp Tm(lambda_1 Phi_1^* + ... + lambda_n Phi_n^*) = 0\
&imp lambda_1 Phi_1^* + ... + lambda_n Phi_n^* = 0\
&imp lambda_1 = ... = lambda_n = 0$

De plus : 

$Phi_i (e_i) &= \
&=$

(rattraper dans les photos)
]

#pagebreak()
= VI. Orthogonalité

#def() Soit $A subset E$ sev\
*l'orthogonal* de $A$ est le sev de $ED$ défini par $A^bot = {Phi in E | forall alpha in A, scal(Phi, alpha) = 0}$

#def() Soit $B subset ED$ sev\
*l'orthogonal* de B est le sev de E défini par $B^rond = {x in E | forall Phi in B scal(Phi, x) = 0}$

#rq() pas pareil que l'orthogonlité au sein d'un espace vectoriel classique\
-> ne pas confondre produit scalaire et crochets de dualité

#prop() $B subset ED$\
$T(B^rond) = B^bot$

#rappel : #lien(<T>)[T]

#corollaire() $Soit A subset E, (A^bot)^bot = T((A^bot)^rond)$

#prop() Soient $A, A' subset E et B, B' subset ED$ sev\
- $A subset A' imp (A')^bot subset A^bot$
- $B subset B' imp (B')^rond subset B^rond$
- $(Vect A)^bot = A^bot$
- $(Vect B)^rond = B^rond$

#corollaire() 
- Soit $A subset E$ et $(e_1, ..., e_p)$ une base de $Vect A$ que l'on complète en une base $(e_1, ..., e_p, e_(p+1), ..., e_n)$ de E\
  Alors $A^bot = Vect(e_(p+1)^*, ..., e_n^*)$

- Soit $B subset ED et (f_1, ..., f_p)$ une base de $Vect B$ que l'on complète en une base $(f_1, ..., f_p, f_(p+1), ..., f_n)$ de $ED$\
  Notons $(e_1, ..., e_p, e_(p+1), ..., e_n)$ sa base antéduale\
  Alors $B^rond = Vect(e_(p+1), ..., e_n)$

#corollaire() $F$ sev de $E$, $G$ sev de $ED$
- $dim E = dim F + dim F^bot$
- $(F^bot)^rond = F$
- $dim E = dim G + dim G^rond$
- $(G^rond)^bot = G$

#corollaire() Soient $(Phi_1, ..., Phi_p)$ une famille de formes linéaires sur E de rang $r in [|0, p|]$\
On pose $F := inter.big_(i=1)^p ker Phi_i$\
Alors $dim F = n - r$

Réciproquement, tout sev de E de dimension $n-r$ est l'intersection des noyeaux de formes linéaires linéairement indépendantes

#corollaire() 
- Soient $F, F'$ sev de E\
  - $(F+F')^bot = F^bot inter (F')^bot$
  - $(F inter F')^bot = F^bot + (F')^bot$
- $G, G'$ sev de $ED$
  - pareil avec des ronds
  - pareil avec des ronds

#demo()[
*1.a)*\
On a $F subset F+F' et F' subset F+F' donc (F+F')^bot subset F^bot et (F+F')^bot subset (F')^bot$\
Donc $(F+F')^bot subset F^bot inter (F')^bot$

Soit $Phi in F^bot inter (F')^bot et x in F+F'$\
Donc $exists y in F et z in F' tq x = y+z$\
On a $Phi(x) = Phi(y+z) = Phi(y)+Phi(z) = 0+0=0$\
Donc $Phi in (F+F')^bot$

*1.b)*\
$F inter F' subset F et F inter F' subset F' donc F^bot subset (F inter F')^bot et (F')^bot subset (F inter F')^bot$\
$donc F^bot+(F')^bot subset (F inter F')^bot$

D'autre part 
$ dim (F^bot + (F')^bot) &= dim(F^bot)+dim((F')^bot)-dim(F^bot inter (F')^bot)\
&=^(a\)) dim(F^bot)+dim((F')^bot)-dim((F + F')^bot)\
&= n-dim(F) + n - dim(F') - (n-dim(F+F'))\
&= 2n - dim(F) - dim(F') - n + dim(F+F')\
&= n - cancel(dim(F)) - cancel(dim(F')) + cancel(dim(F)) + cancel(dim(F')) - dim(F inter F')\
&= n-dim(F+F') = dim((F+F')^bot) $

#rappel() $ T : func(E &-->^tilde (E^*)^*, x &ass func(E^* &-->K, Phi &ass Phi(x))) $
$B subset ED, T(B) = B^bot ssi B° = Tm(B^bot)$
#pagebreak()
*2.a)*\
$ (G+G')° &= Tm((G + G')^bot)\
&= Tm(G^bot inter (G')^bot)\
&= Tm(G^bot) inter Tm((G')^bot)\
&= G° inter (G')° $

*2.b)*\
$ (G inter G')° &= Tm((G inter G')^bot)\
&= Tm(G^bot + (G')^bot)\
&= Tm(G^bot)+Tm((G')^bot)\
&= G°+(G')° $
]

#ex()[
$u_1=(1,2,1) et u_2=(0,1,0)$\
$F = Vect{u_1}$\
$G = Vect{u_1,u_2}$

*On commence par ${u_1}^bot et {u_1, u_2}^bot$*\
$Soit u_3 = e_3 = (0,0,1)$\
$B = (u_1, u_2, u_3)$ base de $RR^3$\
$Soit u^* = a_i e_1^* + b_i e_2^* + c_i e_3^*$

$M = mat(a_1, b_1,c_1;a_2,b_2,c_2;a_3,b_3,c_3), N = (u_1,u_2,u_3) = mat(1,0,0;2,1,0;1,0,1)$

$M = N^(-1) = mat(1,0,0;-2,1,0;-1,0,1)$\
Donc $B^* = (e_1^*, -2e_1^*+e_2^*, -e_1^*+e_3^*)$\
${u_1}^bot = Vect{u_2^*,u_3^*} = Vect{-2e_1^*+e_2^*, -e_1^*+e_3^*}$

$ F = {(x,y,z) in RR^3 | u_2^*(x,y,z)=0 et u_3^*(x,y,z)=0} $
#pagebreak()
Mais 
$ u_2^*(x,y,z) &= u_2^*(x e_1+y e_2+z e_3)\
&= -2e_1^*(x e_1+y e_2 + z e_3) + e_2^*(x e_1 + y e_2 + z e_3)\
&= -2x+y $
De même, $u_3^*(x,y,z)=-x+z$, donc
$ F = {(x,y,z)in RR^3 | y=2x et x=z} $

D'autre part :\
${u_1,u_2}^bot = Vect{u_3^*} = Vect{-e_1^*+e_3^*}$
$ G = {(x,y,z)in RR^3 | x = z} $
]

#rappel() Soit $A subset E$ sous ensemble et $(e_1,...,e_p)$ une base de $Vect(A)$\
Soit $(e_1,...,e_p,e_(p+1),...,e_n)$ une base de $E$\
Alors $ A^bot = Vect(e_(p+1)^*, ..., e_n^*) $

= V. Polynomes d'endomorphismes

$E " "K$-ev, $dim E < pinf$\
$Soit P : a_0 + a_1 X + ... + a_k X^k in KX$\
On note
- Si $f in LE, P(f) = a_0 + a_1 f + ... + a_k f^k in LE$
- Si $A in Mn(K), P(A) = a_0 + a_1 A + ... + a_k A^k$

#prop() Soient $f in LE, P, Q in KX et lambda in K$
- $P(f) in LE$
- Si $B$ base de $E$, alors $Mat_B (P(f)) = P(Mat_B (f))$
- $(lambda P + Q)(f) = lambda P(f) + Q(f)$
- $(P Q)(f) = P(f)Q(f) = (Q P)(f)$
- $ker (P(f)) et im(P(f))$ sont stables par $f$
- Si $lambda$ valeur propre de $f$, alors $P(lambda)$ est valeur propre de $P(f)$

#demo()[
  Celene
]

#thm("- Lemme des noyaux") Soit $f in LE, et  P_1, ..., P_k in KX$ premiers entre eux deux a deux. Posons $P = P_1...P_k$, alors 
$ ker P(f) = plus.o.big_(i=1)^k ker (P_i (f)) $

#demo()[
Récurrence pour $k>=2$\
- $k=2$\
  $pgcd(P_1,P_2) = 1 imp^"Bézout" exists U, V in KX tq 1 = U P_1 + V P_2 redstar$

  *on mq $W = ker P_1 (f) inter ker P_2 (f) = {0}$*\
  Soit $X in W$\
  $P_1 (f)(X) = P_2(f)(X) = 0$\
  dp $redstar$ on a :\
  $id_E = (U P_1+V P_2)(f) imp id_E = U(f) rond P_1(f) + V(f) rond P_2(f)$\
  
  $Donc X &= id_E (X)\
  &= U(f)(P_1(f)(X)) + V(f)(P_2(f)(X))\
  &= U(f)(0)+V(f)(0)\
  &= 0$\
  Donc $X=0$

  *On mq $ker P(f) = ker P_1(f)plus.o ker P_2(f)$*\
  On a $P = P_1P_2$\
  Donc $P(f) = P_1(f)rond P_2(f) = P_2(f) rond P_1(f)$\
  Soit $X in ker P_1(f), P_1(f)(X) = 0$\
  Alors $P(f)(X) = 0$\
  de meme $ker P_2 subset ker P$\

  Soit $X in ker P(f), P(f)(X)=0$\
  $X = id_E (X) =^redstar (U P_1)(f)(X) + (V P_2)(f)(X)$

  $"On a" P_2(f)(U P_1(f)(X)) &= (P_2(f) rond (U P_1)(f))(X)\
  &= ((U P_1)(f) rond P_2(f))(X)\
  &= (U(f)rond P_1(f) rond P_2(f))(X)\
  &= (U(f) rond (P_1 P_2)(f))(X)\
  &= (U(f) rond V(f))(X)\
  &= U(f)(P(f)(X))=0$\ 
  Donc $U P_1(f)(X) in ker P_2(f)$, de meme $(V P_2)(f)(X) in ker P_1(f)$

- Hérédité : Pour $k >= Q$, on suppose que le resultat est vrai pour $k$\
  On montre qu'il est vrai pour $k+1$

  $pgcd P(f) &= ker (P_1...P_k P_(k+1))(f)\
  &= ker (P_1...P_k)(f) plus.o ker P_(k+1) (f)\
  &= plus.o.big_(i=1)^(k+1) ker P_i (f)$
]

#corollaire() Soient $lambda_1, ..., lambda_k$ des valeurs propres distinctes de $f in LE$

Alors $ker P(f) = plus.o.big_(i=1)^k E_lambda_i$\
Avec $P = product_(i=1)^k (X-lambda_i) et E_lambda_i = ker (f - lambda_i id_E)$ l'espace propre associé a $lambda_i$

= VI. Polynome minimal

#def() Soit $f in LE$\
L'application $Phi_P : func(KX &--> LE, P &ass P(f))$ est un morphisme d'un anneau vers un espace vectoriel\
On dit que $Phi_P$ est un *morphisme d'algèbres*

#corollaire() Il existe un unique polynome unitaire $pi_f in KX tq ker Phi_f = (pi_f)$\
De meme avec $A in M_n (K) et Phi_A : func(KX &--> M_n (K), P &ass P(A))$ il existe un unique polynome unitaire $pi_A tq ker Phi_A = (pi_A)$

#def() $pi_f et pi_A$ sont les *polynome minimaux* de $f$ et $A$ resp.\

= Rattraper
#pagebreak()
#thm() $f in LE, chi_f$ scindé, $lambda_1, ..., lambda_m$ valeurs propres

Alors $pi_f = product_(i=1)^m (X-lambda_i)^(b_i)$ avec $b_i = Nil((f-lambda_i id_E)|_N_lambda_i)$

#rq() $N_lambda_i$ = sous espace propre

#demo()[
Soit $chi_f = (-1)^n product_(i=1)^m (X-lambda_i)^(alpha_i)$\
On sait que $pi_f | chi_f$ (thm de Cayley-Hamilton)\
De plus, $pi_f (lambda_i) = 0$

Donc $pi_f = product_(i=1)^m (X-lambda_i)^(p_i), p_i <= alpha_i$

On montre que $p_i = Nil((f-lambda_i id_E)|_N_lambda_i)$\
Notons $N_i = N_lambda_i et g_i = f|_N_i$\
Soit $B_i$ base de $N_i$\
dp le thm précédent (oupsi), $E = N_1 plus.o ... plus.o N_m$\
Donc $B = B_1 union.sq ... union.sq B_m$

$A := Mat_B (f) &= mat(Mat_B_1 (g_1), , 0; , dots.down, ; 0, , Mat_B_m (g_m))\
&= mat(A_1, , 0; , dots.down, ; 0, , A_m)$

$Soit P in KX tq P(A) = 0\
P(A) = mat(P(A_1), , 0; , dots.down, ; 0, , P(A_m))$

Pour tout $i, j in [|1, m|]$ on pose $A_(i, j) = A_i - lambda_j I_alpha_i$\
$A_i$ n'admet que $lambda_i$ pour valeur propre\
donc $det (A_i - lambda_j I_alpha_i) != 0 pour i != j$

$A_(i, j)$ inversible $ssi i != j$\
$A_(i, i) = A_i - lambda_i I_alpha_i$ nilpotente d'indice $Nil(f-lambda_i id_E |_N_i) = b_i$\
$P(A) = 0 imp P(A_i) = 0 pour i in [|1, m|]$\
On suppose que $P = product_(i=1)^m (X-lambda_i)^(q_i)$\
Pour tout $j in [|1, m|]$ on a $P(A_j) = product_(i=1)^m (A_j - lambda_i I_alpha_j)^(q_i)$

#pagebreak()
$P(A) &= mat(product_(i=1)^m (A_1 - lambda_i I_alpha_1)^(q_i), , 0; , dots.down, ; 0, , product_(i=1)^m (A_m - lambda_i I_alpha_m)^(q_i))\
P(A) &= mat(product_(i = 1)^m A_(1, i)^(q_i), , 0; , dots.down, ; 0, , product_(i = 1)^m A_(m, i)^(q_i))$

Fixons $j in [|1, m|]$ on a 

$product_(i=1)^m A_(j, i)^(q_i) = product_(i=1)^(j-1) A_(j, i)^(q_i) dot A_(j, j)^(q_j) dot product_(i=j+1)^m A_(j, i)^(q_i)$

$P(A_i) = 0 ssi A_(j, j)^(q_j) = 0$\
Donc $(A_j - lambda_j I_alpha_i)^(q_j) = 0 imp q_j >= b_j$

En particulier, comme $pi_A = product_(i=1)^m (X - lambda_i)^(p_i)$, on a $p_i >= b_i$\
Mais $p_i <= b_i$\
Donc $p_i = b_i$
]


= VIII. Réduction

#thm() Soit $f in LE$, les prop suivantes sont équivalentes 
- $f$ diagonalisable
- Il existe un polynome annulateur de $f$ scindé à racines simples
- $pi_f$ scindé à racines simples
- $chi_f$ scindé et pour toute valeur propre $lambda, dim E_lambda = m^alpha (lambda)$

#ex(1)[
$p in LE tq p^2 = p$ (projection)\
$Soit Q =X^2-X in KX$\
On a $Q(p) = 0 et Q = X(X-1)$ scindé des racines simples\
donc p diagonalisable
]

#ex(2)[
$u in Lr(RR^3) B = (e_1, e_2, e_3)$ base canonique

Soit $A := Mat_B (u) = mat(2, 0, -1; -1, 1, 0; 0, 0, 1)$

$chi_u = -(X-1)^2 (X-2)$ scindé

*Méthode 1*

$E_1 = ker (A-I_3) &= ker mat(1, 0, -1; -1, 0, 1; 0, 0, 0)\
&= Vect {mat(1;0;1) , mat(0;1;0)} = Vect { v_1, v_2}$

Donc $dim E_1 = 2 donc dim E_2 = 1 donc u$ diagonalisable

On peut calculer 

$E_2 &= ker mat(0, 0, -1; -1, -1, 0; 0, 0, -1)\
&= Vect {mat(1;1;0)} = Vect {v_3}$

$B' = (v_1, v_2, v_3)$

$Mat_B' (f) = mat(1, 0, 0; 0, 1, 0; 0, 0, 2)$
]

#demo()[
*$1 imp 3$*\
$f$ trigonalisable $imp$ $exists B$ base de E tq $Mat_B (f) = mat(lambda_1, , *; , dots.down, ; 0, , lambda_n)$

$imp chi_f = product_(i=1)^n (lambda_i-X)$ scindé

*$3 imp 4$* ok car $pi_f | chi_f$

*$4 imp 2$* ok car $pi_f (f) = 0$

*$2 imp 1$*\
Soit $P = product_(i=1)^n (X - lambda_i)^(alpha_i)$, où $lambda_i in K$ deux-à-deux distincts tq $P(f) = 0$\
Donc $ker P(f) = E$

$imp^"Lemme des Noyaux" E &= plus.o.big_(i=1)^n ker((f - lambda_i id_E)^(alpha_i))\
&= plus.o.big_(i=1)^n ker N_i$\

Soit $x in N_i$\
$[(f-lambda_i id_E)^(alpha_i)rond f](x) &= [f rond (f - lambda_i id_E)^(alpha_i)](x)\
&= f[(f-lambda_i id_E)^(alpha_i)(x)]\
&= f(0)=0$\
Donc $f(x) in N_i donc N_i$ stable par $f$\
Soit $g_i = (f-lambda_i id_E)|_N_i in Lr(N_i)$\
On a $a g_i^(alpha_i)=0 imp g_i$ trigonalisable \
Soit $B$ la base de $N_i tq Mat_B_i (g_i)$ triangulaire supérieure\
$B = B_1 union...union B_k$ base de $E$

$Mat_B (f) = mat(Mat_B_1 (g_1), ,*; , dots.down, ; 0, , Mat_B_k (g_k))$
]

#rq() La preuve donne une methode pour trigonaliser $g_i$ et donc $f$ : Il suffit de trouver une base de $N_i$\
Comment on fait ça ? On prend une base de $ker(f-lambda_i id_E)$ complétée en une base de $ker ((f-lambda_i id_E)^2)$ complétée en ... complétée en une base de $ker ((f-lambda_i id_E)^(alpha_i)$


#corollaire() Si $E$ est un $CC$-ev, alors tout $f in LE$ est trigonalisable

#demo()[Tout polynome dans $CC$ est scindé]

#ex()[
$f in Lr(RR^3) et (e_1, e_2, e_3)$ base canonique 

$A := Mat_((e_1, e_2, e_3)) (f) = mat(1, 1, 0; 0, 1, 0; 1, -1, 2)$

On calcule $chi_A = (1-X)^2(2-X)$ scindé $imp A$ trigonalisable

$ ker (A-I_3) &= ker mat(0, 1, 0; 0, 0, 0; 1, -1, 1)\
&= Vect{mat(1;0;-1)}\
&= Vect {u_1} $

$A$ n'est pas diagonalisable car $dim E_1 = dim ker (A-I_3) = 1 != 2$

$ ker ((A-I_3)^2) &= ker mat(0, 0, 0; 0, 0, 0; 1, 2, 1)\
&= vect{u_1, u_1} avec u_2 = mat(0;1;0) $

$ ker (A-2I_3) &= ker mat(-1, 1, 0; 0, -1, 0; 1, -1, 0)\
&= Vect{u_3} avec u_3 = mat(0;0;1) $

Soit $B_1 = (u_1, u_2), B_2 = (u_3)$\
$B = B_1 union B_2 = (u_1, u_2, u_3)$ base de $E$

$Mat_B (f) = mat(Mat_B_1 (g_1), *; 0, Mat_B_2 (g_2)) =: T$

$donc T = #pavemat(
  pave: (
    (path: "SSS", from: (0, 2)),
    (path: "DDD", from: (2, 0))
  ))[$mat(1, m, 0; 0, 1, 0; 0, 0, 2)$]$

On calcule $m$ :\

$(A-I_3)u_2 = u_1 &imp A u_2 = u_1+u_2\
&imp f(u_2) = u_1+u_2\
&imp m = 1$

($f(u_2) = A u_2 = m u-1 + u_2 imp m=1$)

$ P = (u_1|u_2|u_3) = mat(1, 0, 0; 0, 1, 0; -1, 0, 1) $
Alors $A = P T Pm$
]

#pagebreak()
= IX. Décomposition de Dunford

#thm() Soit $f in LE tq chi_f$ scindé.\ Alors il existe un unique couple $(d, n) in LE^2 tq $
- $d$ diagonalisable
- $n$ nilpotent
- $f= d+n$
- $d rond n = n rond d$

#demo()[

#text(1.3em)[*Existence*]

$chi_f$ scindé $imp^"thm 18" E = plus.o.big_(i=1)^m N_i "    " (I)$\
où $N_i := N_lambda_i$ sev caracteristique \
On définit $(d_i, n_i) in LE^2$\
Soit $g_I = f|_N_i$\
On a $N_i = ker ((f-lambda_i id_E)^(alpha_i))$

$g_i &= (lambda_i id_E) + (g_i - lambda_i id_E)\
&= d_i + n_i$

$d_i$ diagonale et $n_i$ nilpotente car $n_i^(alpha_i) = 0$\
Soit $v in E, v = v_1 + ... + v_m, v_i in N_i pour "tout" i$\
On définit 

- $d(v) &= d_1 (v_1)+...+d_m (v_m)\
&= lambda_1 v_1 + ... + lambda_m v_m$

- $n(v) = n_1(v_1) + ... + n_m (v_m)$

*1. $d$ diagonalisable*\
$B_i$ base de $N_i, alors B = B_1 union ... union B_m$ base de $E$

$ Mat_B (d) = #pavemat(pave:(
  (path: "DDD", from: (3, 0)),
  (path: "SSS", from: (0, 3)),
  (path: "DDD", from: (4, 4)),
  (path: "SSS", from: (4, 4))
))[$mat(lambda_1;
 , dots.down, , , , 0;
  , , lambda_1; 
  , , , dots.down;
  , , , , lambda_m;
  ,0, , , , dots.down;
  , , , , , ,lambda_m)$] $


*2. $n$ est nilpotent*\
$N_i$ est stable par $n_i$

$soit v_i in N_i, alors n_i (v_i) &= g_i (v_i) - lambda_i v_i\
&= f(v_i) - lambda_i v_i$\
Mais $N_i$ stable par $f$, donc $f(v_i) in N_i$\
De plus, $lambda_i v_i in N_i, donc n_i (v_i) in N_i$

$Soit k = max {alpha_1, ..., alpha_m} et v = v_1+...+v_m in E$\
$n^k (v) = n^k (v_1) +...+ n^k (v_m) = n_1^k (v_1) +...+n_m^k (v_m) = 0$\
donc $n$ nilpotent

*3.*\
Soit $v = v_1+...+v_m$

$ f(v) &= sum_(i=1)^m f(v_i) = sum_(i=1)^m g_i (v_i)\
&= sum_(i=1)^m d_i (v_i) + n_i (v_i)\
&= sum_(i=1)^m d_i (v_i) + sum_(i=1)^m n_i (v_i)\
&= d+n $

*4.*\
$ (d rond n)(v) &= (d rond n)(v_1+...+v_m)\
&= d(n_1(v_1)+ ...+n_m (v_m))\
&= d(n_1 (v_1))+...+d(n_m (v_m))\
&= lambda_1n_1(v_1)+...+lambda_m n_m (v_m)\ \ \
(n rond d)(v) &= ...\
&= lambda_1n_1(v_1)+...+lambda_m n_m (v_m) $


#text(1.3em)[*Unicité*]

Supposons $(d', n')$ un autre couple satisfaisant les memes conditions, on mq $N_i$ stable par $d'$ 
$ d' rond f &= d' rond (d'+n')\
&= d' rond d' + d' rond n'\
&= d' rond d' + n' rond d'\
&= f rond d' $\
Soit $v_i in N_i = ker ((f-lambda_i id_E)^(alpha_i))$

$ (f-lambda_i id_E)^(alpha_i)(d'(v_i)) &=^(f rond d' = d' rond f) d'((f-lambda_i id_E)^(alpha_i))(v_i)\
&= d'(0) = 0 $
Donc $d' (v_i) in N_i$\
On montre qu'il existe une base commune de diagonalisation pour $d et d'$\
$N_i$ stable par $d' imp$ on peut considérer $d'|_N_i$\
$d|_N_i = lambda_i id_E imp Mat_B (d|_N_i)$ diagonale dans toute base de $N_i$\
($pi_(d'|_N_i) | pi_d' et pi_d'$ scindé à racines simples)\
Donc $exists$ base $B_i$ de $N_i tq Mat_B_i (d'|_N_i)$ diagonale aussi\
$B = B_1 union ... union B_m$\
alors $Mat_B (d) et Mat_B (d')$ diagonales

Soit $u = d-d' = n-n'$
- $u$ nilpotent 
- $u$ diagonalisable 

Donc $Mat_B (u) = 0 donc u = 0$
]

#ex(1)[
$Mat_((e_1, e_2, e_3))(f) = mat(1, 1, 0; 0, 1, 0; 1, -1, 2) =: A$\
$chi_A = (1-X)^2(2-X)$ est scindé

$E_1 = ker (A-I_3) = Vect{mat(1;0;-1)}$

$N_1 = ker (A-I_3)^2 = Vect{u_1, u_2:=mat(0;1;0)}\
N_2 = E_2 = ker (A-2I_3) = Vect {u_3:=mat(0;0;1)}\
B = (u_1, u_2, u_3)\
Mat_B (f) = mat(1, 1, 0; 0,1,0;0,0,2) := T\
car :\
f(u_1) = u_1\
f(u_2) = A u_2 = u_1+u_2\
f(u_3) = 2u_3$

$ A = P T Pm avec P &= (u_1|u_2|u_3)\
&= mat(1,0,0;0,1,0;-1,0,1) $
$ avec T = D'+N', A = P D' Pm + P N' Pm\
D' = mat(1, 0, 0; 0, 1, 0; 0, 0, 2), N' = mat(0, 1, 0; 0, 0, 0; 0, 0, 0) $
]


#ex(2)[
$A = mat(1, 1, 2; 2, 3, 6; 0, -1, -1)$\
$chi_A = (X-1)^3$ scindé\
A n'est pas diagonalisable (sinon, $pi_A = X-1, et donc A-I_3 = 0 donc A = I_3$)

$E = N_1 donc D = D_1 = lambda I_3 donc D = I_3\
Alors N=A-D = A-I_3$
]

#ex(3)[
$A = mat(3,2,4;-1,3,-1;-1,-1,-3)$

$chi_A = -(X+1)(X-2)^2$ scindé\
$N_(-1) = E_(-1) = ker (A+I_3) = Vect{u_1:=mat(-1;0;1)}\
E_2 = ker (A-2I_3) = Vect{u_2 := mat(-2;-1;1)}$

$N_2 = ker (A-2I_3)^2 &= ker mat(-9, 0, -18; 0,0,0;9,0,18)\
&= Vect{mat(-2;0;1), mat(0;1;0)}\
&= Vect{u_2-u_3, u_3}\
&= Vect{u_2, u_3}$

$f(u_1) = A u_1 = -u_1\
f(u_2) = A u_2 = 2u_2\
f(u_3) = A u_3 = mat(2;3;-1) = -u_2+2u_3 "    (calcul)"$

$P = (u_1|u_2|u_3), T = mat(-1, 0, 0; 0, 2, -1; 0,0,2), A = P T Pm\
T = D'+N' avec D' = mat(-1,0,0;0,2,0;0,0,2) et N' = mat(0,0,0;0,0,-1;0,0,0)$
]

= X. Applications au calcul des puissances d'une matrice

Soit $A in Mn(K) et k in NN$\
Si $chi_A$ est scindé, alors $A = D+N$ avec $D$ diagonale, $N$ nilpotente et $N D = D N$

$Soit p = Nil(N)$

$ A &=^(D N = N D) sum_(i=0)^k mat(k;i)N^i D^(k-i)\
&= sum_(i=0)^(p-1) mat(k;i) N^i D^(k-i) $
$D = P D' Pm avec D'$ diagonale\
Donc $D^i = P (D')^i Pm$

#ex()[
$A = mat(-1,-2,-2; -1,1,-1;3,2,4)$\
$chi_A = -(X-1)^2(X-2)$ scindé

$ker (A-2I_3) = Vect{u_1 := mat(0;1;-1)}\
ker(A-I_3) = Vect{u_2 := mat(1;0;-1)}\
ker((A-I_3)^2) = Vect{u_2, u_3:=mat(0;1;0)}$

$P = mat(0,1,0; 1,0,1; -1,-1,0)\
T = Pm A P = mat(2, 0, 0; 0, 1, -2; 0,0,1)\
D' = mat(2, 0,0;0,1,0;0,0,1), N' = mat(0,0,0;0,0,-2;0,0,0) -> Nil (N') = 2$


$ A^k &= sum_(i=0)^1 mat(k;i) P (N')^i Pm dot P (D')^(k-i)Pm\
&= P [sum_(i=0)^1 mat(k;i)(N')^i (D')^(k-i)]Pm\
&= P[(D')^k + k(D')^(k-1) dot N']Pm\
&= P[mat(2^k, 0, 0; 0,1,0;0,0,1) + k mat(2^(k-1),0,0;0,1,0;0,0,1)dot mat(0,0,0;0,0,-2;0,0,0)]Pm\
&= ...\
&= mat(1-2k, -2k, -2k; -2^k+1, 1, -2^k+1; 2^k-1+2k, 2k, 2^k+2k) $
]

== Exponentielle d'une matrice
$K = RR ou CC$

#def() Soit $A in Mn(K)$. *L'exponentielle de A*, notée $e^A$, est définie par $ e^A = sum_(i=0)^pinf A^i/i! $

#thm() Soient $A, B in Mn(K)$
- $e^A$ est normalement convergente ($e^A$ est bien définie)
- $e^(0_Mn(K)) = I_n$

- $D = mat(a_1, , 0; , dots.down, ; 0, , a_n)$, alors $e^D = mat(e^(a_1), , 0; , dots.down, ; 0, , e^(a_n))$

- $N^p = 0 imp e^N = sum_(i=0)^(p-1) N^i/i!$

- $A = P B Pm imp e^A = P e^B Pm$

- $A e^A = e^A A$

- Soit $f(t) = e^(t A), alors f'(t) = A f(t) = f(t)A$

- Si $A B = B A, alors e^(A+B) = e^A e^B$

- $e^A$ est inversible, d'inverse $e^(-A)$

#demo()[
  admis
]

#rq() $A in Mn(K), chi_A$ scindé $imp A = D+N, D N = N D$

$Donc e^A &= e^D e^N\
&= P e^D'Pm dot P e^N' Pm\
&= P e^D' e^N' Pm$

#ex()[
$A = mat(3,2,4;-1,3,-1;-2,-1,-3)$

$D' = mat(-1, 0, 0;0,2,0;0,0,2), N' = mat(0,0,0;0,0,-1;0,0,0), (N')^2 = 0\
P = mat(-1, -2, 0;0,-1,1;1,1,2)$

$e^D' = mat(e^(-1),0,0;0,e^2,0;0,0,e^2), e^N' &= sum_(i=0)^1 (N')^i/i!\
&= I_3+N'\
&= mat(1,0,0;0,1,-1;0,0,1)$

$e^A = P (e^D' dot e^N')Pm$


]