#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *

#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 5 — Actions de groupes])

#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
= I. Définitions et exemples
#def() Soit $X$ un ensemble et $G$ un groupe\
Une *action* de G sur X est une application 

$G times X &--> X\
(g, x) &ass g dot x$\
avec :
- $forall x in X, 1_G x = x$
- $forall x in X, forall g, h in G, g(h x) = (g h)x$\
On note $G agit X$ quand G agit (ou opère) sur X

#prop() G groupe, X, Y deux ensembles\
- Si $G agit Y alors G agit Fr(X, Y)$
  $"via" (g dot f)(x) = g f(x)$

- Si $G agit X$ alors $G agit Fr(X, Y) "via" (g dot f)(x) = f(gm x)$

#demo()[
*1.*\
$G agit Y$, on a $(1_G dot f)(x) = 1_G f(x) = f(x), donc 1_G dot f = f$

$"De plus," (g dot (h dot f))(x) &= (g dot (h f)(x))\ &= (g (h f)(x))\
&= ...\
&= ((g dot h) dot f)(x)$

*2.* (pareil)
]

#prop() $G agit X imp G agit Pr(X)$\

$"via" G times Pr(X) &--> Pr(X)\
(g, A) &ass g dot  A = {g a | a in A}$
#pagebreak()
#prop() G groupe, X ensemble\
*1.* On suppose $G agit X$\
Pour $g in G$, on définit :

$rho_g : X &--> X\
x &ass g x$\
Alors $rho_g in Sym(X)$ ($=Bij(X)$)

$et rho : G &--> Sym(X) "est un morphisme de groupes"\
g &ass rho_g$

*2.* Réciproquement, si $rho : G --> Sym(X)$ est un morphisme

$alors G times X &--> X &"définit une action de groupes"\ 
(g, x) &ass rho(g)(x)$

*3.* Cette correspondance action $arrow.wave.l.r$ morphismes est bijective

#demo()[
*1.* On peut prouver que $forall g, h in G, rho_g rho_h = rho_(g h)$ ($star$)\
Ainsi $rho_g rho_gm = id_X$\
et $rho_gm rho_g = id_X$ donc $rho_g in Sym(X)$\
Finalement $rho : G --> Sym(X)$ est un morphisme par $(star)$

*2.*\
$forall x in X, 1_G x = rho(1)(x) &= 1_(Sym(X))(x)\
&= id_X (x) " ("rho "est un morphisme)"$\
$1_G x = x$

$forall g, h in G, forall x in X, g(h x) &= rho(g)(h x)\
&= rho(g)(rho(h)(x))\
&= (rho(g)rho(h))(x)\
&= rho(g h)(x) " (morphisme)"\
&= (g h)(x)$

*3.* ça se voit wlh (pas moi qui le dit c'est le prof)
]

#def() Une action est *fidèle* si le morphisme associé est injectif\
$ie forall g in G, rho_g = id_X imp g = 1_G$

#rq() ⚠️ Si $forall g in G, forall x in X, (g x = x imp g = 1_g)$, alors on dit que l'action est *libre*\
(libre $imp$ fidèle, mais fidèle $arrow.double.not$ libre)

#ex()[
$Sn agit RR^n$\
$sigma(x_1, ..., x_n) = (x_sigma(1), ..., x_sigma(n))$\
Si $forall x in RR^n, sigma(x) = x, alors sigma = 1_Sn$\
L'action est fidèle
]

= II. Orbites et stabilisateurs

== 1. Orbite

#def() $G agit X$. L'*orbite* de $x in X$ est $G dot x = Orb_G (x) = {g dot x | g in G}$\
On note $X\/G = {Orb_G (x) | x in X}$ l'ensemble des orbites.

#rq()
- $forall x in X, x = 1_G dot x donc x in Orb_G (x)$
- $Si OrbG (x) = {x}$, on dit que l'orbite de $x$ est *triviale*

#ex(1)[
$G agit G$ par translation ($g dot h = g h$)\
Mq $forall h in G, Orb(h) = G$\
Soient $h, h' in G, g := h' hm in G$\
On a $h' = g dot h in Orb(h)$\
Donc $Orb(h) = G$
]

#ex(2)[
$H sg de G, H agit G$ par translation ($h dot g = h g$)\
Les orbites sont les sous ensembles de la forme $H g, g in G$ (cf chap suivant wlh)
]

#ex(3)[
$G agit G$ par conjugaison ($g dot h = g h gm$)

$Orb(h) &= {g h gm | g in G}\
&= {"elems de conjugaison"}\
&= "classe de conjugaison"\
G\/G &= {"classes de conjugaison"}$
]

#ex(4)[
$Sn agit [|1, n|] " " (sigma dot i = sigma(i))$\
- $forall i in [|1, n|], Orb_Sn (i) = [|1, n|] " " (mat(i, j) dot i = j)$
- $Soit sigma in Sn$, On a $<sigma> agit [|1, n|]$\
 Les orbites pour l'action de $<sigma>$ sont les $sigma$-orbites du chap précédent\
 $Orb_(<sigma>) (i) = {sigma^k (i) | k in ZZ}$
]

#ex(5)[
$GL_n (RR) agit M_n (RR)$ par conjugaison $(P dot M = P M Pm)$\
$M in M_n (RR)$ est diagonalisable ssi $Orb(M)$ contient une matrice diagonale
]

#ex(6)[
$GL_n (RR) times GL_n (RR) agit M_(m, n) (RR) via (P, Q) dot M = P M Qm$

Toute orbite possède une unique matrice de la forme $mat(I_r, 0; 0, 0), r = rg(M)$
]
#pagebreak()
#prop() Une action $G agit X$ induit une *relation d'équivalence* "$tilde$" sur $X$

$"définie par" x tilde y &ssi y in Orb_G (x)\
&ssi exists y in G, y = g dot x$\
En particulier :
- $y in Orb(x) ssi Orb(y) = Orb(x)$
- L'ensemble $X\/G$ des orbites forme une partition de $X$,\ 
  ainsi si $X$ est fini, alors $exists x_1, ...,x_n in X tq X = union.big.sq_(i=1)^n Orb(x_i)$

#demo()[
- $x in Orb(x) donc forall x in X, x tilde x$
- Si $x tilde y, alors exists g in G tq y = g x$
  donc $exists g' in G tq x = g' y" " (g' = gm)$\
  donc $forall x, y in X, x tilde y => y tilde x$
- Si $cases(y = g x, z = h y) alors z = h(g x) = (h g) x in Orb(x)$\
  $donc x tilde y et y tilde z imp x tilde z$

$tilde$ est une relation d'équivalence
]

#ex(1)[
$< sigma > agit [|1, n|], sigma in Sn$\
On retrouve le fait que les $sigma$-orbitres forment une partition de $[|1, n|]$ (cf DCSD)
]

#ex(2)[
$RR agit CC via x dot z = x + z$\
(cas particulier $H agit G$)\
On a vu que les orbites sont les $H g$

$donc CC &= union.sq.big Orb(z)\
&= union.big.sq_(z in CC) RR + z$
]

#ex(3)[
$UU agit CCE via u dot z = u z$\
les orbites sont les $UU z, z in CC$\
$CC^times = union.big.sq {"cercles centrés en 0"}$
]

#def() $G agit X$\ 
S'il existe une unique orbite, on dit que l'action est *transitive*

#prop()

 $G agit X "transitive" &ssi exists x in X, Orb(x) = X\
&ssi forall x in X, Orb(x) = X$
#pagebreak()
#demo[
$redimprev$ clair

$redimp$\
Soit $x in X, Orb(x) = X, soit y in X$\
On veut mq $ Orb(y) = X$\
On a $y in Orb(x) donc Orb(y) in Orb(x) = X$
]

#ex(1)[
$G agit G$ par translation, et $Sn agit [|1, n|]$ sont transitives
]

#ex(2)[
$GL_n (RR) agit RR^n$ n'est pas transitive car $Orb(0) = {0} != RR^n$
]

#ex(3)[
En revanche $GL_n (RR) agit RR^n\\{0}$ est bien définie et transitive
]

== 2. Stabilisateur

#def() $G agit X$. Le *stabilisateur* de $x in X$ est \
$G_x = StabG(x) = {g in G | g x = x} subset G$

#ex(1)[
$G agit G$ par conjugaison

$Stab(h) &= {g in G | g dot h = h}\
&={g in G | g h gm = h}\ 
&= {g in G | g h = h g}$\
Ainsi $Stab(h) = C_G (h)$ est le centralisateur de ${h}$ dans $G$ (cf chap 2)
]

#ex(2)[
$G agit Pr(G)$ (hérité de $G agit G$ par conjugaison)\
$forall A subset G, Stab(A) = N_G (A)$ (normalisateur de A dans G — cf chap 2)
]

#ex(3)[
$Sn agit [|1, n|], Stab(n) = {sigma in Sn | sigma(n) = n}$ est en bijection avec $Sym_(n-1)$
]

#prop()
- $forall x in X, StabG(x)$ est un sg de G
- $soient x, y in X, Orb(x) = Orb(y) imp Stab(x) et Stab(y)$ sont conjugués dans G\
  Plus précisément, $forall g in G, Stab(g dot x) = g Stab(x) gm$

#rq() ⚠️ On peut avoir $Stab(x) et Stab(y)$ conjugués mais $Orb(x) != Orb(y)$ (cf $RR agit CC$)

#pagebreak()
#demo[
*1.*\
- On a $Stab(x) subset G$ par def
- Si $g, h in Stab(x), alors (g h)x = g(h x) = g x = x$\
  $g h in Stab(x)$
- Si $g in Stab(x), alors g x = x donc x = gm x$\
  $g in Stab(x) imp gm in Stab(x)$
$Stab(x) sg de G$

*2.*\
Soit $h in G$

$h in Stab(g x) &ssi h (g x) = g x\
&ssi gm h g x = x\
&ssi gm h g in Stab(x)\
&ssi h in g Stab(x) gm$

Donc $Stab(g dot x) = g Stab(x) gm$
]

#def() On dit que $G agit X$ est *libre* si tous les stabilisateurs sont triviaux\ ($forall x in X, StabG(x) = {1_G}$) \
ie $forall x in X, forall g in G, g x = x imp g = 1_G$\

"liberté, mon cul ; égalité, mon cul ; fraternité, mon cul" — un grand homme

#rq()\
*libre* : $forall g in G, forall x in X, (g dot x = x imp g = 1)$\
*fidèle* : $forall g in G, (forall x in X, g dot x = x) imp g = 1$

#prop() Soit $phi : G --> Sym(X)$ le morphisme d'action\
$ker phi = inter.big_(x in X)Stab(x)$\
En particulier l'action est libre, alors elle est fidèle

#demo[
Soit $g in G$

$"On a" g in ker phi &ssi phi(g) = 1_Sym(X) = id_X\
&ssi forall x in X, g x = x\
&ssi forall x in X, g in Stab(x)\
g in ker phi &ssi g in inter.big_(x in X)Stab(x)$

La seconde assertion découle du fait que l'action est fidèle si ker $phi$ = {1}
]

#ex(1)[
$Sn agit RR^n$ ($sigma dot mat(x_1, ..., x_n) = mat(x_sigmam(1), ..., x_sigmam(n))$)\
On a vu que cette action est fidèle, mais elle n'est pas libre\ car $Stab mat(x, ..., x) = Sn != {1}$
]

#ex(2)[
$G agit G$ par translation ($g dot h = g h$) est libre
]

#ex(3)[
$G agit G$ par conjugaison ($g dot h = g h gm$)\
Cette action est libre ssi $G = {1}$\
$redimprev$ ok ($Stab subset {1}$)

$redimp$ $Stab(1) = {1}$\
et $forall g in G, g dot 1 = g 1 gm = 1$\
Donc $ g in Stab(1), donc g = 1$
]

#ex(4)[
$GL_n(RR) agit RR^n$ par automorphisme ($M dot x = M x$)

On a $mat(1, 1; 0, 1) in Stab mat(1; 0) != {I_2}$\
Donc l'action n'est pas libre
]

#def() G groupe, X ensemble\
On dit que X est un *espace affine* sur G si G agit sur X de façon libre et transitive

#def() Une action est *simple* lorsqu'elle est libre et transitive

#rq() Dans ce cas, $forall x, y in X, exists ! g in G tq y = g x$

#ex[
le groupe $RR_ev^n$ agit sur $RR_aff^n$ par translation de façon libre et transitive\ (c'est $G agit G$ par transition)\
Ainsi $forall M, N in RR_aff^n, exists ! in RR_ev^n tq N = M + arrow(u)$\
On note $arrow(u) = arrow(M N)$ (ne dépend que de M et N)

$Ainsi forall M, N, P in RR_aff^n, "on a" P &= M + arrow(M P)\
N + arrow(N P) &= (M + arrow(M N)) + arrow(N P)\
&= M + (arrow(M N) + arrow( N P)) " par def d'une action"$\
Donc par liberté, $arrow(M P) = arrow(M N) + arrow(N P)$ (Relation de Chasles)
]
#pagebreak()
== 3. Relation orbite-stabilisateur

#thm() $G agit X$, on suppose G fini\
+ *Relation orbite-stabilisateur*\
  $forall x in X, Card G = Card Stab(x) Card Orb(x)$

+ *Formule des classes*\
  Si $X$ est fini, et $X = union.big.sq_(i = 1)^n Orb(x_i)$\
  $Alors Card X &= sum_(i=1)^n Card Orb(x_i)\
  &= sum_(i=1)^n (Card G)/(Card Stab(x_i))$

#demo[
*2.* découle directement de 1.

*1.* Soit $x in X$\
On considère l'application surjective

$f : G &--> Orb(x)\
g &ass g x$\
$f$ n'est pas un morphisme donc n'a pas de noyau\
en revanche $forall g, g' in G, f(g) = f(g') ssi gm g' in Stab(x)$\
Ainsi l'application induite par $f$ sur l'ensemble quotient $G\/Stab(x)$ est injective

$Donc Card G\/Stab(x)= (Card G)/(Card Stab(x)) = Card Orb(x)$
]

#ex(1)[
$GL_2(p) agit {"sev de dim 1 de" (ZZ\/pZZ)^2}$\
$arrow.squiggly$ nb de droites dans $(ZZ\/pZZ)^2$\
$arrow.squiggly "Dobble"^copyright$
]

#ex(2)[
p premier impair\
On veut déterminer le nombre de matrices diagonalisables de spectre ${-1, 1}$\
ie ${M in M_2(p) | D := mat(1, 0; 0, -1) in Orb(M)}$\ pour l'action $GL_2(p) agit M_2(p)$ de conjugaison\
ie on veut $Card Orb(D)$

On a $Card Orb(D) = (Card GL_2(p))/(Card Stab(D))$

$Card GL_2(p) = (p^2-1)(p^2-p) = p(p-1)^2(p+1)$

$M in Stab D &ssi M D = D M\
&ssi mat(a, b; c, d)mat(1, 0; 0, -1) = mat(1, 0; 0, -1)mat(a, b; c, d)\
&ssi mat(a, -b; c, -d) = mat(a, b; -c, -d)\
&ssi cases(b = -b, c = -c)\
&ssi b = c = 0\
&ssi M = mat(a, 0; 0, d), a, d != 0$\
Ainsi $Card Stab(D) = (p-1)^2$

Donc $#rect(stroke:green)[Card Orb D = p(p+1)]$
]

#ex(2)[
Si $Card G = p^n$, p premier\
$G agit G$ conjugaison, $G = union.big.sq Orb(x_i)$\
On sait que $Card Orb(x_i) | Card G$

$Donc Card Orb(x_i) &= p^(n_i), n_i in [|0, n|]$\
On remarque que $Card Orb(x_i) = 1 ssi x_i in Z(G)$
]

#ex("3 — thm de Cauchy")[
G fini, soit p premier qui divise $Card G$.\
Alors $G$ possède un élément d'ordre p

On regarde l'action de $Sym_p agit G^p "  " (sigma dot (g_1, ..., g_p) = (g_sigmam(1), ..., g_sigmam(p)))$\
On restreint cette action au sous-groupe $"<"sigma">"$ avec $sigma = mat(1, 2, ..., p)$\
Le sous-ensemble $E = {(g_1, ..., g_p) in G^p | g_1 g_p = 1}$ est stable par $sigma$\ et on regarde $#eng[$sigma$] agit E$
]

#pagebreak()
= III. Formule de Burnside

#def() $G agit X$\
Le *fixateur* de $g in G$ est $Fix(g) = {x in X | g x = x} subset X$

#rq() $g in G$, $x in Fix(g) ssi g x = x ssi g in Stab(x)$

#lemme("de Burnside")

$"nb d'orbites" = Card(X\/G) = 1/(Card G) sum_(g in G) Card Fix(g)$

#demo[
On calcule de deux façons $Card E$ avec $E = {(g, x) in G times X | g x = x}$

*1.*\
$Card E &= sum_((g, x)in E) 1\
&= sum_(g in G) sum_(x in X\ g dot x = x) 1\
&= sum_(x in X) sum_(g in Stab(x)) 1\
&= sum_(x in X) Card Stab(x)$

On a $X = union.big.sq_(Omega in X\/G) Omega$ (formule des classes : les orbites partitionnent $X$)

$Donc Card E &= sum_(x in X)(Card G)/(Card Orb(x)) = sum_(Omega in X\/G) sum_("      "x in Omega\ "ie" Orb(x) = Omega) (Card G)/(Card Orb(x))\
&= sum_(Omega in X\/G) sum_(x in Omega) (Card G)/(Card Omega)\
&= sum_(Omega in X\/G) (Card G)/(Card Omega) sum_(x in Omega) 1 = Card G sum_(Omega in X\/G) 1\
&= Card G.Card(X\/G)$

*2.*\
$Card E &= sum_(g in G)sum_(x in X\
g dot x = x)1\
&= sum_(g in G)sum_(x in Fix(g))1 = sum_(g in G) Card Fix(g)$
]




