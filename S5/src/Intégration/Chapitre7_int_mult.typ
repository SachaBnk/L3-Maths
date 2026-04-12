#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[Chapitre 7 — Intégrales multiples])

#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

= I. Mesure produit

$(E, Ar, mu) et (F, Br, nu)$ deux espaces mesurés tq $mu et nu$ soient $sigma$-finies

$E times F = {(x, y) | x in E, y in F}\
Ar times.o Br = sigma({A times B | A in Ar, B in Br})\
mu times.o nu = ???$

#lemme() Soit $C in Ar times.o Br$,\
on note $C_x = {y in F | (x, y) in C} et C^y = {x in E | (x, y) in C}$\
$forall x in E, y in F, C_x in Br et C^y in Ar$

#demo[
- Soit $Cr$ l'ensemble des elems $C$ de $Ar times.o Br$ tq\
$forall x in E, forall y in F, C_x in Br, C^y in Ar$\
$Cr$ est une tribu qui contient ${A times B | A in Ar, B in Br}$\
Donc $Cr supset Ar times.o Br$\
(Par def $Cr subset Ar times.o Br$)
]

#thm()
+ Il existe une unique mesure m sur $Ar times.o Br$\
  $tq forall A in Ar, forall B in Br, m(A times B) = mu(A)nu(B)$\ (on suppose $0 dot pinf = 0$)\
  On l'appelle mesure produit de $mu et nu$, on la note $mu times.o nu$

+ Soit $C in Ar times.o Br,$\
  $x ass nu(C_x)$ est $Ar$-mesurable\
  et $y ass mu(C^y)$ est $Br$-mesurable\
  Elles sont à valeurs dans $RRPB$

+ $mu times.o nu(C) = int_E nu(C_x)mudx = int_F mu(C^y)nudy$

#demo[Flemme + pas le temps dans le semestre]

#rq() Si $C = A times B alors (A times B)_x = cases(es &si x in.not A, B &si x in A)$\ 
Donc $nu(C_x) = cases(0 &si x in.not A, nu(B) = nu(B)ind_A (x) &si x in A)$

$int_E nu(C_x)mudx = nu(B) int_E ind_A (x) mudx = nu(B)mu(A)$
#pagebreak()
#ex("fondamental")[
Mesure de Lebesgue sur $(RR^d, Br(RR^d))$\
Il existe une unique mesure notée $lambda_d$, sur $(RR^d, Br(RR^d))$\ $tq pour I_1, ..., I_d$ des intervalles de $RR$, $lambda_d (I_1 times ... times I_d) = lambda(I_1) ...lambda(I_d)$\
$lambda_d = lambda times.o ... times.o lambda$, (d fois)

#rq() $lambda_d (a+B) = lambda_d (B) pour a in RR^d, B in Br(RR^d)$\
$lambda_d ([0, 1]^d) = 1$
]

= II. Intégrale par rapport à *$mu times.o nu$*

#rq() on sait que $mu times.o nu (C) = int_E nu(C_x)mudx = int_F mu(C^y) nudy$

$ou int_(E times F)ind_C dmu times.o nu &= int_E (int_F ind_Cx (y)nudy)mudx\
&= ...\
&= int_E (int_F ind_C (x, y)nudy)mudx$

#thm("de Tonelli") <tonelli> Soit $f$ mesurable de $E times F dans RRPB$

+ $E &--> RRPB &"est " Ar"-mesurable"\ x &ass int_F f(x, y)nudy$\
  $F &--> RRPB &"est " Br"-mesurable"\ y &ass int_E f(x, y)mudx$\

+ Dans $RRPB$ on a

  $int_(E times F) f dmunu = int_E (int_F f(x, y) nudy)mudx = int_F (int_E f(x, y) mudx)nudy$

#ex(1)[
$D = {(x, y) in RR2 | x + y >= 1, x^2 + y^2 <= 1}$\
$f : (x, y) in RR2 ass x y^2 ind_D (x, y)$\ 
$mu = nu = lambda$

$D = {"“points au dessus de" y = 1-x"“"} inter {"“disque unité“"}$\
$f$ est mesurable positive car c'est le produit $(x, y) ass x y^2$ (continue sur $RR2$) et et $ind_D$ avec $D in Br(RR2)$

$int_RR2 f dlambda &= int_RR (int_RR f(x, y) lambdadx)lambdady\ &= int_RR (int_RR x y^2 ind_D (x, y) lambdadx)lambdady "(tranches horizontales)"\
&= int_0^1 (int_(1-y)^sqrt(1-y^2)x y^2 dx)dy\
&= int_0^1 [(x^2 y^2)/2]_(1-y)^sqrt(1-y^2)dy\
&= int_0^1 (((1-y^2)y^2)/2 - ((1-y)^2y^2)/2)dy\
&= ...\
&= 1/20$
]

#ex(2)[
$f : (x, y) ass y e^(-x)$

$D = {(x, y) in RR2 | 0 <= x <= y <= x+x^2}\
I = int_RR2 f(x, y) ind_D (x, y) d(lambda times.o lambda)(x, y)\
(x, y) ass f(x, y) "est mesurable et positive"$\
on applique le #lien(<tonelli>)[thm de Tonelli]

$I &= int_RRP (int_[x, x+x^2] y e^(-x)dy) dx\
&= int_RRP [y^2/2]^(x+x^2)_x dx \
&= int_RRP ((x+x^2)^2/2 - x^2/2)e^(-x) dx\
&= int_RRP (x^4+2x^3)/2 e^(-x) dx\
&= int_RR (x^4/2 + x^3)e^(-x)dx\
I &= 1/2 4! +3! = 18$
]

#rappel() $int x^n e^(-x) dx = n!$

#ex(3)[

$f : cases(RRP^2 &--> RRP, (x, y) &ass y e^(-(y^2 (1+x^2))/2))$\
$f$ est continue sur $RRP^2$ donc mesurable\
$f$ est positive\
on peut appliquer le #lien(<tonelli>)[thm de tonelli] pour calculer $I = int_(RRP^2) f dlambda_2$

*D'une part*\
$int_0^a f(x, y)dx &= int_0^a y e^(-(y^2 (1+x^2))/2)dx\
&= y e^(-y^2/2) int_0^a e^(-(y x)^2/2)dx\
&=^(u = x y) y e^(-y^2/2) int_0^(y a) e^(-u^2/2) du/y\
&= e^(-y^2/2) int_0^(y a) e^(-u^2/2)du$

passage à la limite $(a --> pinf)$ : $int_0^pinf f(x, y)dx = e^(-y^2/2) J$\
$avec J = int_0^pinf e^(-u^2/2)du$

Donc $I = int_RRP e^(-y^2/2)J dy = J^2$

*d'autre part*\
$I = int_RRP (int_RRP f(x, y)dy)dx$\
pour $x>0 "fixé", a > 0$

$int_0^a y e^(-(y^2 (1+x^2))/2)dy &= [(-e^(-(y^2 (1+x^2))/2))/(1+x^2)]_0^a\
&= -(e^(-(a^2 (1+x^2))/2))/(1+x^2) + 1/(1+x^2)\
&-->_(a-->pinf) 1/(1+x)
$

On réinjecte et on conclus (il a effacé la fin ce petit sexe)
]
#pagebreak()
#rq() $int_0^pinf e^(-u^2/2)du = sqrt(pi/2)$

ou encore $int_RR e^(-u^2/2)/sqrt(2 pi)du = 1$ (loi normale centrée réduite)
\ \ \ 
*petite transition 🏳️‍⚧️*

$Soit f : E times F --> KK$ mesurable\
$f$ est $mu times.o nu$-integrable si $int_(E times F) abs(f) dmunu < pinf$

D'apres #lien(<tonelli>)[tonelli], f est $munu$-intégrable ssi $int_E (int_F abs(f)dnu)dmu < pinf$\ 
$ou int_F (int_E abs(f)dmu)dnu < pinf$

#rq() $int_F abs(f) dnu$ est toujours définie dans $RRPB$

<fubini>
#thm("de Fubini") Soit $f : E times F --> KK$ intégrable.
+ Pour $mu$-presque tout $x in E$, $y ass f(x, y)$ est $nu$-intégrable\
  et $int f(x, y)nudy$ est $mu$-intégrable

+ Pour $nu$-presque tout $y in F$, $x ass f(x, y)$ est $mu$-intégrable\
  et $int f(x, y)mudx$ est $nu$-intégrable

+ $int_(E times F) f dmunu = int_E (int_F f(x, y) nudy)mudx = int_F (int_E f(x, y) mudx)nudy$
#pagebreak()
#ex[
$D = [0, 1] times [0, pinf[$\
$f(x, y) = e^(-y)sin(2 x y)$\
On voudrait intégrer $f ind_D$ par rapport à $lambda_2$\
$abs(f(x, y)) <= e^(-y) et int_RR2 e^(-y)ind_D dx dy &= int RRP (int_0^1 e^(-y)dx dy)\
&= int_RRP e^(-y)dy = 1 (< pinf)$

*D'une part*\
$Soit x in ]0, 1]$

$int_0^a e^(-y)sin(2 x y)dy = ..."  " ("double ipp ou alors on utilise les complexes")$

$int_0^pinf e^(-y)sin(2 x y)dy&= (2 x)/(1+4x^2)\
1/4 int_0^1 (8x)/(1+4x^2)dx &= 1/4[ln(1+4x^2)]_0^1 \
&= (ln 5)/4$

*D'autre part*\
Soit $y > 0$

$int_0^1 f(x, y)dx &= e^(-y) int_0^1 sin(2 x y)dx\
&= e^(-y) [(-cos(2 x y))/(2y)]_0^1\
&= e^(-y) (sin^2 y)/y$

*Conclusion*

$int_RRP e^(-y) (sin^2 y)/y dy = (ln 5)/4$
]

#exo[
$D = [0, pinf[ times [0, 1]$\
$f : (x, y) ass cos(x y)e^(-t x)$ avec $t >0$ fixé

$int_0^pinf (sin x)/x e^(-t x) dx = arctan 1/t$
][
]

#pagebreak()
#ex("plus théorique")[
$(E, Ar, mu)$ un espace mesuré ($sigma$ fini)\
$soit f : E times RRP --> RRP$ mesurable

$g : cases(E times RRP &--> RRP, (x\, t) &ass inf_{f > t})$ mesurable positive

On applique le #lien(<tonelli>)[thm de Tonelli] à g et $mu times.o lambda$

- $int_(E times RRP) g d mu times.o lambda &= int_E (int_RRP g(x, t) lambda(dt))mudx\
&= int_E (int_RRP ind_{f > t}dt)mudx = int_E f dmu$

- $int g dmu times.o lambda &= int_RRP (int_E g(x, t) mudx)dt\
&= int_RRP mu({x in E | f(x) > t})dt$

On a donc $int_E f dmu = int_RRP mu({x in E | f(x) > t})dt$
]

#pagebreak()
= III. Mesure image et changement de variable

== 1. Le cas affine

#rappel() mesure image\
$f : (E, Ar, mu) --> (F, Br)$\
$forall B in Br, nu(B) = mu(fm(B))$\
$nu(F) = mu(E)$\
On a montré que pour $g$ mesurable positive de $F$ vers $RRP$, $int_F g dnu = int_E g rond f dmu$

On s'intéresse à la mesure image de $lambda_d "sur" (RR^d, Br(RR^d))$\
par l'application $x ass A x + b avec A in GL_d (RR)$\
notons $nu_d$ cette mesure image

#thm()\
$nu_d = 1/abs(det A) lambda_d$\
ou encore pour $g : RR^d --> RRP$ mesurable, 

$int _RRP g(y) (lambda_d (dy))/abs(det A) = int_RR^d g(A x + b)lambda_d (dx)$

$y = a x + b, x = A^(-1)(y - b)$

#demo[
- La mesure de Lebesgue sur $RR^d$ est invariante par translation, donc on peut supposer $b = 0$

- On montre que $nu_d$ est également invariante par translation\
  Soit $a in RR^d, B in Br(RR^d)$

  $nu_d (a+ B) &= lambda_d(fm(a+B))\
  &= lambda_d (A^(-1)(a+B))\
  &= lambda_d (A^(-1)a + A^(-1)B)\
  &= ...$ ok

$nu_d$ est donc un multiple de $lambda_d$ : il existe $alpha in RRPB$ tq $nu_d = alpha lambda_d$

- $nu_d (RR^d) = lambda_d(RR^d) = pinf$

  $et lambda_d(RR^d) &<= sum_(n in ZZ^d) nu_d (n + [0, 1]^d)\
  &<= sum_(n in ZZ^d)nu_d ([0, 1]^d)$

- $nu_d ([0, 1]^d) = lambda_d (A^(-1)[0, 1]^d) <pinf$ car $A^(-1)[0, 1]^d$ borné

*bilan intermédiaire*\
$nu_d = alpha lambda_d avec alpha in RRPE$\
$donc alpha = nu_d ([0, 1]^d) car lambda_d ([0, 1]^d) = lambda([0, 1])^d = 1$

Il faut trouver un ensemble $B$ tel qu'on connaisse $nu_d (B) et lambda_d (B)$

3 étapes :
- A orthogonale
- A symétrique définie positive
- cas général
]

#ex[
On veut déterminer la transformée de Fourier de $g : x ass 1/pi 1/(1+x^2)$\
$g$ est continue et positive et $int_RR d dlambda = 1$\
car $int_a^b 1/(1+x^2)dx = arctan b - arctan a$

$gc(t) = int_RR e^(i t x) 1/(pi (1+x^2))dx = int_RR (cos (t x))/(pi(1+x^2))dx$

$Soit t in RR "fixé", a > 0 "fixé"$\
$f(u, x) = e^(i(u+t)x) e^(-abs(u)) e^(-a abs(x))$\
$abs(f(u, t)) = e^(-abs(u))e^(-a abs(x))$

$int_RR2 e^(-abs(u))e^(-a abs(x)) lambda_2(du dx) = (int_RR e^(-abs(u))du)(int_RR e^(-a abs(x))dx)$

$f$ est $lambda_2$-intégrable. On peut calculer son intégrale grâce à Fubini

$I &= int_RR2 f d lambda_2\
&= int_RR e^(-a abs(x))e^(i t x)(int_RR e^(i u x)e^(-abs(u))lambda(du))lambdadx\
&= int_RR e^(i t x)/(1+x^2)e^(- a abs(x))lambdadx\
&= int_RR e^(-abs(u))(int_RR e^(i(u+t)x e^(-a abs(x)))lambdadx)lambda(du)\
&= int_RR e^(-abs(u))(2a)/(a^2+(u+t)^2)du\
I&=^(y = (u+t)/a) int_RR e^(-abs(a y - t))(2a)/(a^2+a^2y^2)a dy$

$forall a > 0, int_RR e^(i t x)/(1+x^2)e^(-a abs(x))dx = int_RR e^(-abs(a y - t))/(1+y^2)dy$
]

== 2. Changement de variables général

#def() Soit $phi$ un $Cr^1$-difféomorphisme #text(gray)[(une bijection de classe $Cr^1$)]\
$phi : Delta subset  RR^d --> D subset RR^d$

$Jac(phi)(x) = mat(derp(phi_1, x_1)(x), ..., derp(phi_1, x_d)(x); dots.v,dots.down , dots.v; derp(phi_d, x_1)(x), dots, derp(phi_d, x_d)(x))$ (matrice Jacobienne de $phi$)

On lui associe son Jacobien : $J_phi (x) = det(Jac(phi)(x))$

#thm() 
- Soit $f : D --> RRP$ borelienne #text(gray)[(mesurable par rapport à $Br(RR^d)$)]

  $int_D f(x) dlambda_d (x) = int_Delta f(phi(y))abs(J_phi (y))dlambda_d (y)$

- Soit $f : D --> CC$ borelienne

  $f$ est intégrable ssi $int_Delta abs(f(y))abs(J_phi (y))lambda_d (dy) < pinf$

  dans ce cas, $int_D f dlambda_d = int_Delta f rond phi abs(J_phi)dlambda_d$

#ex(1)[

$I &= int_0^(pi/2) sin(x) cos^2(x) dx\
&=^(u = cos x) int_0^1 sqrt(1-u^2)u^2 (-1)/sqrt(1-u^2) du\
&= 1/3$
]

#ex("de fou — coordonnées polaires")[

$(x, y) = (r cos theta, r sin theta)$\
$phi(r, theta) : func(RRPE ]-pi\, pi\[ &--> RR2 \\ (RRM times {0}), (r, theta) &ass (r cos theta, r sin theta))$

$Jac(phi)(r, theta) = mat(cos theta, -r sin theta; sin theta, r cos theta)$\
$J_phi (r, theta) = r > 0$
]
#pagebreak()
#ex(3)[

$(int_RR e^(-x^2) dx)^2 &= (int_RR e^(-x^2)dx)(int_RR e^(-y^2)dy)\
&=^"Tonelli" int_RR2 e^(-(x^2+y^2))dx dy\
&= int_(RR2\\ RR times{0}) e^(-(x^2+y^2))dx dy\
& =int_(RRPE times \]-pi, pi\[) r e^(-r^2 (cos^2 theta)+r^2 (sin^2 theta)) dr dtheta\
&= int_(RRPE times \]-pi, pi \[) r e^(-r^2) dr dtheta = 2 pi int_(RRPE) r e^(-r^2) dr \
&= pi int_(RRPE) 2 r e^(-r^2) dr \
&= pi$

donc $int_RR e^(-x^2) dx = sqrt(pi)$
]

#ex(4)[
$D = {(x, y) in RR2 | x^2 + y^2 -2x < 0}$

$x^2 + y^2 -2x = (x-1)^2 + y^2 -1$\
$D = {(x, y) in RR2 | sqrt((x-1)^2+y^2)<1}$\
On reconnait la distance euclidienne entre $(x, y) et (1, 0)$

$I &= int_D sqrt(x^2+y^2)dx dy\
&= int_Delta r r dr dtheta avec Delta = {(r, theta) in RRP times ]-pi/2, pi/2[, 0 < r < 2 cos theta}$

$"en effet" x^2 + y^2 -2 x < 0 &ssi r^2 - 2 r cos theta < 0\
&ssi^(r>0) r < cos theta$

$I &= int_(\]-pi/2, pi/2\[) (int_(\]0, 2 cos theta\[)r^2 dr)dtheta\
&= int_(-pi/2)^(pi/2) [r^3/3]_0^(2 cos theta) dtheta\
&= 8/3 int_(-pi/2)^(pi/2) cos^3 theta dtheta = ... = 32/9 " (lineariser avec formule de moivre)"$
]

#pagebreak()
#ex(5)[
Pour $a, b in RR$

$D = {(x, y) in RRPE^2 | x^2/a^2 + y^2/b^2 < 1}$
(en gros c'est un quart d'ellipse wlh)

*Aire de $D$ et coordonnées du barycentre de $D$ ?*

$A &= int_D 1 dx dy$

$phi : (r, theta) ass (a r cos theta, b r sin theta)$

$1 > x^2/a^2 + y^2/b^2 ssi 1 > r^2$

$J_phi (r, theta) = mat(delim:"|", a cos theta, -a r sin theta; b sin theta, b r cos theta) = a b r$

$Donc A &= int_(\]0, 1\[ times \]0, pi/2\[) (a dot b dot r) dr dtheta\
&=^"Tonelli" pi/2 a b int_0^1 r dr\
&= (pi a b)/4$

pour le barycentre :\
$x_G &= 1/((pi a b)/4) int_D x dx dy\
&= ... = (4a)/(3pi)$\
$"de même," y_G = (4b)/(3pi)$





]