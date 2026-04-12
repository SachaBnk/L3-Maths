#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../../titres.typ": *

#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 3 — Morphismes]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
= I. Morphismes, Isomorphismes

#def() Soient $(G, *) et (G', *')$ deux groupes.\
Un *morphisme* entre $G$ et $G'$ est une application $f : G --> G'$\ $tq forall g, h in G, f(g*h) = f(g)*'f(h)$\
- Si $G' = G$ on parle d'*endomorphisme* de $G$
- $Hom(G, G') = {"morphismes" G --> G'}$\ (en anglais ils disent "homomorphism" 🏳️‍🌈)
- $End(G) = Hom(G, G)$

#rq() $Hom(G, G') et End(G)$ sont non vides car $ind_(G, G') in Hom(G, G')$

$avec ind_(G, G') : G &--> G'\
g &ass 1_G'$ \

#texemples()

#text(green)[
+ $id_G : G &--> G in End(G)\
g &ass g$

+ $Pour n in ZZ, mu_n : ZZ &--> ZZ in End(ZZ)\ k &ass n k$\
 $"En effet", forall k, k' in ZZ, mu_n (k+k') &= n(k+k')\
 &= n k + n k'\
 &= mu_n (k) + mu_n (k')$\
 Plus généralement, si $G$ est abélien :\
 $pi_n : G &--> G in End(G)\
 g &ass g^n$

+ $n in ZZ, f : ZZ &--> ZZ\ k &ass n+k$\ 
 $f$ *n'est pas* un morphisme (sauf si $n=0$)

+ $i : RR^* &--> RR^* in End(RR^*)\ x &ass 1/x$\
 plus généralement, si $G$ est abélien alors l'application $i : g &ass g^(-1)$ est un morphisme

5. Les applications *exp* et *ln* sont des morphismes

+ La conjugaison dans $CC$

+ $GL_n(RR) &--> GL_n(RR) "est un morphisme"\
M &ass (M^(-1))^T$\
 (Qu'on appelle transconjugaison 🏳️‍⚧️)\
 Mais ni l'application inverse, ni la transposition ne sont des morphismes.\
 (rappel : $(M N)^T = N^T M^T$)

+ $det : GL_n (KK) --> KK^*$ est un morphisme\
 ⚠️ $det : GL_n (KK) --> KK et det : M_n (KK) --> KK$ ne sont pas des morphismes 

+ $n in NN^*$\
 $ZZ &--> mu_n = {z in CC^* | z^n = 1} "est un morphisme (cf exp)"\ k &ass e^(2i k pi/n)$

+ $n in NN$, l'application naturelle\
 $ZZ &--> ZZ\/nZZ "est un morphisme"\ k &ass overline(k)$

#finexemple()
]

#prop() Soit $f : G --> G' in Hom(G, G')$ :\
- $f(1_G) = 1_G'$
- $forall g in G, f(g)^(-1) = f(g^(-1))$

#tpreuve()
#text(blue)[
*1.*\
$f(1_G)f(1_G) = f(1_G 1_G) = f(1_G)$\
donc $f(1_G) = 1_G'$

*2.*\
exo à la maison...?
]

#def()\ 
- Un morphisme bijectif est appelé *isomorphisme*, On dit que deux groupes $G, G'$ sont isomorphes s'il existe un isomorphisme $f : G --> G'$.\ On note alors $G tilde.eq G'$
- Un *automorphisme* de $G$ est un isomorphisme $G --> G$.\
 On note $Aut(G)$ l'ensemble des automorphismes de $G$


#texemples()
#text(green)[
- $Id_G in Aut(G)$

- Les groupes $RR^(m n) et M_(m, n)(RR)$ sont isomorphes via réarangement

- $exp : RR --> RR_+^* et ln : RR_+^* --> RR$ sont des isomorphismes réciproques
#finexemple()
]
#pagebreak()
#prop() $G, G', G''$ groupes\
- Si $f : G --> G' et g : G' --> G''$ sont des morphismes\
 alors $g rond f$ est un morphisme
- Si $f : G --> G'$ est un isomorphisme,\
 alors la bijection réciproque $f^(-1) : G' --> G$ est un isomorphisme
- L'ensemble $Aut(G)$ (muni de la composition) est un sous-groupe de $Bij(G)$

#tdemo()
#text(blue)[

*1.*\
Soient $x, y in G$

$"On a" (g rond f)(x y) &= g(f(x y))\
&= g(f(x)f(y))\
&= (g rond f)(x)(g rond f)(y) "(Note : PUTAAAAAIN ON S'EMMERDE)"$

*2.*\
Soient $x', y' in G'$\
On veut $f^(-1)(x' y') = fm(x')fm(y')$\
Comme $f$ est bijective, on peut écrire $x' = f(x), y' = f(y)$\
$f(x y) = f(x)f(y)$\
$x y = fm(f(x)f(y))$\
cad $fm(x')fm(y') = fm(x'y')$

*3.*\
- $1_Bij(G)$ ok
- $forall f, g in Aut(G), f rond g in Aut(G)$ ok
- $forall f in Aut(G), fm in Aut(G)$ ok

#finpreuve()
]

#prop() Si $f : G --> G'$ est un morphisme, alors toute propriété dans $G$ qui s'exprime uniquement à l'aide de la loi de groupe est également vérifiée dans $G'$\
Par exemple :
- $Card G = Card G'$
- $G "commutatif" ssi G' "commitatif"$
- $G "monogène" ssi G' "monogène"$
- $Z(G) et Z(G')$ sont isomorphes
- $Aut(G) enveq Aut(G')$
- $D(G) enveq D(G)$

#prop() Soit $G$ un groupe *monogène*
- Si $Card G = infy$, $G enveq ZZ$
- Si $Card G = n < infy, G enveq ZZ\/nZZ$

#tdemo()
#text(blue)[
(Le cas $Card G$ < $infy$ est vu au chapitre 6 wlh)\
- On suppose $G$ infini. Par hypothèse, $exists x in G, G = <x>$

$"Donc" f : ZZ &--> G "est surjective"\ n &ass x^n$

- Soient $m <= n tq f(m) = f(n)$\
On a $x^m = x^n donc 1_G = x^(m - n)$\
On a $cases(n-m >= 0, o(x) = Card<x> = Card G = pinf)$\
Donc $n - m =0$

- Mq $f$ est un morphisme : $f(a + b) = f(a)f(b)$ ok

#finpreuve()
]

= II. Noyau et image

#def() $f : G --> G'$ morphisme\
- Le *noyau* de $f$ est $ker(f) = {x in G | f(x) = 1_G'}$
- L'*image* de $f$ est $im(f) = {f(x) | x in G}$

#texemples()
#text(green)[
*1.*\
$det : GL_n (RR) --> RR^*$ est un morphisme

$ker det &= {M in GL_n (RR) | det M = #text(red)[1]}\ &= SL_n (RR)$

$im det &= {det M | M in GL_n (RR)}\ &= RR_+^*$

*1. bis*\
$tr : M_n (RR) --> RR$ est un morphisme

$ker tr &= {M in M_n (RR) | tr M = 0}\
&= sl_n (RR)$\
$im tr = RR$
#pagebreak()
*2.*\
$f : RR^* &--> RR^* "est un morphisme"\ x &ass x^2$\

$ker f &= {x in RR^* | x^2 = 1}\ &= {pm 1}$\

$im f &= {x^2 | x in RR^*}\ &= RR_+^*$

#finexemple()
]

#prop() Soit $f : G --> G'$ un morphisme 
- Si $H$ est un sous-groupe de G, $f(H) = {f(h) | h in H}$ est un sous-groupe de $G$\
 En particulier, $im f$ est un sous-groupe de $G'$
- Si $H'$ est un sous-groupe de $G'$, $fm(H') = {x in G | f(x) in H}$ est un sg de $G$\
 En particulier $ker f = fm{1_G}$ est un sous-groupe de G

#tdemo()
#text(blue)[eh ça se voit c'est bon]

#finpreuve()

#rq() Utiliser ce résultat permet de prouver qu'un ensemble est un sous-groupe plus rapidement (1 condition au lieu de 3)

#texemples()
#text(green)[
*1.*\
pour $pi : k ass overline(k)$\
$n ZZ = ker pi$

*2.*\
$SL_n (RR) = ker det$ est un sous-groupe de $GL_n (RR)$

*3.*\
$"Avec" N: CC^* &--> RR_+^*\ z &ass |z|$\
$UU$ est un sg de $CC^* car UU = ker N$

*4.*\
$H = {mat(a, -b; b, a) | a, b in RR, a^2 + b^2 != 0}$ est un sg de $CCE$

$phi : (CCE, times) &--> GL_2(CC) "est bien défini et est un morphisme"\ 
a+i b &ass mat(a, -b; b, a)$

#finexemple()
]

#exo()[
Mq $H = {mat(1, z; 0, 1) | z in CC}$ est un sg de $GL_2(CC)$ isomorphe à $CC$
][]

#thm() Soit $f : G --> H$ un morphisme.\
$f "injectif" ssi ker f = {1_G}$

#demo()[
$redimp$ supposons $f$ injective, soit $g in ker f$\

$f(g) &= 1_H\
&= f(1_G)$\
par injectivité on a bien $ker f = {1_G}$

$redimprev$ On suppose que $ker f = {1_G}$\
Soient $g, g' in G$\
$f(g) = f(g') imp 1_H &= f(g)^(-1)f(g')\
&= f(g^(-1))f(g')\
1_H &= f(gm g')$\
$gm g' in ker f donc gm g' = 1_G$\
donc $g = g'$
]

#ex()[
$phi : a + i b ass mat(a, -b; b, a)$ est injective wlh
]

#prop() Soit $G$ un groupe\
- pour $g in G$, l'application

 $gamma_g : G &--> G\ h &ass g h gm$\ est un automorphisme de $G$

- L'application

 $gamma : G &--> Aut(G)\ g &ass gamma_g$\
 est un morphisme et $ker gamma = Z(G)$

#demo()[
*1.* ok\

*2.*\
$Soit gamma' : g &--> End(G)\ g &ass gamma'_g = gamma_g$\
Soient $g, g' in G$\
Soit $h in G$\
$(gamma'_g rond gamma'_g')(h) &= gamma'_g (gamma'_g' (h))\
&= gamma'_g (g' h gm')\
&= g(g' h gm')gm\
&= (g g') h (gm' gm)\
&= (g g')h(g g')^(-1)\
&= gamma'_(g g') (h)$\
Donc $gamma$ est un morphisme

*mq $gamma$ est bijectif* (ok, noyau trivial)

*mq $ker gamma = Z(G)$*\
Pour $g in G$\
$g in ker gamma &ssi gamma_g = id_G\
&ssi forall h in G, gamma_g (h) = h\
&ssi forall h in G, g h gm = h\
&ssi forall h in G, g h = h g\
&ssi g in Z(G)$
]


#def() $g, h in G$, 
- on dit que $h et gamma_g (h) = g h gm$ sont *conjugués* dans $G$
- L'image de $gamma : G --> Aut(G)$ est le sous-groupe des *automorphismes intérieurs* de $G$, noté $Int(G)$

#rq() $forall n != 6, Int(frak(S)_n) = Aut(frak(S)_n)$

#thm() (preuve au chap 6)\
Soit $f in Hom(G, G'), avec card G < infy$
- $card im f < infy$
- *$card G = card(ker f)card(im f)$*

