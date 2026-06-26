#set text(size: 13pt, lang: "fr")
#set par(justify: false, spacing: 1.5em)
#import "../titres.typ": *

= Oral 1 Sacha Banak -- CAPES L3 2026
\ \
*1.* Énoncer le théorème de Rolle

*2.* Énoncer le théorème des accroissements finis

*3.* Énoncer l'inégalité des accroissements finis, puis proposer une interprétation graphique

*4.* Soit $f : x ass x + 1/4 (3-x^2)$\
on considère la suite $(u_n)$ définie par : 
$ &forall n in NN, u_(n+1) = f(u_n)\ &u_0 = 2 $ 

$"   "$a. Prouver que $[1,2]$ est stable par $f$

$"   "$b. Prouver que si $(u_n)$ converge vers une limite $cal(l)$, alors celle-ci vérifie $f(cal(l)) = cal(l)$.\
$"      "$En déduire, dans ce cas, que $cal(l)=sqrt(3)$

$"   "$c. Pour $n in NN$, démontrer l'inégalité suivante :
$ abs(u_(n+1) - sqrt(3)) <= 1/2 abs(u_n - sqrt(3)) $

$"   "$d. En déduire que $(u_n)$ converge et donner sa limite

*5.* Soit $g : [a, b] --> [a, b]$ continue sur $[a,b]$, dérivable sur $]a,b[$

$"   "$a) Prouver que $g$ admet un point fixe sur $[a,b]$

$"   "$b) On suppose qu'il existe $k in ]0,1[$ tel que :
$ forall x in ]0,1[, abs(g'(x)) <= k $ 
$"      "$Prouver alors que ce point fixe est unique

*Notion mise en jeu :*\
Inégalité des accroissements finis. Il est attendu que le ou la candidate sache proposer une démonstration de l'inégalité des accroissements finis ou au moins les points constructifs d'une démonstration.