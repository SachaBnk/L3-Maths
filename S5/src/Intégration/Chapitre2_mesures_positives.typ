#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[Chapitre 2 — Mesures positives]) 
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
= I. Définitions et premières propriétés

#def() Soit $(E, Ar)$ un espace mesurable et une tribu sur $E$.\
$mu : Ar --> overline(RR)$ est une *mesure positive* si :
- $mu(es) = 0$
- $forall A in Ar, mu(A) >= 0$
- $display(mu(union.big_(n in NN) A_n) = sum_(n in NN) mu(A_n))$\
 où les $A_n$ sont des éléments de $Ar$ 2 à 2 disjoints.

#def() Une mesure $mu$ est dite *$sigma$-finie* s'il existe une suite croissante d'ensembles $(A_n)_(n in NN) tq display(union.big_(n in NN) A_n = E) et forall n in NN, mu(A_n) < pinf$

#texemple()
#set text(green)
$(NN, Pr(NN)) et mu(A) = card(A)$
#set text(black)

#def() une mesure est dite *finie* si $mu(E) < pinf$

#texemple() #text(green)[Mesure de comptage (ex précédent) sur $E = [|1, 4|]$ muni de $Pr(E)$.]

#def() une mesure $mu$ est dite *de probabilité* si $mu(E) = 1$

#texemple() #text(green)[Loi de Poisson, Loi uniforme]

#remarque() #text(red)[De toute mesure finie on peut construire une mesure de probabilité]

#def() Si $mu$ est une mesure sur $(E, Ar)$,\ alors $(E, Ar, mu)$ est appelé *espace mesuré*

#prop() Soit $(E, Ar, mu)$ un espace mesuré.
- Si $A_1, ..., A_n in Ar$ 2 à 2 disjoints, $display(mu(union.big_(k = 1)^n A_k) = sum_(k=1)^n mu(A_k))$
- Pour $A subset B$ deux éléments de $Ar$, $mu(A) < mu(B)$\
 Et si en plus $mu(A) < pinf$ alors $mu(B\\A) = mu(B) - mu(A)$
- $A, B in Ar, mu(A union B) + mu(A inter B) = mu(A) + mu(B)$

#tpreuve() 
#set text(blue)

*1.*\
On pose $pour i >= n+1, A_i = es$

*2.*\
$B = A union (B \\ A)$ est une réunion disjointe.\
d'où $mu(B = mu(A)) + mu(B \\A) >= mu(A)$

*3.*\
$A union B = (A\\B) union(A inter B) union (B\\A)$ 2 à 2 dijsoints\
$mu(A union B) = mu(A) - cancel(mu(B inter A)) + cancel(mu(A inter B)) + mu(B) - mu(A inter B)$\
$mu(A inter B) + mu(A union B) = mu(A) + mu(B)$

#finpreuve()
#set text(black)


On peut définir les mesures par une liste de propriétés légèrement différente.

#prop() $mu$ est une mesure sur $(E, Ar)$ ssi :\
- $mu(es) = 0$\ 
- $"Si" A_1, ..., A_n in Ar$ sont $2 "à "2$ disjoints, $mu(display(union.big_(k = 1)^n)A_k) = display(sum_(k=1)^n mu(A_k))$ \
- Pour toute suite croissante $(B_n)_(n in NN)$ d'éléments de $Ar$ ($forall n in NN, B_n subset B_(n+1)$),\ $mu(display(union.big_(n=0)^(+infinity)) B_n) = display(lim_(n-->+infinity)mu(B_n)) in overline(RR_+)$

#tpreuve()
#set text(blue) 

#text(red)[$arrow.double$]

On suppose que ces 3 conditions sont vérifiées par $mu$, on veut prouver que $mu$ est une mesure (au sens de la définition précédente)

Soit $(A_n)_(n in NN)$ une suite de $Ar$ d'ensembles 2 à 2 disjoints. \ 
Posons $B_n = display(union.big_(k=0)^n A_k)$ pour $n in NN$, 

$display(union.big_(n in NN) A_n = union.big_(n in NN) B_n)$ car :
- $A_n subset B_n$ donc $display(union.big_(n in NN) A_n subset union.big_(n in NN) B_n)$
- Soit $x in display(union.big_(n in NN) B_n)$, il existe $n_0 in NN$ tq $x in B_n_0$ ou $x in display(union.big_(k = 0)^n_0 A_k)$ \ donc il existe $k in {0, ..., n_0}$ tq $x in B_k$ donc $x in display(union.big_(n in NN) A_n)$

$(B_n)_(n in NN)$ est une suite croissante d'élémentsd de $Ar$.\
$B_n = display(union.big_(k=0)^n A_k subset union.big_(k=0)^(n+1)A_k = B_(n+1))$

De plus $mu(B_n) = sum mu(A_n)$\
Par 3. $display(mu(union.big_(n in NN) B_n) = lim_(n-->+infinity)mu(B_n) = sum_(k=0)^n mu(A_k))$\
Donc $mu$ est une mesure.

#text(red)[$arrow.double.l$]

Soit $mu$ une mesure\
Alors 1. et 2. de la prop sont vraies.

Soit $(B_n)_n$ une suite croissante d'éléments de $Ar$

Posons $A_0 = B_0$ et, pour $n in NN^*, A_n = B_n\\B_(n-1)$

#rq() $display(union.big_(n in NN) A_n = union.big_(n in NN) B_n)$ et les $A_n$ sont 2 à 2 disjoints.

$display(mu(union.big_(n in NN) B_n) = mu(union.big_(n in NN) A_n) &= sum_(n in NN)mu(A_n) \ 
&= lim_(n->+infinity) sum_(k=0)^n mu(A_k)\ 
&= lim_(n->+infinity)mu(union.big_(k=0)^n A_k)\
&= lim_(n->+infinity) mu(B_n))$

#finpreuve()
#set text(black)

#prop() 
- Si $(B_n)_n$ est une suite d'éléments de $Ar$,\
 $display(mu(union.big_(n in NN) B_n) <= sum_(n=0)^(+infinity)mu(B_n))$

- Si $(A_n)_n $ est une suite décroissante d'éléments de $Ar$, #text(red)[tq $exists n_0 in NN, mu(A_n_0) < +infinity$]\ 
 $display(mu(union.big_(n in NN)A_n) = lim_(n->+infinity)mu(A_n))$

#tpreuve()
#set text(blue)
Posons $A_0 = B_0$ et pour $n in NN^*, A_n = B_n \\ (display(union.big_(k=0)^n B_k))$\
les $(A_n)$ sont 2 à 2 disjoints et $display(union.big_(n in NN)A_n = union.big_(n in NN)B_n)$

$"Donc" display(mu(union.big_(n in NN)B_n) &= mu(union.big_(n in NN)A_n)\
&= sum_(n in NN) mu(A_n)\
& <= sum_(n in NN)mu(B_n)) "(car" A_n subset B_n ")"$ 

Pour $i >= n_0$, posons $B_i = A_n_0 \\ A_i$\
La suite $(B_i)_(i >= n_0)$ est croissante.\
$display(mu(union.big_(i. >= n_0)B_i) = lim_(i->+infinity)mu(B_i))$

$display(union.big_(i>= n_0)B_i = A_n_0\\(inter.big_(n >= n_0)A_n)\
mu(A_n_0\\(inter.big_(n >= n_0)A_n))=mu(A_n_0) - mu(inter.big_(n >= n_0)A_n)\
"et"\
mu(B_i) = mu(A_n_0) - mu(A_i)\
"donc l'un est égal à la limite de l'autre"\
question() "rattrapper (nickel)"
)$

#finpreuve()
#set text(black)

= II. Exemples de mesures discrètes
\
#def() Mesure de Dirac\
Soit $(E, Ar)$ un espace mesurable et $a in E$\
$delta_a (A) = display(cases(1 "si" a in A, 0 "sinon"))$

#rq() $delta_a (A) = bb(1)_A (a)$

#rq() 
- $delta_a (E) = 1$
- $delta_a (es) = 0$
- $"Soit" (A_n)_(n in NN)$ des éléments 2 à 2 distincts de $Ar$\
 $display(delta_a (union.big_(n in NN) A_n) = 1 &ssi a in union.big_(n in NN)A_n\
 &ssi exists n_0 in NN\, a in A_n_0)$\
 $display(sum_(n in NN) delta_a (A_n) = cases(0 "si" a in.not display(union.big_(n in NN)A_n), 1 "si" a in display(union.big_(n in NN)A_n)"car" (A_n) "2 à 2 disjoints"))$


#set text(green)
#texemple() Soient $a_1, ..., a_n in E$ différents\

- $mu = display(sum_(i = 1)^n delta_a_i)$\
 $mu(A) = "card"(A inter {a_1, ..., a_n})$ c'est la mesure de comptage sur ${a_1, ..., a_n}$

Soit $p in [0, 1]$\
- $mu = p delta_a + (1-p)delta_a -->$ on recconait Bernouilli

- $display(mu = sum_(k=0)^n mat(n;k)p^k (1-p)^(n-k) delta_k) -->$ binomiale

- $display(mu = sum_(k = 1)^(+infinity) p(A-p)^(k-1) delta_k) -->$ géométrique

#set text(black)
\
#rappel()\ $display(sum_(k = p)^n alpha^k &= alpha^p+alpha^(p+1)+...+alpha^n\
&= (alpha^p-alpha^(n+1))/(1-alpha))$

= III. Mesure de Lebesgue
\
#thm() Il existe une unique mesure sur $(RR, Br(RR))$, notée $lambda$ et appelée *mesure de Lebesgue*, telle que :
- $lambda ([0, 1]) = 1$
- $forall a in RR, forall B in Br(RR), lambda(a + B) = lambda(B)$\
 (Avec $a+B = {a+b | b in B}$)

#rq() $lambda([pi, pi+1]) = 1$

#prop() pour $a < b in RR$
- $lambda([a, b]) = lambda(]a, b]) = lambda\([a, b[) = lambda (]a, b[)= b-a$
- Si $I$ est un intervalle non borné, alors $lambda(I) = pinf$

#tdemo()
#set text(blue)
*1.*\
*Est ce qu'on peut ouvrir nos intervalles ?*\
Soit $alpha = lambda({0}), Soit n in NN^*$\
$A_n = {1/n, 2/n, ..., 1} subset [0, 1]$\
Donc $lambda(A_n) <= lambda([0, 1]) <= 1$ \
$display(lambda(A_n) &= lambda(union.big_(k=1)^n {k/n})\
&= sum_(k=1)^n lambda({k/n})\
&= sum_(k=1)^n lambda(k/n+{0})\
&= sum_(k=1)^n lambda({0}) = sum_(k=1)^n alpha = n alpha)$\
Ainsi $alpha in overline(RR) tq forall n in NN^*, n alpha <= 1$\
Donc $alpha = 0$\
Ainsi $forall a in RR, lambda({a}) = 0$\
(Donc on peut ouvrir nos intervalles)

*On prouve que $lambda([a, b]) = b-a$ dans $ZZ$*\
$Soit n in NN^*,$\ $]0, 1] &= ]0, 1/n] union ]1/n, 2/n] union ... union ](n-1)/n, 1] "(2 à 2 disjoints)"\ 
&= display(union.big_(k=1)^n ](k-1)/n\, k/n])$\
$display(1 = lambda(]0, 1]) &= sum_(k=1)^n lambda((k-1)/n + ]0, 1/n]))$\

On a donc $lambda(]0, 1/n]) = 1/n$

*Dans $QQ$ ?*\
$Soit n in NN^*, k_1 et k_2 in ZZ$\

$display(]k_1/n\, k_2/n] &= union.big_(i=k_1)^(k_2-1))(i_n + ]0, 1/n]))\
&= ]k_1/n, (k_1+1)/n] union ... union ](k_2-1)/n, k_2/n]$\
$"Donc" lambda(]k_1/n, k_2/n])&=(k_2-k_1)lambda(]0, 1/n])]\
&= k_2/n - k_1/n$

*Dans $RR$ ?*\
$Soit a < b in RR$\
Il existe $(a_n)_(n in NN), (b_n)_(n in NN)$ deux suites dans $QQ$ tq :
- $a_n < b_n$
- $a_n$ tend vers $a$ et décroit
- $b_n$ tend vers $b$ et croit

$]a, b\[ = display(union.big_(n in NN))]a_n, b_n [$\
$display(lambda(union.big_(n in NN)]a_n\, b_n \[) &= lim_(n --> pinf) ]a_n\, b_n\[\
&= lim_(n --> pinf) b_n - a_n\
&= b-a)$

*2.*\
$I &= ]a, pinf[\
&= display(union.big_(n in NN))\]a+n, a+n+1[$\
$lambda(I) &= display(sum_(n in NN))lambda\(]a+n, a+n+1[)\
&= pinf$

#finpreuve()
#set text(black)

#rappel() $Soit (E, Ar)$ un espace mesurable et $B in E$,\
$Ar_B = {A inter B | A in Ar}$ est une tribu sur $B$ appelée tribu induite (ou trace) de $Ar "sur" B$

#def() Soit $(E, Ar, mu)$ un espace mesuré et $B in Ar$,\
$"L'application" mu_B : Ar &--> overline(RR)\ C &arrow.long.bar mu_B (C) = mu(B inter C)$\
Est une mesure sur $(E, Ar)$ telle que $mu_b (B^C) = 0$

#tpreuve() exo

#texemple() \
#set text(green)
$lambda_RR_+, lambda_([0, 1]), ...$

$lambda_([0, 1]) (]1/3, 2/3]) = 1/3$

$lambda_([0, 1]) (]-pi, 1/2]) = 1/2$


#text(green)[#underline("Encore un peu d'exemples :")\ ]

Soit $(A_n)_(n in NN)$ une suite de sous-ensembles de $E$. On lui associe deux ensembles :
- $display(limsup_n (A_n) = inter.big_(n in NN) union.big_(k >= n) A_k)$

- $display(liminf_n (A_n) = union.big_(n in NN) inter.big_(k >= n) A_k)$
\ 
$x in display(limsup_n) (A_n) ssi forall n in NN, exists k >= n, x in A_k$\
$x$ appartient à une infinité d'ensembles $A_n$
\ \ \
$x in display(liminf_n) (A_n) ssi exists n in NN, forall k >= n, x in A_k$\
$x$ appartient à tous les $A_n$ à partir d'un certain rang

\ \ *($display(limsup_n) A_n)^C ?$*\

$x in (display(limsup_n) A_n)^C &ssi exists n in NN, forall k >= n, x in.not A_k\
&ssi ... \
&ssi x in display(liminf_n) (A_n)$\

*$liminf et limsup "de" A_n = ]-1-1/n, 1+(-1)^n/n] ?$*




#set text(black)