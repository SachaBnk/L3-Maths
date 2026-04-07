#set text(size: 13pt, lang: "fr")
#import "../../../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[TD 1, Exercice 2, question 4, deuxième partie]) 
#set text(green)
*$underline("Exercice :")$ Soient $A, B subset RR$, trouver une condition necessaire et suffisante pour que les propriétés suivante soient vérifiées*\

- $sup(A B) = sup(A)sup(B)$\
- $inf(A B) = inf(A)inf(B)$

avec $forall X, Y subset RR, X Y = {x times y | x in X, y in Y}$

#set text(black)
*Proposition* : $inf(A)inf(B) < sup(A)sup(B)$ \ #text(orange)[On remercie Célian Delaunay pour sa contribution ❤️]

#set text(blue)
#preuve()
- *sens direct :* Mq $inf(A)inf(B) < sup(A)sup(B) arrow.double sup(A)sup(B) = sup(A B)$

$--> "on suppose " inf(A)inf(B) < sup(A)sup(B)$

on pose : 
- $A_+ = {a >= 0 | a in A}, A_- = {a < 0 | a in A}$
- $B_+ = {b >= 0 | b in B}, B_- = {b < 0 | b in B}$

$-> "Si" A_+ "et" B_+ != emptyset, sup(A)sup(B) "majore" A_+ B_+$ (pas de problème) \
$-> "Si" A_- "et" B_- != emptyset,\ inf(A)inf(B) "majore" A_- B_- "donc" sup(A)sup(B) "majore" A_-B_-$\
$->$Si $A_+ != emptyset, B_- != emptyset$ pour $a in A_+, b in B_-$ :\
$sup(B) >= b$\ 
donc $a.sup(B) >= a b$\
or $a < sup(A)$ donc $sup(A)sup(B) >= a b$\
donc $sup(A)sup(B) "majore" A_+B_-$

$->$ de la meme manière, si $A_- != emptyset, B_+ != emptyset, sup(A)sup(B) "majore" A_-B_+$


$A B = (A_-B_-) union (A_-B_+) union (A_+B_-)union (A_+B_+)$\
d'où $sup(A)sup(B) "majore" A B$

_On veut maintenant prouver que $sup(A)sup(B) = sup(A B)$, pour cela on utilise la caractérisation séquentielle de la borne sup (cf. exo 3 — à peu près)_

*si $sup(A) "et" sup(B) != plus infinity$*
- Il existe une suite $(U_n)_(n in NN) in A^NN$ qui converge vers sup(A)
- Il existe une suite $(V_n)_(n in NN) in B^NN$ qui converge vers $sup(B)$

Par opération sur les limites, la suite définie par $forall n in NN, W_n = U_n V_n$\ converge vers $sup(A)sup(B)$\
#pagebreak()
Il existe une suite à valeurs dans $A B$ qui converge vers $sup(A)sup(B)$, et $sup(A)sup(B)$ majore $A B$. Par caractérisation séquentielle de la borne supérieure, on a bien $sup(A B) = sup(A)sup(B)$.

*Si $sup(A) = plus infinity "ou" sup(B) = plus infinity$* (ou comment ma preuve tombe à l'eau) :

On pose $sup(A) = + infinity$\
Le risque c'est que si $sup(A) = +infinity "et" sup(B) < 0$ c'est la merde\ 
or $inf(A)inf(B) < sup(A)sup(B)$ (par hypothèse)\
$sup(A)sup(B)!= -infinity$ $->$ tout va bien\ \
MAIS : si $sup(A) = +infinity "et" sup(B) = 0$, euh j'ai très envie de dire que si on a supposé que $sup(A)sup(B) > inf(A)inf(B)$ c'est que $sup(A)sup(B)$ est défini hein

#set text(red)
*De manière symétrique, on trouve $inf(A B) = inf(A)inf(B)$*
#set text(blue)
\ \ \

- *sens réciproque :* Mq $inf(A)inf(B) < sup(A)sup(B) arrow.double.l sup(A)sup(B) = sup(A B) "et" inf(A B) = inf(A)inf(B)$

$--> "on pose "sup(A)sup(B) = sup(A B) "et" inf(A)inf(B) = inf(A B)$

$ sup(A)sup(B) = sup(A B) >= inf(A B) = inf(A) inf(B)$

#finpreuve()
#set text(black)

#remarque() On a du restreindre la question à _"trouver une condition pour que $sup(A B) = sup(A)sup(B) "ET" inf(A B) = inf(A)inf(B)$"_ sinon c'est un peu relou mais le resultat reste cool.