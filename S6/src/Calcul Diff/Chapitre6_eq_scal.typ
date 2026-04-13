#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#show heading: it => {it.body+"\n"}


#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Calcul Différentiel*])
#align(center, text(15pt)[Chapitre 6 - Équations scalaires]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
#counter(page).update(1)
#set page(numbering: "1 sur 1", number-align: center)

On considère $X' = f(t, X)$ $redstar$\
avec $f : I times Omega --> RR$, $Omega$ ouvert de $RR$

= I. Fonctions scalaires linéaires

#def() On dit que l'équation différentielle $redstar$ est *linéaire*\ 
si $f(t, a) = a(t)x+b(t)$ (avec $a$ et $b$ des fonctions continues sur $I$)\
Elle est dite *homogène* (ou sans second membre) si $b = 0$\
Elle est *autonome* (ou a coefficients constants) si els fonctions $a$ et $b$ sont constantes (et alors $I = RR$)

#rq() $f(t, x) = a(t)x + b(t)$ est continue sur $I times RR$ et (localement) lipschitzienne en $x$\
Donc Cauchy-Lipschitz s'applique : $forall (t_0, x_0) in I times RR$ il existe une unique solution maximale. De plus elle est globale

== 1. Cas homogène

$ redstar : cases(X' = a(t)X, X(t_0) = x_0) $
Si $x_0 = 0$ la fonction $X : t ass 0$ est la seule solution "évidente"\
Si $x_0 != 0, alors forall t in I, X(t) != 0$

- Si $x_0 = 0, alors $ la solution maximale est donnée explicitement par 
$ forall t in I, X(t) = 0 $
- Si $x_0 > 0$, alors pour tout $t in I : X(t) > 0$\
  En effet s'il existait $t_1 in I tq X(t_1)<=0$, alors comme $X$ est continue, le  #lien("https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_des_valeurs_interm%C3%A9diaires")[théorème des valeurs intermédiaires] nous assurerait l'existence d'un temps $t_2$ entre $t_0 et t_1$ tq $X(t_2) = 0$, On aurait alors deux solutions distinctes au problème de Cauchy
  $ cases(Y' = a(t)Y, Y(t_2)=0) $
  (la fonction $X$ est la fonction nulle), ce qui contredit l'unicité du théorème de Cauchy-Lipschitz.

Ainsi, si $x_0 !=0 alors : forall t in I, X(t) !=0$\
On peut donc diviser par $X(t)$ :
$ (X'(t))/X(t) = a(t) $

#pagebreak()
En intégrant entre $t_0 et t$, on obtient 
$ ln((X'(t))/X(t)) = int_(t_0)^t a(u) du $
En passant à l'exponentielle,
$ forall t in I, X(t) = x_0 exp(int_(t_0)^t a(u)du) $

*#underline("Conclusion :")* L'ensemble des solutions de $redstar$ est un espace vectoriel de dimension 1. En particulier 
$ {X in C1(I,RR) | X' = a(t) X(t)} = Vect{t ass e^(int_(t_0)^t a(u)du)} $


== 2. Cas non-homogène


On considère $X' = A(t)X + B(t)$\
$A in Cr(I, M_d (RR))$\
$B in Cr(I, RRd)$\
$Omega = RRd$

Supposons qu'on connaisse $d$ solutions linéairement indépendantes $X_1, ..., X_d$ du système homogène $X' = A(t)X$\
Alors on sait que toute solution de cette equation homogène s'écrit $ X(t) = sum_(i=1)^d alpha_i X_i (t) $

On sait alors, pour les memes raisons que dans le cas scalaire (d = 1), que les solutions de l'équation avec second membre s'écrivent $X(t) = Z(t)+X_p (t)$, avec $Z$ solution de de $Z' = A(t)Z$, et $X_p$ une solution particulière de l'équation avec second membre.

*Méthode de la variation des constantes*\
Pour trouver une solution particulière, on peut appliquer la méthode de la variation des constantes qui consiste à chercher $X_p$ sous la forme $ X_P (t) = sum_(i=1)^d alpha_i (t) X_i (t) $

En injectant cette expression dans l'équation $X' = A(t)X + B(t)$ on obtient 
$ sum_(i=1)^d (alpha'_i (t)X_i (t) + cancel(alpha_i (t) X_i '(t))) = cancel(sum_(i=1)^d alpha_i (t)A(t)X_i (t)) + B(t) $

#text(gray)[Car $X_i' (t) = A(t)X_i (t)$]\
Et donc on a le système d'inconnues $(alpha_i'(t))_(1<=i<=d)$ $ sum_(i=1)^d alpha_i' (t)X_i (t) = B(t) "    "redstar $
#def() 2 fonctions $x et y$ sont dites *liées* si $ exists alpha, beta in RR, alpha x + beta y = 0 $ Dans le cas contraire on dit que $x et y$ sont liées

#prop() Le système $redstar$ est bien inversible pour tout $t in I$\
i.e. pour tout $t in RR$, la famille $(X_i (t))$ est libre dans $RR$

#demo()[
Soit $t_0 in I et soient alpha_1, ..., alpha_d in RR tq sum_(i=1)^d alpha_i X_i (t_0)=0$\
Posons alors la fonction $X : t ass sum_(i=1)^d alpha_i X_i (t) in C1(I, RRd)$. Cette fonction est solution du problème de Cauchy $ cases(X' = A(t) X, X(t_0)=0) $ 
Or la fonction nulle est également solution. Par unicité de Cauchy-Lipschitz, on a 
$ X = 0,\ 
i.e.forall t in I, sum_(i=1)^d alpha_i X_i (t) = 0 $ Or la famille $(X_i)_(1, <= i<=d)$ est libre dans $C1(I, RRd)$, donc on a $forall i in [|1, d|], alpha_i = 0$
]

Finalement, en résolvant le système de Cramer $redstar$, on obtient $alpha_i'(t)$ pour tout\ $i in [|1, d|]$ et pour tout $t in I$. On en déduit les fonctions $alpha_i$ en primitivant $alpha_i'$.


#pagebreak()

= II. Équations linéaires scalaires du second ordre

On considère des équations de la forme $ (E) : x'' + a(t)x' + b(t)x = c(t) $ 
d'inconnue $x in C2(I, RR) avec a, b, c in Cr(I, RR)$. On va montrer que la résolution de cette équation est équivalente a la résolution du système linéaire d'ordre 1 en dimension 2 $ X' = A(t)X+B(t) $ 
Soit $x in C2(I, RR)$ une solution (globale) de $(E)$.\

On pose alors $X(t) = mat(x(t);x'(t)) in C1(I, RR2)$ et $ X'(t) &= mat(x'(t); x''(t))\
&= mat(x'(t); -a(t)x'(t)-b(t)x(t) + c(t))\
&= mat(0, 1; -b(t), -a(t))mat(x(t); x'(t)) + mat(0; c(t)) $

Réciproquement, soit $X(t) = mat(x(t); y(t))in C1(I, RR2)$ solution de $ X' = mat(0, 1; -b(t), -a(t))X+mat(0; c(t)) $
i.e. $ cases(x'(t) = y(t), -b(t)x(t) - a(t)y(t) + c(t)) $

De $x'=y in C1(I, RR)$ on déduit que $x in C2(I, RR) et$ $ x''(t) &= y'(t)\
&= -b(t)x(t)-a(t)y(t)+c(t)\
&= -b(t)x(t)-a(t)x'(t)+c(t) $

Autrement dit, $x$ est solution de $(E)$. En particulier, si $a(t) = a, b(t)= b et c(t)=0$ on sait résoudre l'équation $ (E_0) : x'' + a x' + b x = 0 $ 

#pagebreak()
en résolvant le système  $ X' = mat(0, 1;-b, -a)X $

#rq("importante") $forall t in I, forall x_0, y_0 in RR$ on déduit de l'équivalence précédente qu'il existe une unique solution globale $x in C2(I, RR)$ au problème de Cauchy $ cases(x''+a(t)x'+b(t)x = c(t), x(t_0) = x_0, x'(t_0) = y_0) $

#ex()[Système ressort en physique]

== 1. Cas homogène autonome

(càd sans second membre et a coef constants)\
$Pour a,b in RR$
$ (E_0) : x'' + a x'+ b x = 0\
ssi X' = A X\ 
avec X(t) = mat(x(t);x'(t)) et A = mat(0,1;-b,-a) $

$det (A-lambda I) &= mat(delim:"|", -lambda, 1; -b, -a-lambda)\
&= lambda^2 + a lambda + b = 0$

On en déduit de l'étude des systèmes linéaires sans second membre que :
+ Si $a^2-4b > 0$, on a 2 racines réelles distinctes $lambda_1 et lambda_2$, et les solutions de $(E_0)$ s'écrivent $ x(t) = alpha_1 e^(lambda_1 t)+alpha_2 e^(lambda_2 t)"    "(alpha_1, alpha_2 in RR) $

+ Si $a^2 - 4 b = 0$, il existe une racine double $lambda in RR$ et les solutions de $(E_0)$ s'écrivent 
  $ x(t) = (alpha_1 + alpha_2 t)e^(lambda t)"    "(alpha_1, alpha_2 in RR) $

+ Si $a^2-4b < 0$, deux solutions complexes conjuguées $lambda = mu pm i omega$, et les solutions de $(E_0)$ s'écrivent
$ x(t) = e^(mu t)(alpha_1 cos(omega t) + alpha_2 sin(omega t))"    "(alpha_1,alpha_2 in RR) $

#pagebreak()
#ex("- TD 1")[
== 2. Cas non-homogène : exemple du TD

$ cases(y''+2y'-3y = t, y(0)=0, y'(0)=1) $

*1. Trouver toutes les solutions de l'équation homogène*
$ (E_0) : z'' + 2z'-3z = 0 $

On cherche les racines du polynome caractéristique 
$ lambda^2 + 2lambda -3 = 0 $
$Delta = 4+12 = 16 > 0\
donc lambda = (-2 pm 4)/2\
lambda_1 = -3, lambda_2 = 1$

L'ensemble des solutions de l'équation homogène est donc 
$ Sr_0 = {t ass alpha_1 e^(-3t)+alpha_2 e^t | alpha_1, alpha_2 in RR} $

*2. Trouver toutes les solutions de l'équation avec second membre*
$ (E) : y'' + 2y'-3y = t $
Pour cela il suffit d'en trouver une, à laquelle on ajoutera les solutions de l'équation homogène. On utilise alors la méthode de variation de la constante sur le système du premier ordre
$ X' = mat(0,1;-2,3)X+ mat(0;t) "    "(ssi (E)) $
On considère le système homogène 
$ Z' = mat(0,1;-2,3)Z "    "(ssi (E_0))  $
On sait que les valeurs propres de la matrice sont $lambda_1 = -3 et lambda_2 = 1$, et que les solutions associées sont 
$ Z_1(t) = mat(e^(-3t); -3e^(-3t)) = e^(-3t)mat(1;-3)\
et Z_2(t) = mat(e^t;e^t) = e^t mat(1;1) $
On cherche alors une solution particulière de 
$ X' = mat(0,1;-2,3)X+mat(0;t) $
Sous la forme 
$ X_p (t) = alpha_1(t)Z_1 (t) + alpha_2(t) Z_2(t) $
En injectant (Yves Belaud en sueur) cette forme dans $(E)$, on obtient 
$ X_p'(t) = mat(0,1;-2,3) X_p (t) + mat(0;t) $
ou encore
$ alpha'_1(t) Z_1(t) + cancel(alpha_1(t)Z'_1(t)) + alpha_2(t)Z_2(t) + cancel(alpha_2(t)Z_2'(t))\ \
=\
cancel(alpha_1(t) mat(0,1;-2,3)Z_1(t)) + cancel(alpha_2(t)mat(0,1;-2,3))Z_2(t) + mat(0;t) $
\
Il reste $alpha'_1(t) Z_1(t) + alpha'_2(t)Z_2(t) = mat(0;t) $\
ou encore 
$ cases(L_1 : &alpha'_1(t)e^(-3t) + &alpha'_2(t)e^t = 0, L_2 : -3&alpha'_1(t)e^(-3t) + &alpha'_2(t)e^t = 0) $

$L_2 - L_1 : -4alpha'_1(t)e^(-3t) = t\
donc alpha'_1(t) = -1/4t e^(3t)\
de "même" : alpha'_2(t) = 1/4 t e^(-t)$

$alpha_1(t) = 1/36 (1-3t)e^(3t) et alpha_2(t) = -1/4(1+t)e^(-t)$ conviennent :
$ X_p (t) = 1/36(1-3t)mat(1;-3) - 1/4(1+t)mat(1;1) $
Et donc
$ y_p (t) &= 1/36(1-3t)-1/4(1+t)\
&=...\
y_p (t)&=-2/9-1/3t $

Finalement, l'ensemble des solutions de $(E)$ est 
$ Sr = {alpha_1e^(-3t) + alpha_2e^t - 1/9(2+3t) | alpha_1, alpha_2 in RR} $

*3. Résolution du pb de Cauchy avec les données initiales*\
Pour $y in Sr$, on évalue $y et y'$ en 0, on obtient un système, on le résout pour $alpha_1, alpha_2 in RR$

ici $alpha_1 = -5/18 et alpha_2 = 1/2$

(flemme d'écrire plus sayer)
]

= III. Systèmes non-linéaires autonomes
\
$Omega subset RRd\
I = RR$
$ redstar : X' = f(X) $

== 1. États d'équilibre et de stabilité

#def() On dit qu'un point $ol(x) in Omega$ est un *point d'équilibre* pour l'équation $redstar$ si c'est un point singulier du champ de vecteur $f$\
càd si $f(ol(x)) = 0$
<les>
#def() Un point d'équilibre $ol(x)$ est dit *localement exponentiellement stable* si\
$exists r>0, forall x_0 in B(ol(x),r), sup J = pinf$\
et 
$ exists alpha, C > 0, forall x_0 in B(ol(x),r),forall t >=0, norm(X(t)-ol(x)) <= C e^(-alpha t)norm(x_0-x) $

On dit qu'il est *globalement exponentiellement stable* si $forall x_0 in Omega, sup J = pinf$ \
et 
$ exists alpha,C >0, forall x_0 in Omega, forall t >=0, norm(X(t)-ol(x)) <= C e^(-alpha t)norm(x_0-x) $

#ex()[
Si $xb$ est localement stable, on a pour tout $t>=0$, $X(t)$ proche de $xb$\
Posons $Y(t) = X(t)-xb$\
$Y(t)$ est proche de 0 et
$ Y'(t) = X'(t) &= f(X(t))\
&= f(xb + Y(t))\
&tilde.eq^"Taylor" f(xb) + Jac f(xb)Y(t) $

On a donc $Y'(t) tilde.eq Jac f(xb)Y(t) in Mr_d (RR)$
]

#pagebreak()
<lyapunov>
#thm("de linéarisation de Lyapunov") Si $xb in Omega$ est tel que $f(xb)=0$ et $Jac f(xb)$ a toutes ses valeurs propres de partie réelle strictement négative, alors $xb$ est un point d'équillibre #lien(<les>)[localement exponentiellement stable] 

== 2. Équation de Lotka-Volterra

On considère le problème de Cauchy suivant
$ (E) : &cases(x' = a x - b x y, y' = -c y + d x y), a,b,c,d>0\
"ou encore" &cases(x' = (a-b y)x, y' = (-c + d x)y) $

$ avec X(t) = mat(x(t);y(t)), X(0) = mat(x_0;y_0)\
f mat(x;y) = mat(a x - b x y; -c y + d x y), f in C1(RR2, RR2) $

$x(t)$ : "quantité" de proies au temps $t$\
$y(t)$ : "quantité" de prédateurs au temps $t$
\ \
*Regardons ce qui se passe si $x_0=0, y_0 in RR$*\
La solution maximale est globale, donnée par
$ forall t in RR, &x(t) = 0\
&y(t) = y_0 e^(-c t) $

*De la même manière, si $y_0 = 0, x in RR$*\
alors la solution maximale (et globale) est donnée par 
$ forall t in RR, X(t) = mat(x(t);y(t)) = mat(x_0 e^(a t); 0) $

En particulier $mat(0;0)$ est un point d'équilibre $(f mat(0;0) = mat(0;0))$, càd que son orbite est réduite à $mat(0;0)$ : $O(0,0) = {(0,0)}$. On en déduit également que 
$ O(0,1)= {0}times ]0,pinf[\
O(0,-1) = {0} times ]minf,0[\
O(1,0) = ]0,pinf[ times {0}\
O(-1,0) = ]minf, 0[ times {0} $

#pagebreak()
*Soit $x_0 >0, y_0>0$*\
Alors $forall t in J, x(t) >0 et y(t)>0$.\ 
En effet supposons qu'il existe $t_0 in J tq x(t_0) <= 0$, alors par le thm des valeurs intermédiaires, il existe $t_1$ entre $t_0 et 0$ tq $x(t_1)=0$
$ "càd" X(t_1) = mat(x(t_1);y(t_1)) in {0} times RR $
${0} times RR &= {0} times ]0,pinf[ union {(0,0)} union {0} times ]minf,0[\
&= O(0,1) union O(0,0) union O(1,0)$\
Or $(x_0,y_0) in.not O(0,1) union O(0,0) union O(1,0)$ $->$ contradiction

L'ensemble $Q = {mat(x;y) in RR2 | x>0 et y>0}$ est donc stable pour l'équation $(E)$, et on peut donc considérer l'équation posée sur $Omega = Q$

*1re question : _Existe-t-il un état d'équilibre dans $QQ$ ?_*

$ cases(xb(a-b yb) &= 0, yb(-c + d xb) &= 0) $
Comme $xb != 0, alors a-b yb = 0, donc yb = a/b$

Comme $yb != 0, alors -c + d xb = 0, donc xb = c/d$

*2e question : _Est-il localement exponentiellement stable_*\
_(Indication : On est en dim 2 donc la matrice $Jac f(xb, yb$ a ses valeurs propres de partie réelle < 0 ssi $det Jac f(xb,yb) > 0$ *et* $tr Jac f (xb,yb) < 0$)_

$Jac f(x,y) = mat(a-b y , -b x; d y, -c + d x)$

$donc Jac f(xb,yb) &= mat(a-b a/b, -b c/d; d a/b, -c + d c/d)\
&= mat(0, -(b c)/d; (d a)/b, 0)$

#rq() Les valeurs propres sont complexes conjuguées et leur somme est nulle, donc ces valeurs propres sont imaginaires pures, on ne peut pas appliquer le #lien(<lyapunov>)[thm de linéarisation de Lyapunov]

#rq() Soit $H(x,y) = -c ln x + d x - a ln y + b y$\
On a la propriété remarquable que si $X' = f(X) dans Q$, alors la fonction
$ Phi : t ass H(x(t),y(t)) $
est constante $(Phi'(t) = 0)$


