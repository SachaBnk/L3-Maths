#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Calcul Différentiel*])
#align(center, text(15pt)[Intro : Rappels de Topologie]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}

$E$ un espace vectoriel

#def() Une *norme* sur $E$ est une conction $norm(.) : E --> RRP$ telle que
- $forall x in E, forall lambda in RR, norm(lambda x) = abs(lambda)norm(x)$
- $forall x, y in E ,norm(x + y) <= norm(x) + norm(y) "(inégalité triangulaire)"$
- $forall x in E, norm(x) = 0 imp x = 0_E$
$(E, norm(.))$ est appelé *espace vectoriel normé*

#ex()[
$E=RRn$

$norm1(x) = sum_(i=1)^n abs(x_i)$

$normi(2, x) = sqrt(sum_(i=1)^n abs(x_i)^2)$


$norminf(x) = max_(i in [|1, n|]) abs(x_i)$
]

#thm("de Cauchy-Schwarz")\
Définissons sur $RRn$ le produit scalaire $scal(x, y) = sum_(i=1)^n x_i y_i$\
de sorte que $normi(2, x) = sqrt(scal(x, x))$

Alors, $forall x, y in RRn, abs(scal(x, y)) <= norm(x) dot norm(y)$

#def() $(E, norm(.))$ evn\
Pour $r > 0 et x  in E$ on définit la *boule* $B(x, r) = {y in E, norm(x-y)<r}$\


#rq() $B(r) = B(0, r)$

#def() $Omega in E$ est dit *ouvert* si $forall x in Omega, exists r > 0, B(x, r) subset Omega$

#def() $(E, normi(E, .)) et (F, normi(F, .))$ deux evn\
$Omega$ ouvert de $E$\
$f : Omega --> F, x in Omega$\
On dit que $f$ est *continue en $x$* si\
$forall epsilon > 0, exists eta > 0, forall y in Omega, normi(E, x-y) < eta imp normi(F, f(x)-f(y)) < epsilon$
#pagebreak()
#def() $0 in Omega subset E$\
$g : Omega --> E$\
$g(h) = o_(h-->0)(h) &ssi normi(F, g(h))/normi(E, h)-->_(normi(E, h)-->0)0\
&ssi exists epsilon : Omega --> F, epsilon(h) -->_(normi(E, h)-->0)0 et g(h) = normi(E, h)epsilon(h)$

#thm() $(E, normi(E, .)) et (F, normi(F, .))$ evn\
$L : E --> F$ linéaire\
Si $E$ est de *dimension finie*, alors $L$ est continue sur $E$

#thm() Les assertions suivantes sont équivalentes :
- L est continue sur E
- L est continue en 0
- $exists C > 0, forall h in E, norm(L(h))_F <= C norm(h)_E$

#preuve()[
*1 $imp$ 2* évident

*2 $imp$ 3*\
On suppose L continue en 0\
$forall epsilon > 0, exists eta > 0, forall h in E, norm(h-0)_E < eta imp norm(L(h)-L(0))_F < epsilon$\
En particulier avec $epsilon = 1$\
$exists eta > 0, forall h in E, norm(h)_E < eta imp norm(L(h))_F < 1$\
On fixe un tel $eta > 0$\
- Pour $h = 0$, on a $norm(L(h))_F = norm(L(0))_F = 0$, on a bien ce qu'on veut

- Pour $h != 0$, $norm(h)_E > 0$

  Le vecteur $k = eta/(2norm(h)_E)h$ vérifie $norm(k)_E = eta/2 < eta$

  Donc $norm(L(k))_F < 1$\
  Or, par linéarité de $L$\
  $L(k) = eta/(2norm(h)_E)L(h)$

  et donc $norm(L(k))_F = eta/(2norm(h)_E)norm(L(h))_F$

  Donc $norm(L(k))_F < 1$ implique que $norm(L(h))_F < 2/eta norm(h)_E$
#pagebreak()
*$3 imp 1$*\
On suppose que $exists C > 0, forall h in E, norm(L(h))_F <= C norm(h)_E$\
Soit $h_0 in E$, par linéarité de $L$\
$forall h in E, L(h-h_0) = L(h)-L(h_0)$\
et donc $forall h in E, norm(L(h)-L(h_0))_F <= C norm(h-h_0)_E$\
càd $L$ est $C$-lipschitzienne donc (uniformément continue donc) continue sur $E$
]

#rappel() Pour $dim E < pinf$, toute application linéaire $L:E-->F$ est continue

#def() On note $Lr(E, F)$ *l'espace vectoriel des applications linéaires continues* de $E$ dans $F$\
On peut munir cet espace d'une norme


#def()\
Soit $L in Lr(E, F)$, la quantité $normt(L)$ définit une norme sur $Lr(E, F)$\
avec $normt(L) = inf {C>0 | forall h in E, norm(L(h))_F <= C norm(h)_E}$

#prop() (admise)

$normt(L) &= min {C>0 | forall h in E, norm(L(h))_F <= C norm(h)_E}\
&= sup_(h in E\ h!= 0) norm(L(h))_F/norm(h)_E\
&= sup_(h in E\ norm(h)_E <= 1) norm(L(h))_F\
&= sup_(h in E\ norm(h)_E = 1) norm(L(h))_F$

#prop() importante\
Si on trouve $C > 0 tq forall h in E, norm(L(h))_F <= C norm(h)_E$\
alors $L$ est continue et $normt(L)<=C$

#prop() $Phi : E --> F, Psi : F --> G$ deux applications linéaires continues\
L'application linéaire $Psi rond Phi$ est continue, et\
$norm(Psi rond Phi)_(Lr(E, G)) <= norm(Psi)_LEF dot norm(Phi)_(Lr(F, G))$

#preuve()[
Soit $x in E$\
$norm((Psi rond Phi) (x))_G &<= norm(Psi)_(Lr(F, G)) dot norm(Phi(x))_F\
&<= norm(Psi)_(Lr(F, G)) dot norm(Phi)_LEF dot norm(x)_E$\
On a bien la continuité de $Psi rond Phi$ dp la prop précédente
]




