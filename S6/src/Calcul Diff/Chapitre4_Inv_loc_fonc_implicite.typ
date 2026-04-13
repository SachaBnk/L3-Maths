#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../titres.typ": *
#align(center, text(20pt)[*Calcul Différentiel*])
#align(center, text(15pt)[Chapitre 4 : Inversion locale et fonctions implicites]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

= I. Homéomorphismes et difféomorphismes

#def() Soient $A subset E et A' subset F$ deux ensembles\
On dit que $f : A -->A'$ est un *homéomorphisme* si $f$ est continue, bijective, de réciproque $fm : A'-->A$ continue 

#lemme() Soit $f : K --> K'$ une application bijective et continue sur un ensemble compact $K$ de $E$.\
Alors $f$ est un homéomorphisme

#rq() $K' = f(K)$ est alors nécessairement compact

#demo()[
Il suffit de vérifier que $fm : K' --> K$ est continue\
Soit $y in K' et (y_n)_(n in NN)$ une suite de $K'$ qui converge vers $y$\
On veut mq $fm(y_n) -->_(n-->pinf)fm(y)$\
Notons $x_n = fm(y_n) et x = fm(y)$\
On veut mq $x_n --> x$\
$ie forall epsilon > 0, exists N in NN, forall n > N, norm(x_n - x)_E < epsilon$\

*Par l'absurde* on suppose que $exists epsilon > 0, forall N in NN, exists n > N, norm(x_n - x)_E >= epsilon$\
On peut alors construire $phi : NN --> NN$ str croissante telle que\ $forall n in NN, norm(x_phi(n) - x)_E >= E$\
$N=0, exists n_0 >= 0, norm(x_n_0 - x)_E >= epsilon$, on pose $phi(0)=n$\
$N = phi(0)+1, exists n_0 >= phi(0)+1, norm(x_n_1 - x)_E >= epsilon$, on pose $phi(1) = 1$

On a donc construit une sous-suite $(x_phi(n))_(n in NN)$ de $(x_n)$ tq $forall n in N, norm(x_phi(n) - x) >= epsilon$\
Cette sous-suite vit dans le compact $K$\
On peut en extraire une autre sous-suite $(x_(phi rond psi(n)))_(n in NN)$ qui converge vers une certaine limite $l in K$\

Or $f$ est continue, donc $f(x_(phi rond psi(n)))-->_(n-->pinf)f(l)$\
Or on a que $f(x_1) = y_n --> y = f(x)$\
donc $f(x_(phi rond psi(n)))-->y$\
et donc, par unicité de la limite $f(l) = y$\
et donc $l = x$\
On a donc $x_(phi rond psi(x))--> x$ ce qui est une contradiction

Donc $fm$ est continue
]

#pagebreak()
#def() Soient $Omega subset E et Omega' subset F$ deux ouverts\
On dit que $f : Omega --> Omega'$ est un *difféomorphisme* de classe $C1$, ou $C1$-difféomorphisme, si $f$ est bijective, de classe $C1$ et de réciproque $fm$ de classe $C1$

#lemme() Soient $Omega subset E et Omega' subset F$ deux ouverts, $f : Omega --> Omega'$ bijective,\ 
$et x in Omega, y in Omega'$ tq $f(x) = y$ et $df(x) et dif fm(y)$ existent\
Alors $df(x)$ est inversible et on a $[df(x)]^(-1) = dif fm(y)$\
En particulier $dim E = dim F$

#demo()[
eh hein
]

#corollaire() Si $f : Omega --> Omega'$ est un homéomorphisme de classe $C1$ sur $Omega tq fm$ est différentiable en tout point de $Omega'$,\
alors $f$ est un $C1$-difféomorphisme

#demo()[
Le seul point à prouver est la continuité en $dif fm$

ie l'application $func(Omega' &--> LEF, y &ass dif fm(y))$

Or on a mq $dfm(y) = [df(fm(y))]^(-1) = psi rond df rond fm(y)$\
Mais $fm$ est continue ($f$ homéomorphisme)\
et $df$ continue ($f$ est $C1$)
]

#pagebreak()
= II. Théorèmes d'inversion

#lemme() Soient $r>0 et T : ol(B(0, r))subset E --> E tq norm(T(0)) <= r/2$\
$et forall x, x' in ol(B(0, r)), norm(T(x)-T(x')) <= 1/2 norm(x-x')$\
Alors $exists! x in ol(B(0, r)) tq T(x) = x$

#demo()[
On commence par remarquer que $forall x in ol(B(0, r)), T(x) in ol(B(0, r))$

$"En effet, si" norm(x) &<= r, norm(T(x))\
&<= norm(T(x)-T(0))+norm(T(0))\
&<= 1/2norm(x-0)+r/2\
&<= 1/2r = r/2 = r$

Ensuite on définit par itérations la suite $(x_n)$ de $ol(B(0, r))$ en fixant $x_0$ quelconque dans $ol(B(0, r))$ puis en posant $x_(n+1) = T(x_n)$\
Alors $forall n in NN$ on a :

$norm(x_(n+1)-x_n) &= norm(T(x_n)-T(x_(n-1)))\
&<= 1/2norm(x_n-x_(n-1))\
&<= ...\
&<= 2^(-n)norm(x_1-x_0)$

On en déduit que $(x_n)$ est une suite de Cauchy. En effet, si $p>n$\

$norm(x_p-x_n) &= norm(sum_(k=n)^(p-1)(x_(k+1)-x_k))\
&<= sum_(k=n)^(p-1) norm(x_(k+1)-x_k)\
&<= sum_(k=n)^(p-1) 2^(-k)norm(x_1-x_0)\
&= norm(x_1-x_0)(2^(-n)-2^(-p))/(1-1/2)\
&<= 2^(-n+1)norm(x_1-x_0)\
&-->_(n-->pinf)0$

La suite $(x_n)$ est bien de Cauchy, elle converge vers un certain $x in ol(B(0, r))$\
Et donc $T(x_n) = X_(n+1) -->_(n-->pinf)x$\
Or $T$ est $1/2$-lipschitzienne donc continue\
donc $T(x_n)-->T(x)$\
par unicité de la limite, on a $T(x) = x$

*Unicité*\
Si $xt$ est un autre point fixe de $ol(B(0, r))$ pour $T$\
$alors 0 <= norm(xt-x) = norm(T(xt)-T(x)) <= 1/2norm(xt-x)$\
donc $norm(xt-x) = 0$
]

#thm("d'inversion locale") Soient $f : Omega --> F$ une fonction de classe $C1$, et $x_0 in Omega$\
Si $df(x_0)$ est inversible, alors il existe deux voisinages $U$, de $x_0$ dans $Omega$, et $V$, de $f(x_0)$ dans $Omega'$, tels que $f$ est un $C1$-difféomorphisme de $U$ sur $V$

#demo()[
Dans le cas $F = E$, $x_0 = f(x_0) = 0, df(x_0)=Id_E$\

*1. Résoudre l'équation $f(x)=y$*\
On remarque que $f(x) = y ssi y-f(x)+x=x$\
On note $T(x) = y-f(x)+x$\
Pour résoudre le pb de point fixe $T(x)=x$, on utilise le lemme.

Soit $epsilon>0$ assez petit (on le choisit plus tard apparemment)\
On a $T(0)=y$\
et $dif T(x) = -df(x)+ Id_E$\
Par hypothèse, $df(0) = Id_E donc dif T(0) = 0$\
Or $dif T$ est continue car $df$ est continue par hypothèse\
Donc $exists r > 0, forall x in ol(B(0, r)), norm(dif T(x))_Lr(E) = norm(dif T(x)-dif T(0))_Lr(E) <= 1/2$\
Par l'inégalité des accroisements finis, on en déduit que

$forall x, x' in ol(B(0, r)), norm(T(x)-T(x')) &<= sup_(0<=t<=1)norm(dif T(t x + (1-t)x'))_Lr(E) norm(x-x')_E\
&<= 1/2norm(x-x')_E$

Pour pouvoir appliquer le lemme il reste à choisir $epsilon > 0$ tq si $y in ol(B(0, epsilon)) alors norm(T(0))<= r/2$

Or $y = T(0)$ donc il suffit de prendre $epsilon = r/2$
#pagebreak()
*Récap*\
$"On vient de mq" exists r >0 tq forall y in ol(B(0, r/2)), exists ! x in ol(B(0, r)) &tq T(x)=x\
&ie y-f(x)+x = x\
&ie f(x) = y$

On voit aussi facilement en changeant $r$ en $r/2$\
que $forall y in ol(B(0, r/4)), exists ! x in ol(B(0, r/2)) subset ol(B(0, r)) &tq T(x)=x$

et donc à fortiori :\
$forall y in ol(B(0, r/4)), exists ! x in ol(B(0, r/2)) subset ol(B(0, r)) &tq f(x)=y$
\ \ \ \
*2. On mq $x$ dépend continûment de $y$*\
ie si $y_n --> y$ alors $x_n --> x$, ou $x_n et x$ sont définis comme les uniques solutions de $f(x_n) = y_n et f(x)=y$\
$->$ memes arguments que dans la preuve du lemme d'homéomorphisme ente compacts

\ \ \ \
*3. On définit $U$ et $V$ ouverts contenant 0 tq $f$ est bujective de $U$ sur $V$, puis in mq $fm$ est $C1$*\
On prend $V = B(0, r/4) et U = B(0, r/2) inter fm(B(0, r/4))$

La fonction $f$  est bien définie de $U$ vers $V$ (grace à $fm(B(0, r/4))$)

Elle est de plus bijective dp l'étape 1, et sa réciproque $fm : V --> U$ est continue par l'étape 2.

De plus $U$ et $V$ sont ouverts et contiennent 0\
$fm(0) = 0 car f(0)=0$

_techniquement la preuve est pas finie mais wlh flemme_
]

#pagebreak()



#thm("d'inversion globale") Soit $f : Omega --> F$ une fonction de classe $C1$ injective telle que $df(x)$ est inversible en tout $x in Omega$\
Alors $f$ est un $C1$-difféomorphisme de $Omega$ sur $f(Omega)$

#ex("- changement de coordonnées polaire")[
$E = F = RR2$

$Omega  = RRPE times ]-pi, pi[$

$f : func(Omega &--> RR2, (r, theta) &ass (r cos theta, r sin theta))$

*$f$ est injective*

$f(r, theta) = f(r', theta') &imp cases(r cos theta = r' cos theta', r sin theta = r' sin theta')\
&imp r^2 cos^2 theta + r^2 sin^2 theta = r'^2 cos^2 theta' + r'^2 sin^2 theta'\
&imp r^2 = r'^2\
&imp r = r' "car" r, r' in RRP\
&imp cases(cos theta = cos theta', sin theta = sin theta')\
&imp theta = theta' "car" theta, theta' in ]-pi, pi[$

$f(Omega) = {(x, y) in RR2 | y = 0 imp x > 0} = RR2\\(RRM times {0})$

$Jac f(r, theta) &= mat(derp(f_1, r), derp(f_1, theta); derp(f_2, r), derp(f_2, theta))\
&= mat(cos theta, -r sin theta; sin theta, r cos theta)\
det Jac f(r, theta) &= r cos^2 theta + r sin^2 theta\ 
&= r\
&> 0$
]
#pagebreak()
= III. Théorème des fonctions implicites

#thm() Soit $f : Omega subset E times F --> G$ une fonction $C1$,\ 
et soit $(x_0, y_0) in Omega tq f(x_0,y_0) = 0$ et $partial_2f(x_0, y_0)$ soit inversible\

Alors il existe un voisinage $U de (x_0, y_0)$ et une fonction $g$ définie sur un voisinage $V de x_0$ tq $forall (x, y) in Omega, [(x, y) in U et f(x, y) = 0]ssi [x in V et g(x) = y]$

De plus, $g$ est $C1$ sur $V$\
et $dg(x) = - [partial_2 f(x, g(x))]^(-1) rond partial_1f(x, g(x)) "    " (star)$

#text(rgb(blue))[#underline[Preuve de ($star$) :]\ 
On a par def de $g$ (et de $f$), $f(x, g(x)) = 0$\
donc par différentiation\
$partial_1f(x, g(x))+partial_2f(x, g(x)) rond dg(x)=0$\
d'où $partial_2f(x, g(x)) rond dg(x) = -partial_1f(x, g(x))$

Donc $dg(x) = -[partial_2f(x, g(x))]^(-1) rond partial_1f(x, g(x))$
]

#demo("du thm")[

Soit $h : func(Omega &--> E times G, (x, y)&ass(x, f(x, y)))$

On a $h(x_0, y_0) = (x_0, 0)$\

$et dif h(x, y) = mat(Id_E, 0; partial_1f(x, y), partial_2f(x, y))$

Comme $partial_2f(x_0, y_0)$ est inversible, $dif h(x_0, y_0)$ l'est aussi\
Donc, par thm d'inversion locale, il existe un voisinage $U$ de $(x_0, y_0)$ et un voisinage $W = h(U) de h(x_0, y_0) tq h$ est un $C1$-difféomorphisme de $U$ sur $W$\
Donc $hm = ((hm)_1, (hm)_2)$ est $C1$ sur $W$\
et on a $hm(x, f(x, y)) = (x, y)$\
$"On a alors" (x, y) in U et f(x, y) = 0 &ssi (x, y) = hm(x, 0)\
&ssi y = (hm)_2(x, 0)$\
Ce qui définit une fonction $g$ de classe $C1$ sur un voisinage $V = {x in E | (x, 0) in W}$ par $g(x) = (hm)_2(x, 0)$
]