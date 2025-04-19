# Pooled Cross Section

### 1st First Example
FERTIL1.DTA (number of children per woman between 1974 and 1984 
- Download -> https://drive.google.com/uc?export=download&id=1xXPLEl_uD2WaSblkRK4nb0u0MaIfZXAV

```
# Creating variable suggested by the author
gen age2=age^2
```
> The first step is to identify whether we have a True Panel or a Pooled Cross Section, for this we need to find out how many observations we have in each period.

```
sort year
```
```
by year: tab kids
```
```
# kids dependent variable
--------------------------------------------------------------------------------------
-> year = 72

 # children |
  ever born |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         16       10.26       10.26
          1 |         16       10.26       20.51
          2 |         34       21.79       42.31
          3 |         29       18.59       60.90
          4 |         23       14.74       75.64
          5 |         22       14.10       89.74
          6 |         13        8.33       98.08
          7 |          3        1.92      100.00
------------+-----------------------------------
      Total |        156      100.00

--------------------------------------------------------------------------------------
-> year = 74

 # children |
  ever born |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |          6        3.47        3.47
          1 |         13        7.51       10.98
          2 |         40       23.12       34.10
          3 |         42       24.28       58.38
          4 |         40       23.12       81.50
          5 |         17        9.83       91.33
          6 |         14        8.09       99.42
          7 |          1        0.58      100.00
------------+-----------------------------------
      Total |        173      100.00

--------------------------------------------------------------------------------------
-> year = 76

 # children |
  ever born |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         15        9.87        9.87
          1 |         16       10.53       20.39
          2 |         34       22.37       42.76
          3 |         40       26.32       69.08
          4 |         27       17.76       86.84
          5 |         11        7.24       94.08
          6 |          4        2.63       96.71
          7 |          5        3.29      100.00
------------+-----------------------------------
      Total |        152      100.00

--------------------------------------------------------------------------------------
-> year = 78

 # children |
  ever born |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         11        7.69        7.69
          1 |         13        9.09       16.78
          2 |         42       29.37       46.15
          3 |         35       24.48       70.63
          4 |         24       16.78       87.41
          5 |          8        5.59       93.01
          6 |          7        4.90       97.90
          7 |          3        2.10      100.00
------------+-----------------------------------
      Total |        143      100.00

--------------------------------------------------------------------------------------
-> year = 80

 # children |
  ever born |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         11        7.75        7.75
          1 |         14        9.86       17.61
          2 |         38       26.76       44.37
          3 |         38       26.76       71.13
          4 |         21       14.79       85.92
          5 |         10        7.04       92.96
          6 |          8        5.63       98.59
          7 |          2        1.41      100.00
------------+-----------------------------------
      Total |        142      100.00

--------------------------------------------------------------------------------------
-> year = 82

 # children |
  ever born |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         23       12.37       12.37
          1 |         35       18.82       31.18
          2 |         52       27.96       59.14
          3 |         37       19.89       79.03
          4 |         15        8.06       87.10
          5 |         11        5.91       93.01
          6 |          9        4.84       97.85
          7 |          4        2.15      100.00
------------+-----------------------------------
      Total |        186      100.00

--------------------------------------------------------------------------------------
-> year = 84

 # children |
  ever born |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         24       13.56       13.56
          1 |         34       19.21       32.77
          2 |         46       25.99       58.76
          3 |         42       23.73       82.49
          4 |         17        9.60       92.09
          5 |         10        5.65       97.74
          6 |          2        1.13       98.87
          7 |          2        1.13      100.00
------------+-----------------------------------
      Total |        177      100.00
```
> Taking the years 72 and 74 as an example, we can see that in the year 72, we obtained 156 interviews and in the year 74 we obtained 173 interviewees, showing that the data is not the same for each period, so we have a Pooled Cross Section.

```
reg kids educ age age2 black east northcen west farm othrural town smcity y74 y76 y78 y80 y82 y84
```
```
# Regression by Grouped OLS

      Source |       SS           df       MS      Number of obs   =     1,129
-------------+----------------------------------   F(17, 1111)     =      9.72
       Model |  399.610888        17  23.5065228   Prob > F        =    0.0000
    Residual |  2685.89841     1,111  2.41755033   R-squared       =    0.1295
-------------+----------------------------------   Adj R-squared   =    0.1162
       Total |   3085.5093     1,128  2.73538059   Root MSE        =    1.5548

------------------------------------------------------------------------------
        kids | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
        educ |  -.1284268   .0183486    -7.00   0.000    -.1644286    -.092425
         age |   .5321346   .1383863     3.85   0.000     .2606065    .8036626
        age2 |   -.005804   .0015643    -3.71   0.000    -.0088733   -.0027347
       black |   1.075658   .1735356     6.20   0.000     .7351631    1.416152
        east |    .217324   .1327878     1.64   0.102    -.0432192    .4778672
    northcen |    .363114   .1208969     3.00   0.003      .125902    .6003261
        west |   .1976032   .1669134     1.18   0.237    -.1298978    .5251041
        farm |  -.0525575     .14719    -0.36   0.721    -.3413592    .2362443
    othrural |  -.1628537    .175442    -0.93   0.353    -.5070887    .1813814
        town |   .0843532    .124531     0.68   0.498    -.1599893    .3286957
      smcity |   .2118791    .160296     1.32   0.187    -.1026379    .5263961
         y74 |   .2681825    .172716     1.55   0.121    -.0707039    .6070689
         y76 |  -.0973795   .1790456    -0.54   0.587     -.448685    .2539261
         y78 |  -.0686665   .1816837    -0.38   0.706    -.4251483    .2878154
         y80 |  -.0713053   .1827707    -0.39   0.697      -.42992    .2873093
         y82 |  -.5224842   .1724361    -3.03   0.003    -.8608214    -.184147
         y84 |  -.5451661   .1745162    -3.12   0.002    -.8875846   -.2027477
       _cons |  -7.742457   3.051767    -2.54   0.011    -13.73033   -1.754579
------------------------------------------------------------------------------
```
Description of variables:
- educ = It is significant and has a *negative* effect on the dependent variable, that is, more educated women, controlled by the other variables, have fewer children or an increase of one unit in the education variable, controlled by the other factors, leads to a decrease of 14.28% in fertility levels. - age = Significant and has a *positive* effect on the dependent variable
- age2 = Significant and has a negative effect on the dependent variable
- black = Significant and has a positive effect on the dependent variable
- east = Significant and has a positive effect on the dependent variable
- northcen = Significant and has a positive effect on the dependent variable
- west = Not significant
- farm = Not significant
- othrural = Not significant
- town = Not significant
- smcity = Not significant
- y74 = Not significant and has a *positive* effect
- y76 = Not significant and has a negative effect
- y78 = Not significant and has a negative effect
- y80 = Not significant and has a negative effect
- y82 = Significant and has a negative effect
- y84 = Significant and has a negative effect

Note that:
- We have 1,129 observations
- Our model is significant, because we have Prob > F = 0.0000 . However, not all of our variables are significant at the 10% significance level. - Since the dummies y74, y76, y78, 80 are not significant, that is, controlled by the other factors, the fertility of these years is statistically equal to that of y72. - We can see that the dummies y82 and y84 are significant and negative, that is, controlled by the other factors, there is a long-term trend in the decline of fertility and this decline is approximately (0.522 - 0.545 = -0.023 children).

### 2nd Second Example
CPS78_85.DTA (Value of salaries of 1978 and 1985) 
- Download -> https://drive.google.com/uc?export=download&id=1pQrWzPQGOPXWqMBZXz-2ezTlHWgOv4HH

```
sum
```
```
   Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
        educ |      1,084    12.77399    2.705561          1         18
       south |      1,084    .2942804     .455929          0          1
    nonwhite |      1,084    .1143911    .3184326          0          1
      female |      1,084    .4169742    .4932861          0          1
     married |      1,084     .654059    .4758936          0          1
-------------+---------------------------------------------------------
       exper |      1,084    18.27675    12.88119          0         55
     expersq |      1,084    499.8118    599.3249          0       3025
       union |      1,084    .2435424    .4294178          0          1
       lwage |      1,084    1.867301    .5428042       -.47     3.7955
         age |      1,084    36.53967    12.20392         18         64
-------------+---------------------------------------------------------
        year |      1,084    81.44834    3.501234         78         85
         y85 |      1,084    .4926199    .5001763          0          1
      y85fem |      1,084    .2260148    .4184419          0          1
     y85educ |      1,084    6.413284    6.765212          0         18
    y85union |      1,084    .0885609      .28424          0          1
```
```
tab year
```
```
   78 or 85 |      Freq.     Percent        Cum.
------------+-----------------------------------
         78 |        550       50.74       50.74
         85 |        534       49.26      100.00
------------+-----------------------------------
      Total |      1,084      100.00
```
```
reg lwage educ exper expersq union female
```
```

      Source |       SS           df       MS      Number of obs   =     1,084
-------------+----------------------------------   F(5, 1078)      =     91.38
       Model |  94.9815424         5  18.9963085   Prob > F        =    0.0000
    Residual |  224.109625     1,078  .207893901   R-squared       =    0.2977
-------------+----------------------------------   Adj R-squared   =    0.2944
       Total |  319.091167     1,083   .29463635   Root MSE        =    .45595

------------------------------------------------------------------------------
       lwage | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
        educ |   .0884531   .0055755    15.86   0.000     .0775129    .0993933
       exper |    .032308    .003934     8.21   0.000     .0245889    .0400271
     expersq |  -.0004523   .0000856    -5.29   0.000    -.0006202   -.0002844
       union |   .1428904    .033123     4.31   0.000     .0778976    .2078832
      female |  -.2508962   .0284176    -8.83   0.000    -.3066564    -.195136
       _cons |   .4428074   .0828303     5.35   0.000     .2802805    .6053344
------------------------------------------------------------------------------
```
- Our model is significant because we have Prob > F = 0.0000 and all variables are statistically significant (P>|t| = 0.000).
- Taking the variable educ as an example, we can say that an increase of 1 year of education, controlled by the other factors, leads to a salary increase of approximately 8.84%.
- Taking the variable female as an example, we can say that the fact of being a woman, controlled by the other factors, leads to a salary decrease of approximately 25.08%.

> However, what is the real effect on salaries between 1978 and 1985, taking into account the factors education and being a woman. Was there an increase or decrease in salary from 1978 in relation to 1985? In the previous example, we performed the difference between the dummies y82 and y84, to find this real effect, however an alternative would be to use the Difference-in-Differences Estimator (DID).

### Difference-in-Differences Estimator (DID)
> This is an alternative to the Pooled OLS Estimator. It is used when we want to capture the effect before and after an event, that is, of a specific change in the data. Its logic is similar to pharmaceutical tests, where a sample population is selected, in which part of this population receives a treatment (treatment group) of a certain natural process, while the other part of this population does not receive the treatment (control group). Given by the following equation:

$Yit = \beta0 +\delta0D + \beta1DT + \delta1 D * DT + eit$

Onde:

$\delta0D$ = Post-event dummy
- 0 = period observed prior to the event
- 1 = period observed after the event

$\beta1DT$ = Treatment Dummy
- 0 = did not receive treatment
- 1 = received the treatment

$\delta1 D * DT$ = Interaction Dummy (difference between receiving and not receiving the treatment = DID)

Description of variables:
- y85 -> post-event dummy
- female e educ -> treatment dummy
- y85educ e y85fem -> interaction dummy

```
reg lwage y85 female exper expersq y85fem
```
```
      Source |       SS           df       MS      Number of obs   =     1,084
-------------+----------------------------------   F(5, 1078)      =     75.16
       Model |   82.484555         5   16.496911   Prob > F        =    0.0000
    Residual |  236.606612     1,078  .219486653   R-squared       =    0.2585
-------------+----------------------------------   Adj R-squared   =    0.2551
       Total |  319.091167     1,083   .29463635   Root MSE        =    .46849

------------------------------------------------------------------------------
       lwage | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         y85 |   .3616747   .0375785     9.62   0.000     .2879395    .4354099
      female |  -.3301099   .0413898    -7.98   0.000    -.4113237   -.2488962
       exper |   .0362199   .0040174     9.02   0.000     .0283372    .0441027
     expersq |  -.0006607   .0000864    -7.65   0.000    -.0008301   -.0004912
      y85fem |   .0831141   .0582039     1.43   0.154    -.0310918      .19732
       _cons |    1.47623   .0428719    34.43   0.000     1.392108    1.560352
------------------------------------------------------------------------------
```
```
reg lwage y85 educ exper expersq y85educ
```
```
      Source |       SS           df       MS      Number of obs   =     1,084
-------------+----------------------------------   F(5, 1078)      =    105.79
       Model |  105.032916         5  21.0065831   Prob > F        =    0.0000
    Residual |  214.058252     1,078  .198569807   R-squared       =    0.3292
-------------+----------------------------------   Adj R-squared   =    0.3261
       Total |  319.091167     1,083   .29463635   Root MSE        =    .44561

------------------------------------------------------------------------------
       lwage | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         y85 |   .0191659   .1317823     0.15   0.884     -.239413    .2777448
        educ |    .068904   .0071893     9.58   0.000     .0547973    .0830107
       exper |   .0321275   .0038302     8.39   0.000      .024612     .039643
     expersq |  -.0004276   .0000836    -5.12   0.000    -.0005915   -.0002636
     y85educ |    .025344   .0100768     2.52   0.012     .0055715    .0451164
       _cons |   .4416655   .0993411     4.45   0.000     .2467418    .6365893
------------------------------------------------------------------------------
```
```
reg lwage y85 educ y85educ exper expersq union female y85fem
```
```
# We can analyze both effects together, reducing possible multicollinearity and increasing the model's degrees of freedom.

      Source |       SS           df       MS      Number of obs   =     1,084
-------------+----------------------------------   F(8, 1075)      =     99.80
       Model |  135.992074         8  16.9990092   Prob > F        =    0.0000
    Residual |  183.099094     1,075  .170324738   R-squared       =    0.4262
-------------+----------------------------------   Adj R-squared   =    0.4219
       Total |  319.091167     1,083   .29463635   Root MSE        =     .4127

------------------------------------------------------------------------------
       lwage | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         y85 |   .1178062   .1237817     0.95   0.341     -.125075    .3606874
        educ |   .0747209   .0066764    11.19   0.000     .0616206    .0878212
     y85educ |   .0184605   .0093542     1.97   0.049      .000106     .036815
       exper |   .0295843   .0035673     8.29   0.000     .0225846     .036584
     expersq |  -.0003994   .0000775    -5.15   0.000    -.0005516   -.0002473
       union |   .2021319   .0302945     6.67   0.000     .1426888    .2615749
      female |  -.3167086   .0366215    -8.65   0.000    -.3885663    -.244851
      y85fem |    .085052    .051309     1.66   0.098    -.0156251     .185729
       _cons |   .4589329   .0934485     4.91   0.000     .2755707     .642295
------------------------------------------------------------------------------
```

- The dummy for y85 is not significant, i.e., controlled by the other factors, the salaries of y78 and y85 are statistically equal.

- Analyzing the variable educ and y85educ. We have that the increase of 1 year of study in y78, increases the salaries by 7.47%, controlled by the other factors. Furthermore, in the year y85 this effect is 1.85% greater (7.47% - 8.50% = 1.85%), i.e., an increase in the effect from one year to the next).

- Analyzing the variable female and y85fem. We have that the salary difference in y78, is -31.67%, controlled by the other factors. Furthermore, in the year y85 this effect is 8.50% smaller (31.67% - 8.50% = -23.17%), i.e., a decrease in the effect from one year to the next).
  
### 3rd Third Example
KIELMC.DTA (Effect of installing a garbage incinerator on real estate prices in a region of Massachusetts)
- Download -> https://drive.google.com/uc?export=download&id=1RXmFk-LzRyptoLPW3BQIMS8_b8rvLshX

```
tab year
```
```
# Noted that I do not have a true data panel

    1978 or |
       1981 |      Freq.     Percent        Cum.
------------+-----------------------------------
       1978 |        179       55.76       55.76
       1981 |        142       44.24      100.00
------------+-----------------------------------
      Total |        321      100.00
```
```
sum
```
```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
        year |        321    1979.327    1.492329       1978       1981
         age |        321    18.00935    32.56585          0        189
       agesq |        321    1381.567    4801.789          0      35721
         nbh |        321    2.208723    2.164353          0          6
         cbd |        321    15822.43    8967.106       1000      35000
-------------+---------------------------------------------------------
       intst |        321    16442.37    9033.131       1000      34000
      lintst |        321    9.480513    .7771655     6.9078     10.434
       price |        321    96100.66    43223.73      26000     300000
       rooms |        321     6.58567    .9012042          4         10
        area |        321    2106.729    694.9579        735       5136
-------------+---------------------------------------------------------
        land |        321    39629.89    39514.39       1710     544500
       baths |        321    2.339564    .7705265          1          4
        dist |        321    20715.58    8508.184       5000      40000
       ldist |        321    9.837414    .4783831   8.517193   10.59663
        wind |        321    6.978193    2.665079          3         11
-------------+---------------------------------------------------------
      lprice |        321    11.37812    .4381744   10.16585   12.61154
         y81 |        321    .4423676    .4974428          0          1
       larea |        321    7.597232    .3407226   6.599871    8.54403
       lland |        321    10.30186    .8017517   7.444249   13.20762
    y81ldist |        321    4.342579    4.892513          0   10.56875
-------------+---------------------------------------------------------
    lintstsq |        321    90.48224    14.06646    47.7177   108.8684
     nearinc |        321    .2990654    .4585634          0          1
    y81nrinc |        321    .1246106    .3307925          0          1
      rprice |        321    83721.36    33118.79      26000     300000
     lrprice |        321    11.26138    .3878996   10.16585   12.61154
```
```
#nearinc = Location dummy
reg rprice nearinc if year==1981
```
```
# nearinc = Location dummy

      Source |       SS           df       MS      Number of obs   =       142
-------------+----------------------------------   F(1, 140)       =     27.73
       Model |  2.7059e+10         1  2.7059e+10   Prob > F        =    0.0000
    Residual |  1.3661e+11       140   975815048   R-squared       =    0.1653
-------------+----------------------------------   Adj R-squared   =    0.1594
       Total |  1.6367e+11       141  1.1608e+09   Root MSE        =     31238

------------------------------------------------------------------------------
      rprice | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     nearinc |  -30688.27   5827.709    -5.27   0.000    -42209.97   -19166.58
       _cons |   101307.5   3093.027    32.75   0.000     95192.43    107422.6
```
> Our model will be significant from a global point of view and our variable nearinc is significant and negative, that is, in 81, the properties that are located close to the waste treatment center have lower prices, on average US$30,688, than the properties far from the waste treatment center. However, is this difference caused by the waste treatment center?

```
reg rprice nearinc if year==1978
```
```
      Source |       SS           df       MS      Number of obs   =       179
-------------+----------------------------------   F(1, 177)       =     15.74
       Model |  1.3636e+10         1  1.3636e+10   Prob > F        =    0.0001
    Residual |  1.5332e+11       177   866239953   R-squared       =    0.0817
-------------+----------------------------------   Adj R-squared   =    0.0765
       Total |  1.6696e+11       178   937979126   Root MSE        =     29432

------------------------------------------------------------------------------
      rprice | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     nearinc |  -18824.37   4744.594    -3.97   0.000    -28187.62   -9461.117
       _cons |   82517.23    2653.79    31.09   0.000     77280.09    87754.37
------------------------------------------------------------------------------
```

- It is observed that the answer is __*No*__. Because we see the same effect in 78, long before the installation of the waste treatment center. Therefore, the prices are lower because we are most likely analyzing a less privileged region of the city.
- So the real effect of the installation of the waste treatment center will be the difference between the dummies y81 and y78 (18,824 - 30,688 = US$11,864), which would be the same as estimating using the DID estimator

```
reg rprice y81 nearinc y81nrinc
```
```
# Using DID estimator

      Source |       SS           df       MS      Number of obs   =       321
-------------+----------------------------------   F(3, 317)       =     22.25
       Model |  6.1055e+10         3  2.0352e+10   Prob > F        =    0.0000
    Residual |  2.8994e+11       317   914632739   R-squared       =    0.1739
-------------+----------------------------------   Adj R-squared   =    0.1661
       Total |  3.5099e+11       320  1.0969e+09   Root MSE        =     30243

------------------------------------------------------------------------------
      rprice | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         y81 |   18790.29   4050.065     4.64   0.000     10821.88    26758.69
     nearinc |  -18824.37   4875.322    -3.86   0.000    -28416.45   -9232.293
    y81nrinc |   -11863.9   7456.646    -1.59   0.113    -26534.67    2806.867
       _cons |   82517.23    2726.91    30.26   0.000      77152.1    87882.36
------------------------------------------------------------------------------
```
```
reg rprice y81 nearinc y81nrinc age agesq intst land area rooms baths
```
```
# Adding more explanatory variables (author's suggestion)

      Source |       SS           df       MS      Number of obs   =       321
-------------+----------------------------------   F(10, 310)      =     60.19
       Model |  2.3167e+11        10  2.3167e+10   Prob > F        =    0.0000
    Residual |  1.1932e+11       310   384905860   R-squared       =    0.6600
-------------+----------------------------------   Adj R-squared   =    0.6491
       Total |  3.5099e+11       320  1.0969e+09   Root MSE        =     19619

------------------------------------------------------------------------------
      rprice | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         y81 |   13928.48   2798.747     4.98   0.000     8421.533    19435.42
     nearinc |   3780.337   4453.415     0.85   0.397    -4982.408    12543.08
    y81nrinc |  -14177.93   4987.267    -2.84   0.005    -23991.11   -4364.759
         age |   -739.451   131.1272    -5.64   0.000    -997.4629   -481.4391
       agesq |    3.45274   .8128214     4.25   0.000     1.853395    5.052084
       intst |  -.5386352   .1963359    -2.74   0.006    -.9249548   -.1523157
        land |   .1414196   .0310776     4.55   0.000     .0802698    .2025693
        area |   18.08621   2.306064     7.84   0.000     13.54869    22.62373
       rooms |   3304.227   1661.248     1.99   0.048     35.47904    6572.974
       baths |   6977.317   2581.321     2.70   0.007     1898.191    12056.44
       _cons |   13807.67   11166.59     1.24   0.217    -8164.239    35779.57
------------------------------------------------------------------------------
```
### 4th Fourth Example
INJURY.DTA (In July 1980 there was a limit for receiving compensation assistance for work accidents in relation to the income of individuals, and individuals with income above the limit did not receive compensation. After July 1982, this limit was raised)
- Download -> https://drive.google.com/uc?export=download&id=1RsIsNjywFAeEkgdN15fesj44ieVNRU5Y
```
reg ldurat afchnge highearn afhigh
```
Description of variables:
- afchnge = post-period dummy (1 = individuals removed after new legislation and 0 = otherwise)
- highearn = treatment dummy (1 = Individuals with income above the limit of old legislation and 0 = otherwise)
- afhigh = interaction dummy

```
      Source |       SS           df       MS      Number of obs   =     7,150
-------------+----------------------------------   F(3, 7146)      =     38.34
       Model |  193.919855         3  64.6399516   Prob > F        =    0.0000
    Residual |  12047.1908     7,146  1.68586493   R-squared       =    0.0158
-------------+----------------------------------   Adj R-squared   =    0.0154
       Total |  12241.1107     7,149  1.71228293   Root MSE        =    1.2984

------------------------------------------------------------------------------
      ldurat | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     afchnge |   .0236351   .0397008     0.60   0.552    -.0541902    .1014603
    highearn |   .2151955   .0433612     4.96   0.000     .1301948    .3001963
      afhigh |   .1883498    .062794     3.00   0.003      .065255    .3114445
       _cons |   1.199336   .0271091    44.24   0.000     1.146194    1.252478
------------------------------------------------------------------------------
```

- afchnge = is not significant and positive, controlled by other factors, after the new legislation there is no change in the duration of absence for low-income individuals, because those affected are only high-income individuals.
- afhigh = is significant and positive, controlled by other factors, after the change in legislation, individuals who had higher incomes (who were not covered by compensation) began to be absent for a much longer period, around 18% of the duration of absence.

```
reg ldurat afchnge highearn afhigh male married indust injtype
```
```
      Source |       SS           df       MS      Number of obs   =     6,824
-------------+----------------------------------   F(7, 6816)      =     21.03
       Model |  244.707976         7  34.9582823   Prob > F        =    0.0000
    Residual |  11329.2752     6,816  1.66215892   R-squared       =    0.0211
-------------+----------------------------------   Adj R-squared   =    0.0201
       Total |  11573.9832     6,823   1.6963188   Root MSE        =    1.2892

------------------------------------------------------------------------------
      ldurat | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     afchnge |   .0219922     .04015     0.55   0.584    -.0567144    .1006989
    highearn |   .1797779   .0469284     3.83   0.000     .0877835    .2717723
      afhigh |   .2151064    .064014     3.36   0.001     .0896191    .3405938
        male |  -.0862377   .0402554    -2.14   0.032    -.1651509   -.0073244
     married |   .1183969   .0352929     3.35   0.001     .0492118    .1875821
      indust |   .0338827   .0178639     1.90   0.058    -.0011361    .0689016
     injtype |   .0353488     .01031     3.43   0.001     .0151379    .0555598
       _cons |   .9597444   .0735133    13.06   0.000     .8156355    1.103853
------------------------------------------------------------------------------
```

