#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 1 — Définitions et exemples de base]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
= Exemples de groupes connus

- $(NN, +)$ *n'est pas* un groupe car tous les élements de $NN$ ne possèdent pas de symétrique pour +.
- $(ZZ, +)$ est un groupe #text(blue)[(Marie > Zelda apparemment)]
- $(ZZ\/n ZZ, +)$ est un groupe
- $(RR, +)$ est un groupe
- $(RR^*, times)$ est un groupe
- $(ZZ\/n ZZ, times) = (ZZ\/nZZ)^times$ est un groupe

#remarque() $(ZZ\/n ZZ)^times = {overline(k) in ZZ\/n ZZ | "pgcd"(k, n) = 1}$

- $(M_(m, n)(RR), +)$ est un groupe
- $(G L_n(RR), times)$ est un groupe

= I. Lois de composition interne

Soit $E$ un ensemble non vide.

#def() Une lci sur E est une application $* : E times E arrow.long E$. On note $x * y$ l'image de $(x, y)$ par $*$.\
$forall x, y, z in E$, $*$ peut être :
- *associative* si $x * (y * z) = (x * y) * z$
- *commutative* si $x * y = y * x$

#texemples()
- Toutes les lois données précédemment sont associatives
- La puissance dans $NN^*$ n'est pas associative

#pagebreak()
= II. Groupes

== 1. Définition 

#def() Un groupe est un ensemble $G$ non vide muni d'une lci $*$, tel que :
- $*$ est associative
- $G$ admet un élément neutre $e$ pour $*$\ $forall g in G, g*e = e*g = g$
- Tout élément de $G$ admet un symétrique pour $*$\ $forall g in G, exists g' in G, g*g' = g'*g = e$.

#prop() Soit $(G, *)$ :
+ La loi $*$ admet un *unique* élément neutre noté $1_G$
+ Tout élément $x$ de $G$ admet un *unique* symétrique noté $x^(-1)$

#tpreuve()
#set text(blue)

*1.*\
Soient $e$ et $e'$ deux éléments neutres de $G$.\ 
$e = e * e' = e'$.

*2.*\
Soient $x in G$, $y, y' in G$ des inverses de $x$.\
$y &= y 1_G \ &= y(x y')\
&= (y x)y'\
&=1_G y'\
&= y'$
#finpreuve()
#set text(black)

== 2. Exemples

1. $ZZ, DD, QQ, RR, CC$ sont des groupes s'ils sont dotés de la lci $+$. Le neutre est alors $0$ et le symétrique de $x$ est $-x$.
2. $RR^*, QQ^*, CC^*$ sont des groupes s'ils sont dotés de la lci $times$. Le neutre est alors $1$ et le symétrique de $x$ est $1/x$.
3. $(RR, times)$ n'est pas un groupe car $0$ n'admet pas de symétrique.
4. $(ZZ\/n ZZ, +)$ est un groupe dont l'élement neutre est $overline(0)$ et l'inverse de $overline(i)$ est $overline(-i) = overline(n-i)$. \ Il s'agit d'ailleurs d'un groupe *fini* de cardinal $n$.
5. $mu_n(CC) = {z in CC | z^n = 1}$ doté de la lci $times$ est un groupe d'élément neutre $1$. L'inverse de $z$ est $1/z$.
6. Si E est un ensemble, l'ensemble $frak(S)(E)$ des bijections de $E$ dans $E$ est un groupe pour la lci $circle$. L'inverse de $f in frak(S)(E)$ est la bijection réciproque $f^(-1)$. \ ($f^(-1)(x) = y arrow.double.l.r x = f(y)$)\ $frak(S)(E)$ est fini $arrow.double.l.r E$ est fini, auquel cas $1_frak(S)(E) = Id_E$.
7. Si $X$ est un ensemble et $G$ un groupe, l'ensemble $cal(F)(X, G)$ (ensembles des fonction de $X$ dans $G$) est un groupe pour la multiplication terme à terme \ ($forall x in X, (u v)(x) := u(x)v(x)$)\ Le neutre est $cases(X arrow.long G, x arrow.long.bar 1_G)$ et le symétrique de $u$ est $cases(X arrow.long G, x arrow.long.bar 1/u(x))$.
8. $G L_n (RR)$ est un groupe. Sa loi est $times$ (multiplication de matrices) et le neutre est $I_n$, et l'inverse de $M in G L_n (RR)$ est la matrice inverse $M^(-1)$.
9. $M_n (RR)$ est un groupe pour $+$ (pas pour $times$). le neutre est $0_n$ et l'inverse de $M$ est $-M$.


#prop() L'ensemble $(ZZ\/n ZZ)^times$ est un groupe (muni de la multiplication). Ce groupe est fini, commutatif et $overline(1)$ est son élement neutre. Son cardinal est $phi(n)$ (fonction d'Euler).

#rappels() 
- $phi(n) = "card" ({k in [|1, n|] | "pgcd"(k, n) = 1}$).

- $(ZZ\/n ZZ)^times &= {overline(k) in ZZ\/n ZZ | "pgcd"(k, n) = 1}\
&= {overline(k) in ZZ\/n ZZ | exists K in ZZ\/n ZZ, overline(k)K = overline(1)}$

#tpreuve()
#set text(blue)

- $times$ est une lci car pour $k, l$ premiers à $n$, $k l$ est aussi premier à $n$. (Théorème de Gauss, décomposition en facteurs premiers).
- $times$ est associative car la multiplication dans $ZZ$ est associative, et $overline(k l) = overline(k)overline(l)$.
- $overline(1)$ est l'élément neutre.
$arrow.long$ existence d'un inverse ?\
Soit $overline(k) in (ZZ\/n ZZ)^times$, par définition $"pgcd"(k, n) = 1$.\
Par le théorème de Bézout : \ 
$exists u, v in ZZ, &k u + n v = 1\
&overline(k)overline(u) + overline(n)overline(v) = overline(1)$\
or $overline(n) = overline(0)$.\
D'où $overline(k)overline(u) = overline(1) = overline(u)overline(k)$ par commutativité.\
Donc $overline(k)$ possède un inverse.

$arrow.long$ est ce que cet inverse est dans $(ZZ\/n ZZ)^times$ ?\
$overline(k)overline(u) = overline(1)$ \
donc $overline(k u-1) = overline(0)$\
donc $n | k u - 1$\
donc $exists v in ZZ, k u - 1 = n v$\
donc $k u - n v = 1$\
d'où $"pgcd"(k, n) = 1$ (théorème de Bézout), $overline(k) in (ZZ\/n ZZ)^times$\

$(ZZ\/nZZ, times)$ est un groupe (abélien au passage).
#finpreuve()
#set text(black)

#remarque() Soit $phi$ l'indicatrice d'Euler.

$phi(4) &= "card"{k in [|1, 4|] | "pgcd"(k, 4) = 1}\ 
&= 2\
phi(6) &= 2\
phi(8) &= 4$\
D'où $phi(p) = p-1 arrow.double.l.r "p est premier"$.

#corollaire()\
- Si $p$ est premier, alors $(ZZ\/p ZZ)^times = ZZ\/p ZZ \\ {overline(0)}$
- Si $p$ n'est pas premier, $(ZZ\/p ZZ)^times != ZZ\/p ZZ \\ {overline(0)}$
\
#prop() L'ensemble $S L_2(ZZ)$ des matrices de taille 2 et de déterminant 1 est un groupe infini pour la multiplication de matrices.

#tpreuve()
#set text(blue)
- On rappelle que l'inverse d'une matrice $M = mat(a, b; c, d) in G L_2(RR)$ est $M^(-1) = 1/det(M) mat(d, -b; -c, a)$.\
Donc si $M in S L_2(RR), det(M)=1$, d'où $M^(-1) in G L_2(RR) "et" M^(-1)=mat(d, -b; -c, a)$.\
Or ses coefficients sont entiers donc $M^(-1) in S L_2(RR)$. \
Donc $S L_2(ZZ)$ est stable par l'inversion.\

- $S L_2(RR) != emptyset$ car $I_2 in S L_2(RR)$.\
- $times$ est une lci car $det(S S') = det(S)det(S')$, associative par associativité de la multiplication de matrices.\
- $I_2$ est l'élément neutre.\

Donc $(S L_2(ZZ), times)$ est un groupe (infini car $forall n in ZZ, mat(1, n; 0, 1) in S L_2(RR)$)

#finpreuve()
#set text(black)

#pagebreak()
== 3. Inverses

#prop() Soient $(G, *)$ un groupe, et $a, b, c in G$.\
On a $a b = a c arrow.double.l.r b = c arrow.double.r.l b a = c a$.\
De même l'équation $a x = b$ pour $x in G$ admet une *unique* solution $x = a^(-1) b$.\
/!\\ Cela ne signifie pas que $a b = b a$.

#tpreuve()
#set text(blue)
- $a b = a c arrow.double.l b = c$ :\ Si $b = c$, on multiplie à gauche par $a$ et on obtient $a b = a c$.\
- Réciproquement, si $a b = a c$, on multiplie à gauche par $a^(-1)$ et on obtient $b = c$.

L'autre équivalence se démontre de la même façon.
#finpreuve()
#set text(black)

#prop() Soient $G$ un groupe et $a,b in G$. \
Si $a$ et $b$ commutent, alors $a^(-1)$ commute avec $b$ et $b^(-1)$.\

#tpreuve()
#set text(blue)
On a $a b = b a$\
donc $b = a^(-1)b a$\
donc $b a^(-1) = a^(-1) b$\
donc $a^(-1)$ commute avec $b$.\

On procède de même pour $b^(-1)$.
#finpreuve()
#set text(black)

#theoreme() Théorème de Cayley\
Soient $G$ un groupe et $a in G$.\
Les applications $cases(G &arrow.long G, b &arrow.long.bar a b)$ et $cases(G &arrow.long G, b &arrow.long.bar b a)$ sont bijectives.

#tpreuve()

#set text(blue)
$forall c in G, &exists!b in G, c = a b\
&exists! b in G, c = b a$\
(Unicité du symétrique).
#finpreuve()
#set text(black)

#texemples() les applications suivantes sont bijectives : \

- $ZZ &--> ZZ\
n &arrow.long.bar n + 2025$\
- $RR^* &--> RR^*\
x &arrow.long.bar 122x$
- $frak(S)_n &--> frak(S)_n\
sigma & arrow.long.bar (12)sigma$
- $frak(S)_n &--> frak(S)_n\
sigma & arrow.long.bar sigma(123)$
#pagebreak()

#prop() Soit $G$ un groupe.\
+ $forall x in G, (x^(-1))^(-1) = x$
+ Pour $x_1, ..., x_n in G, (x_1...x_n)^(-1) = x_n^(-1)...x_1^(-1)$

#tpreuve()
#set text(blue)
+ On a $(x^(-1))x = x(x^(-1)) = 1_G$, on a ce qu'on veut par unicité de l'inverse.
+ Wallah c'est une récurrence sur $n in NN^*$ :\
*Initialisation* : pour $n = 1$, c'est évident.\
*Hérédité* : \
cas $n=2$ (on en a besoin plus tard) :\
$(x_1 x_2)(x_2^(-1) x_1^(-1)) = x_1 (x_2 x_2^(-1)) x_1^(-1) = x_1 1_G x_1^(-1) = 1_G$.\
De même $(x_2^(-1) x_1^(-1))(x_1 x_2) = 1_G$.\
Donc $(x_1 x_2)^(-1) = x_2^(-1) x_1^(-1)$.\

On entame l'hérédité :\
On suppose la propriété vraie au rang $n >= 2$.\
On a $(x_1...x_n x_(n+1))(x_(n+1)^(-1) x_n^(-1)...x_1^(-1)) = (x_1...x_n)(x_(n+1) x_(n+1)^(-1)) x_n^(-1)...x_1^(-1) = (x_1...x_n) 1_G x_n^(-1)...x_1^(-1) = 1_G$.\
De même $(x_(n+1)^(-1) x_n^(-1)...x_1^(-1))(x_1...x_n x_(n+1)) = 1_G$.\
Donc $(x_1...x_n x_(n+1))^(-1) = x_(n+1)^(-1) x_n^(-1)...x_1^(-1)$.\
La propriété est donc vraie au rang $n+1$.

#finpreuve()
#set text(black)

#texemple() Le rubik's cube\
$("right"*"up")^(-1) = "up"^(-1) "right"^(-1)$

== 4. Puissances
Soient $(G, *)$ un groupe et $x in G$.\

#def() $x^0 = 1_G$\
$forall n in NN^*, x^n = x * x^(n-1)$\

#prop()\
pour $m, n in NN$ :\
- $x^m x^n = x^(m+n) = x^n x^m$
- $(x^m)^n = x^(m n) = (x^n)^m$

#remarque() Pour l'addition, la puissance est la multiplication.

#prop() pour $n in NN^*, (x^n)^(-1) = (x^(-1))^n$

#tpreuve() 
#set text(blue)
récurrence wallah
#finpreuve()
#set text(black)

#prop() Soient $G$ un groupe, $x, y in G "et" n in ZZ$\
Si $x$ et $y$ commutent, alors $x$ commute avec $y^n$ et $(x y)^n = x^n y^n$.

#tpreuve()
#set text(blue)
wah ça se voit en vrai
#finpreuve()
#set text(black)

#texemple() Le rubik's cube\
right et left commutent.

== 5. Tables de multiplication

$#texemple() "table de multiplucation de" mu_2(CC) &= {z in CC^* | z^2 = 1}\ &= {plus.minus 1} $

#table(
  columns: 3,
  [$times$], [$1$], [$-1$],
  [$1$], [$1$], [$-1$],
  [$-1$], [$-1$], [$1$]
)

#texemple() table d'addition de $ZZ\/3 ZZ$ : 
#table(
  columns: 4,
  [$+$], [$overline(0)$], [$overline(1)$], [$overline(2)$],
  [$overline(0)$], [$overline(0)$], [$overline(1)$], [$overline(2)$],
  [$overline(1)$], [$overline(1)$], [$overline(2)$], [$overline(0)$],
  [$overline(2)$], [$overline(2)$], [$overline(0)$], [$overline(1)$]
)


#remarque() La table de multiplication caractérise le groupe au sens où deux groupes avec la même table (à permutations près des éléments) sont les mêmes (isomorphes).

#texemple() si $G = {a, b, c}$, avec 
#table(
  columns: 4,
  [$*$], [$a$], [$b$], [$c$],
  [$a$], [$a$], [$b$], [$c$],
  [$b$], [$b$], [$c$], [$a$],
  [$c$], [$c$], [$a$], [$b$]
)
alors $G tilde.eq ZZ\/3 ZZ$.

#remarque() Par le thm de Cayley, dans chaque ligne et chaque colone il y a exactement un seul exemplaire de chaque élément du groupe.\ 
$-->$ Cela permet de compléter une table suivant le principe du sudoku. (cf. TD)

#pagebreak()
= III. Produit direct de groupes


#def() Soient $(G, *_G)$ et $(H, *_H)$ deux groupes.\
On définit sur le produit cartésien : $ G times H = {(g, h) | g in G, h in H}$
la loi suivante :\
$forall g, g' in G, forall h, h' in H, (g, h) * (g', h') := (g *_G g', h *_H h')$.\

#prop() $(G times H, *)$ est un groupe appelé *produit direct* de $G$ et $H$.

#tpreuve()
#set text(blue)
- $G times H != emptyset "car" (1_G, 1_H) in G times H$
- $*$ est une lci car $G$ et $H$ sont des groupes, et $*$ est associative par associativité de $*_G$ et $*_H$.
- neutre  : $1_(G times H) = (1_G, 1_H)$ :\
- existense d'un inverse : si $(g, h) in G times H$, alors $(g^(-1), h^(-1)) in G times H$\ et $(g, h)*(g^(-1), h^(-1)) = (1_G, 1_H)$.
Donc $(G times H, *)$ est un groupe.

#finpreuve()
#set text(black)

#remarque() /!\\ ne pas confondre $(g, h)^(-1) "pour" (g, h) in G times H$\
et $(g h)^(-1) "pour" g, h in G$

#remarque() Par recurrence, on peut définir le groupe $G^n$ (ex $ZZ^2 "ou" (RR^*)^3$).\
(On peut remarquer que $G^n tilde.eq cal(F)({1, n}, G)$)

#texemple() $ZZ\/2 ZZ times mu_4$ est un groupe pour la loi $(overline(k), zeta)(overline(k'), zeta') = (overline(k)+overline(k'), zeta zeta')$.\ Le neutre est $(overline(0), 1)$ et l'inverse de $(overline(k), zeta)$ est $(-overline(k), zeta^(-1))$.

#texemple() $RR^* times RR$ est un groupe pour la loi $(x, a)(y, b) = (x y, a + b)$.\ Le neutre est $(1, 0)$ et l'inverse de $(x, a)$ est $(1/x, -a)$.

#texo() table de multiplication de $(ZZ\/2ZZ)^2$ :\

#table(
  columns: 5,
  [$+$], [$(0, 0)$], [$(0, 1)$], [$(1, 0)$], [$(1, 1)$],
  [$(0, 0)$], [$(0, 0)$], [$(0, 1)$], [$(1, 0)$], [$(1, 1)$],
  [$(0, 1)$], [$(0, 1)$], [$(0, 0)$], [$(1, 1)$], [$(1, 0)$],
  [$(1, 0)$], [$(1, 0)$], [$(1, 1)$], [$(0, 0)$], [$(0, 1)$],
  [$(1, 1)$], [$(1, 1)$], [$(1, 0)$], [$(0, 1)$], [$(0, 0)$]
)

#texemple() Le groupe $M_(m, n)(RR)$ est une "réorganisation" de $RR^(m n)$ (isomorphie).

#pagebreak()
#prop()\
- $G times H$ est fini ssi $G$ et $H$ sont finis, et dans ce cas $"card"(G times H) = "card"(G) "card"(H)$
- $G times H$ est abélien ssi $G$ et $H$ sont abéliens

#tpreuve()
#set text(blue)

*2.*\
$G times H "est abelien" &arrow.double.l.r forall (g, h), (g', h') in G times H, (g, h)(g', h') = (g', h')(g, h)\ 
&arrow.double.l.r forall (g, h), (g', h') in G times H, (g g', h h') = (g' g, h' h)\ 
&arrow.double.l.r forall (g, h), (g', h') in G times H,g g' = g' g "et" h h' = h' h\ 
&arrow.double.l.r G "et" H "sont abeliens"$

#finpreuve()
#set text(black)

= IV. Matrices modulaires
$m, n >= 2$

#def() $M_n (m) :=$ le groupe des matrices $n times m$ à coefficients dans $ZZ\/m ZZ$.

#def() L'application de réduction modulo $m$ est l'application\
$M_n (ZZ) &--> M_n (m)\
A=(a_(i, j)) &arrow.long.bar overline(A) = (overline(a_(i, j)))$

#prop() \ 
- $overline(A + B) = overline(A) + overline(B)$
- $overline(A B) = overline(A).overline(B)$

#prop() L'ensemble $M_n (m)$ muni de l'addition est un groupe fini de cardnal $m^(n^2)$.\
neutre : $overline(0) = mat(overline(0), "...", overline(0) ;
dots.v, dots.down, dots.v ;
overline(0), "...", overline(0))$\
l'inverse de $M$ est $-M$

#set text(red)
*Dans la suite on prend $n = 2$ et $m = p$ premier.*
#set text(black)

#def() le *déterminant* de $M = mat(a, b ; c, d) in M_2 (p)$ est $det(M) = a d - b c in ZZ\/ p ZZ$

#remarque() Si $A in M_2 (ZZ) "est tq" overline(A) = M$\
$"Alors" overline(det(A)) &= det(M)\
&= det(overline(A))$

#def() $G L_2 (p) := {M in M_2 (p) | det(M) != overline(0)}$

#texemple() $forall alpha in ZZ\/p ZZ, mat(overline(1), alpha ; alpha, overline(1)) in G L_2(p)$

#prop() On rappelle que p est premier.\
L'ensemble $G L_2(p)$ est un groupe pour la multiplication de matrices.

#tpreuve()
#set text(blue)

- $G L_2(p) != emptyset$ car $overline(I_2) in G L_2(p)$
- Mq la loi est une lci :\ Soient $overline(A), overline(B) in G L_2(p), (A, B in M_N (ZZ))$\ On veut mq $overline(A) overline(B) in G L_2(p)$\ $"On a" det(overline(A).overline(B)) &= det(overline(A B))\
&=overline(det(A B))\
&= overline(det(A)det(B))$\ Par hypothèse, $det(overline(A)) != overline(0)$ et $det(overline(B)) != overline(0)$\ donc $p divides.not det(A) "et" p divides.not det(B)$\ donc $overline(det(A)det(B)) = det(overline(A).overline(B)) != overline(0)$\ donc $overline(A).overline(B) in G L_2(p)$.

- Loi associative par associativité sur $M_2(ZZ)$
- Neutre : $overline(I_2)$
- existence d'un inverse\ Soit $M = mat(a, b; c, d) in G L_2(p)$\ Posons $N := 1/det(M)mat(d, -b; -c, a) in M_2(p)$\ $"On a" N M &= 1/(a d - b c)mat(d, -b; -c, a)mat(d a - b c, d b - b d; -c a + a c, -c b + a d)\
&= 1/(a d - b c)mat(a d - b c, 0; 0, a d - b c)\
&= overline(I_2)$\ On vérifie de meme que $M N = overline(I_2)$.\ Ainsi $det(M N) = det(M)det(N) = det(overline(I_2)) = overline(1)$\ donc $N in G L_2(p)$\ $N$ est bien l'inverse de $M$.

#finpreuve()
#set text(black)

$#prop() G L_2(p) &= {M in M_2(p) | exists N in M_2(p), M N = overline(I_2)}\
&= {M in M_2(p) | exists N in M_2(p), N M = overline(I_2)}$ \ $G L_2(p)$ est un groupe commutatif de cardinal $(p-1)^2p(p+1)$.

#tpreuve()
#set text(blue)

*1.* euh c'est un exemple pas une preuve...?

$A = mat(overline(A), overline(1); overline(0), overline(1))$

$B = mat(overline(1), overline(0); overline(1), overline(1))$

$A, B in G L_2(p)$

$A B != B A "car" 2 != 1 "dans" ZZ\/p ZZ$

*2.* methode "naïve" :\
$"pour" mat(a, b; c, d), a d- b c = alpha != 0$\
Soit $G L_2^alpha (p) = {M in G L_2(p) | det M = 1}$\
pour $alpha in ZZ\/p ZZ\\{overline(0)}$\
On a $M = mat(a, b; c, d) in G L_2 (alpha) arrow.double.l.r a d - b c = alpha$\
$"Ainsi" M in G L_2^alpha (p) &arrow.double.l.r a d = alpha + b c\ 
&arrow.double.l.r cases(d = 0 "et" alpha + b c = 0, 
d != 0 "et" a = (alpha + b c)/d)\
&arrow.double.l.r cases(d = 0 "et" b = -alpha/c #text(black)[(1)],
d != 0 "et" a = (alpha + b c)d #text(black)[(2)])$

La condition #text(black)[(1)] autorise : 
- p valeurs de a
- p-1 valeurs de c
- 1 valeur de d ($d=0$)
- 1 valeur de b ($b=-alpha/c$)

La condition #text(black)[(2)] autorise :
- p-1 valeurs de d ($d != 0$)
- p valeurs de b
- p valeurs de c
- 1 valeur de a ($a = (alpha + b c)/d$)

$"donc" "card" G L_2^alpha (p) &= p(p-1) +(p-1)p^2\ 
&= p(p-1)(1+p)$

$"Ainsi" "card" G L_2(p) &= display(sum_(alpha != 0)) "card" G L_2^alpha (p)\ 
&= display(sum_(alpha != 0)) (p-1)p(p+1)\
&= (p-1)^2p(p+1)$

*2.* autre méthode (plus rapide) :\

pour $G L_n (p), n >=2$

$M = mat(a, b; c, d) in G L_2 (p) arrow.double.l.r "les vecteurs" mat(a; b) "et" mat(c; d) "forment une famille libre"$

$"Ainsi" &mat(a; b) != mat(c; d), forall lambda in ZZ\/p ZZ --> p^2-1 "choix"\
&lambda mat(a; b) != mat(c; d), forall lambda in ZZ\/p ZZ --> p^2-p "choix"$  

$"donc" "card" G L_2(p) &= (p^2-1)(p^2-p)\
&= (p-1)(p+1)p(p-1)$

#finpreuve()
#set text(black)