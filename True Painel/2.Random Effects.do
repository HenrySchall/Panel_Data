# Load Base -> WAGEPAN.DTA
reg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, vce(cluster nr)

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

iis nr
tis year

xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87,fe vce(cluster nr)

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

xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87,re vce(cluster nr) theta

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

xtreg lwage exper expersq union married, re vce(cluster nr) theta

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
However, how do you know which model is most suitable, for specific database? In the literature, 
it is suggested to use statistical tests to determine the best model, following the order proposed below:
```

xttest0

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
						  
xtreg lwage exper expersq union married, fe

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

xtreg lwage exper expersq union married, fe 

estimates store FE

xtreg lwage exper expersq union married, re

hausman FE

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
