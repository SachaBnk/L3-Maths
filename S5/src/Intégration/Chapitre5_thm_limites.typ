#set text(size: 13pt, lang: "fr")
#show math.equation.where(block: false): math.display
#set page(numbering: "1 / 1", number-align: right)
#set par(justify: true)
#import "../../titres.typ": *
#align(center, text(20pt)[*Intégration*])
#align(center, text(15pt)[Chapitre 5 — Théorèmes limites et premières applications]) 
#show outline.entry.where(level: 1): it => {
  v(12pt)
  strong(it)
}
#text(1.3em)[#outline(title : "")]
#pagebreak()
$(E, Ar, mu)$
= I. Lemme de Fatou

#lemme("de (Pierre) Fatou")<fatou> Soit $(f_n)_n$ une suite de fonctions mesurables positives.\
$int_E liminf_n f_n dmu <= liminf_n int_E f_n dmu$

#rappel() $liminf_n u_n = lim_(n-->pinf) inf{u_k | k>=n}$

#demo()[
Pour $n in NN, g_n = inf_(k>=n)f_k, (g_n)_n$ est une suite croissante\
$g = lim_(n-->pinf) g_n = liminf_n f_n$

$0 <= g_n <= f_n\
Donc forall n in NN, int_E g_n dmu <= int_E f_n dmu$

D'après le théorème de convergence monotone (Beppo Levi — chap 4), on a :

$lim_(n-->pinf) int_E g_n dmu = int_E lim_(n-->pinf) g_n dmu = int_E liminf_n f_n dmu$

Et donc :

$int_E liminf_n f_n dmu &= lim_n int_E g_n dmu\ &= liminf_n int_E g_n dmu, "(car" (g_n) "croissante)"\
&<= liminf_n int_E f_n dmu$
]

#ex()[$f_n : x ass x^n/(1+x^(n+1))ind_RRP (x), mu = lambda$

$lim_(n-->pinf) f_n (x) = cases(0 si x < 1, 1/2 si x = 1, 1/x si x > 1) (= liminf_(n-->pinf) f_n)$

$int liminf_n f_n dlambda = int(1/2ind_{1} (x) + 1/x ind_(\]1, pinf\[)(x))dx = int_1^pinf 1/x dx$

Donc $liminf_n int f_n dlambda = pinf$
]
#pagebreak()
= II. Ensembles et applications négligeables

#def() On dit qu'un ensemble $N subset E$ est *négligeable*\ si il existe $A in Ar tq N subset A et mu(A) = 0$

#rq() $N$ n'appartient pas forcément à $Ar$

#rq() En particulier les éléments de $Ar tq mu(A) = 0$ sont négligeables

#def()<mupp> 
- On dit qu'une propriété est vraie *$mu$-presque-partout* ($mupp$) si elle est vraie en dehors d'un ensemble négligeable (pour $mu$)
- $f et g$ définies sur $E$ à valeurs dans $F$ sont dites *égales presque partout* si\ ${x in E | f(x) != g(x)}$ est négligeable (pour $mu$)
- On dit qu'une suite $(f_n)_n$ d'applications de $E$ dans $KK$ *converge #MUPP* vers $f$ si il existe $N$ négligeable (pour $mu$) tel que $forall x in.not N, (f_n (x))_n$ converge vers $f(x)$

#thm("(Inégalité de Markov)")<markov> Soit $f$ mesurable positive, pour $lambda > 0$

$mu({f >= lambda}) <= 1/lambda int f dmu$

#rappel() ${f >= lambda} = {x in E | f(x) >= lambda}$

#demo()[
$f(x) &= f(x)ind_{f >= lambda} + f(x) ind_{f < lambda}\
&>= lambda ind_{f>=lambda} + 0$\
On intègre par rapport à $mu$ :

$int f dmu &>= int lambda ind_{f < lambda} dmu\
&>= lambda mu({f < lambda})$
]
#pagebreak()
#prop() Soit $f$ mesurable à valeurs dans $RRB tq int abs(f) dmu < pinf$\
Alors $f$ est finie #lien(<mupp>)[#MUPP]

#demo()[
$Pour n in NN$

$1/n int abs(f) dmu >= mu({abs(f) >= n}) >= mu({abs(f) = pinf})$, (#lien(<markov>)[Inégalité de Markov])

On fait tendre $n$ vers $pinf$ : $mu({abs(f) = pinf}) = 0$
]

#prop() $f$ mesurable à valeurs dans $CC$ \
$f$ négligeable ($mu({f !=0})=0$) $ssi$ $int_E abs(f) dmu = 0$

#demo()[
$redimp$ Soit $f$ négligeable, pour $n in NN, min(abs(f), n) <= n ind_{f!=0}$\
On intègre:

$int min(abs(f), n)dmu <= n mu({f !=0}) = 0, ("car" f "est négligeable")$

On note $g_n = min(abs(f), n), g_n >=0 et g_n "mesurable"$\
$forall x in E, g_n (x) -->_(n-->pinf) abs(f)$\
$(g_n)_n$ est croissante\
Par le théorème de convergence monotone, $int_E lim_(n-->pinf) g_n dmu = int_E abs(f) dmu <= 0$

$redimprev$ pour $n in NNE$, on suppose $int_E abs(f)dmu = 0$

Par #lien(<markov>)[inégalité de Markov], $mu({abs(f) >= 1/n}) <= n int_E abs(f)dmu = 0$\

$"or" {abs(f) != 0} &= union.big_(n in NNE) {abs(f) >= 1/n}$

$Donc mu(abs(f) != 0) &<= sum_(n in NNE) mu({abs(f) >= 1/n})\
&<= 0$
]

#rq() Soit $f$ continue sur $[a, b]$\
$int_a^b abs(f(t))dt = 0 ssi forall t in [a, b], f(t) = 0$

#pagebreak()
#prop() 
- Soient $f et g$ deux applications mesurables positives\

  - $f <=^mupp g imp int f dmu <= int g dmu$
  - $f =^mupp g imp int f dmu = int g dmu$

- Soient $f et g$ mesurables à valeurs dans $CC$ tq $f =^mupp g$,\
  $f muint ssi g muint$\
  Dans ce cas, $int f dmu = int g dmu$

#demo()[
*1.a)*\
$f &= f ind_{f<=g} + f ind_{f > g}\
&<= g ind_{f<=g} + f ind_{f>g}$\
On intègre :

$int f dmu &<= int g ind_{f <= g}dmu + int f ind_{f>g}dmu\
&<= int g ind_{f <= g}dmu + int g ind_{f>g}dmu$
]

= III. Théorème de convergence dominée

#thm("de convergence dominée")\
Soit $(f_n)_n$ une suite de fonctions mesurables de $(E, Ar, mu)$ sur $(KK, Br(KK))$\
Si :

- $(f_n)_n$ *converge simplement* #MUPP vers une fonction $f$
- il existe une fonction $g$ *INTÉGRABLE* telle que $forall n in NN, abs(f_n (x)) <=^mupp g(x)$\
  c'est à dire que $mu({x in E | f(x)>g(x)}) = 0$

Alors:
-  les applications $f_n et f$ sont intégrables
- $int_E abs(f_n - f)dmu -->_(n-->pinf) 0$

- En particulier $lim_n int_E f_n dmu = int_E lim_n f_n dmu$
#pagebreak()
#demo()[
*1.*\
Supposons que $f_n-->_(n-->pinf)f$ et que pour tout $n in NN, abs(f_n) <= g$\
Posons $h_n = 2g - abs(f_n - f)$\
$h_n$ est positive par inégalité triangulaire, et est mesurable\
D'après le #lien(<fatou>)[lemme de Fatou], $int_E liminf_n h_n dmu <= liminf_n int_E h_n dmu$

$"ou encore" int_E 2g dmu &<= liminf_n int_E h_n dmu, "(car quand la limite existe, liminf = lim)"\
&<= liminf_n (int_E 2g dmu - int_E abs(f_n - f)dmu)\
&<= int_E 2g dmu - limsup_n (int_E abs(f_n-f)dmu)$ 

On a donc $limsup_n int_E abs(f_n - f)dmu <= 0$

*2.*\
Soit $N in Ar tq forall x in N^c, f_n (x) -->_(n-->pinf) f(x) et mu(N) = 0$\
Pour tout $n in NN$, il existe $N_n in Ar tq mu(N_n) = 0 et pour x in N^c, abs(f_n (x)) <= g(x)$

Soit $M = N union (union.big_(n in NN)N_n), M^c = N^c inter (inter.big_(n in NN) N_n^c)$\
$x in M^c imp f_n (x) --> f(x) et forall x in N, abs(f_n (x)) <= g(x)$\
Posons $h_n = f_n ind_(M^c), h = f ind_(M^c)$\
La suite $(h_n)_n$ vérifie les hypothèses du théorème *partout*. On peut lui appliquer *1.*\
Donc $int_E abs(h_n - h)dmu -->_(n-->pinf) 0$

$int_E abs(f_n - f)dmu &= int_E abs(f_n - f)ind_(M^c)dmu + int_E abs(f_n-f)ind_M dmu\
&= int_E abs(h_n - h)dmu + 0, car mu(M) = 0$
]
#pagebreak()
#ex(1)[
$f_n (x) = (1+x/n)^n e^(-2x) ind_[0, n] (x)$

$(1+x/n)^n &= exp(n ln(1+x/n))\
&= exp(x + o(1))\
&-->_(n-->pinf) e^x$\
$donc f_n (x) -->_(n-->pinf) e^(-x)ind_RRP (x)$

$abs(f_n (x))&<=(1+x/n)^n e^(-2x) ind_RRP (x)\
&<= exp(n times x/n) e^(-2x) ind_RRP (x), "(car" ln(1+u) <= u, pour u >=0")"\
&<= e^(-x) ind_RRP (x)$

De plus $int_RR e^(-x) ind_RRP (x)dx = int_0^pinf e^(-x)dx = 1$, $g$ est intégrable\
On peut appliquer le théorème
]

#ex(2)[
$f_n (x) = x^n/(1+x^(n+2))ind_RRP (x)$

$f_n (x) -->_(n-->pinf) cases(0 si x < 1, 1/2 si x = 1, 1/x^2 si x>1)$

$f_n (x) -->_(n-->pinf)^lambdapp 1/x^2 ind_(\]1, pinf\[)(x)$

$abs(f_n(x)) <=^lambdapp g(x) = cases(0 si x < 0, 1 si x in [0, 1], 1/x^2 si x>1)$\
on peut appliquer le thm
]

#rq() Fonctions $lambda$-intégrables :
- $f$ mesurable bornée sur $[a, b]$
- sur $]a, b], lim_(n-->pinf) int_(a_n)^b f(x)dx$ 

#ex(3)[
(exo)

$f_n (x) = (n sin x/n)/x^3 ind_(\[1, pinf\[)(x)$
]
#pagebreak()
#ex(4)[\
$f_n (x) = (-n^2 x + n)ind_[0, 1/n](x)$\
$f_n (x) -->_(n-->pinf)0 pour x!=0$

$ int_RR f_n dlambda --> int_RR 0 dlambda$

or $int_RR f_n dlambda = 1/2 times 1/n times n = 1/2 ->$ contradiction

⚠️ C'est parce qu'on n'a pas vérifié l'hypothèse de domination ⚠️
]

#corollaire() Soit $(f_n)_n$ une suite d'applications mesurables de $(E, Ar, mu)$ dans $KK$\
tq $sum_n int_E abs(f_n) dmu < pinf$

Alors la série $sum f_n$ converge $MUPP$, et il existe $f in Lr^1 (mu)$\
tq $f = sum_n f_n mupp$

$Alors lim_(n-->pinf) int_E abs(f - sum_n f_n)dmu = 0$

En particulier, $int_E f dmu = sum_(n=0)^pinf int_E f_n dmu$

#demo()[
osekour rattraper ;)
]

#ex()[

$f : RR &--> RR\
x &ass (sin x)/(e^x - 1)ind_RRPE (x)$

$f$ est continue sur $RRPE$ et $lim_(x --> 0^+) f(x) = 1$\
Donc $f$ est continue par morceaux sur $RR$\

*$f$ est-elle intégrable sur $RR$ ?*\
Pour $x >=1, abs(f(x))<=1/(e^x - 1) et 1/(e^x - 1) tilde_pinf 1/e^x$

En particulier il existe A tq $forall x > A, 1/(e^x- 1) <= 2/e^x$

Sur le compact $[0, A]$, $abs(f)$ est majorée par une constante $M$\
$abs(f(x)) <= M ind_[0, A](x) + 2/e^x ind_(\[A, pinf\[)(x)$

$1/(e^x - 1) = e^(-x)/(1 - e^(-x)) = e^(-x) sum_(n=0)^pinf e^(-n x)$

$sum_(n=0)^pinf p^n = 1/(1-p) avec p = e^(-x)$

$f(x) = sum_(n=1)^pinf sin(x)e^(-n x)/(f_(n)(x))$\
... (flemme + fin de cours)
]

#rq()\ $int_0^A sin(a x)e^(-b x)dx &= Im(int_0^A e^(i a x)e^(-b x)dx)\
&= ...\
&= Im([-e^(-(b-i a)x)/(b - i a)]_0^A)\
&= ...\
&= Im(1/(b-i a))$







