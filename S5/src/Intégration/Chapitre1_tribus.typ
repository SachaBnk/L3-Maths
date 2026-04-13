#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[Chapitre 1 — Comment on dit "tribu" ?])
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
= I. Opérations sur les ensembles

#def() Soient E un ensemble et $A$, $B$ des parties de $E$.\
$A inter B$ : dans $A$ *et* $B$.\
$A union B$ : dans $A$ *ou* $B$ (ou les deux).\
$A^C$ : pas dans $A$.\
$A triangle B = (A union B) \\ (A inter B)$

$(A inter B)^C &= E\\(A inter B)\
&= A^C union B^C$

#tpreuve()
#set text(blue)
Soit $x in (A inter B)^C$\
Donc $x in.not A inter B$\
Donc $x in.not A$ ou $x in.not B$\
Donc $x in A^C$ ou $x in B^C$\
Donc $x in A^C union B^C$\
Donc $(A inter B)^C subset A^C union B^C$\

L'autre inclusion est laissée au lecteur.

#finpreuve()
#set text(black)

#remarque() On associe naturellement une fonction à un ensemble. \
Soit $A subset E$, l'indicatrice de $A$ est la fonction $forall x in E, bb(1)_A (x) = cases(1 "si" x in A,
0 "sinon")$

#def() Soient $E "et" F$ deux ensembles et $f$ une fonnction de $E$ dans $F$.\
Soient $A subset E, B subset F$ \
- L'image directe de $A$ par $f$ set le sous-ensembel de $F$ noté $f(A)$.
$f(A) &= {f(x) | x in A}\
&= {y in F | exists x in A, y = f(x)}$\

- L'image réciproque de $B$ par $f$ est le sous-ensemble de $E$ noté $f^(-1)(B)$.
$f^(-1)(B) &= {x in E | f(x) in B}$\
/!\\ Cette relation ne suppose pas que $f$ est bijective.\

#texemple() \
#set text(green)
$f:&RR arrow.r.long RR \ 
&x arrow.r.long.bar x^2$\
$f(]-2, 2]) = [0, 4]$\
$f^(-1)(]-infinity, 1]) = [-1, 1]$\
#finexemples()
#set text(black)


Soient $B, B' in F "et" A, A' in E$\
$f^(-1)(B inter B') = f(-1)(B) inter f^(-1)(B')$\
$f^(-1)(B union B') = f^(-1)(B) union f^(-1)(B')$\

$f(A inter A') subset f(A) inter f(A')$\
$f(A union A') subset f(A) union f(A')$\

= II. Ensembles finis, dénombrables et non dénombrables

#def() Deux ensembles $E$ et $F$ sont dits *équipotents* s'il existe une bijection de $E$ sur $F$.\

#texemples() 
#set text(green)

- $NN$ et $2NN$ sont équipotents via la bijection $f:n arrow.r.long.bar 2n$\
- Soit $E$ un ensemble et $cal(P)(E) = {A subset E}$\
$cal(P)(E)$ est équipotent à ${0, 1}^E$ car 
$cases(cal(P)(E) &arrow.r.long {0, 1}^E, A &arrow.r.long.bar 1_A)$
est une bijection.\
#set text(black)

#prop() $E$ et $cal(P)(E)$ ne sont jamais équipotents.\
#tpreuve()
#set text(blue)
Il n'existe pas de surjection de $E$ sur $cal(P)(E)$.\
On suppose par l'absurde qu'il existe une surjection $f:E arrow.r.long cal(P)(E)$.\
Soit $A = {x in E | x in.not f(x)} in cal(P)(E)$\
Il existe un antécédent $a in E$ de $A$.\
Donc $A = f(a)$\
Deux cas de figure :\
- $a in A$ : par définition de $A$, $f(a) != a "donc" a in.not A arrow.r.long "contradiction"$
- $a in.not A$ : donc $a in f(a) = A arrow.r.long$ contradiction
#finpreuve()
#set text(black)

#prop() $RR$ n'est pas dénombrable.\

#tpreuve()
#set text(blue)
(Diagonale de Cantor)\
On prouve que [0, 1[ n'est pas dénombrable.\
On suppose par l'absurde que [0, 1[ est dénombrable.\
Alors il existe $(x_n)_(n in NN)$ tel que $[0, 1[ = {x_n | n in NN}$\
On écrit $x_n$ en écriture décimale : $x_n = 0, a_1(n)a_2(n)...$ avec $forall i in NN^*, a_i (n) in [|0, 9|]$\
\
Pour tout entier $n >= 1$, on choisit un element de $[|0, 9|]$ différent de $a_n (n)$ noté $y_n$. \
On note $x = 0,y_1y_2y_3...$.\

On démontre facilement par récurrence que $forall n in NN^*, x_n != x$ or $x in [0, 1[$.\
Donc $x in.not {x_n | n in NN} arrow.long$ contradiction.\

Donc pas equipotence entre $NN "et" [0, 1[$.\
Or $[0, 1[ subset RR$.\ 
Donc $NN "et" RR$ ne sont pas équipotents.\

#finpreuve()
#set text(black)

#prop() $RR$ admet la propriété de la borne supérieure :\
$forall A subset RR, exists a in overline(RR)$, tel que:\
- $forall x in A, x <= a$\
- $forall b < a, exists x in A, b < x$\

#remarque() $QQ$ n'admet pas cette propriété.\
Par exemple, $A = {x in QQ | x^2 < 2}$ n'a pas de borne supérieure dans $QQ$.\


= III. définition d'une tribu, premières propriétés

Soit $E$ un ensemble et $cal(P)(E)$ l'ensemble de ses parties.

#def() Une tribu $cal(A)$ sur $E$ est un sous-ensemble non-vide de $cal(P)(E)$tel que :\ 
- $emptyset in cal(A)$
- Si $A in cal(A)$, alors $A^C in cal(A)$
- Si $(A_n)_(n in NN) in cal(A)^(NN), "alors" display(union.big_(n in NN)) A_n in cal(A)$

#texemples()
#set text(green)
- $cal(P)(E)$ est une tribu sur $E$\
- ${emptyset, E}$ est une tribu sur $E$\
- Soit $A subset E$ (on suppose $A != emptyset "et" A != E$).\ Alors ${emptyset, A, A^C, E}$ est la plus petite tribu contenant $A$.\
- Quelle est la plus petite tribu qui contient le singleton ${n}$, pour tout $n in NN$ ?\ $-->$ $cal(P)(E)$ !

#set text(black)

#def() Si $cal(A)$ est une tribu sur $E$, le couple $(E, cal(A))$ est appelé *espace mesurable*.\

#prop() Une tribu est stable par :
- intersection dénombrable 
- par différence symétrique

#tpreuve()
#set text(blue)
- Soit $(A_n)_(n in NN) in cal(A)^(NN)$.\
$display((inter.big_(n in NN) A_n)^C &= union.big_(n in NN) A_n^C\
inter.big_(n in NN) A_n &= (union.big_(n in NN) A_n^C)^C)$\
Or, par définition de la tribu :\

$forall n in NN, &A_n^C in cal(A)\ &display(union.big_(n in NN) A_n^C in cal(A))$\

$--> cal(A)$ est stable par intersection dénombrable.\

- Pour la différence symétrique :\
Soient $A, B in cal(A)$\
$A\\B = A inter B^C in cal(A)$\
$A triangle B = (A\\B) union (B\\A) in cal(A)$
#finpreuve()
#set text(black)

#prop() Une intersection (quelconque) de tribus de $E$ est une tribu sur $E$.

#tpreuve()
#set text(blue)

Soient $(cal(A)_i)_(i in I)$ des tribus sur $E$.\ 
Soit $cal(A) = display(inter.big_(i in I) cal(A)_i)$

- $forall i in I, emptyset in cal(A)_i, "donc" emptyset in cal(A)$

- $"Soit" A in cal(A), &forall i in I, A in cal(A)_i\
"Donc" &forall i in I, A^C in cal(A)_i$\
Donc $A^C in cal(A)$

- Soit $(A_n)_(n in NN)$ une suite d'éléments de $cal(A)$.\ Pour tout $n in NN, A_n in display(inter.big_(i in I)cal(A)_i)$, donc $forall i in I, A_n in cal(A)_i$\ Donc $forall i in I, display(union.big_(n in NN)A_n in cal(A)_i)$\ 
D'où $display(union.big_(n in NN) A_n in inter.big_(i in I) cal(A)_i = cal(A))$

#finpreuve()
#set text(black)

#prop() Soit $epsilon$ un sous ensemble de $cal(P)(E)$. \
Il existe une plus petite tribu (au sens de l'inclusion) qui contient $E$. \
On l'appelle tribu engendrée par $E$ et on la note $sigma(E)$.

#tpreuve()
#set text(blue)
On pose $cal(A) = display(inter.big_(M "dans l'ensemble des"\ "tribus qui contiennent" epsilon) M)$\
--> il suffit de prouver que $cal(A)$ est bien cette tribu.\

#finpreuve()
#set text(black)

#prop() Soit $f : E --> F$ et $cal(B)$ une tribu sur $F$.\ 
$cal(A) = {f^(-1)(B) | B in cal(B)}$ est une tribu, appelée *tribu image réciproque* de $cal(B)$ par $f$.

#tpreuve()
#set text(blue)

- $emptyset = f^(-1)(emptyset) in cal(A)$

- Soit $A in cal(A)$. Il existe $B in cal(B)$ tel que $A = f^(-1)(B)$ (par définition de $cal(A)$)\ $A^C &= (f^(-1)(B))^C \ &=f^(-1)(B^C) in cal(A)$ (car $B^C in cal(B)$)

- Soit $(A_n)_(n in NN)$ une suite de $cal(A)$.\ $forall n in NN, exists B_n in cal(B)$ tel que $A_n = f^(-1)(B_n)$\ 
$display(union.big_(n in NN) A_n &= union.big_(n in NN) f^(-1)(B_n)\ &= f^(-1)(union.big_(n in NN) B_n))$\
Or $display(union.big_(n in NN) B_n in cal(B))$\ Donc $display(union.big_(n in NN) A_n in cal(A))$

#finpreuve()
#set text(black)

#prop()\ 
Soient $f : E --> F, epsilon in cal(P)(F)$\ 
$f^(-1)(sigma(epsilon)) = sigma(f^(-1)(epsilon))$

#tpreuve()
#set text(blue)
(Double inclusion)
- $epsilon subset sigma(epsilon)$ donc $f^(-1)(epsilon) subset f^(-1)(sigma(epsilon))$\ Mais $f^(-1)(sigma(epsilon))$ est une tribu, donc $sigma(f^(-1)(epsilon)) subset f^(-1)(sigma(epsilon))$

- Notons $cal(B) = {B subset F | f^(-1)(B) in sigma(f^(-1)(epsilon))}$\ $cal(B)$ est une tribu\ $cal(B)$ contient $epsilon$ donc $cal(B)$ contient $sigma(epsilon)$\ $f^(-1)(sigma(epsilon)) subset f^(-1)(cal(B)) subset sigma(f^(-1)(epsilon))$

#finpreuve()
#set text(black)

#texemple() (tribu induite)\
#set text(green)
Soit $E$ muni d'une tribu $cal(A)$.\
Soit $B subset E$.\
$cal(B) = {A inter B | A in cal(A)}$ est une tribu sur $B$.\
- $emptyset = emptyset inter B in cal(B)$
- Soit $C in cal(B)$, Il existe $A in cal(A)$ tel que $C = A inter B$\ $C^C = B \\ C &= B inter C^C\
&= B inter A^C in cal(B)$
- Soit $(C_n)_(n in NN)$ une suite d'éléments de $cal(B)$.\ Il existe $(A_n)_(n in NN) in cal(A)^NN$ telle que $forall n in NN, C_n = A_n inter B$\
$display(union.big_(n in NN) C_n &= union.big_(n in NN) (A_n inter B)\ &= (union.big_(n in NN) A_n) inter B in cal(B))$
#finexemples()
#set text(black)

= IV. Tribu borélienne

#def() Dans le cadre usuel sur $RR$ (topologie usuelle sur $RR$), un ensemble $O subset RR$ est ouvert si $forall x in O, exists a, b in RR "tq" x in ]a, b[ subset O$

#texemples()
#set text(green)
- $[0, 1[$ pas ouvert
- $]0, 1[$ ouvert
- $[0, 1]^C = ]-infinity, 0[ union ]1, +infinity[$ ouvert
#finexemples()
#set text(black)

#def() La tribu sur $RR$ engendrée par les ouverts (usuels) est appelée tribu borélienne sur $RR$ et notée $cal(B)(RR)$.\

#remarque() \
$]0, 1[ in cal(B)(RR)$\
${0} = (]-infinity, 0[ union ]0, +infinity[)^C$\
$[0, 1] &= {0} union ]0, 1[ union {1}\
&= (]-infinity, 0[ union ]1, +infinity[)^C$

#prop() $cal(B)(RR)$ est engendrée par (au choix) :\
1. les intervalles ouverts\
2. les intervalles ouverts à extrémités rationnelles\
3. les intervalles $]-infinity, a], a in RR "ou" QQ$
4. les intervalles $]-infinity, a[, a in RR "ou" QQ$

#remarque() ${sqrt(2)} = display(inter.big_((r, r') in QQ^2\ r^2 < 2\ r'^2 > 2)) ]r, r'[$

#tpreuve()
#set text(blue)

*2.* (car 2 $arrow.double$ 1)\
Soit $O$ un ouvert de $RR$.\
$I = {(rho, r) in QQ times QQ_+^* | ]rho - r, rho + r[ subset O}$\
$O = display(union.big_((rho, r) in I))]rho - r, rho + r[$\

- $forall (rho, r) in I, ]rho - r, rho+r[ subset O$ par définition de $I$\.\ Donc $O supset display(union.big_((rho, r)in I))]rho - r, rho + r[$
- Soit $x in O$.\ Par définition de l'ouvert, $exists a, b in RR$ tels que $x in ]a, b[ subset O$ ($a < x < b$).\ $"Il existe" &r_1 in ]a, x[ inter QQ\
&r_2 in ]x, b[ inter QQ$.\ $]r_1, r_2[ = ](r_1+r_2)/2 - (r_2 - r_1)/2, (r_1 + r_2)/2 + (r_2 - r_1)/2[ subset ]a, b[ subset O$

*3.*\
- $epsilon = {]-infinity, a[ | a in RR} subset cal(O)$
- $sigma(epsilon) = sigma(cal(O)) = cal(B)(RR)$\ soient $a < b$ deux réels.\ $]a, b[ &= ]-infinity, b[ inter ]a, +infinity[ \ 
&= ]-infinity, b[ inter (]-infinity, a\[^C)\
&= ]-infinity, b[ inter (display(inter.big_(n in NN^*))\]-infinity, a+1/n [)^C$ \ Astuce : $]-infinity, a] = display(inter.big_(n in NN))]-infinity, a + 1/n [$

*4.*\
$epsilon' = {]-infinity, a[ | a in RR}$\
$]-infinity, a] = (]a, +infinity[)^C in cal(B)(RR)$\
$sigma(epsilon') subset cal(B)(RR)$.\

$]a, b[ = ???$\
(faire comme pour 3.)

#finpreuve()
#set text(black)

#remarque() On considèrera parfois la droite achevée $overline(RR) = RR union {+infinity, -infinity}$.\
La topologie (usuelle) sur $overline(RR)$ c'est toutes les réunions d'ensembles $]a, b[, ]-infinity, a[, ]b, +infinity[$ avec $a, b in RR$.\