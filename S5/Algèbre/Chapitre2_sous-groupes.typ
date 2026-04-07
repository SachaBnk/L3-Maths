#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../../titres.typ": *

#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 2 — Sous-groupes, sous-groupes engendrés\ et ordre d'un élément]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
= I. Sous-groupes

#def() Soit $G$ un groupe. On dit qu'un sous ensemble $H$ de $G$ est un *sous-groupe* de $G$ si :
- $1_G in H$
- $forall a, b in H, a b in H$
- $forall a in H, a^(-1) in H$

En pratique pour montrer qu'un ensemble $G$ est un groupe, on montre qu'il est un sous-groupe d'un groupe $cal(G)$ connu (ex : $ZZ et RR$). En particulier :
- Pas besoin de vérifier l'assiociativité
- Pour $g in G$, on sait deja que $g^(-1)$ existe dans $cal(G)$ et il suffit de montrer qu'il est dans $G$.

#prop() Soit $H subset.eq G$.\ 
La partie $H$ est un sous-groupe de $G$ si et seulement si :
- $1_G in H$
- $forall a, b in H, a b^(-1) in H$

#remarque() Si la loi est notée additivement, la condition devient \ $forall a, b in H, a - b in H$.

#tpreuve()
#set text(blue)

#text(red)[$arrow.double$]

- $H$ est un sous-groupe de $G$ donc $1_G in H != emptyset$
- Soient $a, b in H$. On a $b^(-1) in H "et" a in H, "donc" a b^(-1) in H$

#text(red)[$arrow.double.l$]

Soit $a in H != emptyset$\
On sait que $a a^(-1) = 1_G in H$

Ainsi $1_G a^(-1) in H$\
Ainsi $b in H$ alors $b^(-1) in H$ et $a (b^(-1))^(-1) = a b in H$.

#finpreuve()
#set text(black)


#def() 
- Si $G$ est un groupe, alors ${1_G}$ est toujours un sous-groupe de $G$ qu'on appelle le *sous-groupe trivial*.
- De plus un sous groupe $H subset.neq G$ est appelé *sous-groupe propre* de $G$.

Par exemple, on verra dans ce chapitre que si $G$ est un groupe de cardinal $p$ premier, alors $G$ n'admet pas de sous-groupe propre.
#pagebreak()
#texemple()
#set text(green)
$ZZ$ est un sous-groupe de $QQ$ qui est un sous-groupe de $RR$ qui est un sous-groupe de $CC$

\ \
#texemple() Soit $n in NN$\
Le sous ensemble $n ZZ = {n k | k in ZZ}$ est un sous-groupe de $ZZ$.

En effet :
- $0 = n 0 in n ZZ$
- $n k+n k' = n(k+k') in ZZ$
- $-(n k) = n(-k) in ZZ$

(On verra en TD que tout sous-groupe de $ZZ$ est de cette forme.)

\ \
#texemple() $RR^*$ n'est pas un sous-groupe de $RR$ car $0 in.not RR^*$

\ \
#texemple() Soit $n in NN^*$\
Le groupe $mu_n (CC) = {z in CC | z^n = 1}$ est un sg de $CC^*$\
En effet : 
- $mu_n subset CC^*$
- $1 in mu_n$
- Si $z, z' in mu_n$ alors $(z z')^n = z^n z'^n = 1$ donc $z z' in mu_n$
- Si $z in mu_n$ alors $(z^(-1))^n = (z^n)^(-1) = 1$ donc $z^(-1) in mu_n$


#texemple()\ 
$UU$ = {$z in CC | |z| = 1$} est un sous-groupe de $CC^*$\
En effet :
- $UU subset CC^*$
- $1 in UU$
- Si $z, z' in UU$ alors $|z z'| = |z| |z'| = 1$ donc $z z' in UU$
- Si $z in UU$ alors $|z^(-1)| = 1/(|z|) = 1$ donc $z^(-1) in UU$

de plus $mu_n$ est un sous groupe de $UU$


#texemple() Le sous-ensemble $H$ des matrices de $M_n (CC)$ des matrices de trace nulle est un sous-groupe de $M_n (CC)$.\
- $0 in H$
- Si $A, B in H$ alors $tr(A-B) = tr(A) - tr(B) = 0 - 0 = 0$ donc $A-B in H$
- Si $A in H$ alors $tr(-A) = -tr(A) = 0$ donc $-A in H$

\ \
#texemple() Le sous-ensemble $U_n (CC)$ de $M_n (CC)$ formé des matrices triangulaires supérieures de diagonale $1$ est un sous-groupe de $G L_n (CC)$ (voire de $S L_n (CC)$).\

\ \
#texemple() \
L'ensemble $cal(R) = {mat(cos theta, -sin theta; sin theta, cos theta) | theta in RR}$ est un sous-groupe commutatif de $S L_2 (RR)$

(on utilise les formules d'addition)

#finexemples()
#set text(black)

#prop() L'ensemble $Z(G) = {z in G | forall g in G, g z = z g}$ est un sous-groupe de $G$ appelé *centre* de $G$.

#remarque() $z in Z(G) arrow.double.l.r z "commute avec tous les éléments de" G$


#tpreuve()
#set text(blue)

- $forall g in G, g 1 = 1 g = g$ donc $1 in Z(G)$
- $ "Soient" z, z' in Z(G),$\ $forall g in G, (z z')g &= z(z'g)\
&=z(g z')\
&= (z g)z'\
&= (g z)z'\
&= g(z z') arrow.long z z' in Z(G)$
- $"Soit" z in Z(G), "soit" g in G,$ on a\ $z^(-1)g &= z^(-1)(g z z^(-1))\
&= (z^(-1) g z) z^(-1)\
&= (z^(-1) z g) z^(-1)\
&= g z^(-1) arrow.long z^(-1) in Z(G)$

#finpreuve()
#set text(black)

Déterminer le centre d'un groupe est en général un problème difficile. 

#set text(green)
#texemple() $G "est abélien" arrow.double.l.r Z(G) = G$

\
#texemple() $Z(G L_n (RR)) = {a I_n | a in RR*}$\
(pour $n = 2$, on utilise les matrices $mat(1, 1; 0, 1)$ et $mat(1, 0; 0, lambda), lambda != 0$)

\ \
#texemple() On verra que pour $n > 3$, on a $Z(frak(S)_n) = {I_(frak(S)_n)}$

#finexemples()
#set text(black)

#prop() soit $G$ un groupe, $A subset.eq G$\
1. L'ensemble $C_G (A) := {g in G | forall a in A, a g = g a}$ est un sous-groupe de G, appelé *centralisateur* de $A$ dans $G$. C'est l'ensemble des éléments de $G$ qui commutent avec tous les éléments de $A$.\
2. L'ensemble $N_G (A) := {g in G | g A g^(-1) = A}$ est un sous-groupe de $G$, appelé *normalisateur* de $A$ dans $G$.

#tpreuve() #text(blue)[exo]

#remarque() $g A = {g a | a in A}$


#texemples()
#set text(green)
- $C_G ({1}) = G$

- $C_G (G) = Z(G)$
#set text(black)

#remarque() $Z(G) subset C_G (A) subset N_G (A)$

#prop() L'intersection d'une famille de sous-groupes reste un sous-groupe.

#tpreuve()
#set text(blue)

Soit$I$ un ensemble et $(H_i)_(i in I)$ une famille de sous-groupes de $G$.

*but* : $H := display(inter.big_(i in I)) H_i$ est un sous-groupe de $G$

- $H != emptyset &"car" 1 in H\
&"car" forall i in I, 1 in H\
&"car" H_i "est un sg"$

- Soient $a, b in H$\ On a $forall i in I, a, b in H_i$\ donc $forall i in I, a b^(-1) in H_i$ car $H_i$ est un sg.\ Donc $a b^(-1) in H$ 
donc $H$ est un sg de $G$.

#finpreuve()
#set text(black)

#rq() $H union K$ n'est en général pas un sous-groupe de $G$. (comme les sous-espaces vectoriels)

#texemple() #set text(green) 
$2ZZ inter 3ZZ = 6ZZ$ mais $2ZZ union 3ZZ$ n'est pas un sg de $ZZ$ \ ($2 + 3 = 5 in.not 2ZZ union 3ZZ$)

#set text(black)

#thm("de Lagrange")\
Soit $G$ un groupe fini et $H$ un sous-groupe de $G$. \ Alors le $"card"(H)$ divise $"card"(G)$.

#set text(green)
#texemple() Si $"card"(G)$ est un nombre premier, alors ${1} "et" G$ sont les seuls sous-groupes de $G$.\ 
(Pour la même raison, on verra bientot que de tels groupes sont nécessairement commutatifs.)

#texemple() Si p est premier, $p > n$ et $k in NN*$\
Alors $frak(S)_n$ ne possède pas de sous-groupe de cardinal $p^k$.
#set text(black)

#rq() ⚠️ Si $d | "card"(G)$, il n'existe psa nécessairement de sous-groupe de cardinal $d$ dans $G$.

#texemple() 
#set text(green)
$"card"(frak(A)_4) = (4!)/2 = 12$ ne contient pas de sous-groupe de cardinal $6$.

#set text(black)
= II. Sous-groupes engendrés
\
#texemple() #set text(green)
$forall n in ZZ^*, n = 1+...+1$ (n fois) donc $ZZ$ est engendré par ${1}$.
#set text(black)

#def() Soit $G$ un groupe et $S$ une partie de $G$. L'intersection de tous les sous-groupes de $G$ contenant $S$ est appelée le *sous-groupe de $G$ engendré par $S$* et est notée $<S>$.\
Si $S = {S_1, ..., S_n}$ on note aussi $<S_1, ..., S_n>$.

$<S> = display(inter.big_(H "sg de" G\ H supset.eq S)) H$

#rq() En pratique on ne va pas souvent utiliser cette definition pour manipuler $<S>$.

#prop() Soit $G$ un groupe et $S subset.eq G$. 
1. $S subset.eq <S>$

2. le sous-groupe $<S>$ est le plus petit sous-groupe de $G$ contenant $S$.\ Ainsi si $H$ est un sg de $G$, alors $H supset.eq S ssi H supset.eq <S >$.

3. Si $T subset.eq G$, $<S> subset <T> ssi S subset <T>$\
 en particulier si $T supset.eq S$, alors $<T> supset.eq <S>$.

#tpreuve()
#set text(blue)

*1.*

Soit $cal(H)$ l'ensemble des sous-groupes de $G$ qui contiennent $S$.\
$<S> = display(inter.big_(H in cal(H))) H$\

$"Ainsi" forall H in cal(H), H supset.eq S$

Donc $display(inter.big_(H in cal(H))) H supset.eq S$


*2.*

#text(red)[$arrow.double$]

On a $H supset.eq <S>$\
Dp 1. $H supset.eq S$

#text(red)[$arrow.double.l$] On pose $H supset.eq S$

On a donc $H in cal(H)$\
donc $<S> = display(inter.big_(K in cal(H)))K = H inter display(inter.big_(K in cal(H)\ K != H))K subset.eq H$\
donc $<S> subset.eq H$. (cela montre également la 1ère partie de l'assertion)

*3.*

$<T>$ est un sous-groupe donc $<T> supset.eq <S> ssi <T> supset.eq S$ (dp 2.)\
De plus si $T supset.eq S$ alors $<T> supset.eq T supset.eq S$ (dp 1.)\
Donc $<T> supset.eq S$ donc $<T> supset.eq <S>$

#finpreuve()
#set text(green)

#texemple() Dans $ZZ$ on a \
- $<2> = 2ZZ$ 
- $<2, 3> = ZZ$ car $1 in <2, 3>, "donc" <1> = ZZ subset.eq <2, 3>$

#set text(black)

#prop() Soit $G$ un groupe, $S subset.eq G$ ($S$ n'est pas nécessairement un sous-groupe)
1. Si $S = emptyset$ alors $<S> = <1_G>$

2. Si $S != emptyset$\ $"Alors" <S> &= {x_1x_2 ... x_n | n in NN, forall i in [|1, n|], x_i in S union S^(-1)}\
&= {x_1^(plus.minus 1)x_2^(plus.minus 1) ... x_n^(plus.minus 1) | n in NN, forall i in [|1, n|], x_i in S}$

#rq() $S^(-1) = {s^(-1) | s in S}$

#tpreuve()
#set text(blue)

*1.*

${1_G}$ est un sg de $G$ qui contient $emptyset$.\
Si $H$ est un sg de $G$ (qui contient $emptyset$), alors $H supset.eq {1}$\
$"Donc" <emptyset> &= display(inter.big_(H "sg de" G))H \
&= {1} inter display(inter.big_(H "sg de" G\ H != {1}))H\ &= {1}$


*2.*

Soit $cal(S)$ l'ensemble décrit dans l'énnoncé (flemme de le recopier).\
*but* : Mq $cal(S) = <S>$

$star$ Mq $cal(S)$ est un sg de $G$

- $S != emptyset$ donc si $x in S$ alors $x in cal(S)$ par def ($n=1$)

- Soient $a, b in cal(S)$\ $exists m in NN, exists x_1, ..., x_m in S "tq" a = x_1^(plus.minus 1)...x_m^(plus.minus 1)$\ $exists n in NN, exists x_1, ..., x_n in S "tq" b = y_1^(plus.minus 1)...y_n^(plus.minus 1)$\ On a $a b = x_1^(plus.minus 1)...x_m^(plus.minus 1)y_1^(plus.minus 1)...y_n^(plus.minus 1) in cal(S)$

- Si $c in cal(S)$ alors $c = z_1...z_p, z_i in S union S^(-1)$\ $c^(-1) = z_1^(-1)...z_p^(-1), z_i &in S^(-1) union (S^(-1))^(-1)\
&= S^(-1) union S$ \ donc $c^(-1) in cal(S)$

$star$ Mq $cal(S) = <S>$

On a déjà cu que $cal(S) supset.eq S "donc" cal(S) supset.eq <S>$ car $cal(S)$ est un sous-groupe.

Soit $x in cal(S)$.\
On a $x = x_1...x_n, "avec" x_i in S union S^(-1) subset.eq <S>$ (dp 1.)\
Donc $x in <S>$ par produit.

#finpreuve()
#set text(black)

#rq() 

$FF_2 &= <a, b>\
&= {x_1...x_n | x_i in {a, a^(-1), b, b^(-1)}, n in NN}$\
groupe libre à deux éléments . 

#rq() Si la loi de $G$ est notée additivement, \
$<S> &= {x_1+...+x_n | n>=0, forall i in I, x_i in S union -S}\
&= {pm x_1pm...pm x_n | n>=0, forall i in I, x_i in S}$

#rq() Si $x in G$ alors $<x> = {x^k | k in ZZ}$

#set text(green)
#texemple() Dans $ZZ\/10ZZ$, on a $overline(9) = overline(-1)$\ 
donc $<overline(9)> = <overline(-1)> = ZZ\/10ZZ$

#texemple() On a $overline(9) = overline(-1) "dans" (ZZ\/10ZZ)^times$ (groupe multiplicatif)\
$"Et" <overline(9)> = <overline(-1)> &= {(overline(-1))^k | k in ZZ }\
&= {pm 1}$\
Donc $"card"<overline(9)> = 2$


#texemple() $<(overline(1), 2)> subset.eq ZZ\/2ZZ times CC^*$\

$"On a" <(overline(1), 2)> &= {(k overline(1), 2^k) | k in ZZ}\
&= {(overline(k), 2^k) | k in ZZ}\
&= {(overline(0), 2^k) | k in ZZ)} union {(overline(1), 2^k) | k in ZZ}$

#texemple() $<mat(1, 1; 0, 1)>subset.eq G L_2(RR)$ (loi multiplicative)\

$<mat(1, 1; 0, 1)> &= {mat(1, 1; 0, 1)^k | k in ZZ}\
&= {mat(1, k; 0, 1) | k in ZZ}$

#tpreuve() #text(blue)[recurrence sur $n in NN$ et calcul de l'inverse]
\
\
#texemple() $<mat(overline(1), overline(1);overline(0), overline(1))> subset G L_2(p)$ ($p$ premier)\

$<mat(overline(1), overline(1);overline(0), overline(1))> &= {mat(overline(1), overline(k);overline(0), overline(1)) | k in ZZ}\
&= {mat(overline(1), alpha;overline(0), overline(1)) | alpha in ZZ\/p ZZ}$\

$"card" <mat(overline(1), overline(1);overline(0), overline(1))> = p$\
#rappel() $"card"G L_2(p) = p(p-1)^2(p+1)$


#texemple() Le rubik's cube de ses grands morts\
Le groupe G des permutations du Rubik's cube est engendré par les mouvements des faces.\
$G = <R, L, F, B, U, D>$\
On a en fait $G = <R, L, F, B, U>$\
En remarquant que $D = gamma_(gamma_(R L)(F^2 B^2))(U)$\
avec $gamma_X (Y) = X Y X^(-1)$

#set text(black)

#def() Soit $n >= 3$ dans le plan affine euclidien on considère :
- la rotation $r$ de centre $O$ d'angle $(2 pi)/n$
- une symétrie axiale $s$ passant par $O$
Le groupe engendré $<r, s> subset.eq G L_2(RR)$ est le *groupe diédral* $D_n$


#question() récupérer les schémas
#set text(green)

#texemple() n = 3\

<  schéma 1 >

$s r s(A) &= s r (A)\
&= s(B)\
&= C\
&= r^(-1) A$

#texemple() n = 4

< schéma 2 >

$s r s (A) &= s r(D)\
&= s(A)\
&= D\
&= r^(-1)(A)$

#set text(black)

#prop() Le groupe diédral $D_n$ est le groupe des isométries qui laissent invariant le polygone régulier à n sommets.\
On a : 
- $r^n = s^2 = 1_D_n (= id_(RR^2))$
- $s r s = r^(-1) ("i.e." s r = r^(-1) s, r s = s r^(-1))$
- $card(D_n) = 2n$\
 $"et" D_n &= {r^i | i in {0, ..., n-1}} union {s r^i | i in {0, ..., n-1}}\
 &= {r^i | i in {0, ..., n-1}} union {r^i s | i in {0, ..., n-1}}$

#def() $G$ un groupe\
- Un *commutateur* de $G$ est un élément de la forme \
 $[x, y] = x y x^(-1) y^(-1), pour x, y in G$
- Le *groupe dérivé* noté $D(G)$ de $G$ est le groupe de $G$ engendré par les commutateurs

#rq() $G$ abélien $ssi D(G) = {1}$\
Lien avec résolution d'équations polynomiales (groupe résolubles)

#def() On dit que $G$ est *monogène* si $exists a in G tq G = <a>$
\
Si de plus $G$ est fini, on dit que $G$ est *cyclique*.

#prop()
- Le groupe $ZZ$ est monogène et $k$ engendre $ZZ$ ssi $k = pm 1$
- Pour $n >= 1$, le groupe $(ZZ\/n ZZ)^times$ est cyclique\
 et $overline(k)$ engendre $ZZ\/n ZZ$ ssi $overline(k) in (ZZ\/n ZZ)^times$ ssi $pgcd(k, n) = 1$


 #set text(blue) 
 #tpreuve() 
*1.*

$forall n in ZZ, n &= n(1)\
&= (-n)(-1)$\
Donc $<1> = < -1> = ZZ$\
Donc $ZZ$ monogène.

Réciproquement, si $k in ZZ tq < k> = ZZ$\
alors $1 in <k>$ donc $exists u in ZZ tq 1 = u k$\
Donc $k = pm 1$

*2.*

$ZZ\/n ZZ$ est cyclique car fini ($card = n$)\
et $forall overline(k) in ZZ\/n ZZ, overline(k) = k overline(1) in <overline(1)>$\
donc $ZZ\/n ZZ = <overline(1)>$

$Soit overline(k) in ZZ\/n ZZ tq <overline(k)> = ZZ\/n ZZ$\
Ainsi $overline(1) in <overline(k)> "donc" exists u in ZZ\/n ZZ tq overline(1) = u overline(k)$\
donc $overline(k) in (ZZ\/n ZZ)^times$

Réciproquement, si $overline(k) in (ZZ\/nZZ)^times$\
alors $exists u in ZZ\/n ZZ tq overline(1) = u overline(k)$\
$"donc" forall overline(l) in ZZ\/n ZZ, overline(l) &= l overline(1)\
&= l u overline(k) in <overline(k)>$\
Donc $<overline(k)> = ZZ\/n ZZ$

#finpreuve()
#set text(black)

#rq() Si $G = < x >$ alors $G = {x^k | k in ZZ}$ mais il peut y avoir des répétitions\
(par ex $k, l tq x^k = x^l$)

#set text(green)
#texemple() Le groupe $mu_n = {z in CC^* | z^n = 1}$ est cyclique engendré par $e^((2i k pi)/n)$ ssi $pgcd(k, n) = 1$\
(en particulier, $mu_n = <e^((2i k pi)/n)>$)

#texemple() On a vu $(ZZ\/10 ZZ)^times = {pm overline(1), pm overline(3)}$\
$"On a" overline(3)^4 &= ...\
&= overline(1)$\
$ZZ\/10 ZZ$ cyclique

#texemple() $(ZZ\/2 ZZ)^2$ n'est pas cyclique car $forall a in (ZZ\/n ZZ)^2, 2a = 0$,\
ainsi $<a> = {0, a} != (ZZ\/2ZZ)^2$\
(de même, $(ZZ\/8 ZZ)^times$ ,n'est pas cyclique)


#texemple() On verra que si $p$ est premier, $(ZZ\/p ZZ)^times$ est cyclique.

#texemple() Le groupe $QQ$ n'est pas monogène.
#set text(black)


#prop() Si $G = <x>$\
 alors pour $a, b in G$, il existe $k, l in ZZ tq a = x^k, b = x^l$\
 ainsi $a b = x^k x^l = x^l x^k = b a$

= III. Ordre d'un élément

#rq() Résumé au début du TD2 (Romain Gicquaud le goat)

#def() Soit $G$ un groupe et $g in G$
- On dit que $g$ est d'ordre fini s'il existe $n>=1 tq g^n = 1_G$\
 L'ordre de $g$ est alors $o(g) = min{n>=1 | g^n = 1_G}$
- Si $g$ n'est pas d'ordre fini, on note $o(g) = pinf$

#rq() On parle généralement de l'ordre d'un groupe pour parler de son nombre d'éléments (on verra que $o(g) = card<g>$)

#rq() Si la loi de $G$ est notée additivement, on a $o(g)= min{n >= 1 | n g = 0_G}$

#set text(green)
#texemple() 
- Dans $(CC, times)$, on a $o(i) = 4$

- Dans $(CC, +)$, on a $o(i) = pinf$

- Dans $(ZZ\/6ZZ, +)$, on a $o(overline(2))=3$

- Dans $(ZZ\/9ZZ, times)$, $o(overline(2))=6$

#rq() On remarque que $<overline(2)> = (ZZ\/9ZZ, times), donc (ZZ\/9ZZ)$ est cyclique.

- Dans $G L_2(CC)$, la matrice $A = mat(0, -1; 1, 0)$ est d'ordre 4.\
 En revanche $B = mat(1, 1; 0, 1) in GL_2(CC)$ est d'ordre infini

- Dans $GL_2(2)$, la matrice $A' = mat(0, 1; 1, 0) = overline(A)$ est d'ordre 2\
 et $B' = overline(B) = mat(1, 1; 0, 1)$ est d'ordre infini

- Dans $D_4$ (groupe diédral), la rotation $r "d'angle" pi/2$ est d'ordre 4\
 et la symétrie axiale $s$ est d'ordre $2$

#texemple() le rubik's cube de ses grands morts, le retour\
Dans le groupe des permutations du Rubik's cube :
- un mouvement de base est d'ordre 4
- le mouvement $R U' R U$ est d'ordre 105 (peut etre je comprend pas ses notations)
- le mouvement "PLL(U)" (osekour) est d'ordre 3

#set text(black)


#prop() $Soit a in GG "d'ordre" n$

$Si d|n, alors b = a^d "est d'ordre" n/d$

#tdemo()
#set text(blue)
Tout d'abord, on a $b^(n/d) = (a^d)^(n/d) = a^n = 1$ (car $d|n$)\
$donc o(b) #text(red)[$<=$] n/d$

Si maintenant $1 <= k <= n/d$,\
$b^k = (a^d)^k = a^(k d) != 1$ (car $1 <= d k <= n et a$ d'ordre $n$) 
#finpreuve()

#texemple()\
#set text(green)
On a vu que $o(overline(2)) = 6$ dans $(ZZ\/9ZZ, times)$\

$donc o(overline(4)) &= o(overline(2)^2)\
&= 6/2\
&= 3$

#set text(black)

#prop() Pour tout $a in G$, on a $o(a) = o(a^(-1))$

#tdemo()
#set text(blue)

$forall k >= 1, a^k = 1 &ssi (a^k)^(-1) = 1\
&ssi a^(-k) = 1\
&ssi (a^(-1))^k$

#finpreuve()
#set text(black)
#pagebreak()
#prop() $forall g in G$, $o(g) = card<g>$\
plus précisément :
- $Si o(g) < pinf$ alors l'application\

 $alpha : [|0, o(g)-1|] &--> <g>\
 i &arrow.bar.long g^i$
 est une bijection\
 en particulier $<g> = {1, g, ..., g^(o(g)-1)}$

- $Si o(g) = pinf, alors, beta : ZZ &--> <g>\
 i &associe g^i$\ est une bijection

#tdemo()
#set text(blue)
*2.*\
Supposons d'abord que $o(g) = pinf$\
L'application $beta$ est surjective d'après la prop décrivant les éléments d'un sg engendré.

Mq $beta$ est injective :\
$"soient" i, j in ZZ &tq beta(i) = beta(j)\
&i.e. g^i = g^j$\
Par symétrie on peut supposer $i <= j$\
On a $g^i = g ^j$\
donc $1 = g^(j-i)$\
Ainsi $j-i >= 0 tq g^(j-i) = 1$\
Or $o(g) = infy donc i = j$\
$beta$ est injective\
$beta$ est surjective.

*1.*\
Supposons maintenant que $n = o(g) < infy$\
Mq $alpha$ est injective.\
Soient $i, j in {0, ..., o(g)-1} tq g^i = g^j$\
On pose par symétrie $i <= j$\

On a $cases(g^(j-i) = 1, 0 <= j-i <= n) donc i = j$\
Donc $alpha$ injective

Mq $alpha$ est surjective.\
Soit $x in <g>$. Comme pour $beta$, on sait qu'il existe $k in ZZ tq x = g^k$\
On écrit la division de k par n : \
$ k = n q + r, r in {0, n-1} $\
$"Ainsi" x = g^k &= g^(n q + r) \ &= g^r\ &= alpha(r)$\
Donc $alpha$ est surjective

#finpreuve()
#set text(black)

#rq() Si la loi de $G$ est notée additivement,\ 
alors $<g> = {0, g, 2g, ..., (o(g)-1)g}$

#corollaire() $Soit G$ un groupe fini.\
- Pour tout $g  in G$, $o(g) | card G$,\
 en particulier $g^(card G) = 1$\
- De plus tous les éléments de $G$ sont d'ordre fini.

#tdemo()
#set text(blue)
$<g> subset.eq G $ donc $o(g) = card<g> != pinf$\
$o(g) = card<g>$ divise $card G$ par le théorème de Lagrange,\
Ainsi $card G = n.o(g)$\
$donc g^(card G) &= g^(n.o(g))\
&= 1$

#finpreuve()
#set text(black)

#rq() Il existe des groupes infinis dans lesquels tous les éléments sont d'ordre fini.\
par exemple, dans $(ZZ\/2ZZ)^NN = Fr(NN, ZZ\/2ZZ)$, tous les éléments $!= 1$ sont d'ordre 2.

#set text(green)
#texemple() 
- $forall x in ZZ\/n ZZ, o(x)|n$

- $forall y in (ZZ\/n ZZ, times), o(y)|phi(n)$\
 Ainsi $o(overline(2))|6$

#texo() 
#set text(blue)
Prouver que un mouvement du rubik's cube ne peut pas etre d'ordre 53\
Indication : numéroter les étiquettes non-centrales\
#set text(green)
(eh non hein)
#set text(black)

#prop() Soit $G$ un groupe, si $card G$ est *premier*,
alors $G$ est *cyclique*.\
Plus précisément, $forall a in G\\{1}, <a> = G$

#tdemo()
#set text(blue)

$a != 1 donc o(a) > 1. \ "Or" o(a) | G et G "est premier" donc o(a) = p = card<a>\
donc <a> = G$ 

#finpreuve()
#set text(black)

#prop() $x in G$ d'ordre fini.\
$Soit d in NN^*$
- $Si x^d = 1, alors o(x) | d$
- $o(x^d) = o(x)/pgcd(o(x), d)$

#rq() On a vu que $si d | o(x), alors o(x^d) = o(x)/d$\
c'est un cas particulier du *2.*

#tdemo() 
#set text(blue)
*1.*\
On fait la division euclidienne de $d$ par $o(x)$\
$d = o(x)q + r, avec 0 <= r < o(x)$\
on veut mq $r = 0$\
$"On a" 1 = x^d &= x^(o(x)q+r)\
&= (x^o(x))^q x^r\
&= 1^q x^r\
1&= x^r$\
Donc $r = 0$ par minimalité de $o(x)$.

*2.*\
On note $Delta = pgcd(o(x), d) donc Delta|d$\
$->$ on veut mq $o(x^d) | o(x)/Delta$

$"On a" (x^d)^(o(x)/Delta) &= x^(d.o(x)/Delta)\
&= (x^o(x))^(d/Delta)\
&= 1$

$->$ on veut mq $o(x)/Delta | o(x^d)$\
$(x^d)^(o(x^d))=1$\
$x^(d.o(x^d))=1$\
$donc o(x) | d.o(x^d)$ (d'après *1.*)\
$donc o(x)/Delta | d/Delta o(x^d)$\
Or $Delta = pgcd(o(x), d)$ donc $o(x)/Delta et d/Delta$ sont premiers entre eux\
Donc $o(x)/Delta | o(x^d)$ d'après le théorème de Gauss

#finpreuve()
#set text(black)

#rq() Si la loide $G$ est notée additivement, \
$forall x in G, forall n in NN^*, n x = 0 imp o(x) | n$

#set text(green)
#texemple() Pour $overline(4) in ZZ\/10ZZ$, on a $5times overline(4) = overline(20) = overline(0)$\
donc $o(overline(4)) | 5$, Or 5 est premier, et $overline(4) != 0$\
donc $o(overline(4)) = 5$ 

#texemple() mq $o(overline(3)) = 4$ dans $(ZZ\/10ZZ, times)$

#set text(black)

#corollaire() Soit $x in G$ d'ordre fini $n$\
- Les générateurs de $<x>$ sont les $x^k pour k in [|1, n|]$ premiers à $n$.\
 Il y a donc $phi(n)$ générateurs.

- Plus généralement, si $d | n$ alors les éléments de $<x> "d'ordre" d$ sont les $x^k pour pgcd(k, n) = n/d$\
 Il y en a $phi(d)$

#tdemo()
#set text(blue)
On a vu $o(x^k) = n/pgcd(n, k)$

1. $= n ssi pgcd(n, k) = 1$

$"2."= d &ssi pgcd(n, k) = n/d\
&ssi k = k'.n/d avec k' in [|1, d|], pgcd(k', d) = 1$

#finpreuve()
#set text(black)

#corollaire() Si $n >= 1 alors sum_(d | n) phi(d) = n$

#tpreuve()
#text(blue)[
$ZZ\/nZZ = union.big_(d | n) {"éléments d'ordre d"}$\
Or d'après *2.* $Card {"éléments d'ordre d"} = phi(d)$ dp *2.*
]

#finpreuve()

#prop() $Soient G$ un groupe, $a, b in G$ qui commutent.\
Si $x$ est d'ordre $a$, et $y$ d'ordre $b$, avec $pgcd(a, b) = 1$\
Alors $x y$ est d'ordre $a b$

#tdemo()
#text(blue)[
$"On a" (x y)^(a b) &= x^(a b)y^(a b)= 1.1 = 1$\
*Donc $o(x y) | a b$*

Avec $k=o(x y)$,\
$(x y)^k = 1\
donc x^k y^k = 1\
donc x^k = y^(-k) = z in G$\
$"On a" z in <x> donc o(z) | card<x> = a\
et z in <y> donc o(z) | card<y> = b$\
$"Or" pgcd(a, b) = 1 &donc o(z) = 1 \ &donc z = 1$\
Ainsi $x^k = 1 donc a | k$\
et $y^(-k) = 1 donc y^k = 1 et b | k$\
Or $a$ et $b$ sont premiers entre eux\
*Donc $a b | k = o(x y)$*
]

#finpreuve()

#lemme() Soit $p$ un nombre premier, et $n in NN^*$\
L'équation $x^n = overline(1)$ possède au plus $n$ solutions $x in ZZ\/pZZ$

#tdemo()
#text(blue)[
Sur $RR$ un polynôme de degré $n$ possède au plus $n$ racines\
Soit $Q in ZZ\/pZZ[X]$ de degré $n$\
Si $alpha in ZZ\/pZZ$ est de racine $Q$, on écrit la division euclidienne de $Q$ par $(X - alpha) :$\
$Q = (X - alpha)S + R, avec deg(R) <= 0$\
On a $R(alpha) = 0 donc R = 0 et Q = (X-alpha)S$\
$deg S = deg Q - 1$

De plus, si $beta != alpha$ est racine de $Q$, alors\
$Q(beta) = (beta - alpha)S(beta) = overline(0)$\
donc $beta-alpha = overline(0) ou S(beta) = overline(0)$ *car p est premier*\
Donc l'ensemble des racines de $Q$ est l'ensemble des racines de $S$ union ${alpha}$
]

#finpreuve()

#rq() Si p n'est pas premier, le résultat n'est pas forcément vérifié, par exemple les 4 éléments de $(ZZ\/8ZZ, times)$ vérifient $x^2 = overline(1)$

#thm() Soit $p$ premier\
Le groupe $(ZZ\/pZZ, times)$ est *cyclique* (d'ordre p-1)

#tdemo()
#text(blue)[

$Soit d | (p-1)\ Soit N_d in NN, "le nombre d'éléments de" (ZZ\/pZZ, times) "d'ordre d"$\
On suppose $N_d >= 1$ : on va mq $N_d = phi(d)$ 

Par hypothèse, on peut trouver $x in (ZZ\/pZZ, times)$ d'ordre $d$\
Ainsi les éléments de $<x>$ sont d'ordre divisant $d$\
De plus, $forall y in <x>, y^d = 1, (d = o(x) = card<x>)$\
Ainsi les éléments de $<x>$ sont exactement les solutions de l'équation $z^d = 1$ pour $z in ZZ\/pZZ$ d'après le lemme\
Ainsi si $y in (ZZ\/pZZ, times)$ est d'ordre $d$ alors $y^d = 1$\
donc $y in <x>$

$"Ainsi" N_d &= card {"éléments de" (ZZ\/pZZ, times) "d'ordre d"}\ 
&= card {"éléments de" <x> "d'ordre d"}\
&= phi(d)$

Ainsi , $forall d | p-1, N_d = 0 ou N_d = phi(d)$\
$"Ainsi" sum_(d | p-1) phi(d) = p-1 = sum_(d | p-1) N_d$\
$forall d, phi(d) >= N_d$\
$donc phi(d) = N_d$\
$donc N_(p-1) = phi(p-1) >= 1$
]

#finpreuve()

