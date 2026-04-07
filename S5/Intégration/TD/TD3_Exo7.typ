#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../../../titres.typ": *

= Exo 7 : formule du crible

#text(blue)[
Soit $(E, Ar, mu)$ un espace mesuré, ${A_1, ..., A_n}$ une famille finie. prouver :

$H_n : forall n >= 2, mu(A_1 union ...union A_n) = S_n = sum_(j=1)^n (-1)^(j+1) sum_(1<= i_1 < ... < i_j <= n)mu(A_1 inter ... inter A_n)$

]

*Par récurrence*

- Init : ok

- Hérédité :

on suppose $H_p, pour p in NN$

$mu(A_(p+1)\\union.big_(k = 1)^p A_k) &= mu(A_p+1) - [sum_(j=1)^p (-1)^(j+1) sum_(1<= i_1 < ... < i_j <= p) mu(A_(p+1) inter.big A_1 inter ... inter A_p)]\
&= mu(A_p+1) + [sum_(j=1)^p (-1)^(j+2) sum_(1<= i_1 < ... < i_j <= p) mu(A_1 inter ... inter A_(p+1))]\
$

$S_(p+1) &= S_p + mu(A_(p+1)\\union.big_(k = 1)^p A_k) "(union disjointe)"\
$