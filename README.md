# Panel Data

![IMG2345](https://github.com/user-attachments/assets/6a6e2c3a-d5e6-48f2-8560-d28f17aa2784)

> Panel data estimation is the analysis of data that have a two-factor structure, i.e., we have one factor that represents different units (such as individuals, companies, countries, etc.) and another that represents different time periods. This document seeks to demonstrate the process of panel data estimation, using as a basis the book: "*Econometric Analysis of Cross Section and Panel Data, Second Edition, by Jeffrey M. Wooldridge*". All the bases used in this code can be found in this repository, for any questions consult the referenced work.

### General Characteristics
- Heterogeneity of units: Each unit (individual, company, country, etc.) may have its own characteristics that do not vary over time.
- Temporal variability: Variables may change over time for each unit.
- Longitudinal structure: The presence of multiple observations for each unit allows the analysis of both variability within and between units.

> We can say that Panel Data is subdivided into two types: True Panel and Cross-Section Clustering. When we have a True Panel, the same unit of analysis is used over time (all the "i"s are the same), that is, in a survey, for example, the data will be about the same individuals over time. In a Cross-Section Clustering, the "i"s will not be the same between periods, that is, in a survey the data will not be about the same individuals.

### Panel Data Models
1) Pooled Cross Section Model
2) Fixed Effects Model (FE) 
3) Random Effects Model (RE)
4) Dynamic Effects Model (GMM)

### General Equation
$Yit = \beta0 + + \beta1Xit + \beta2Xit + eit$

- i = specific units
- t = time

## Pooled Cross Section

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

## True Panel
> Until now, all examples were about cross-sectional groupings and for these types of datasets, Grouped OLS is not biased. However, when you have a true panel, all the "i"s will be the same for all periods. Therefore, if one of the control variables has any relationship with the explanatory variables of the model, there will be the presence of endogeneity, that is, COV (Xn,e) ≠ 0. In this way, the estimation via Grouped OLS will be biased, so another general equation is used, considering the so-called compound error term. 

#### General Equation
$Yit = \beta0 + + \beta1Xit + \beta2Xit + Vit$

$Vit = ai + uit$

- Vit = compound error term
- ai = fixed effect or unobserved heterogeneity (that which does not vary over time)
- uit = endosyncratic error (that which varies over time)
  
> Fixed effect is something that explains Yit, being specific to i, but does not vary over the observed time horizon. Since the Pooled OLS estimator is biased, another estimator is used, the First Differences Estimator (PD).

### First Differences Estimator (PD)
> The First Differences Estimator transforms the original equation by subtracting the values ​​of the dependent variable and the explanatory variables, that is, all the cross-sections of all observations i during time are taken and subtracted in relation to a previous period, removing any fixed effect that is constant at t. Mathematically speaking:

$Yi1 = (\beta0 + \delta0) + \beta1Xi1 + Vit$ (ai + uit)$

$Yi2 = (\beta0 + \delta0) + \beta1Xi1 + Vit$ (ai + uit)$

$(Yi2 - Yi1) = \delta0 + \beta1(Xi2 - Xi1) + (ui2 - ui1)$

$∆Yi = \delta0 + \beta1∆Xi + ∆ui$

### 1st First Example
CRIME2.DTA (Crime rates for US counties in 82 and 87).
- Download -> https://drive.google.com/uc?export=download&id=178_1AxOjDBdqFvSSmp-7_EqqtwQjPWxm
```
tab year
```
```

   82 or 87 |      Freq.     Percent        Cum.
------------+-----------------------------------
         82 |         46       50.00       50.00
         87 |         46       50.00      100.00
------------+-----------------------------------
      Total |         92      100.00
```
- crmrte = crime rate
- unem = unemployment
- we can see that we have the same number of observations for the years 82 and 87, so we have a true panel

Model Equation: $ccrmrte = \beta0 +\delta0D87 + \beta1cunem + eit$

```
reg crmrte d87 unem
```
```
      Source |       SS           df       MS      Number of obs   =        92
-------------+----------------------------------   F(2, 89)        =      0.55
       Model |  989.717223         2  494.858612   Prob > F        =    0.5788
    Residual |  80055.7995        89  899.503365   R-squared       =    0.0122
-------------+----------------------------------   Adj R-squared   =   -0.0100
       Total |  81045.5167        91  890.610074   Root MSE        =    29.992

------------------------------------------------------------------------------
      crmrte | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         d87 |   7.940416   7.975325     1.00   0.322    -7.906385    23.78722
        unem |   .4265473   1.188279     0.36   0.720    -1.934538    2.787633
       _cons |   93.42025   12.73947     7.33   0.000     68.10719    118.7333
------------------------------------------------------------------------------
```

unem was given as not significant (result contrary to that of the literature), then:
- There are variables omitted in the error
- They are correlated with unem
- So I can't estimate by OLS (biased), I'll use first difference estimator.

```
reg ccrmrte cunem
```
```
# ccrmrte e cunem são as primeiras diferenças das variáveis

      Source |       SS           df       MS      Number of obs   =        46
-------------+----------------------------------   F(1, 44)        =      6.38
       Model |  2566.43744         1  2566.43744   Prob > F        =    0.0152
    Residual |  17689.5497        44  402.035219   R-squared       =    0.1267
-------------+----------------------------------   Adj R-squared   =    0.1069
       Total |  20255.9871        45  450.133047   Root MSE        =    20.051

------------------------------------------------------------------------------
     ccrmrte | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
       cunem |   2.217999   .8778658     2.53   0.015     .4487771    3.987222
       _cons |    15.4022   4.702117     3.28   0.002      5.92571     24.8787
------------------------------------------------------------------------------
```
> Note: if it is necessary to calculate the first difference of a variable use the command: 

```
generate ccrmrte2 = D.crmrte
```

- We can clearly see that our model has become significant, as well as the unem variable.
- Interpretation _cons (intercept) -> Conditioned by the other explanatory variables equal to 0, the variation of the dependent variable is equal to 15.4 percentage points, that is, even with unemployment not varying, there is an increase in crime occurrences from 82 to 87 in 15.4 occurrences for each group of 1000 inhabitants.
- Interpretation unem -> When unemployment varies by one percentage point, the occurrence of crime increases (varies positively) by 2.2 occurrences for each group of 1000 inhabitants.

### 2nd Second Example
Jtrain.DTA (Monitoring of 54 companies for three years, showing the disposal rate of their products, in a scenario where there is a government subsidy for employee training).
- Download -> https://drive.google.com/uc?export=download&id=1OQDTCc2yjt5gKGr4XLva3_KCJx6kcB1M

Descrição das variáveis: 
- lscrap = taxa de descarte
- grant = subsídio para treinamento dummy para 89
- grant_1 = subsídio para treinamento dummy para 88
- fcode = é o código da empresa

```
reg lscrap d88 d89 grant grant_1
```
```
# Grouped OLS
      Source |       SS           df       MS      Number of obs   =       162
-------------+----------------------------------   F(4, 157)       =      0.69
       Model |  6.15830732         4  1.53957683   Prob > F        =    0.5989
    Residual |  349.586781       157   2.2266674   R-squared       =    0.0173
-------------+----------------------------------   Adj R-squared   =   -0.0077
       Total |  355.745089       161  2.20959682   Root MSE        =    1.4922

------------------------------------------------------------------------------
      lscrap | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         d88 |  -.2393704   .3108639    -0.77   0.442    -.8533854    .3746446
         d89 |  -.4965236   .3379281    -1.47   0.144    -1.163996    .1709483
       grant |   .2000197   .3382846     0.59   0.555    -.4681564    .8681958
     grant_1 |   .0489357   .4360663     0.11   0.911    -.8123778    .9102492
       _cons |   .5974341    .203063     2.94   0.004     .1963462    .9985219
------------------------------------------------------------------------------
```
> When running the model via Grouped OLS, the dummies grant and grant_1 are not significant. It can be concluded that there is something omitted in the error term that leads to a biased estimation via Grouped OLS. For example, we could say that there are differences between companies in the way discards are made, which leads to considering the presence of a fixed effect (FE) and obviously the use of the First Difference Estimator.

```
reg clscrap cgrant
```
```
      Source |       SS           df       MS      Number of obs   =       108
-------------+----------------------------------   F(1, 106)       =      0.21
       Model |  .072601835         1  .072601835   Prob > F        =    0.6440
    Residual |   35.828927       106  .338008745   R-squared       =    0.0020
-------------+----------------------------------   Adj R-squared   =   -0.0074
       Total |  35.9015288       107  .335528307   Root MSE        =    .58139

------------------------------------------------------------------------------
     clscrap | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
      cgrant |   -.039272    .084737    -0.46   0.644    -.2072713    .1287274
       _cons |  -.2174961   .0564913    -3.85   0.000    -.3294957   -.1054966
------------------------------------------------------------------------------
```

> In this case, since we have the fcode variable to indicate the number of each firm, we can run the estimator directly, without needing to calculate the first differences of each variable, as done in the previous example.

```
xtset fcode year
```
```
# Informing stata of the presence of a panel
Panel variable: fcode (strongly balanced)
 Time variable: year, 1987 to 1989
         Delta: 1 unit
```
- fcode (variável i)
- year (variável t)

```
# First Differences
xtreg D.(lscrap grant)
```
```

Random-effects GLS regression                   Number of obs     =        108
Group variable: fcode                           Number of groups  =         54

R-squared:                                      Obs per group:
     Within  = 0.0041                                         min =          2
     Between = 0.0011                                         avg =        2.0
     Overall = 0.0020                                         max =          2

                                                Wald chi2(1)      =       0.26
corr(u_i, X) = 0 (assumed)                      Prob > chi2       =     0.6100

------------------------------------------------------------------------------
    D.lscrap | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
       grant |
         D1. |  -.0378244   .0741476    -0.51   0.610    -.1831511    .1075022
             |
       _cons |  -.2176301    .063343    -3.44   0.001    -.3417801   -.0934802
-------------+----------------------------------------------------------------
     sigma_u |  .30038384
     sigma_e |  .50179022
         rho |  .26381331   (fraction of variance due to u_i)
------------------------------------------------------------------------------
```

> It can be seen that the First Differences estimator did not return statistically significant results for the explanatory variables. However, this does not mean that there is no Fixed Effect, only that it may not be the appropriate estimator, so another alternative for this case is the Fixed Effect Estimator (FE).

### Fixed Effect Estimator
> As we have seen, a fixed effect is something that explains Yit, being specific to i, but does not vary over the observed time horizon, that is, it controls all factors that are constant over time, but that vary between units. Therefore, if we do in fact have a fixed effect, it is expected that the average value of the constant i is exactly equal to the constant, that is, the average of ai over time is equal to ai itself. This assumption allows us to perform an intra-group transformation (within), where instead of taking the difference between two periods, we take the difference of the period in relation to its average. Mathematically speaking:

$Yit = (\beta0 + \delta0) + \beta1Xit + Vit$ (ai + uit)$

$Yit = (\beta0 + \delta0) + \beta1Xit + Vit$ (ai + \bar{uit})$

$(Yit - \bar{Yi}) = \delta0 + \beta1(Xit - \bar{Xi}) + (uit - \bar{uit})$

$\ddot{Yit} = \delta0 + \beta1\ddot{Xit} + \ddot{uit}$ -> I apply Grouped OLS (It will no longer be biased)

> After this intra-group transformation, there would be an equation where the Grouped OLS estimator would no longer be biased, allowing the model to be estimated. But what is the difference between the models?

#### PD vs. FE Comparison
- Both methods control for variables that are constant over time, but the fixed effects estimator does so explicitly, while the first-difference method does so implicitly.
- The first-difference method loses a period of data due to differencing, while the fixed effects estimator does not.
- In the fixed effects method, variables that do not vary over time cannot be included in the model, while in the first-difference method these variables are automatically eliminated, which reduces the degrees of freedom, increasing multicollinearity.
- Studies show that in up to t-2 periods the results of the estimators are identical, but FE has an advantage over first-differences in unbalanced panels.
  
```
xtset fcode year
```
```
xtreg lscrap d88 d89 grant grant_1, fe
```
```
Fixed-effects (within) regression               Number of obs     =        162
Group variable: fcode                           Number of groups  =         54

R-squared:                                      Obs per group:
     Within  = 0.2010                                         min =          3
     Between = 0.0079                                         avg =        3.0
     Overall = 0.0068                                         max =          3

                                                F(4, 104)         =       6.54
corr(u_i, Xb) = -0.0714                         Prob > F          =     0.0001

------------------------------------------------------------------------------
      lscrap | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         d88 |  -.0802157   .1094751    -0.73   0.465     -.297309    .1368776
         d89 |  -.2472028   .1332183    -1.86   0.066    -.5113797    .0169741
       grant |  -.2523149    .150629    -1.68   0.097    -.5510178    .0463881
     grant_1 |  -.4215895      .2102    -2.01   0.047    -.8384239   -.0047551
       _cons |   .5974341   .0677344     8.82   0.000     .4631142    .7317539
-------------+----------------------------------------------------------------
     sigma_u |   1.438982
     sigma_e |  .49774421
         rho |  .89313867   (fraction of variance due to u_i)
------------------------------------------------------------------------------
F test that all u_i=0: F(53, 104) = 24.66                    Prob > F = 0.0000
```

- Our model is significant from a global point of view (Prob > F = 0.0001)
- Controlled by other factors, the disposal rates of 88 are not statistically different from those in 89
- The disposal rates of 88, controlled by other factors, are lower than in 89
- Subsidies, controlled by other factors, reduce the disposal rate
- Controlled by other factors, subsidies reduce the disposal rates

### LSDV (Least Squares Dummy Variable)
> The Fixed Effect Estimator can be described in another way, called LSDV (Least Squares Dummy Variable), this method consists of including a dummy or intercept for each i, thus explicitly showing the said effect of each i. This methodology has the advantage of enabling the analysis of individual fixed effects; however, the excess of dummies reduces the degrees of freedom (reducing the number of observations), which can lead to less precise estimates since the variability is divided among more parameters. Therefore, it is recommended to use this model only when seeking to know the individual fixed effect of each i.

```
tabulate fcode, generate(dum)
```

```
  firm code |
     number |      Freq.     Percent        Cum.
------------+-----------------------------------
     410032 |          3        0.64        0.64
     410440 |          3        0.64        1.27
     410495 |          3        0.64        1.91
     410500 |          3        0.64        2.55
     410501 |          3        0.64        3.18
     410509 |          3        0.64        3.82
     410513 |          3        0.64        4.46
     410517 |          3        0.64        5.10
     410518 |          3        0.64        5.73
     410521 |          3        0.64        6.37
     410523 |          3        0.64        7.01
     410529 |          3        0.64        7.64
     410531 |          3        0.64        8.28
     410533 |          3        0.64        8.92
     410535 |          3        0.64        9.55
     410536 |          3        0.64       10.19
     410538 |          3        0.64       10.83
     410540 |          3        0.64       11.46
     410544 |          3        0.64       12.10
     410546 |          3        0.64       12.74
     410547 |          3        0.64       13.38
     410556 |          3        0.64       14.01
     410560 |          3        0.64       14.65
     410561 |          3        0.64       15.29
     410562 |          3        0.64       15.92
     410563 |          3        0.64       16.56
     410564 |          3        0.64       17.20
     410565 |          3        0.64       17.83
     410566 |          3        0.64       18.47
     410567 |          3        0.64       19.11
     410569 |          3        0.64       19.75
     410571 |          3        0.64       20.38
     410577 |          3        0.64       21.02
     410586 |          3        0.64       21.66
     410591 |          3        0.64       22.29
     410592 |          3        0.64       22.93
     410593 |          3        0.64       23.57
     410596 |          3        0.64       24.20
     410603 |          3        0.64       24.84
     410604 |          3        0.64       25.48
     410606 |          3        0.64       26.11
     410609 |          3        0.64       26.75
     410612 |          3        0.64       27.39
     410626 |          3        0.64       28.03
     410627 |          3        0.64       28.66
     410629 |          3        0.64       29.30
     410635 |          3        0.64       29.94
     410636 |          3        0.64       30.57
     410639 |          3        0.64       31.21
     410640 |          3        0.64       31.85
     410641 |          3        0.64       32.48
     410642 |          3        0.64       33.12
     410649 |          3        0.64       33.76
     410653 |          3        0.64       34.39
     410665 |          3        0.64       35.03
     410679 |          3        0.64       35.67
     410680 |          3        0.64       36.31
     410685 |          3        0.64       36.94
     410686 |          3        0.64       37.58
     418006 |          3        0.64       38.22
     418007 |          3        0.64       38.85
     418008 |          3        0.64       39.49
     418011 |          3        0.64       40.13
     418013 |          3        0.64       40.76
     418014 |          3        0.64       41.40
     418021 |          3        0.64       42.04
     418024 |          3        0.64       42.68
     418035 |          3        0.64       43.31
     418036 |          3        0.64       43.95
     418045 |          3        0.64       44.59
     418046 |          3        0.64       45.22
     418051 |          3        0.64       45.86
     418052 |          3        0.64       46.50
     418054 |          3        0.64       47.13
     418065 |          3        0.64       47.77
     418066 |          3        0.64       48.41
     418076 |          3        0.64       49.04
     418083 |          3        0.64       49.68
     418084 |          3        0.64       50.32
     418091 |          3        0.64       50.96
     418097 |          3        0.64       51.59
     418098 |          3        0.64       52.23
     418107 |          3        0.64       52.87
     418109 |          3        0.64       53.50
     418118 |          3        0.64       54.14
     418124 |          3        0.64       54.78
     418125 |          3        0.64       55.41
     418126 |          3        0.64       56.05
     418140 |          3        0.64       56.69
     418147 |          3        0.64       57.32
     418163 |          3        0.64       57.96
     418168 |          3        0.64       58.60
     418177 |          3        0.64       59.24
     418183 |          3        0.64       59.87
     418185 |          3        0.64       60.51
     418213 |          3        0.64       61.15
     418220 |          3        0.64       61.78
     418225 |          3        0.64       62.42
     418229 |          3        0.64       63.06
     418237 |          3        0.64       63.69
     418239 |          3        0.64       64.33
     418243 |          3        0.64       64.97
     418245 |          3        0.64       65.61
     419198 |          3        0.64       66.24
     419201 |          3        0.64       66.88
     419242 |          3        0.64       67.52
     419268 |          3        0.64       68.15
     419272 |          3        0.64       68.79
     419275 |          3        0.64       69.43
     419276 |          3        0.64       70.06
     419289 |          3        0.64       70.70
     419297 |          3        0.64       71.34
     419298 |          3        0.64       71.97
     419302 |          3        0.64       72.61
     419303 |          3        0.64       73.25
     419305 |          3        0.64       73.89
     419307 |          3        0.64       74.52
     419309 |          3        0.64       75.16
     419312 |          3        0.64       75.80
     419319 |          3        0.64       76.43
     419328 |          3        0.64       77.07
     419335 |          3        0.64       77.71
     419339 |          3        0.64       78.34
     419343 |          3        0.64       78.98
     419344 |          3        0.64       79.62
     419347 |          3        0.64       80.25
     419351 |          3        0.64       80.89
     419357 |          3        0.64       81.53
     419375 |          3        0.64       82.17
     419376 |          3        0.64       82.80
     419378 |          3        0.64       83.44
     419379 |          3        0.64       84.08
     419380 |          3        0.64       84.71
     419381 |          3        0.64       85.35
     419384 |          3        0.64       85.99
     419388 |          3        0.64       86.62
     419392 |          3        0.64       87.26
     419400 |          3        0.64       87.90
     419401 |          3        0.64       88.54
     419406 |          3        0.64       89.17
     419409 |          3        0.64       89.81
     419410 |          3        0.64       90.45
     419420 |          3        0.64       91.08
     419432 |          3        0.64       91.72
     419433 |          3        0.64       92.36
     419434 |          3        0.64       92.99
     419449 |          3        0.64       93.63
     419450 |          3        0.64       94.27
     419459 |          3        0.64       94.90
     419461 |          3        0.64       95.54
     419467 |          3        0.64       96.18
     419472 |          3        0.64       96.82
     419473 |          3        0.64       97.45
     419479 |          3        0.64       98.09
     419482 |          3        0.64       98.73
     419483 |          3        0.64       99.36
     419486 |          3        0.64      100.00
------------+-----------------------------------
      Total |        471      100.00
```

```
xtreg lscrap d88 d89 grant grant_1 dum*
```

```
Random-effects GLS regression                   Number of obs     =        162
Group variable: fcode                           Number of groups  =         54

R-squared:                                      Obs per group:
     Within  = 0.2010                                         min =          3
     Between = 1.0000                                         avg =        3.0
     Overall = 0.9276                                         max =          3

                                                Wald chi2(57)     =    1331.91
corr(u_i, X) = 0 (assumed)                      Prob > chi2       =     0.0000

------------------------------------------------------------------------------
      lscrap | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
         d88 |  -.0802157   .1094751    -0.73   0.464     -.294783    .1343516
         d89 |  -.2472028   .1332183    -1.86   0.064    -.5083058    .0139003
       grant |  -.2523149    .150629    -1.68   0.094    -.5475423    .0429125
     grant_1 |  -.4215895      .2102    -2.01   0.045    -.8335739   -.0096051
        dum1 |          0  (omitted)
        dum2 |          0  (omitted)
        dum3 |          0  (omitted)
        dum4 |          0  (omitted)
        dum5 |          0  (omitted)
        dum6 |          0  (omitted)
        dum7 |          0  (omitted)
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



