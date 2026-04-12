#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 sur 1", number-align: center)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Calcul Différentiel*])
#align(center, text(15pt)[Chapitre 3 : Différentielle seconde et optimisation]) \
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()

= I. Différentielle seconde

#def() $f : Omega --> F$ de classe $C1$\
$Si df : Omega --> LEF$ est différentiable en $x in Omega$, sa différentielle en $x$ est une application linéaire de $E dans LEF$\
$ie dif(df)(x) in LELEF$

#def() Doit $f : Omega --> F$ différentiable en tout point de $Omega$.\
On dit que $f$ est deux fois différentiable en $x in Omega$ si $df : Omega --> LEF$ est différentiable en $x$.\
On appelle alors *différentielle seconde* de $f$ en $x$ l'application $ddf(x)$ définie pour tout $h, k in E$ par\
$ddf(x)(h, k) = [dif(df)(x)](h)(k)$\
On dit que $f$ est de classe $C2$ sur $Omega$, si $df$ est de classe $C1$ sur $Omega$

#rq() On vérifie facilement que $ddf(x) : E times E --> F$ est bilinéaire,\ ie $ddf(x) in Br(E times E, F)$\
Dans le cas où $E = RRn$, on peut caractériser les fonctions $C1$ à l'aide des dérivées partielles.

#thm() $Soit f : Omega subset RRn --> F$ une fonction de classe $C1$.\
$f$ est de classe $C2 ssi$ ses dérivées partielles sont de classe $C1 "sur" Omega$

On a alors $forall i, j in [|1, n|], (partial^2 f)/(partial x_i partial x_j)(x) = ddf(x)(e_i, e_j)$

#demo()[Notes de cours Célène]

#lemme() Soit $f : Omega --> F$ deux fois dérivable en $x in Omega$\
Pour $h, k in E$ suffisamment petits, on pose\
$G(h, k) = f(x+h+k) - f(x+h)-f(x+k)+f(x)$

Alors $G$ vérifie $norm(G(h, k) - ddf(x)(h, k))_F/(norm(h)_E^2 + norm(k)_E^2) -->_((h, k)-->0)0$

#pagebreak()
#demo()[

Soit $Q(h, k) = G(h, k) - ddf(x)(h, k)$\
Pour $h in E$ fixé, on va considérer l'application $k ass Q(h, k)$\
Cette application est différentiable, on appelle sa différentielle la différentielle partielle de $Q$ par rapport à sa deuxième variable (ici $k$) notée $partial_2 Q(h, k) in LEF$

$"On a" partial_2Q(h, k)(kt) = df(x+h+k)(kt) - df(x+h)(kt) - ddf(x)(h, kt)$\
Comme $f$ est 2 fois différentiable en $x$, sa différentielle $df$ est différentiable en $x$, et on a donc\
$df(x+h+k) = df(x)+d(df)(x)(h+k)+norm(h+k)_E epsilon_1(h+k)$\
$df(x+k) = df(x)+d(df)(x)(k)+norm(k)_E epsilon_2(k)$

donc\
$df(x+h+k)(kt) - df(x+k)(kt) &= ddf(x)(h+k+kt)-ddf(x)(k, kt)\
&+ norm(h+k)_E epsilon_1(h+k)(kt) - norm(k)_E epsilon_2(k)(kt)\
&= ...$

Finalement, $partial_2Q(h, k) = norm(h+k)_E epsilon_1(h+k) + norm(k)_E epsilon_2(k)$\
et donc\
$norm(partial_2Q(h, k))_LEF <= (norm(h)_E + norm(k)_E)(norm(epsilon_1(h, k))_LEF + norm(epsilon_2(k))_LEF)$

En appliquant l'IAF à la fonction $k ass Q(h, k)$, on en déduit que

$norm(Q(h, k)-Q(h, 0))_F &<= sup_(0<= t<= 1)norm(partial_2Q(h, t k))_LEF norm(k)_E\
&<= (norm(h)_E + norm(k)_E) sup_(0<= t<= 1)(norm(epsilon_1(h, t k))_LEF + norm(epsilon_2 (t k))_LEF) dot norm(k)_E\
&<= (norm(h)_E + norm(k)_E)norm(k)_E dot epsilon(h, k)$

Or $Q(h, k) = G(h, k) - ddf(x)(h, k)$\
donc $Q(h, 0) = G(h, 0) = 0$

$et donc norm(G(h, k) - ddf(x)(h, k))_F/(norm(h)_E^2+norm(k)_E^2) &= norm(Q(h, k)-Q(h, 0))_E/(norm(h)_E^2 + norm(k)_E^2)\
&<= ((norm(h)_E+norm(k)_E)dot norm(k)_E)/(norm(h)_E^2 + norm(k)_E^2) epsilon(h, k)\
&<= 3/2 dot epsilon(h, k)\
&-->_((h, k)-->0) 0$
]
#pagebreak()
#rq() pourquoi l'avant-dernière ligne elle marche ?

$(a+b)b &= a b + b^2\
&<= 1/2(a^2+b^2)+b^2\
&<= 3/2(a^2 + b^2)$

#thm("de Schwarz") Soit $f : Omega --> F$ deux fois différentiable en $x in Omega$.\
L'application bilinéaire $ddf(x)$ est symétrique\
ie $forall (h, k) in E times E, ddf(x)(h, k) = ddf(x)(k, h)$

Dans le cas $E=RRn$, on a $(partial^2 f)/(partial x_i partial x_j) = (partial^2 f)/(partial x_j partial x_i)$

#demo()[
Soient $h, k in E$, pour tout $t in RRE$ "suffisament petit"

$norm(ddf(x)(t h, t k)-ddf(x)(t k, t h))_F\ 
<= norm(ddf(x)(t h, t k) - G(t h, t k))_F + norm(G(t k, t h)-ddf(x)(t k, t h))_F\
<= 2(norm(t h)^2+norm(t k)^2)epsilon(t)$

ce qui s'écrit aussi $t^2 norm(ddf(x)(h, k)-ddf(x)(k, h))_F <= 2t^2(norm(h)^2 + norm(k)^2)epsilon(t)$

Comme $t^2 > 0$, on obtient en divisant par $t$\
$0 <= norm(ddf(x)(h, k)-ddf(x)(k, h))_F <= 2(norm(h)^2 + norm(k)^2)epsilon(t)$

On obtient en faisant tendre $t$ vers 0 que\
$ddf(x)(h, k)-ddf(x)(k, h) = 0$
]


#def() Si $f : Omega subset RRn --> #colr[$RR$]$ admet des dérivées partielles secondes en $x$, On définit la *matrice hessienne* de $f$ en $x in Omega$ par

$Hess f(x) &= mat((partial^2 f)/(partial x_1 ^2)(x), (partial^2 f)/(partial x_1 partial x_2)(x), ..., (partial^2 f)/(partial x_1 partial x_n)(x); 
(partial^2 f)/(partial x_2 partial x_1)(x), dots.down, , dots.v; 
dots.v;
(partial^2 f)/(partial x_n partial x_1)(x), ..., , (partial^2 f)/(partial x_n ^2)(x))\
&= mat((partial^2 f)/(partial x_i partial x_j))_(1<= i, j<= n)$

Si la fonction $f$ est deux fois différentiable en $x$, alors\
$ddf(x)(h, k) = h^T dot Hess f(x) dot k = scal(h, Hess f(x) dot k)$


#rq() Par schwarz, la matrice Hessienne est alors symétrique, et donc\
$ddf(x)(h, k) = scal(Hess f(x) dot h, k)$

($scal(h, A k) = scal(A^T h, k)$)

= II. Formule de Taylor-Young

#thm("de Taylor-Young") Si $f:Omega --> F$ est deux fois différentiable en $x in Omega$, alors\
$f(x+h) = f(x)+df(x)(h)+1/2ddf(x)(h,h)+o(norm(h)^2)$

#demo()[non]

= III. Optimisation

Dans cette partie on considère $Omega$ un ouvert de $E=RRn$ et $f : Omega --> F=R$\
et on se pose la question de l'existence d'extrema locaux

#rappel() $f : Omega --> RR$ donc on peut parler du gradiant $nabla f$ et de $Hess f$

#rq() La formule de Taylor-Young s'écrit

$f(x+h) &= f(x) +Jac f(x) dot h +1/2 h^T dot Hess f(x)dot h + norm(h)^2epsilon(h)\
&= f(x) + scal(nabla f(x), h) + 1/2 scal(Hess f(x) dot h, h) + norm(h)^2epsilon(h)$

#def() On dit qu'une fonction $f in Cr(Omega, RR)$ admet un *maximum local* en un point $x_0 in Omega$ si il existe $r > 0$ tel que\
$forall x in B(x_0, r)inter Omega, f(x) <= f(x_0)$

#rq() pareil pour un minimum local

#def() On dit qu'il s'agit d'un *maximum strict* si il existe $r > 0$ tel que\
$forall x in B(x_0, r)inter Omega, x != x_0 imp f(x) < f(x_0)$

#prop("(Conditiion nécessaire du 1er ordre)")\
Soit $f in Cr(Omega, RR)$\
Si $f$ admet un extremum local en un point $x_0 in Omega$ et si $f$ est différentiable en $x_0$\
alors $nabla f(x_0) = 0$ et $Jac f(x) = 0$

#demo()[
oupsi
]
#pagebreak()
#def() Un point $x_0 in Omega$ tel que $nabla f(x) = 0$ est appelé *point critique* de $f$

#def() 
- Une matrice symétrique réelle $A in S_n (RR)$ est dite *positive*, noté $A >=0$, si\
$forall x in RRn, scal(A x, x) >= 0$
- Elle est dite *définie positive* si $forall x in RRn \\ {0}, scal(A x, x) > 0$

#rq() pareil pour négative

#rq() On rappelle qu'une matrice $A in S_n (RR)$ est positive sso toutes ses valeurs propres (qui sont réelles) sont positives, et définie positive si ses valeurs propres sont strictement positives

#prop("(Condition nécessaire du second ordre)")\
Soit $f in Cr(Omega, RR)$\
Si $f$ admet un minimum local en $x_0 in Omega$, et si $f$ est deux fois différentiable en $x_0$\
alors $Hess f(x_0) >= 0$

#rq() pareil pour un maximum

#demo()[
Soit $f in Cr(Omega, RR)$\
Soient $x_0 in Omega et r > 0 tq B(x_0, r) subset Omega$\
et $forall x in B(x_0, r), f(x) <= f(x_0)$\
On suppose $f$ deux fois différentiable en $x_0$

Taylor-Young ordre 2, pour $h in B(0, r)$\
$f(x_0+h) = f(x) + scal(nabla f(x_0), h) + 1/2 scal(Hess f(x_0) dot h, h) + norm(h)^2epsilon(h)$

Soit $v in RRn$, pour tout $t in RR$ suffisament petit\
$f(x_0 + t v)-f(x_0) = t^2/2 scal(Hess f(x_0) v, v) + t^2norm(v)^2epsilon(t v)$

En passant à la limite pour $t-->0$, on récupère que $scal(Hess f(X_0) dot v, v) <= 0$

Comme $v$ est quelconque dans $RRn$, on a bien $Hess f(x_0) <= 0$
]

#prop("(Condition suffisante)")\
Soit $f in Cr(Omega, RR), et x_0 in Omega$ en lequel $f$ est deux fois différentiable


et $cases(nabla f(x_0)>=0, Hess f(x_0)>0)$

Alors $x_0$ est un point de minimum strict de $f$
#pagebreak()
#def() n=2

$cases(nabla f(x_0) = 0, det Hess f(x_0) < à)$

On dit que $x_0$ est un point selle (ou col) pour $f$
