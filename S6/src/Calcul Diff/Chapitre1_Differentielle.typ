#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Calcul Différentiel*])
#align(center, text(15pt)[Chapitre 1 : Différentielle]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

= I. Définition et premières propriétés

$(E, normi(E, .)) et (F, normi(F, .))$ evn de dimention finie\
$Omega$ ouvert de $E$

#def() Une fonction $f:Omega --> F$ est *différentiable* en $x in Omega$ si il existe une application linéaire $L_x : E-->F$\ 
telle que $f(x+h) = f(x) + L_x (h)+o_(h-->0)(h)$\
(cad $f(x+h)=f(x)+L_x (h) + norm(h)_E epsilon(h)$, avec $norm(epsilon(h))_F -->_(norm(h)_E -->0)0$ )

#prop() Si une telle application $L_x$ existe, elle est unique,\ on l'appelle *différentielle* de $f$ en $x$, et on la note $L_x = dif f(x)$\ (ou alors $dif f_x (h)$)

#demo()[
*Unicité*\
Supposons qu'il existe deux applications linéaires $L_1 : E-->F et L_2 : E-->F$

$tq f(x+h) &= f(x) + L_1 (h) + norm(h) epsilon_1(h)\
&= f(x) + L_2 (h) + norm(h) epsilon_2(h)$

On veut mq $L_1 = L_2$\
Soit $h in E$\
Pour $t in RR$ suffisament petit (pour que $x + t h in Omega$)

$"on a" f(x+t h) &= f(x)+L_1(t h)+norm(t h)epsilon_1(t h)\
&= f(x)+L_2(t h)+norm(t h)epsilon_2(t h)$\
Donc $forall t > 0$ petit, $L_1(t h)+norm(t h) epsilon_1(t h) = L_2(t h)+norm(t h) epsilon_2(t h)$

Par linéarité de $L_1 et L_2$, ete par homogénéité de la norme,\
$t L_1(h)+t norm(h) epsilon_1(t h) = t L_2 (h)+t norm(h)epsilon_2(h)$\
$t!=0$ donc\
$L_1(h)+norm(h)epsilon_1(t h) = L_2(h)+norm(h)epsilon_2(h)$\
Passage à la limite quand $t -->0$ on a bien $L_1 = L_2$
]

#prop() $f:]a, b[-->RR$\
$f$ différentiable en $x$ $ssi$ $f$ dérivable en $x$

#prop() Si $f : Omega --> F$ est différentiable en $x in Omega$, alors $f$ est continue en $x$

#demo()[
$f(x+h)=f(x)+dif f(x)(h)+o(h)$\
$lim_(h-->0) o(h) = lim_(h-->0)dif f(x)(h) = 0$ ($dif f(x)$ est linéaire)

donc $f(x+h)-->_(h-->0) f(x)$
]

#prop()
- Soient $f:Omega-->F et g:Omega-->F, alpha, beta in RR$\
  Si $f et g$ sont différentiables en $x in omega$ alors $alpha f + beta g$ est différentiable en $x$\
  et $dif (alpha f+beta g) (x) = alpha dif f(x)+beta dif g(x)$

- Soient $f:Omega-->RR et g:Omega-->RR$\
  Si $f$ et $g$ sont différentiables en $x in Omega$, alors $f g$ est différentiable en $x$\
  et $dif (f g)(x) = dif f(x) g(x)+ f(x) dif g(x)$

- Soient $f:Omega subset E-->F et g : Omega' subset F --> G tq f(Omega) subset Omega'$\
  Si $f$ est différentiable en $x in Omega$, et $g$ différentiable en $f(x)$, alors $g rond f$ est différentiable en $x$\
  et $dif (g rond f) = dg(f(x)) rond df(x)$



#demo()[
*1.* (on utilise la definition de différentiablilité avec $epsilon(h)$)

*2.*

$(f g)(x+h) &= (f(x)+dif f(x)(h)+norm(h)epsilon_1(h))(g(x)+dif g(x)(h)+norm(h)epsilon_2(h))\
&= f(x)g(x) + f(x) dif g(x)(h) + dif f(x)(h) g(x) + "[du bordel en" o(x)"]"\
$


*3.*

$(g rond f)(x+h) &= g(f(x+h))\
&= g(f(x) + dif f(x)(h)+norm(h)_E epsilon_1(h))\ \

&= g(f(x))+dif g(f(x))(dif f(x)(h) + norm(h)epsilon_1 (h))\ 
&+norm(df(x)(h) + norm(h)_E epsilon_1(h))_F epsilon_2 (df(x)(h) + norm(h)_E epsilon_1(h))\ \

&= g rond f(x)+ dg(f(x))(df(x)(h)) + norm(h)_E dg(f(x))(epsilon_1(h)) + psi_x (h)$

$psi_x (h) &<=^("inégalité"\ "triangulaire") ...\
$
]

#rq() Pour $f : I --> RR$ dérivable, pour $y in I$

La différentielle de $f$ en $y$ est $dif f(y) : func(RR-->RR, t ass f'(y) dot t)$
#pagebreak()
= II. Dérivées directionnelles

$x in Omega subset E$\
Si $f:Omega --> F$ est différentiable en $x$, pour $v in E$

$f(x + t v) &= f(x) + df(x)(t v) + o(t)\
&= f(x) + t df(x)(v) + t epsilon(t) "   (avec" epsilon -->_(t-->0)0)$

et donc $(f(x+t v)-f(x))/t = df(x)(v)+epsilon(t)$

$"d'ou" lim_(t-->0) (f(x+t v)-f(x))/t$ existe et vaut $df(x)(v) in F$
\ \ \
#def() Soit $f : Omega subset E --> F$, soit $x in Omega, v in E$

Si la limite de $(f(x+t v)-f(x))/t$ existe pour $t-->0$\
alors on dit que $f$ admet une *dérivée directionnelle* en $x$ dans la direction $v$.\
On la note $D_v f(x) in F$ 

#prop() Soit $f : Omega subset E --> F, x in Omega$\
Si $f$ est différentiable en $x$, alors pour toute direction $v in E$, $f$ admet une dérivée directionnelle en $x$ dans la direction $v$.\
Et $D_v f(x) = df(x)(v)$

#rq() la réciproque est fausse

#ex()[
$f : func(RR2 --> RR, (x,y) ass cases(1 &si y = x^2 != 0, 0 &sinon))$\
$f$ admet des dérivées directionnelles (nulles) en 0 dans toutes les directions mais n'est pas continue en 0

Avec $v = (v_1, v_2), v_1 != 0$\
Pour $t != 0$\
$f(a+t v) = f(t v_1, t v_2) != 0 &ssi t v_2 = t^2v_1^2\
&ssi t = v_2/v_1^2$\
$donc forall t in ]-abs(v_2)/v_1^2, abs(v_2)/v_1^2[$ ...
]

#pagebreak()
= III. Dérivées partielles

$E = RRn$, base canonique $(e_1, ..., e_n)$

#def() $f : RRn --> F$\
La dérivée partielle de $f$ selon $x_i$ est $derp(f, x_i) = g'_i$\
$avec g_i : t ass f(x_1, ..., x_(i-1), t, x_(i+1), ..., x_n)$

#prop() Soit $f : Omega subset RRn --> F, x in Omega$\
La fonction $f$ admet une dérivée partielle par rapport à la $i$-ème coordonnée en $x$\ $ssi$ elle admet une dérivée directionnelle en $x$ dans la direction $e_i$\
On a alors $derp(f, x_i)(x) = D_e_i f(x)$

#demo()[

$(g_i (x_i + t) - g_i (x_i))/t = (f(x+t e_i) - f(x))/t\
"passage à la limite" (t-->0) :\
derp(f, x_i) = D_e_i f(x)$
]

#rq() $derp(f, x_i)(x) = D_e_i f(x) = df(x)(e_i)$

#rq() Si on définit pour $i in [|1, n|]$ la forme linéaire\
$dif x_i : func(RRn &--> RR, h &ass h_i)$\
Alors on peut écrire pour $f : Omega --> F$ différentiable en $x$ :\
$df(x) = sum_(i=1)^n derp(f, x_i) dif x_i$

#def() Soit la fonction $f : Omega subset RRn--> RR^p$ qui admet des dérivées partielles en $x$ selon toutes les coordonnées $x_i$\
La *matrice Jacobienne* de $f$ est

$Jac f(x) &= mat(derp(f, x_1)(x), ..., derp(f, x_n)(x))\
&= mat(derp(f_1, x_1)(x), ..., derp(f_1, x_n)(x);
dots.v, dots.down, dots.v; 
derp(f_p, x_1)(x), ..., derp(f_p, x_n)(x))$

#prop() Pour $f : Omega subset RRn --> RR^p$ différentiable en $x in Omega$\
alors $forall h in RRn, df(x)(h) = Jac f(x) dot h$

#pagebreak()
#def() Soit $f : Omega subset RRn --> RR$ (cas $p = 1$)\
Soit $x in Omega tq f$ admet des dérivées partielles en $x$ suivant toutes ses coordonnées.

On définit alors le *gradient de $f$ en $x$* comme le vecteur$nabla f(x) = mat(derp(f, x_1)(x); dots.v; derp(f, x_n)(x)) in RRn$

#rq() $nabla f(x) = (Jac f)^T$

#prop() Si $f : Omega subset RRn --> RR$ est différentiable en $x in Omega$, alors

$forall h in RRn, df(x)(h) &= scal(nabla f(x), h)\
&= sum_(i=1)^n k_i h_i$

#exo[
$norm2(.) : func(RRn&-->RR, x &ass norm2(x) = sqrt(scal(x_i, x_i)))$\
Mq $norm2(.)$ est différentiable en tout $x in RRn\\{0}$ et calculer sa différentielle
][
On écrit $norm2(.) = g rond f$

$avec f : func(RRn &--> RRP, x &ass scal(x, x))\
et g : func(RRP &--> RR, t &ass sqrt(t))$

*$f$ est différentiable et tout $x in RRn$*

$f(x+h) &= scal(x+h, x+h)\
&= scal(x, x) + 2scal(x, h) + scal(h, h) "(par bilinéarité et symétrie)"\
&= f(x) + 2scal(x, h) + norm2(h)^2\
&= f(x) + 2scal(x, h) + o_0(norm2(h))$

Donc $f$ est bien différentiable en $x$, de différentielle $df(x) : h ass 2scal(x, h)$

*$g$ est différentiable sur $RRPE$*\
$g$ est dérivable sur $RRPE$, de dérivée $g' : t ass 1/(2sqrt(t))$

$dg(t) : k ass g'(t) dot k = k/(2sqrt(t))$

Comme $x != 0 imp f(x) > 0$, on peut, pour $x != 0$, appliquer le thm de différentiation de la composée de foctions.\ 
On en déduit que $norm2(.) = g rond f$ est différentiable et tout  $x in RRn\\{0}$

$"et de différentielle" dif(g rond f)(x)(h) &= dg(f(x))(df(x)(h))\
&= 1/(2sqrt(f(x)))df(x)(h)\
&= (2scal(x, h))/(2norm2(x))\
&= scal(x, h)/norm2(x)\
&= scal(x/norm2(x), h)\
&= scal(nabla (g rond f)(x), h)$

Donc $nabla (g rond f)(x) = x/norm2(x)$




]



