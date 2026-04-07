#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 1 — Anneaux]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

#import "@preview/commute:0.3.0": node, arr, commutative-diagram

= I. Anneaux, corps et sous-anneaux

#def() Un anneau $(A, +, dot)$ est un ensemble muni de deux lois de composition interne "+" et "$dot$" tel que
- $(A, +)$ est un groupe abélien
- "$dot$" est associative
- "$dot$" est distributive sur "+"
- $1_A$ in A

#ex(1)[
- $ZZ, RR, ZZ[X], ZsnZ$ anneaux commutatifs
- $M_n (RR)$ anneau non commutatif
]

#rq() ⚠️ Il n'y a pas toujours l'inverse de $a in A$ pour "$dot$" ⚠️ (par exemple dans $ZZ$)

#prop()
- $0_A$ est unique
- $forall a in A, -a$ est unique
- $1_A$ est unique
- $Soit a in A$, s'il existe $a^(-1) in A, alors a^(-1)$ est unique
- $0 dot a = a dot 0 = 0$
- $-(a b) = (-a)dot b = a dot (-b)$

#demo()[
*5.*\
$0 dot a &= (0+0)dot a\ 
&= 0 dot a + 0 dot a$
]

#def() 
$A$ anneau commutatif\
$A$ est un *corps* si tout $a in A \\ {0}$ admet un inverse pour "$dot$"

#prop() A corps\
$forall a in A\\{0}$, l'inverse de $a$ est unique

#prop() $A$ corps\
$forall a, b in A, a b = 0 imp a = 0 ou b = 0$

#def() $A$ anneau commutatif
A est dit *intègre* si \
$forall a, b in A, a b = 0 imp a=0 ou b=0$\
(A n'est pas forcément un corps)

#rq()\
$"corps" &imp "intègre"\
"corps" &arrow.l.double.not "intègre"$
#pagebreak()
#ex(1)[$ZZ[i] = {a + i b | a, b in ZZ}$ (entiers de Gauss) est intègre
]

#ex(2)[
$ZsnZ$ est intègre $ssi n$ est premier

$redimp$ On suppose $ZsnZ$ intègre, $Soit a, b in ZZ tq n | a b$

$ol(a b) = ol(0) imp ol(a)dot ol(b) = 0 imp ol(a) = ol(0) ou ol(b) = ol(0)$ car $ZsnZ$ intègre\
$imp n|a ou n|b$

$redimprev$ Soit $ol(x) in ZsnZ tq ol(x) != ol(0)$

$n divides.not x$\
Bézout : $exists a, b in ZZ tq 1 = a x + b n $\
$ol(1) = ol(a x)+ol(b n) = ol(a x)$
donc $x$ est inversible
]

#def() $(A, +, dot)$ anneau, $B subset A$\
$B$ est un *sous-anneau* si
- $(B, +)$ est un sous-groupe
- $1_A in B$
- $forall b_1, b_2 in B, b_1 b_2 in B$

= II. Ideaux

#def() A commutatif, $I subset A$\
I est un *idéal* si
- $(I, +)$ est un groupe
- I est absorbant ($forall i in I, forall a in A, i dot a in I$)

#rq() Si $A$ n'est pas commutatif\
$a i in I$ idéal à gauche\
$i a in I$ idéal à droite

#ex(1)[\
$A = M_3 (RR)$ non commutatif

$I = {A in M_3(RR) | A mat(1;0;0) = mat(0;0;0)}$

$I$ est un idéal à gauche mais pas à droite
]

#ex(2)[${0_A}, A$ idéaux de $A$]

#prop() Soit $A$ anneau commutatif, $a in A$\
$I = { a x | x in A} = eng(a)$ est un idéal de $A$ (idéal engendré par $a$)

#pagebreak()

#prop() $K "corps" ssi "les seuls idéaux de" K "sont" {0_K} et K$

#demo()[
$redimp$ Soit $K$ un corps, $I$ un idéal de $K$
- Si $I={0_K}$ ok
- Sinon\
  $exists x in I tq x != 0_K$\
  $K$ corps donc $exists x^(-1) in K$\
  $x dot x^(-1) = 1_K$ donc $1_K in I$\
  or $forall a in A, forall i in I, a i in I$ ($I$ idéal)\
  En particulier $forall a in A, a dot 1_K in I$\
  donc $A subset I$, donc $A = I$

$redimprev$ Soit $x in K\\{0_K}$\
Soit $ I = eng(x)$\
$I != {0_K} car x != 0_K$\
Alors $I = K$ par hypothèse\
donc $1_K in I$ \
donc $exists y in K tq 1_K = x y imp x^(-1) = y in K$
]

#prop() Les idéaux de $ZZ$ sont exactment les $nZZ$

#demo()[
- Si $I = 0, alors I = eng(0)$ ok
- Sinon, $exists a in I tq a != 0$\
  Si $a in I, alors -a in I$ ($I$ est un groupe)\
  Soit $S = {x in I | x > 0} != es$\
  Soit $n$ le plus petit éléments de S (existe car $S subset NN$)\
  par l'absurde on suppose $I != nZZ$\
  alors $exists m in I, q in ZZ, 0<r<n tq m = n q + r$\
  $r = m - m q in I$ contradiction car $r < n et n$ plus petit elem de $S$\
  donc $I = nZZ$
]

#prop() $(A, +)$ gp commutatif, $I$ sg de $A$\
$alors I dist A$\
et $(skewed(A/I), +, dot)$ est un anneau
#pagebreak()

#prop() $nZZ subset m ZZ ssi m | n$

#prop() $I, J$ idéaux de $A$, $A$ commutatif
- $I inter J$ idéal de $A$
- $I+J$ idéal de $A$
- $I union J$ pas idéal

#demo()[
*3.* contre-exemple :\
$I = 3ZZ, J = 7ZZ$\
$x = 3 in I union J et y = 7 in I union J$\
$x+y = 10 in.not I union J$
]

#def() $A$ anneau commutatif, $X subset A$ un sous-ensemble quelconque de $A$\
*L'idéal engendré par $X$* est le plus petit idéal qui contient $X$\
On le note $ENG(X)$ (ou $eng(X)$)\
$ENG(X) = inter.big_(I "idéal de" A\ X subset I)I$

#rq() Soit $r in A, X = {r} subset A$

$ENG(X) &= eng(r)\
&= {a r | a in A}$

#prop() A anneau commutatif, $X subset A$

$I = {sum_(l=1)^k a_l x_l | k in NNE, forall a <= l <= k, a_l in A, x_l in X} = ENG(X)$

#preuve()[
*$I$ idéal de $A$*\
- $(I, +)$ sous groupe\
  - Soit $x in X$, $0_A = 0_A dot x in I$
  - Soent $x, y in I$\
    $x = sum_(l=1)^k_1 a_l x_l et y = sum_(m=1)^k_2 b_m tilde(x_m)$

    $x - y = sum_(l=1)^k_1 a_l x_l + sum_(m=1)^k_2 (-b_m) tilde(x_m) in I$ 
#pagebreak()
- Soit $a in A, x in I$

  $a x &= a sum_(l=1)^k a_l x_l\
  &= sum_(l=1)^k (a a_l)x_l in I$

*$X subset I$*\
Pour $x in X, x = 1_A dot x in I$

*$I$ est le plus petit idéal qui contient $X$*\
Soit $J$ idéal de $A$ tq $X subset J$\
On montre que $I subset J$

$forall a in A, forall x in X subset J, a dot x in J\
donc sum_(l=1)^k a_l x_l in J\
donc I subset J$
]

= III. Morphismes d'anneaux

#def() $A, B$ deux anneaux\
$f : A --> B$ est un *morphisme d'anneaux* si\
$forall a_1, a_2 in A$\
- $f(a_1+a_2) = f(a_1)+f(a_2)$
- $f(a_1 dot a_2) = f(a_1) dot f(a_2)$
- $f(1_A) = 1_B$

#rq() $f(0_A)= 0_B$ découle de la définition\
mais les deux premiers points n'impliquent pas $f(1_A)=1_B$

#prop() $A, B$ anneaux commutatifs\
$f : A-->B$ morphisme d'anneaux
- $J$ idéal de $B$ $imp$ $fm(J)$ idéal de $A$
- Si $f$ surjectif et $I$ idéal de $A$, alors $f(I)$ est un idéal de $B$

#preuve()[TD]
#pagebreak()
#ex()[
*Pourquoi "surjectif" ?*\
contre ex, $f : func(ZZ --> RR, n ass n)$\
avec un tel morphisme, $ZZ$ serait idéal de $RR$, ce qui est absurde\
($RR$ est un corps donc ses idéaux sont triviaux)
]

#corollaire() $ker f$ est un idéal de $A$

#demo()[
$ker f = fm({0_B})$
]

#prop() $A$ anneau, $f : ZZ-->A$ morphisme d'anneaux\
$forall k in ZZ, f(k) = k dot 1_A$

#def() *charactéristique* (rattraper)

#prop() $A$ intègre\
$char A =0 ou p$ avec $p$ premier

#demo()[
(cas $char A = 0$ ok)\
$si char A = p != 0$\
Soit $m in NNE$ diviseur de $p$
$m divides p imp exists n in NNE, p = m n$\
$0_A &= p dot 1_A\
&= (n dot 1_A)(m dot 1_A)$\
mais $A$ intègre donc $(n dot 1_A) = 0 ou (m dot 1_A) = 0$

]

#def() $A$ anneau commutatif, $X subset A, X != es$\
L'*idéal engendré* par $X$ est le plus petit idéal qui contient $X$

$(X) = inter.big_(I "idéal de" A\ X subset I) I$

#pagebreak()
= IV. Anneaux principaux

#def() $A$ anneau commutatif\
- Un idéal $I subset A$ est dit *principal* si il y a un élément $x in A$ tq $I = (x)$
- $A$ est principal si il est intègre et que tous ses idéaux sont principaux

= V. Anneaux quotients

#def() $A$ anneau commutatif, $I subset A$ idéal\
$x Rr y ssi x-y in I$ est une relation d'équivalence

On note $ol(x)$ la classe de $x$ par $Rr$

$ol(x) &= {a in A | a Rr x}\
&= {a in A | a-x in I}\
&= x+I$

On définit l'*anneau quotient* de A sur I par $skewed(A/I) = {x+I | x in A}$

#thm("- correspondance des idéaux") $A$ anneau commutatif, $I subset A$ idéal

$pi : func(A &--> skewed(A/I), x &ass x+I = ol(x))$ projection canonique surjective

Il y a une bijection entre ${J "idéaux de" A | J supset I} et {"idéaux de" skewed(A/I)}$


#ex()[
$A = ZZ, I = (6) = 6ZZ$\
idéaux de $ZZ\/6ZZ$ ?

Soit $J$ idéal de $ZZ$ tq $I subset J$\
$exists m in NN tq J = m ZZ$

$6ZZ subset m ZZ &imp m | 6\
&imp m in {1, 2, 3, 6}$
- Cas m = 6

  $pi(6ZZ) &= {x + 6ZZ | x = 6ZZ}\
  &= {0+6ZZ}$
- Cas m = 1

  $pi(ZZ) &= {x+6ZZ | x in ZZ}\
  &= ZZ\/6ZZ$
- Cas m = 2

  $pi(2ZZ) &= {x+6ZZ | x in 2ZZ}\
  &= {0+6ZZ, 2+6ZZ, 4+6ZZ}\
  &= (2+6ZZ)$
- Cas m = 3\
  
  $pi(3ZZ) &= {x+6ZZ | x in 3ZZ}\
  &= {0+6ZZ, 3+6ZZ}\
  &= (3+6ZZ)$
]

#def() A commutatif, I idéal\
- I est dit *premier* si pour $x, y in A, x y in I imp x in I ou y in I$
- I est dit *maximal* si pour tout idéal $J subset A$, $I subset J imp J = I ou J = A$

#ex()[
$A=ZZ, p$ premier\
- $(p)$ est maximal et premier
- ${0}$ est premier mais pas maximal
]

#thm() $A$ commutatif, $I$ idéal, $I != A$\
- $I$ premier $ssi A\/I$ intègre
- $I$ maximal $ssi A\/I$ est un corps
- $I$ maximal $imp I$ premier

#demo()[TD]


#thm() Rattraper

#demo()[
Soit $I$ idéal de $A$, $I != {0}, I != A$\
On suppose $I$ premier\
A est principal donc $exists b in A tq J = (b)$\
$a in I subset J imp a in J imp exists r in A, a = r b$\
Mais $a in I et I "premier" imp r in I ou b in I$
- Cas 1 : $r in I = (a) imp exists k in A tq r = k a$

  $Donc a = r b = k a b &imp a = k b a\
  &imp a(1-k b) = 0\
  &imp^(A "intègre") 1-k b = 0\
  &imp 1 = k b in J\
  &imp J = A$

- Cas 2 : $b in I$\
  Soit $x in J, exists m in A tq x = m h in I$\
  Donc $J subset I donc J = I$

$I$ est maximal
]
#pagebreak()
= VI. Premier théorème d'isomorphisme

#thm() $A, B$ deux anneaux\
$f : A-->B$ morphisme d'anneaux

$ft : func(skewed(A/(ker f)) &--> im f, a+ker f &ass f(a))$ est un isomorphisme

#demo()[
*$ft$ bien définie*\
- $f(a) in im f$

- $a_1 + ker f = a_2 + ker f &imp a_2 - a_1 in ker f\
&imp f(a_2-a_1)=0\
&imp f(a_1) = f(a_2)$

*$ft$ est un morphisme*\
$ft((a_1+ker f) + (a_2 + ker f)) &= ft((a_1+ker f)) + ft((a_2 + ker f))$\
$ft((a_1+ker f) times (a_2 + ker f)) &= ft((a_1+ker f)) times ft((a_2 + ker f))$

*$im ft = im f imp ft$ surjective*\

*$ft$ injective*

$ker ft &= {a+ker f | ft(a+ker f) = 0}\
&= {a+ker f | f(a) = 0}\
&= {a+ker f | a in ker f}\
&= 0+ker f$
]

#pagebreak()
= VII. Corps de fractions d'un anneau commutatif intègre

$A$ anneau commutatif intègre.\
$(a , b) in A times (A\\{0})$\
$(a, b) tilde (c, d) ssi a d = b c$\
cette relation est une relation d'équivalence\
La classe de $(a, b)$ est notée $a/b$

#def() On appelle *corps de fraction* $Frac A = {a/b mid(|) (a, b) in A times(A\\{0})}$

#rq() $i : func(A&-->Frac A, a &ass a/1_A)$

#prop()

- $a/b + c/d = (a d + b c)/(b d)$

- $a/b dot c/d = (a c)/(b d)$

#thm("- Propriété universelle de Frac A")\
$A$ intègre, $K$ corps\
$Soit alpha : A --> K$ morphisme d'anneaux injectif\
alors il existe un *unique* morphisme de corps (injectif donc) $Phi : Frac A --> K$\
$tq phi rond i = alpha$

#demo()[
*Unicité*\
Soit un tel $Phi$ (injectif, $alpha = Phi rond i$)\
$Soit a/b in Frac A$

$Phi(a/b) &= Phi(a/1_A dot 1_A/b)\
&= Phi(a/1_A) dot Phi(b/1_A)^(-1)\
&= Phi(i(a)) dot Phi(i(b))^(-1)\
&= (Phi rond i)(a) dot [(Phi rond i)(b)]^(-1)\
&= alpha(a) dot alpha(b)^(-1)$
#pagebreak()
*eXistenZ*

Soit $Phi : func(Frac A &--> K, a/b &ass alpha(a)dot alpha(b)^(-1))$

- Bien défini :
  - $alpha(b)^(-1) in K donc alpha(a)alpha(b)^(-1) in K$
  - $a/b = c/d imp a d = b c donc alpha(a d) = alpha(b c) donc ... donc Phi(a/b) = Phi(c/d)$

- Morphisme : exo

- Injectif car morphisme de corps (TD)
]

#ex()[

#commutative-diagram(
  node((0, 0), $ZZ$),
  node((0, 1), $QQ$),
  node((1, 0), $Frac A$, "quot"),
  arr((0, 0), (0, 1), $alpha$),
  arr("quot", (0, 1), $Phi$, label-pos: right, "dashed"),
  arr((0, 0), "quot", $i$),
)

(Rattrapper)
]

(Rattrapper)


