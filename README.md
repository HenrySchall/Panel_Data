# Panel Data

![IMG_2672](https://github.com/user-attachments/assets/6ba074b6-270c-40b0-af7b-d787a13cf2d5)

> Panel data estimation is the analysis of data that have a two-factor structure, i.e., we have one factor that represents different units (such as individuals, companies, countries, etc.) and another that represents different time periods. This repository seeks to demonstrate the process of panel data estimation, using as a basis the book: "*Econometric Analysis of Cross Section and Panel Data, Second Edition, by Jeffrey M. Wooldridge*". In case of doubt, consult the referenced work.

### General Characteristics
- Heterogeneity of units: Each unit (individual, company, country, etc.) may have its own characteristics that do not vary over time.
- Temporal variability: Variables may change over time for each unit.
- Longitudinal structure: The presence of multiple observations for each unit allows the analysis of both variability within and between units.

> We can say that Panel Data is subdivided into two types: True Panel and Cross-Section Clustering. When we have a True Panel, the same unit of analysis is used over time (all the "i"s are the same), that is, in a survey, for example, the data will be about the same individuals over time. In a Cross-Section Clustering, the "i"s will not be the same between periods, that is, in a survey the data will not be about the same individuals.

### Panel Data Models
1) Pooled Cross Section Model
2) True Painel
   - Fixed Effects Model (FE)
   - Random Effects Model (RE)
   - Dynamic Effects Model (GMM)

### General Equation
$Yit = \beta0 + + \beta1Xit + \beta2Xit + eit$

- i = specific units
- t = time


        dum8 |          0  (omitted)
        dum9 |          0  (omitted)
       dum10 |          0  (omitted)
       dum11 |  -6.140227   .4064064   -15.11   0.000    -6.936769   -5.343685
       dum12 |          0  (omitted)
       dum13 |          0  (omitted)
       dum14 |          0  (omitted)
       dum15 |          0  (omitted)
       dum16 |          0  (omitted)
       dum17 |  -2.234968   .4064064    -5.50   0.000     -3.03151   -1.438426
       dum18 |          0  (omitted)
       dum19 |          0  (omitted)
       dum20 |          0  (omitted)
       dum21 |          0  (omitted)
       dum22 |          0  (omitted)
       dum23 |          0  (omitted)
       dum24 |          0  (omitted)
       dum25 |          0  (omitted)
       dum26 |  -1.422899   .4064064    -3.50   0.000    -2.219441   -.6263574
       dum27 |          0  (omitted)
       dum28 |  -1.696559   .4064064    -4.17   0.000    -2.493101   -.9000175
       dum29 |  -1.518793   .4064064    -3.74   0.000    -2.315335   -.7222514
       dum30 |  -3.860639   .4064064    -9.50   0.000    -4.657181   -3.064097
       dum31 |          0  (omitted)
       dum32 |          0  (omitted)
       dum33 |   -2.71708   .4064064    -6.69   0.000    -3.513622   -1.920538
       dum34 |          0  (omitted)
       dum35 |          0  (omitted)
       dum36 |  -.0136073   .4064064    -0.03   0.973    -.8101493    .7829347
       dum37 |  -3.205269   .4064064    -7.89   0.000    -4.001811   -2.408727
       dum38 |  -1.378389   .4064064    -3.39   0.001    -2.174931   -.5818469
       dum39 |          0  (omitted)
       dum40 |          0  (omitted)
       dum41 |  -4.017246   .4064064    -9.88   0.000    -4.813788   -3.220704
       dum42 |          0  (omitted)
       dum43 |          0  (omitted)
       dum44 |  -3.432003   .4064064    -8.44   0.000    -4.228545   -2.635461
       dum45 |          0  (omitted)
       dum46 |  -3.593904   .4064064    -8.84   0.000    -4.390446   -2.797362
       dum47 |          0  (omitted)
       dum48 |          0  (omitted)
       dum49 |          0  (omitted)
       dum50 |          0  (omitted)
       dum51 |          0  (omitted)
       dum52 |          0  (omitted)
       dum53 |          0  (omitted)
       dum54 |  -3.132317   .4064064    -7.71   0.000    -3.928859   -2.335775
       dum55 |  -6.214608   .4064064   -15.29   0.000     -7.01115   -5.418066
       dum56 |          0  (omitted)
       dum57 |          0  (omitted)
       dum58 |  -4.961392   .4064064   -12.21   0.000    -5.757934    -4.16485
       dum59 |          0  (omitted)
       dum60 |          0  (omitted)
       dum61 |          0  (omitted)
       dum62 |          0  (omitted)
       dum63 |  -1.615852   .4201882    -3.85   0.000    -2.439406   -.7922984
       dum64 |          0  (omitted)
       dum65 |          0  (omitted)
       dum66 |  -2.980634   .4201882    -7.09   0.000    -3.804188    -2.15708
       dum67 |          0  (omitted)
       dum68 |  -1.480697   .4201882    -3.52   0.000    -2.304251   -.6571434
       dum69 |          0  (omitted)
       dum70 |  -2.512121   .4064064    -6.18   0.000    -3.308663   -1.715579
       dum71 |          0  (omitted)
       dum72 |  -3.708901   .4201882    -8.83   0.000    -4.532455   -2.885347
       dum73 |          0  (omitted)
       dum74 |  -2.775932   .4201882    -6.61   0.000    -3.599486   -1.952379
       dum75 |  -2.758024   .4201882    -6.56   0.000    -3.581578    -1.93447
       dum76 |          0  (omitted)
       dum77 |  -3.540301   .4201882    -8.43   0.000    -4.363855   -2.716747
       dum78 |  -2.383381   .4201882    -5.67   0.000    -3.206934   -1.559827
       dum79 |          0  (omitted)
       dum80 |  -2.606835   .4201882    -6.20   0.000    -3.430389   -1.783281
       dum81 |  -2.640472   .4201882    -6.28   0.000    -3.464026   -1.816919
       dum82 |          0  (omitted)
       dum83 |  -3.477985   .4201882    -8.28   0.000    -4.301539   -2.654432
       dum84 |          0  (omitted)
       dum85 |  -3.979211   .4201882    -9.47   0.000    -4.802765   -3.155657
       dum86 |          0  (omitted)
       dum87 |  -3.581844   .4201882    -8.52   0.000    -4.405397    -2.75829
       dum88 |          0  (omitted)
       dum89 |  -1.519958   .4201882    -3.62   0.000    -2.343512   -.6964044
       dum90 |          0  (omitted)
       dum91 |  -.9756548   .4201882    -2.32   0.020    -1.799209    -.152101
       dum92 |  -6.012563   .4064064   -14.79   0.000    -6.809105   -5.216021
       dum93 |  -.0722396   .4201882    -0.17   0.863    -.8957933    .7513142
       dum94 |          0  (omitted)
       dum95 |          0  (omitted)
       dum96 |          0  (omitted)
       dum97 |          0  (omitted)
       dum98 |          0  (omitted)
       dum99 |          0  (omitted)
      dum100 |  -4.495012   .4201882   -10.70   0.000    -5.318566   -3.671458
      dum101 |          0  (omitted)
      dum102 |          0  (omitted)
      dum103 |          0  (omitted)
      dum104 |   -1.33342   .4201882    -3.17   0.002    -2.156973   -.5098658
      dum105 |  -2.512121   .4064064    -6.18   0.000    -3.308663   -1.715579
      dum106 |  -1.493268   .4201882    -3.55   0.000    -2.316822   -.6697143
      dum107 |  -2.997043   .4094963    -7.32   0.000    -3.799641   -2.194445
      dum108 |  -.1105996   .4094963    -0.27   0.787    -.9131976    .6919984
      dum109 |          0  (omitted)
      dum110 |          0  (omitted)
      dum111 |  -2.888576   .4094963    -7.05   0.000    -3.691174   -2.085978
      dum112 |  -4.568587   .4064064   -11.24   0.000    -5.365129   -3.772045
      dum113 |          0  (omitted)
      dum114 |          0  (omitted)
      dum115 |          0  (omitted)
      dum116 |          0  (omitted)
      dum117 |  -3.214181   .4094963    -7.85   0.000    -4.016779   -2.411583
      dum118 |          0  (omitted)
      dum119 |          0  (omitted)
      dum120 |          0  (omitted)
      dum121 |          0  (omitted)
      dum122 |          0  (omitted)
      dum123 |  -3.878364   .4064064    -9.54   0.000    -4.674906   -3.081822
      dum124 |  -1.756382   .4094963    -4.29   0.000     -2.55898   -.9537841
      dum125 |          0  (omitted)
      dum126 |          0  (omitted)
      dum127 |          0  (omitted)
      dum128 |  -3.121164   .4094963    -7.62   0.000    -3.923762   -2.318566
      dum129 |          0  (omitted)
      dum130 |          0  (omitted)
      dum131 |  -2.551721   .4094963    -6.23   0.000    -3.354319   -1.749123
      dum132 |          0  (omitted)
      dum133 |          0  (omitted)
      dum134 |  -3.786565   .4094963    -9.25   0.000    -4.589163   -2.983967
      dum135 |          0  (omitted)
      dum136 |  -1.031465   .4094963    -2.52   0.012    -1.834063   -.2288668
      dum137 |          0  (omitted)
      dum138 |          0  (omitted)
      dum139 |          0  (omitted)
      dum140 |          0  (omitted)
      dum141 |  -2.314374   .4094963    -5.65   0.000    -3.116972   -1.511776
      dum142 |          0  (omitted)
      dum143 |          0  (omitted)
      dum144 |  -1.596364   .4064064    -3.93   0.000    -2.392906   -.7998224
      dum145 |          0  (omitted)
      dum146 |          0  (omitted)
      dum147 |          0  (omitted)
      dum148 |          0  (omitted)
      dum149 |  -2.691121   .4064064    -6.62   0.000    -3.487663   -1.894579
      dum150 |          0  (omitted)
      dum151 |          0  (omitted)
      dum152 |          0  (omitted)
      dum153 |          0  (omitted)
      dum154 |          0  (omitted)
      dum155 |  -2.213759   .4064064    -5.45   0.000    -3.010301   -1.417217
      dum156 |          0  (omitted)
      dum157 |          0  (omitted)
       _cons |   3.314408   .2961843    11.19   0.000     2.733897    3.894919
-------------+----------------------------------------------------------------
     sigma_u |          0
     sigma_e |  .49774421
         rho |          0   (fraction of variance due to u_i)
------------------------------------------------------------------------------
```

Notes:
- Unbalanced panels are those that present some type of friction in their data (lack of information in some period). In this case, if the explanatory variables are correlated with the endosymbolic error term, we will have a sample selection problem (solution: Heckman Estimator).

### Random Effects Estimator (RE)
> The Random Effects Estimator assumes that individual differences are captured by a specific error term for each unit, that is, there is the presence of ai, it is random and not correlated with the explanatory variables. Therefore, the Grouped OLS estimator will not be biased. It may not be biased (it is consistent), but it will not be efficient, because there will be serial autocorrelation in the composite error term, that is, the error from one period will be carried over to the next, since ai is not eliminated. The solution to this problem is to perform a Generalized Least Squares (GLS) transformation, in other words, a "near-average" transformation, this occurs because the COR (Vit, Vit-1) is known and this correlation is associated with the variance of the endosyncratic error term and the variance of ai. Thus, one can weight the Xs and Y, by the structure of the change in the variance of the errors, depending on X, this would be the entire process of obtaining the Random Effect (RE) estimator. Mathematically speaking:

![Captura de tela 2024-07-05 154904](https://github.com/HenrySchall/Panel-Data/assets/96027335/2b24bc4e-cdf2-47d5-865f-4f96593df8c5)

- λ -> It is the weighting of the serial correlation structure, due to the fixed effects present in OLS. This is the "almost no mean" transformation, powered by λ (λ is estimated), instead of the within-group transformation, for each Y and each X of it in relation to the mean of i.

#### Cases:
- λ = 1 -> When $𝜎^2$ has a very high variance, it means that there is a very large difference between the ai's (the variance of ai will be very large), so the fixed effect is relevant.
- λ = 0 -> The variance of ai is very small, so there is no fixed effect that differentiates the units of analysis.

Therefore, we can conclude that:
- The closer to λ = 0, MQO is the preferable estimator
- The closer to λ = 1, FE is the preferable estimator
- The closer to λ = 0.5 (from the mean), RE is the preferable estimator
  
> Therefore, the GLS estimator, in the context of random effects, is an intermediate situation.
    
### 3rd Third Example
WAGEPAN.DTA"
- Download -> https://drive.google.com/uc?export=download&id=1ZppP8EB1W3HmazdhFPIAO-SURIRHC3c4

Legenda de variáveis:
- ui -> ai
- eit -> uit

```
reg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, vce(cluster nr)
```

```
# Estimated GLS
# vce(cluster nr) -> controle de heterocedasticidade
Linear regression                               Number of obs     =      4,360
                                                F(14, 544)        =      47.10
                                                Prob > F          =     0.0000
                                                R-squared         =     0.1893
                                                Root MSE          =     .48033

                                   (Std. err. adjusted for 545 clusters in nr)
------------------------------------------------------------------------------
             |               Robust
       lwage | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
       black |  -.1392342   .0505238    -2.76   0.006    -.2384798   -.0399887
        hisp |   .0160195   .0390781     0.41   0.682     -.060743     .092782
       exper |   .0672345   .0195958     3.43   0.001     .0287417    .1057273
     expersq |  -.0024117   .0010252    -2.35   0.019    -.0044255   -.0003979
       union |   .1824613   .0274435     6.65   0.000     .1285531    .2363695
        educ |   .0913498   .0110822     8.24   0.000     .0695807    .1131189
     married |   .1082529    .026034     4.16   0.000     .0571135    .1593924
         d81 |     .05832    .028228     2.07   0.039     .0028707    .1137693
         d82 |   .0627744   .0369735     1.70   0.090    -.0098538    .1354027
         d83 |   .0620117    .046248     1.34   0.181    -.0288348    .1528583
         d84 |   .0904672    .057988     1.56   0.119    -.0234407     .204375
         d85 |   .1092463   .0668474     1.63   0.103    -.0220644     .240557
         d86 |   .1419596   .0762348     1.86   0.063     -.007791    .2917102
         d87 |   .1738334   .0852056     2.04   0.042     .0064611    .3412057
       _cons |   .0920558   .1609365     0.57   0.568    -.2240773    .4081888
------------------------------------------------------------------------------
```

```
iis nr
```

```
tis year
```

```
xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87,fe vce(cluster nr)
```

```
# Fixed Effect (FE)
note: black omitted because of collinearity.
note: hisp omitted because of collinearity.
note: educ omitted because of collinearity.
note: d87 omitted because of collinearity.

Fixed-effects (within) regression               Number of obs     =      4,360
Group variable: nr                              Number of groups  =        545

R-squared:                                      Obs per group:
     Within  = 0.1806                                         min =          8
     Between = 0.0005                                         avg =        8.0
     Overall = 0.0635                                         max =          8

                                                F(10, 544)        =      46.59
corr(u_i, Xb) = -0.1212                         Prob > F          =     0.0000

                                   (Std. err. adjusted for 545 clusters in nr)
------------------------------------------------------------------------------
             |               Robust
       lwage | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
       black |          0  (omitted)
        hisp |          0  (omitted)
       exper |   .1321464    .012008    11.00   0.000     .1085586    .1557342
     expersq |  -.0051855   .0008102    -6.40   0.000    -.0067771   -.0035939
       union |   .0800019   .0227431     3.52   0.000     .0353268    .1246769
        educ |          0  (omitted)
     married |   .0466804   .0210038     2.22   0.027     .0054218    .0879389
         d81 |   .0190448   .0227267     0.84   0.402     -.025598    .0636876
         d82 |   -.011322   .0212167    -0.53   0.594    -.0529987    .0303547
         d83 |  -.0419955   .0205087    -2.05   0.041    -.0822814   -.0017096
         d84 |  -.0384709   .0211722    -1.82   0.070    -.0800601    .0031183
         d85 |  -.0432498    .017595    -2.46   0.014    -.0778122   -.0086874
         d86 |  -.0273819   .0162181    -1.69   0.092    -.0592396    .0044757
         d87 |          0  (omitted)
       _cons |    1.02764   .0398919    25.76   0.000     .9492785    1.106001
-------------+----------------------------------------------------------------
     sigma_u |   .4009279
     sigma_e |  .35099001
         rho |  .56612236   (fraction of variance due to u_i)
------------------------------------------------------------------------------
```

```
xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87,re vce(cluster nr) theta
```

```
# Random Effect (RE)

Random-effects GLS regression                   Number of obs     =      4,360
Group variable: nr                              Number of groups  =        545

R-squared:                                      Obs per group:
     Within  = 0.1799                                         min =          8
     Between = 0.1860                                         avg =        8.0
     Overall = 0.1830                                         max =          8

                                                Wald chi2(14)     =     610.97
corr(u_i, X) = 0 (assumed)                      Prob > chi2       =     0.0000
theta        = .64291089

                                   (Std. err. adjusted for 545 clusters in nr)
------------------------------------------------------------------------------
             |               Robust
       lwage | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
       black |  -.1393767   .0509251    -2.74   0.006    -.2391882   -.0395653
        hisp |   .0217317   .0399157     0.54   0.586    -.0565015     .099965
       exper |   .1057545    .016379     6.46   0.000     .0736522    .1378568
     expersq |  -.0047239   .0007917    -5.97   0.000    -.0062756   -.0031723
       union |   .1061344    .020844     5.09   0.000      .065281    .1469879
        educ |   .0918763   .0111455     8.24   0.000     .0700315    .1137211
     married |    .063986   .0189722     3.37   0.001     .0268013    .1011708
         d81 |    .040462   .0275684     1.47   0.142    -.0135711    .0944951
         d82 |   .0309212   .0350705     0.88   0.378    -.0378158    .0996581
         d83 |   .0202806    .043861     0.46   0.644    -.0656853    .1062466
         d84 |   .0431187   .0555848     0.78   0.438    -.0658254    .1520628
         d85 |   .0578155   .0645584     0.90   0.370    -.0687167    .1843476
         d86 |   .0919476   .0747028     1.23   0.218    -.0544671    .2383623
         d87 |   .1349289   .0848618     1.59   0.112    -.0313971    .3012549
       _cons |   .0235864   .1599577     0.15   0.883     -.289925    .3370977
-------------+----------------------------------------------------------------
     sigma_u |  .32460315
     sigma_e |  .35099001
         rho |  .46100216   (fraction of variance due to u_i)
------------------------------------------------------------------------------
```

##### Generate Comparison Table

- OLS
```
quietly regress lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, vce(cluster nr)
```
```
estimates store OLS
```

- Fixed Effect (FE)
```
quietly xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, fe vce(cluster nr)
```
```
estimates store FE
```
- Random Effect (RE)
```
quietly xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, re vce(cluster nr)
```
```
estimates store RE
```
```
estimates table OLS FE RE, b se t stats(N r2 r2_o r2_b r2_w sigma_u sigma_e rho theta)
```

```
-----------------------------------------------------
    Variable |    OLS           FE           RE      
-------------+---------------------------------------
       black | -.13923421    (omitted)   -.13937673  
             |  .05052376                 .05092515  
             |      -2.76                     -2.74  
        hisp |  .01601951    (omitted)    .02173173  
             |  .03907813                 .03991566  
             |       0.41                      0.54  
       exper |   .0672345    .13214642    .10575452  
             |  .01959583    .01200804    .01637903  
             |       3.43        11.00         6.46  
     expersq |  -.0024117    -.0051855   -.00472394  
             |   .0010252    .00081024    .00079168  
             |      -2.35        -6.40        -5.97  
       union |  .18246128    .08000186    .10613443  
             |  .02744349     .0227431    .02084397  
             |       6.65         3.52         5.09  
        educ |  .09134979    (omitted)    .09187628  
             |  .01108217                 .01114552  
             |       8.24                      8.24  
     married |  .10825295    .04668036    .06398602  
             |    .026034    .02100382    .01897217  
             |       4.16         2.22         3.37  
         d81 |  .05831999    .01904479      .040462  
             |  .02822803    .02272668    .02756841  
             |       2.07         0.84         1.47  
         d82 |  .06277442   -.01132198    .03092116  
             |  .03697346     .0212167    .03507051  
             |       1.70        -0.53         0.88  
         d83 |  .06201174   -.04199552    .02028064  
             |  .04624802    .02050869    .04386099  
             |       1.34        -2.05         0.46  
         d84 |  .09046719   -.03847088    .04311871  
             |  .05798801    .02117215    .05558476  
             |       1.56        -1.82         0.78  
         d85 |   .1092463   -.04324982    .05781546  
             |  .06684743    .01759497    .06455842  
             |       1.63        -2.46         0.90  
         d86 |  .14195959   -.02738194    .09194758  
             |   .0762348    .01621806    .07470275  
             |       1.86        -1.69         1.23  
         d87 |  .17383343    (omitted)    .13492892  
             |   .0852056                 .08486176  
             |       2.04                      1.59  
       _cons |  .09205578    1.0276395    .02358638  
             |  .16093649     .0398919     .1599577  
             |       0.57        25.76         0.15  
-------------+---------------------------------------
           N |       4360         4360         4360  
          r2 |  .18927834    .18057757               
        r2_o |                .0634798    .18298401  
        r2_b |               .00045916    .18602694  
        r2_w |               .18057757    .17992598  
     sigma_u |                .4009279    .32460315  
     sigma_e |               .35099001    .35099001  
         rho |               .56612236    .46100216  
       theta |                            .64291089  
-----------------------------------------------------
                                       Legend: b/se/t
```
Variable legend:
- ui -> ai
- eit -> uit
- sigma_u -> standard deviation of the fixed effect (ai)
- sigma_e -> standard deviation of the endosyncratic component (uit)
- rho -> intraclass correlation of the error v (compound) or due to ai.
- r2_o -> square of the correlation coefficient between observed and adjusted values ​​(ignoring ai) for variability in both dimensions.
- r2_b -> square of the correlation coefficient between observed and adjusted values ​​(ignoring ai) for between-group variability.
- r2_w -> square of the correlation coefficient between observed and adjusted values ​​(ignoring ai) for within-group variability.
- theta -> lambda

**However, how do you know which model is most suitable, for specific database? In the literature, it is suggested to use statistical tests to determine the best model, following the order proposed below:**

#### Test Breusch and Pagan Lagrangian multiplier test for random effects

- Null hypothesis (H0): var(ai) = 0
- Alternative hypothesis (H1): var(ai) ≠ 0
- Rejection of the null hypothesis indicates that pooled OLS is not the appropriate model, as the variability structure of the compound errors is sigma2. RE is choice between them

```
xtreg lwage exper expersq union married, re vce(cluster nr) theta
```
```
Random-effects GLS regression                   Number of obs     =      4,360
Group variable: nr                              Number of groups  =        545

R-squared:                                      Obs per group:
     Within  = 0.1766                                         min =          8
     Between = 0.0055                                         avg =        8.0
     Overall = 0.0734                                         max =          8

                                                Wald chi2(4)      =     439.46
corr(u_i, X) = 0 (assumed)                      Prob > chi2       =     0.0000
theta        = .66674755

                                   (Std. err. adjusted for 545 clusters in nr)
------------------------------------------------------------------------------
             |               Robust
       lwage | Coefficient  std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
       exper |   .1175546   .0104012    11.30   0.000     .0971686    .1379406
     expersq |  -.0047935   .0006536    -7.33   0.000    -.0060746   -.0035124
       union |   .1000728   .0210756     4.75   0.000     .0587654    .1413803
     married |   .0749106   .0193667     3.87   0.000     .0369525    .1128687
       _cons |   1.067721   .0370905    28.79   0.000     .9950252    1.140417
-------------+----------------------------------------------------------------
     sigma_u |  .35135125
     sigma_e |  .35125535
         rho |   .5001365   (fraction of variance due to u_i)
------------------------------------------------------------------------------
```
```
xttest0
```
```
Breusch and Pagan Lagrangian multiplier test for random effects

        lwage[nr,t] = Xb + u[nr] + e[nr,t]

        Estimated results:
                         |       Var     SD = sqrt(Var)
                ---------+-----------------------------
                   lwage |   .2836728       .5326094
                       e |   .1233803       .3512553
                       u |   .1234477       .3513513

        Test: Var(u) = 0
                             chibar2(01) =  3807.33
                          Prob > chibar2 =   0.0000
```

- prob > chibar2 = 0 -> rejects H0, so the variance of ui is different from zero, the best specification is not Pooled OLS. **So RE is preferred to Pooled OLS**

#### Chow Test or F Test (POLS intercept and slope equality test).

> It estimates an auxiliary equation, in which the effect of an explanatory variable is analyzed, influencing the dependent variable, differently for each individual, that is, it is as if I created a dummy for each individual and multiplied it by the selected explanatory variable and when performing a joint hypothesis test (Chow test), if the parameters are statistically significant together, there is no equality between the intercepts, so there are specific effects for each individual.

- Null hypothesis (H0): There is equality of intercepts and slopes for all "i"
- Alternative hypothesis (H1): There is no equality of intercepts and slopes for all "i"

> Rejection of the null hypothesis indicates that the parameters are different between individuals, therefore FE is preferable to Pooled OLS.

```
xtreg lwage exper expersq union married, fe
```
```

Fixed-effects (within) regression               Number of obs     =      4,360
Group variable: nr                              Number of groups  =        545

R-squared:                                      Obs per group:
     Within  = 0.1780                                         min =          8
     Between = 0.0005                                         avg =        8.0
     Overall = 0.0638                                         max =          8

                                                F(4, 3811)        =     206.38
corr(u_i, Xb) = -0.1139                         Prob > F          =     0.0000

------------------------------------------------------------------------------
       lwage | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
       exper |   .1168467   .0084197    13.88   0.000     .1003392    .1333542
     expersq |  -.0043009   .0006053    -7.11   0.000    -.0054876   -.0031142
       union |   .0820871   .0192907     4.26   0.000      .044266    .1199083
     married |   .0453033   .0183097     2.47   0.013     .0094056     .081201
       _cons |    1.06488   .0266607    39.94   0.000     1.012609     1.11715
-------------+----------------------------------------------------------------
     sigma_u |   .4000539
     sigma_e |  .35125535
         rho |   .5646785   (fraction of variance due to u_i)
------------------------------------------------------------------------------
F test that all u_i=0: F(544, 3811) = 9.71                   Prob > F = 0.0000
```

- p-value > F = 0 -> I reject H0, so there is no equality of intercepts and slopes for all "i". **So FE is preferred to Pooled OLS**
- NOTE: Note that there are two p-values ​​> F, one above and one below, the first is the global significance of the model and the second is the Chow Test.

**The first test suggested RE, the second FE, in both cases the clustering solution was discarded. So which one should I choose, FE or RE?**

#### Hausman Test

> It is used to compare models, to check if there is a systematic difference in the estimated parameters between the models, with the aim of selecting the most parsimonious model.

- Null hypothesis (H0): Difference in coefficients is not systematic -> EA is consistent (random heterogeneity)
- Alternative hypothesis (H1): Difference in coefficients is systematic -> EA is not consistent (random homogeneity)

> Rejection of the null hypothesis indicates that FE is better than RE

- Step 1 -> Estimate with Fixed Effect
```
xtreg lwage exper expersq union married, fe 
```
```
estimates store FE
```

- Step 2 -> Estimate with the Random Effect
```
xtreg lwage exper expersq union married, re
```
- Step 3 -> Run the test 
```
hausman FE
```
```
                 ---- Coefficients ----
             |      (b)          (B)            (b-B)     sqrt(diag(V_b-V_B))
             |       FE           .          Difference       Std. err.
-------------+----------------------------------------------------------------
       exper |    .1168467     .1175546       -.0007079        .0013369
     expersq |   -.0043009    -.0047935        .0004926        .0001197
       union |    .0820871     .1000728       -.0179857        .0067273
     married |    .0453033     .0749106       -.0296073        .0068551
------------------------------------------------------------------------------
                          b = Consistent under H0 and Ha; obtained from xtreg.
           B = Inconsistent under Ha, efficient under H0; obtained from xtreg.

Test of H0: Difference in coefficients not systematic

    chi2(4) = (b-B)'[(V_b-V_B)^(-1)](b-B)
            = 250.26
Prob > chi2 = 0.0000
```


