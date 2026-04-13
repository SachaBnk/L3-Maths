#set text(size: 14pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *

#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 6 — Groupes quotients])

#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

_Idée du quotient :_ On va faire "disparaitre" les aspects de G qui ne nous interessent pas\
Plus précisément on va diviser G en classes d'équivalences avec en bonus l'ensemble des classes qui va être un groupe

= I. Classes modulo un sous-groupe

$a equiv b [n] &ssi n | b-a\
&ssi b - a in nZZ\
&ssi b in a + nZZ$

#def() G groupe, H sous-groupe\
La *congruence* (à gauche) modulo H est\
$forall g, g' in G, g equiv g' mod H ssi gm g' in H$

#prop()\
$g equiv g' mod H &ssi gm g' in H\
&ssi g' in g H\
&ssi Orb(g) = Orb(g') "pour" G agitr H "donné par" g dot h = g h$

#demo[
On a vu au chap 5 que $Orb(g) = g H$
]

#corollaire() La congruence mod H est une relation d'équivalence ; les classes sont de la forme $g H$ pour $f in G$\
$"en particulier", exists g_1, ..., g_n in G tq G = union.big.sq_(i=1)^n g_i H$

#demo[Chap 5]

#def() G groupe, H sg de G\
La classe d'équivalence $g H$ pour $g in G$ est appelée *classe* (à gauche) *modulo H*.\
On note $skewed(G/H) = {g H | g in G}$ l'ensemble des classes modulo H

#rq() on note $H \\ G = {H g | g in G}$ 
#pagebreak()
= II. Théorème de Lagrange

#def() H sg de G\
L'*indice* de H dans G est $[G : H] = Card (skewed(G/H))$\
Si l'indice est fini, on dit que H est d'indice fini dans G

#ex[
- $nZZ$ est d'indice fini dans $ZZ$\
  $[ZZ : nZZ] = n$

- $[Sn : An] = 2$

- $[Sym_3 : eng(mat(1, 2))] = 3$
]

#prop() G groupe fini, H sg de G\
$forall g in G, Card H = Card(g H) = Card (H g)$

#demo[voir thm de Cayley]

#thm("de Lagrange") G groupe fini, H sg de G\
$Card G = Card H times [G : H]$\
en particulier, $Card H | Card G$

#demo[
$Si g_1, ..., g_n$ sont des représentants des classes mod H

alors $G = union.big.sq_(i=1)^n g_i H et Card skewed(G/H) = n$ (nombre de classes)

On sait que $forall g in G, cases(G &--> G, h &ass g h)$ est une bijection (thm de Cayley)

donc $forall i, Card(g_i H) = Card H$

$donc Card G &= sum_(i=1)^n Card (g_i H)\
&= sum_(i=1)^n Card H\
&= n Card H$
]

= III. Sous-groupes distingués

G groupe, H sous-groupe, $skewed(G/H) = {g H| g in G}$\
On voudrait une loi de groupe $star$ sur $GsH$\
$tq forall g, g' in G, (g H)star (g' H) = (g g') H$\

#def() H sg de G\
On dit que H est *distingué* dans G si $forall g in G, g H gm = H$\
On note *$H dist G$*

#prop() H sg de G

$H dist G &ssi forall g in G, g H = H g\
&ssi^((*)) forall g in G, g H gm subset H\
&ssi forall g in G, forall h in H, g h gm in H $

#demo[
Seule ($*$) n'est pas immédiate :\
#redimp ok\
$redimprev$ On a $forall g in G, g H gm subset H$\
$Soit g in G$, on veut mq $g H gm = H$\
#text(red)[*$subset$*] ok\
#text(red)[*$supset$*] On sait que $gm H (gm)^(-1) subset H$\
$donc gm H g subset H\
donc H g subset g H\
donc H subset g H gm$
]

#ex(1)[
Soit $n >= 3 et tau in Sn$ une transposition\
$eng(tau) = {1, tau}$ n'est pas distingué dans $Sn$.\
En effet si $tau'$ est une autre transposition (existe car $n >=3$) alors on sait qu'il existe $sigma in Sn tq tau' = sigma tau sigmam in.not eng(tau)$\
En revanche, $An dist Sn car forall rho in An, forall sigma in Sn, epsilon(sigma rho sigmam) = epsilon(sigma) 1 epsilon(sigmam) = 1$\
$donc sigma rho sigmam in An$
]

#pagebreak()
#ex(2)[
$U = {mat(1, a; 0, 1) | a in RR}$ n'est pas distingué dans $GL_2(RR)$ 

mais est distingué dans $T = {mat(lambda, a; 0, mu) | a in RR, lambda, mu in RRE}$

(source : tkt frr)
]

#prop() G groupe\
- G et ${1}$ sont distingués dans $G$
- Si G est abélien, alors tout sous groupe de G est distingué dans G (sans dec)
- Le centre $Z(G)$ et le groupe dérivé $D(G)$ de G sont distingués dans G
- Si H est un sg de G, alors $H dist N_G (H) = {g in G | g H gm = H}$

#rq() $N_G (H)$ est le plus grand sg de G dans lequel H est distingué

#prop() G groupe, H sg de G\
Si H est d'indice 2 ($= [G:H] = Card GsH$)\
Alors $HdG$

#demo[
$[G:H] = Card(GsH) = 2$

$Ainsi si g in.not H, alors 1 H = H != g H\
donc G = H union.sq (g H)\
"de même" H != H g donc G = H union.sq (H g)\
Ainsi g H = H g\ \ \
"d'autre part", si g in H, alors g H = H = H g\
donc forall g in G, g H = H g\ \ \
donc HdG$
]

#ex(1)[
$An dist Sn car Card An = (Card Sn)/2$
]

#ex(2)[
groupe diédral $D_n = eng(r) union.sq s eng(r)$

On a $eng(r) dist D_n$ d'indice 2 $(skewed(D_n/eng(r)) = {eng(r), s eng(r)})$
]

#pagebreak()
#prop() G, G' groupes, $f : G --> G'$ morphisme
+ $Si H' dist G' alors fm(H') dist G$,\
  en particulier $ker f dist G$
+ si $H dist G et f$ *surjective*, $alors f(H) dist G'$

#demo[
*1.* mq $fm(H') dist G$\
$Soient g in G, h in fm(H')$

$"On a" f(g h gm) &= f(g)f(h)f(gm)\
&in H' car H' dist G'$\
$Ainsi g h gm in fm(H')$ comme voulu

Pour la deuxieme partie, on remarque que $ker f = fm({1})$
]

#ex[
$SL_n (CC) = {M in GL_n (CC) | det M = 1}$ est un sg distingué de $GL_n (CC)$ car $SL_n (CC) = ker det$
]

#ex[
la signature $epsilon : Sn --> CCE$ est un mrophisme donc $An dist Sn$
]

= IV. Groupes quotients 

#thm() G groupe, H sg *distingué* de G

+ L'application $* : cases(GsH times GsH &--> GsH, (g H, g' H) &ass (g g') H)$ est bien définie, et définit une *loi de groupe* sur $GsH$\
  Le neutre est H et $(g H)^(-1) = gm H$

+ L'application $pi : cases(G &--> GsH, g &ass g H)$ est un *morphisme* de groupes, *surjectif*\ et de noyau H

#rq() En pratique on écrira $GsH = {pi(g) | g in G}$ et on oubliera (un peu) les classes
#pagebreak()
#demo[
La notion de sg distingué a été définie pour que ce thm soit vrai (bah super). Il ne reste plus qu'à vérifier qur $ker pi = H$

$forall g in G, g in ker pi &ssi pi(g) = 1_GsH\
&ssi pi(g) = H\
&ssi g H = H\
&ssi g in H$
]

#rq() 
- ⚠️ $GsH$ n'est pas un sg de G (il n'est même pas inclus dans G)
- ⚠️ G abélien $=> GsH$ abélien\
  mais $arrow.l.double.not$

#ex[
$ZZ$ abelien donc $nZZ dist ZZ$\
$->$ on peut former le groupe $ZsnZ$ de cardinal n\ 
car $ZZ = nZZ union (1+nZZ) union ... union (n-1 + nZZ)$
]

#corollaire() G groupe, H sg de G\
H est distingué dans G\ $ssi$\ il existe un groupe G' et un morphisme $f : G --> G' tq H = ker f$

#demo[
$redimprev$ un noyau est toujours dinstingué\
$redimp$ On prend $G' = GsH et f = pi$
]

#pagebreak()
= V. Théorème d'isomorphisme

Le resultat suivant sert à construire des morphismes qui partent d'un quotient (et on ne fait pas autrement)

#thm("de factorisation de morphismes")\
$H dist G, pi : G --> GsH$.\
$Si f : G --> G'$ est un morphisme tel que $H subset ker f$\
$alors "il existe un unique morphisme" hat(f):GsH --> G' tq f = hat(f)rond pi$\
De plus :
+ $ker hat(f) = pi(ker f)$,\ 
  en particulier, $hat(f)$ injectif $ssi$ $ker f = H$

+ $im hat(f) = im f$\ 
  en particulier, $hat(f)$ surjectif $ssi$ $f$ surjectif

#demo[
tout d'abord, pour $g, g' in G$ on a $f(g) = f(g') ssi g'gm in ker f supset H$\
Donc on sait qu'il existe une unique application $hat(f) : GsH --> G' tq f = fc rond pi$

*$fc$ est un morphisme*

$exists a, b in G tq &alpha = pi(a)\
&beta = pi(b)$\
$donc fc(alpha beta) &= fc(pi(a)pi(b))\
&= fc(pi(a b))\
&= f(a b)\
&= f(a)f(b)"   (f morphisme)"\
&= fc(pi(a))fc(pi(b)) = fc(alpha)fc(beta)$

*1.* $Soit alpha in GsH$\
- Supposons $alpha in ker fc, soit a in G tq alpha = pi(a)$\
  On a $fc(alpha) = 1_G$\
  donc $1_G' = fc(pi(a)) = f(a)$\
  $donc a in ker f donc alpha = pi(a) in pi(ker f)$

- Supposons que $alpha in pi(ker f)$\
  par hypothèse, $exists b in ker f tq alpha = ker(b)$\
  on a donc $fc(alpha) = fc(pi(b)) = f(b) = 1_G'$\
  Donc $alpha in ker fc$
  ]

#thm("d'isomorphisme (Corollaire)")\
Soit $f : G --> G'$ un morphisme\
$skewed(G/(ker f))tilde.eq im f$

#demo[$H := ker f dist G$ et on applique le thm précédent]

#rq() C'est ce corollaire qu'on utilise pour montrer un iso du\ type $GsH tilde.eq G'$ : on trouve un morphisme surjectif $G --> G'$ de noyau $H$

#ex(1)[
$det : GL_n (CC) --> CC^times$ morphisme\
- $ker det = SL_n (CC)$
- $det$ est surjectif car $forall lambda in CCE, lambda = det mat(lambda, 0; 0, I_(n-1))$

donc d'après le thm d'isomorphismes, on a $skewed((GL_n (CC))/(SL_n (CC))) tilde.eq CCC$
]

#ex(2)[
On considère le morphisme surjectif $f : cases(delim:"|", ZZ &--> skewed(2ZZ/(6ZZ)), k &ass 2k mod 6)$, obtenu comme la composition des morphismes surjectifs  suivants :

$func(ZZ &--> 2ZZ, k &ass 2 k) "   " pi : func(2ZZ &--> 2 skewed(ZZ/(6ZZ)), k &ass k mod 6)$

$k in ker f &ssi 2k equiv 0[6]\
&ssi 6|2k\
&ssi 3|k$

Plus généralement si $d | n$\
alors $ skewed(d ZZ/(nZZ) tilde.eq ZZ/(unskewed(n/d)ZZ))$
]

#ex(3)[
$n>=2, epsilon : Sn --> CCC$ est un morphisme\ avec $im epsilon : {pm 1} = mu_2 et ker epsilon = An$\
Donc $skewed(Sn/An) tilde.eq mu_2$
]
#pagebreak()
#rq() Si $G agit X$ via le morphisme $phi : G --> Sym(X)$

alors le morphisme induit $skewed(G/(ker phi)) -->^tilde im phi subset Sym(X)$ est injetif

donc correspond à une action fidèle $skewed(G/(ker phi)) agit X$

Par exemple on a pour $GL_n (RR) agit {"sev de dim 1 de" RRn}$\
on a $ker phi = RRE I_n$\
$->$ action fidèle de $P GL_n (RR) := (GL_n (RR))/(RRE I_n)$ sur ${"sev de dim 1 de" RRE}$

#corollaire() $f : G --> G'$ morphisme
+ Si $G$ est fini, alors $Card G = Card(ker f) Card(im f)$
+ Si de plus $G'$ est fini, alors $Card(im f)|pgcd(Card G, Card G')$

#demo[*1.*


$skewed(G/(ker f))tilde.eq im f$

$Card skewed(G/(ker f)) = (Card G)/(Card ker f)$ par Lagrange

*2.*\
$Card im f | Card G$ par (i)\
de plus, $Card im f | Card G'$ par Lagrange
]

#pagebreak()
= VI. Retour sur les groupes monogènes

#prop() Soit G monogène\
+ Si $Card G = oo$, alors $G tilde.eq ZZ$
+ Si $Card G = n in NN, alors G tilde.eq ZsnZ$

#demo[
*2.* Soit $x in G tq G = eng(x)$\
On considère le morphisme injectif $f : func(ZZ&-->G, k &ass x^k)$\
D'après le thm d'isomorphisme, il reste à mq $ker f = nZZ$\
$"Or" forall k in ZZ, x^k = 1 &ssi o(x) | k\
&ssi n|k\
&ssi k in nZZ$

Donc $ker f = nZZ et ZsnZ tilde.eq G$
]

#thm("chinois") Si $m$ et $n$ sont *premiers entre eux*

alors $skewed(ZZ/(m ZZ) times ZsnZ tilde.eq ZZ/(m n ZZ))$

#demo[
On considère le morphisme $f : func(ZZ &--> skewed(ZZ/(m ZZ)times ZZ/(n ZZ)), k &ass (k mod m, k mod n))$

$k in ker f &ssi k equiv 0 [n] et k equiv 0[m]\
&ssi m|k et n|k\
&ssi m n | k$\
$Ainsi ker f = m n ZZ\
et skewed(ZZ/(ker f) = ZZ/(m n ZZ)) tilde.eq im f "    (thm iso)"$\
Ainsi $im f$ est un sg de $skewed(ZZ/(m ZZ) times ZZ/(n ZZ))$

$avec Card im f = m n = Card(skewed(ZZ/(m ZZ) times ZZ/(nZZ)))$

donc $im f = skewed(ZZ/(m ZZ) times ZZ/(nZZ))$
]

#corollaire() Soient $m, n$ premiers entre eux, et $a, b in ZZ$\
Le système $cases(x equiv a [m], x equiv b[n])$ d'inconnue x possède une unique solution modulo $m n$
#pagebreak()
#demo[

$f(x) = (a, b)\ donc si fc :skewed(ZZ/(m n ZZ)) --> skewed(ZZ/(m ZZ) times ZZ/(nZZ))$

alors $fc(x mod m n) = (a, b)$ (unique car $fc$ bij)\
dp le thm d'iso, il reste a mq $ker f = nZZ$

$forall k in ZZ, x^k = 1 &ssi o(x)|k\
&ssi^(Card eng(x) = n) n|k\
&ssi k in nZZ$

donc $ker f = nZZ et ZsnZ tilde.eq G$
]

#exo[
Comment trouver $x$ tel que $cases(x equiv a [m], x equiv b[n])$ ?
][
$f : func(ZZ &--> ZsnZ times ZsnZ, k &ass (k mod m, k mod n))$

induit $fb : func(skewed(ZZ/(m nZZ) &--> &ZZ/(m ZZ) &times &ZsnZ), k mod m n &ass (&k mod m&, &k mod n))$

Soient $a in skewed(ZZ/(m ZZ)), b in ZsnZ$

$"on veut" fb(x) &= (a, b)\
&= a(overline(1), overline(0))+ b(overline(1), overline(0))\
&= f(alpha a + beta b)$

Par le thm de Bézout, $exists u, v in ZZ tq u m + v n = beta + alpha = 1 (star)$

$"on a" (star) mod m : &alpha = 1[m], alpha = v n = 0[n]\
"de meme" (star) mod n :&beta = 1[m], beta = u m = 0[m]$

Ainsi $x = a v n + b u m$ convient
]

#text(red, 2em)[*Fin du programme du CC2*]

#pagebreak()
#thm("de correspondance des sous-groupes") $H dist G, pi : G --> GsH$\
l'application $pi : func({"sg" dist "de G" supset H&} &--> {"sg" dist "de" GsH}, &k &ass pi(k))$\ est une bijection croissante d'inverse $k ass pi^(-1)(k)$
