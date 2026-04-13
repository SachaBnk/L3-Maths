#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *

#align(center, text(20pt)[*Algèbre*])
#align(center, text(15pt)[Chapitre 4 — Groupe symétrique]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
#def() Le *groupe symétrique* d'indice n est le groupe des permutations de $[|1, n|]$. On le note $Sn (ou S_n "si on est pisse froid")$\
On note un élément $sigma in Sn$ de la manière suivante :\
$mat(1, 2, ..., n; sigma(1), sigma(2), ..., sigma(n))$

#prop() $Card Sn = n!$

= I. Cycles

#def() Soit $sigma in Sn$\
La relation suivante définit une relation d'équivalence sur $[|1, n|]$ :\
$i Rr j ssi exists k in ZZ, j = sigma^k (i)$\
Cette relation induit une partition de ${1, ..., n}$ en classes d'équivalences, appelées *$sigma$-orbites*.\
On note $Orb_sigma (i)$ la $sigma$-orbite qui contient $i$

#prop() $sigma in Sn, i in [|1, n|]$, On pose $N = min{k >= 1 | sigma^k (i) = i}$\
- $Orb_sigma (i) = {i, sigma(i), ..., sigma^(N-1)(i)}$
- $Card Orb_sigma (i) = N$

#rq() c'est un ennoncé analogue à la définition de l'ordre $o(g) pour g in G$ avec $o(g) = card <g>$

#demo()[
*1.*\
Remarquons d'abord que $N$ existe quisque ${k>=1 | sigma^k (i) = i}$ existe.\
En effet si $k$ est l'ordre de $sigma "dans" Sn$ alors $k>=1$ et $sigma^k = 1_Sn = id donc sigma^k (i) = i$

- Par définition, on a $i Rr sigma(i)Rr ... Rr sigma^(N-1)(i)$\
 Donc $forall k in ZZ, sigma^k (i) in Orb_sigma (i)$\
 donc ${i, sigma(i), ..., sigma^(N-1)(i)} subset Orb_sigma (i)$

- Soit $j in Orbs(i)$\
 Par def, $exists k in ZZ, j = sigma^k (i)$\ Par division euvlidienne, il existe $q in ZZ, r in [|0, N-1|] tq k = q N+r$\
 $"Ainsi" j &= sigma^k (i)\
 &= sigma^(q N + r) (i)\
 &= sigma^r (sigma^(q N) (i))\
 &= sigma^r ((sigma^N)^q (i))\
 &= sigma^r (i) in {i, sigma(i), ..., sigma^(N-1) (i)}$
#pagebreak()
*2.*\
Il suffit de mq si $0 <= k < l <N alors sigma^k (i) != sigma^l (i)$\
Si $sigma^k (i) = sigma^l (i) alors sigma^(-k) (sigma^k (i)) = sigma^(-k) (sigma^l (i))$\
Donc $i = sigma^(l-k) (i) ->$  pas possib' (par def de $N$)
]

#def() Soit $k >= 2$. On dit que $sigma in Sn$ est un *$k$-cycle* (ou cycle de longueur $k$) s'il existe des entiers $a_1, ..., a_k$ distincts tq :\
- $sigma(a_1) = a_2, ..., sigma(a_(k)) = a_1$
- $sigma(i) = i, forall i in.not {a_1, ..., a_k}$\
On note *$sigma = (a_1, ..., a_k)$*\
Un 2-cycle est appelé une *transposition* (🏳️‍⚧️)

#rq() Les k-cycles sont les permutations ayant une orbite non triviale de taille k.

#ex()[

$sigma = mat(1, 2, 3; 2, 3, 1) = (1, 2, 3)$

$sigma = mat(1, 2, 3, 4; 4, 1, 2, 3) = (1, 4, 2, 3)$

$sigma = mat(1, 2, 3, 4, 5; 5, 3, 2, 4, 1) = (1, 5)(2, 3)$, (pas un cycle donc)
]

#prop() L'inverse de $(a_1, ..., a_k) "dans" Sn$\ est $(a_k, a_(k-1), ..., a_1) = (a_1, a_k, a_(k-1) ..., a_2)$

#demo()[
Ça se voit (le prof le prouve avec un dessin wlh)
]
#pagebreak()
= II. Décompositions

#def() Soit $sigma in Sn$ le *support* de $sigma$\
est $supp(sigma) = {i in [|1, n|] | sigma(i) != i}$

#ex()[\
$supp(id) = es$\
$supp(a_1, ..., a_k) = {a_1, ..., a_k}$
]

#prop()
- $ i in supp(sigma) => sigma(i) in supp(sigma)$
- $Pour sigma, rho in Sn, supp(sigma) inter supp(rho) = es imp sigma rho = rho sigma$

#demo()[
*1.*\
$Si i in supp(sigma), &alors i != sigma(i)\
&donc sigma(i) != sigma(sigma(i)) "car" sigma "bijective"\
&donc sigma(i) in supp(sigma)$

*2.* évident (il a fait un dessin)
]

#rq() $imprev$ pas vraie

#thm("de décomposition en cycles à supports disjoints")<dcsd>\
Toute permutation $sigma in Sn$ se décompose de manière unique (à l'ordre des facteurs près) en un produit de cycles dont les supports sont 2 à 2 disjoints.

#ex(1)[

$mat(1, 2, 3, 4, 5, 6, 7; 4, 2, 7, 5, 1, 3, 6) &= (1,4,5)(3,7,6)\
&= (3, 7, 6)(1, 4, 5) "(support disjoints)"$
]

#ex(2)[\
$sigma = mat(1, 2)mat(2, 4)mat(3, 4)$ n'est pas une décomposition à supports disjoints\
$sigma = mat(1, 2, 3, 4)$
]

#demo()[
*Existence*\
Soient $A_1, ..., A_r$ les $sigma$-orbites.

On sait que $union.big.sq_(l=1)^r A_l = [|1, n|]$

Pour  $l in [|1, r|]$ on définit $c_l (i) = cases(i &si i in.not A_l, sigma(i) &sinon)$

- Si $Card A_l = 1, alors c_l = id$
- $Si Card A_l = N_l >= 2, alors c_l$ est un $N_l$-cycle de support $A_l$\
 En effet pour $i in A_l, c_l = (i, sigma(i), ..., sigma^(N_l-1) (i))$

Soit $i in[|1, n|]$, il existe un *unique* $l in [|1, r|] tq i in A_l$

$c_1...c_r (i) &= c_1...c_l...c_r (i)\
&= c_1...c_r (i), car forall m > l, i in.not A_m car i in A_l et A_l inter A_m = es\
&= c_1...c_(l-1),  "par def de" c_l\
c_1...c_r (i) &= sigma(i), car i in A_l donc sigma(i) in A_l et forall m < l, A_m inter A_l = es$\
Donc $c_1...c_r = sigma$ (on a ce qu'on veut car les supports des $A_l$ sont 2 à 2 disjoints)
\ \ \
*Unicité*\
Soient $d_1, ..., d_s$ des cycles à supports disjoints tq $sigma = d_1...d_s$\
$forall m in [|1, s|], B_m : "le support de" d_m$\
Pour $i in B_m$, comme dans la preuve de l'existence, on a\
$d_1...d_s (i) = d_m (i)$ donc $sigma(i) = d_m (i)$\
donc $sigma(i) in B_m et d_m (i) in Orbs(i)$\
Et ainsi $Orbs(i) subset B_m et B_m subset Orbs(i)$\
donc $B_m = Orbs(i) = A_l$ pour un certain $l$
]

#prop() Soit $sigma in Sn, sigma = c_1 ... c_r$ sa #link(<dcsd>)[DCSD]\
Si $k_i$ est l'ordre de $c_i$ alors l'ordre de $sigma$ est $N = ppcm(k_1, ..., k_r)$

#demo()[

$sigma^N &= c_1^N ... c_r^N\
&= 1_Sn ... 1_Sn car forall i in [|1, r|], k_i divides c_i^N\
&= 1_Sn$\
Donc $o(sigma) | N$

$"On pose" sigma^k &= c_1^k ... c_r^k = 1_Sn$\
$et forall i in [|1, r|], c_i^k = c_(i, 1) ... c_(i, n_i)$

$union.big.sq_(j=1)^n_i supp(c_(i, j)) = supp(c_i)$

$donc product_(1 <= i <= r\ 1 <= j <= n_i) c_(i, j)$ est la #lien(<dcsd>)[DCSD] de $sigma^k$

Or $sigma^k = 1$ (par hypothèse)\
donc $c_(i, j) = 1$ par unicité de la #lien(<dcsd>)[DCSD]

$donc forall i in [|1, r|], c_i^k = 1$ $et donc forall i in [|1, r|], k_i | k$\
$donc N | k et N = min{k>=1 | sigma^k = 1}$
]

#rq() ⚠️ $c^k$ n'est pas forcément un cycle :\
$mat(1, 2, 3, 4)^2 = mat(1, 3)mat(2, 4)$

#ex(1)[

$sigma = mat(1, 2, 3, 4, 5; 2, 1, 3, 5, 4)$


- DCSD : $sigma = mat(1, 2)mat(4, 5)$
- $o(sigma) = ppcm(2, 2) = 2$
]

#ex(2)[

$sigma &= mat(1, 2, 3, 4, 5, 6, 7, 8; 2, 8, 6, 5, 4, 3, 7, 1)\
&= mat(1, 2, 8)mat(3, 6)mat(4, 5)$

$o(sigma) &= ppcm(3, 2, 2)\
&= 6$
]

#ex("du Rubik's cube de ses morts")[C'est non]

#thm("de décomposition en produit de transpositions")\
Toute *permutation* se décompose en un *produit de transpositions*

#demo()[
D'après le #link(<dcsd>)[thm de DCSD], il suffit de montrer que tout cycle se décompose en produit de transpositions.\
Par récurrence sur la $k$ longueur du cycle :

- $k = 2$ : un 2-cycle est bien une transposition ok

- On suppose le résultat vrai pour $k >= 2$\
  $Soit gamma = mat(i_1, ..., i_(k+1))$ un (k+1)-cycle\
  $gamma mat(i_k, i_(k+1)) &= mat(i_1, ..., i_(k+1))rond mat(i_k, i_(k+1))\
  &= mat(i_1, ..., i_(k))$\
  Ainsi $gamma mat(i_k, i_(k+1))$ est un k-cycle donc par HR, $exists delta_1, ... ,delta_r$ transpositions\
  tq $gamma mat(i_k, i_(k+1)) = delta_1 ... delta_r$\
  donc $gamma = delta_1 ... delta_r mat(i_k, i_(k+1))$ (car toute transposition est d'ordre 2 genre)
]

#rq() On a en fait montré que $mat(i_1, ..., i_k) = mat(i_1, i_2) ... mat(i_(k-1), i_k)$

#rq()\ On aurait pu faire une recurrence sur n en remarquant que $(n, sigma(n))sigma$ fixe n\
donc s'identifie à un élément de $frak(S)_(n-1)$

#rq() ⚠️ Pas unicité : $mat(1, 2, 3) = mat(1, 2)mat(2, 3) = mat(1, 3)mat(1, 2)$

#ex()[

$mat(1, 2, 3, 4, 5, 6, 7, 8; 2, 8, 6, 5, 4, 3, 7, 1) &=^#link(<dcsd>, "DCSD") mat(1, 2, 8)mat(3, 6)mat(4, 5)\
&= mat(1, 2)mat(2, 8)mat(3, 6)mat(4, 5)$
]

#rq() On a donc montré que $Sn = <"cycles"> = <"transpositions">$

#text(red, 1.5em)[*Le programme du CC1 d'algèbre s'arrète ici*]

= III. Classes de conjugaison

#rappel()\ $forall g in G, gamma_g : G &--> G in Aut(G)\ h &ass g h gm$
- Les éléments $h et g h gm$ sont dits *conjugués*
- la *classe de conjugaison* de h est ${gamma_g (h) | g in G}$ 

#prop() Soient $gamma = mat(a_1, ..., a_k)$ un k-cycle, et $sigma in Sn$\
$sigma gamma sigmam$ est un k-cycle\
plus précisément, $sigma mat(a_1, ..., a_k)sigmam = mat(sigma(a_1), ..., sigma(a_k))$

#demo()[
Soit $gamma' = sigma gamma sigmam$

- Si $i in.not {sigma(a_1), ..., sigma(a_k)}, alors sigmam(i) in.not {a_i, ..., a_k}$

  $donc gammam(i) &= sigma gamma(sigmam(i))\ &= sigma(sigmam(i))\ &= i$

- Si $exists l in [|1, k|], tq i = sigma(a_l)$

  $sigma'(i) &= sigma gamma sigmam(sigma(a_l))\ &= sigma gamma(a_l)\
  gamma'(sigma(a_l)) &= sigma(a_(l+1))$\
  On a bien le résultat voulu
]

#corollaire()

 $Sn &= <mat(1, i) | i in [|2, n|]>\
&= <mat(i, i+1) | i in [|1, n-1|]>$

#rq() On est passé d'une partie génératrice à $mat(n;2) = n(n-1)/2$ éléments (toutes les transpositions) à n-1 éléments seulement

#demo()[
Puisque $Sn = <"transpositions">$, il suffit de mq $forall j < k, mat(j, k) in <mat(1, i) | i > 1>$

D'après la formule de conjugaison, on a $mat(j, k) = mat(1, j)mat(1, k)mat(1, j) = mat(sigma(1), sigma(k))$
]

#rq() avec $s_i = mat(i, i+1)$,\ alors on a la relation $s_i s_(i+1) s_i = s_(i+1)s_i s_(i+1) = mat(i, i+2)$ (relation de tresse)

#prop() $Sn = <mat(1, 2), mat(1, 2, ..., n)>$

#demo()[
Posons $sigma = mat(1, 2, ..., n)$\
$forall k in [|1, n|], p in ZZ, sigma^p (k) = k+p$

$donc sigma^k mat(1, 2) sigma^(-k) &= mat(sigma^k (1), sigma^k (2))\
&= mat(k+1, k+2) in [|1, n-1|]$

$Ainsi forall i in [|1, n|], mat(i, i+1) in <mat(1, 2), mat(1, 2, ..., n)>\
Donc Sn = <mat(1, 2), mat(1, 2, ..., n)>$
]

#def() Soit $sigma in Sn et sigma = gamma_1 ... gamma_n$ sa #lien(<dcsd>)[DCSD] (en incluant les 1-cycles), où les cycles sont triés par longueur $l_i$ décroissante.\
On dit que $sigma$ est de *type* $(l_1, ..., l_n)$

#rq() Si $(l_1, ..., l_n)$ est le type d'un elem de $Sn$, $l_1 >= ...>=l_n$

#prop() Deux permutatuions dans $Sn$ sont conjuguées *ssi* elles ont le même type

#demo()[
$redimp$ Soient $sigma, rho in Sn$ conjugués\
#underline[but :] mq $rho et sigma$ ont le même type\
Si $rho = gamma_1...gamma_n$\
alors $sigma rho sigmam = gamma'_1...gamma'_n avec forall i in [|1, n|], gamma'_i = sigma gamma_i sigmam$\
par la formule de conjugaison, chaque $gamma'_i$ est un $l(gamma_i)$-cycle\
Il reste a montrer que $gamma'_1...gamma'_n$ est bien la #lien(<dcsd>)[DCSD],\ i.e.$forall i !=j in [|1, n|], supp(gamma_i)inter supp(gamma_j) = es$\
$"D'après la formule de conjugaison," forall i in [|1, n|], supp(gamma'_i) &= supp(sigma gamma_i sigmam)\
&= sigma(supp(gamma_i))$\
Ainsi si $k in supp(gamma_i)inter supp(gamma_j), alors k in sigma(supp(gamma_i))inter sigma(supp(gamma_j))$

$redimprev$ Soient $sigma, sigma' in Sn$ de même type

$sigma = gamma_1...gamma_n\
sigma' = gamma'_1...gamma'_n$\
avec $forall i in [|1, n|], gamma^star_i = mat(a^star_(i, 1), ..., a^star_(i, n_i)), avec star in {" ", '}$

#rq()#text(blue)[\
+ $sum_(i=1)^r n_i = n$, car on inclut les 1-cycles

+ $union.big.sq_(i=1)^r {a^star_(i, 1), ..., a^star_(i, n_i)} = [|1, n|], avec star in {" ", '}$\
]
On considère $rho : [|1, n|] --> [|1, n|]$ définie par *$rho(a_(i, j)) = a'_(i, j)$* ($i in [|1, r|], j in [|1, n_i|]$)\
Chaque élement de [|1, n|] posséde une unique image par $rho$ (dp *rq 2.*)\
Toujours par *rq 2.*, $rho$ est surjective, donc bijective\
$Ainsi rho in Sn, et rho sigma rho^(-1) &= rho (inter.big.sq_(i=1)^r gamma_i) rho^(-1)\
&= inter.big.sq_(i=1)^r rho gamma_i rho^(-1)\
&= inter.big.sq_(i=1)^r gamma'_i\
&= sigma'$
]

#corollaire() Pour $k >=2$, Tous les k-cycles de $Sn$ (en particulier ls transpositions) sont conjugués dans $Sn$
#pagebreak()
= IV. Signature

#def() Soit $sigma = c_1...c_r in Sn$ sa DCSD (cycles de longueur 1 inclus)\
La *signature* de $sigma$ est $epsilon(sigma) = (-1)^(n-r)$

#prop()
- Si $delta in Sn$ est une transposition, alors $epsilon(delta) = -1$
- Si $sigma in Sn$ est un k-cycle, alors $epsilon(sigma) = (-1)^(k-1)$

#demo()[
*1.*\
$delta = mat(a, b)(c_1)...(c_(n-2))$\
$epsilon(delta) = (-1)^(n-(n-1))$

*2.*\
$sigma = mat(a_1, ..., a_k)(b_1)...(b_(n-k))$\
$epsilon(sigma) = (-1)^(n-(n-k+1))$
]

On va mq $epsilon : Sn --> {pm 1} = mu_2 subset CC^times$ est un morphisme

#lemme() Soient $a != b$ et $s, t > 0$\
- Si $tau = mat(a ,c_1, ..., c_s, b, d_1, ..., d_t)$ est un cycle alors $mat(a, b)tau$ est un produit de deux cycles à supoport disjoints\
  plus précisément, $mat(a, b)tau = mat(a, c_1, ..., c_s)mat(b, d_1, ..., d_t)$

- Si $tau = mat(a, c_1, ..., c_s) et delta = mat(b, d_1, ..., d_t)$ sont des CSD alors $mat(a, b)tau delta$ est un cycle\
  $mat(a, b)tau delta = mat(a, c_1, ..., c_s, b, d_1, ..., d_t)$

#demo()[non]

#prop() Soient $sigma in Sn$ et $tau in Sn$ une transposition\
Alors $epsilon(tau sigma) = -epsilon(sigma)$

#demo()[
Soit $sigma = gamma_1, ..., gamma_r$\
$epsilon(sigma) = (-1)^(n-r)$\

*1.*\
On suppose $exists i tq tau subset tau_i$\
Alors par le *1.* du lemme on sait que la DCSD de $delta tau_i$ est constituée de deux cycles : $gamma, gamma'$\
...
#pagebreak()
*2.*\
Si maintenant $tau = mat(a, b)$ est tq $a in supp gamma_i, b in supp gamma_j, i != j$\
Alors $mat(a, b)sigma = mat(a, b)gamma_i gamma_j gamma_1 ... overline(gamma_i) ... overline(gamma_j) ... gamma_r$\
$donc epsilon(tau gamma) &= (-1)^(n-(1+(r-2)))\
&= (-1)^(n-r+1)\
&= -(-1)^(n-r)$
]

#corollaire()
- Soit $sigma in Sn$, $si sigma = tau_1, ...,tau_r$ est une décomposition en produits de transpositions, alors $epsilon(sigma) = (-1)^r$
- La signature $epsilon : Sn --> {pm 1} subset CC^times$ est un morphisme de groupe,\
ie $forall sigma, sigma' in Sn, epsilon(sigma sigma') = epsilon(sigma)epsilon(sigma')$

#demo()[
*1.* découle du 1. de la prop précédente en utilisant $epsilon(tau_r) = -1$

*2.*\
Soient $sigma = tau_1 ... tau_r et sigma' = tau_1' ... tau_s'$\
...
]

== Methode pour le calcul de signatures

+ On fait la DCSD $sigma = gamma_1...gamma_r$

+ On a $epsilon(sigma) = epsilon(gamma_1)...epsilon(gamma_r)$

+ Si $gamma_i$ est un $k_i$-cycle alors $epsilon(gamma_i) = (-1)^(k_i-1)$

#rq() La signature peut etre un moyen de montrer que deux permutations sont différents

#rq() Si $sigma = gamma_1 ... gamma_r$ ou les $gamma_i$ sont des cycles (pas necessairement à support disjoints) alors on a quand même $epsilon(sigma) = epsilon(gamma_1)...epsilon(gamma_r)$

#ex("Rubik's cube")[non]

#def() Le *groupe alterné* est le noyau du morphisme de signature\
$An = ker epsilon subset Sn$\
Si $sigma in An$ on dit que $sigma$ est pair

#ex()[
- $Alt_1 = {id} = Sym_1$
- $Alt_2 = {id}$

- $Alt_3 &= {id, mat(1, 2, 3), mat(1, 3, 2)}\
&tilde.eq ZZ\/3ZZ$
]

#prop() $forall n >= 2, card An = n!/2$

#demo()[
Soit $epsilon : Sn --> {pm 1}$\
$epsilon$ est un morphisme donc $Card Sn = Card ker(epsilon) Card im(epsilon)$\
On sait que $ 1 in im epsilon$ (c'est un morphisme)\
$-1 = epsilon mat(1, 2) in im epsilon$ (car $n >= 2$)\
Donc $Card im epsilon = 2$
]

#prop() $An = <"3-cycles">$

#demo()[
#text(red)[*$supset$*] Si $gamma$ est un 3-cycle\
alors $epsilon(gamma) = (-1)^(3-1) = 1$\
donc ${"3-cycles"} subset An$\
donc $"<3-cycles>" subset An$ car $An$ est un sg

#text(red)[*$subset$*] Soit $sigma in An$\
On sait qu'il existe $i_1, ..., i_r tq sigma = mat(1, i_1)...mat(1, i_r)$\
De plus, $epsilon(sigma) = 1$ donc r est pair\
on conclut car pour $i != j, mat(1, i)mat(1, j) = mat(1, i, j)$
]