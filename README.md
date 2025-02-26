# Panel Data

![descreva uma imagem sobre dados em painel Stata 03-02-2025 at 01-32-46](https://github.com/user-attachments/assets/d854eb66-c062-4af5-9ac6-f4e9a767e89d)

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

#### 1º First Example

Load Base -> FERTIL1.DTA (number of children per woman between 1974 and 1984)

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

#### 2º Second Example

Load base -> CPS78_85.DTA (Value of salaries of 1978 and 1985)

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

### Difference-in-Differences (DID) Estimator
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
  
#### 3rd Third Example
Load Base -> KIELMC.DTA (Effect of installing a garbage incinerator on real estate prices in a region of Massachusetts)

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

#### 4º Quarto Exemplo
Carregar Base -> INJURY.DTA (Em julho de 1980 havia um limite para recebimento de auxilio compensação por acidente de trabalho em relação a renda dos indivíduos, sendo que indivíudos com renda superior ao limite não recebiam compensação. Após julho de 82, esse limite foi elevado)

```
reg ldurat afchnge highearn afhigh
```
Descrição das variáveis: 
- afchnge = dummy pós período (1 = indivíduos afastados pós novo legislação e 0 = caso contrário)
- highearn = dummy de tratamento (1 = Individuos com renda acima do limite da legislação antiga e 0 = caso contrário)
- afhigh = dummy de interação

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

- afchnge = é não significativa e positiva, controlado pelos outros fatores, pós nova legislação não há mudança na duração do afastamento para os indivíduos de renda baixa, porque os afetados são apenas os indivíduos de renda alta. 
- afhigh = é significativa e positiva, controlado pelos outros fatores, após a mudança da legislação, os indivíduos que tinham renda mais alta (não eram contemplados pela compensação) passaram à se afastar um período muito maior, cerca de 18% no tempo de duração de afastamento.

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

## Painel Verdadeiro 
> Até então todos os exemplos se tratavam de agrupamentos de cortes transversais e para esses tipos de datasets MQO Agrupado não é viesado, entretanto quando se tem um painel verdadeiro, todos os "is" serão iguais para todos os períodos, com isso se uma das das variáveis controles tiver alguma relação com as variáveis explicativas do modelo, haverá a presença de endogeneidade, ou seja, COV (Xn,e) ≠ 0. Desta forma a estimação via MQO Agrupado será viesada, sendo assim utiliza-se outra equação geral, consideando o chamado termo de erro composto. 

#### Equação Geral 
$Yit = \beta0 + + \beta1Xit + \beta2Xit + Vit$

$Vit = ai + uit$

- Vit = termo de erro composto
- ai = efeito fixo ou heteogeneidade não observada (aquilo que não varia no tempo)
- uit = erro endossincrático (aquilo que varia no tempo)

> Efeito fixo é algo que explica Yit, sendo específico de i, todavia não varia no horizonte de tempo observado. Como o estimador MQO Agrupado é viesado, passa-se a utilizar outro estimador, o Estimador de Primeiras Diferenças (PD).

### Estimador de Primeiras Diferenças (PD)
> O Estimado de Primeiras Diferenças transforma a equação original subtraindo os valores da variável dependente e das variáveis explicativas, ou seja, pega-se todos os cortes transversais de todas as observações i durante o tempo e substrai  em relação a um período anterior , removendo qualquer efeito fixo que seja constante em t. Matemáticamente falando:

$Yi1 = (\beta0 + \delta0) + \beta1Xi1 + Vit$ (ai + uit)$

$Yi2 = (\beta0 + \delta0) + \beta1Xi1 + Vit$ (ai + uit)$

$(Yi2 - Yi1) = \delta0 + \beta1(Xi2 - Xi1) + (ui2 - ui1)$

$∆Yi = \delta0 + \beta1∆Xi + ∆ui$

#### 1º Primeiro Exemplo 
Carregar Base -> CRIME2.DTA (Taxas de criminalidade para os munícipios americanos em 82 e 87). 

```r
tab year
```
![Captura de tela 2024-07-03 233018](https://github.com/HenrySchall/Panel-Data/assets/96027335/c7b2aaac-fa78-45b5-a800-019fec40e083)

- crmrte = taxa de crime
- unem = desemprego
- observa-se que temos os mesmos números de observações para os anos 82 e 87, então temos um painel verdadeiro

Equação do Modelo: $ccrmrte = \beta0 +\delta0D87 + \beta1cunem + eit$

```R
reg crmrte d87 unem
```
![2](https://github.com/HenrySchall/Panel-Data/assets/96027335/dac9953a-e4c2-4d80-9e92-4e2a41d81c7a)

unem foi dada como não significativa (resultado contrário ao da literatura), então: 
- há variáveis omitidas no erro
- elas são correlacionadas com unem

Então não posso estimar por MQO (viesado), vou usar estimador de primeiras diferenças.

```R
# ccrmrte e cunem são as primeiras diferenças das variáveis
reg ccrmrte cunem
```

![3](https://github.com/HenrySchall/Panel-Data/assets/96027335/418e4c95-d013-46b5-8c32-6a21295c567c)

- Vemos claramente que nosso modelo passou a ser significativo, assim como a variável unem.
- Interpretação _cons (intercepto) -> Condicionado pelas outras variavies explicativas iguais a 0, a variação da variável dependente é igual a 15.4 pontos perceutais, ou seja, mesmo com o desemprego não variando, ocorre um aumento nas ocorrências de crimininalidade de 82 para 87 em 15.4 ocorrências para cada grupo de 1000 habitantes.
- Interpretação unem -> Quando o desemprego varia em um ponto percentual, a ocorrência de criminalidade aumenta (varia positivamente) em 2.2 ocorrências para cada grupo de 1000 habitantes.

#### 2º Segundo Exemplo 
Carregar Base -> Jtrain.DTA (Acompanhamento de 54 empresas durante três anos, mostrando a taxa de descarte dos seus produtos, num cenário onde há subsídio governamental para treinamento de funcionários). 

Descrição das variáveis: 
- lscrap = taxa de descarte
- grant = subsídio para treinamento dummy para 89
- grant_1 = subsídio para treinamento dummy para 88
- fcode = é o código da empresa

```r
# MQO Agrupado
reg lscrap d88 d89 grant grant_1
```
![1](https://github.com/HenrySchall/Panel-Data/assets/96027335/38738c66-939f-4c2c-8270-12f809667b92)

> Ao rodar modelo via MQO Agrupado, as dummies grant e grant_1 são não significativas. Conclui-se que existe alguma coisa omitida no termo de erro que leva a uma estimação viesada via MQO Agrupado. Por exemplo, poderiamos dizer que existe diferenças entre as empresas, na forma como os descartes são feitos, isso leva a considerar a presença de um efeito fixo (FE) e obviamente a utilização do Estimador de Primeiras Diferenças.

```r
reg clscrap cgrant
```
![imag](https://github.com/HenrySchall/Panel-Data/assets/96027335/2cc76fac-b68d-4fd8-b7f0-e727f264a28f)

> Nesse caso como temos a variável fcode para indicar o número de cada firma, podemos rodar o estimador diretamente, sem precisar calcular as primeiras diferenças de cada variável, como feito no exemplo anterior

```r
# informando para o stata a presença de um painel
xtset fcode year
```
- fcode (variável i)
- year (variável t)

```r
# Primeiras Diferenças
xtreg D.(lscrap grant)
```
![imag2](https://github.com/HenrySchall/Panel-Data/assets/96027335/b190a1f5-8764-453b-950c-3bd3feddc394)

> Observa-se que o estimador de Primeiras Diferenças não retornou resultados estatísticamente significativos para as variáveis explicativas. Mas isso não significa que não temos a presença de Efeito Fixo, apenas que ele poder não ser o estimador adqueado, por isso outra alternativa para esse caso é o Estimador de Efeito Fixo (FE).

### Estimador de Efeito Fixo
> Como vimos Efeito fixo é algo que explica Yit, sendo específico de i, todavia não varia no horizonte de tempo observado, ou seja, ele controla todos os fatores que são constantes ao longo do tempo, mas que variam entre as unidades. Sendo assim, se de fato temos um efeito fixo é esperado que o valor médio da constante i seja exatamente igual a constante, ou seja, a média de ai no tempo é igual ao próprio ai. Essa suposição, permite realizar uma transformação intra-grupo (within), onde em vez de se tomar a diferença entre dois períodos, tira-se a diferença do período em realação a sua média. Matematicamente falando:

$Yit = (\beta0 + \delta0) + \beta1Xit + Vit$ (ai + uit)$

$Yit = (\beta0 + \delta0) + \beta1Xit + Vit$ (ai + \bar{uit})$

$(Yit - \bar{Yi}) = \delta0 + \beta1(Xit - \bar{Xi}) + (uit - \bar{uit})$

$\ddot{Yit} = \delta0 + \beta1\ddot{Xit} + \ddot{uit}$ -> Aplico MQO Agrupado (Não será mais viesado)

> Após essa transformação intra-grupo, teria-se um equação onde o estimador MQO Agrupado não seria mais viesado, permitindo a estimação do modelo. Mas qual a diferença entre os modelos?

#### Comparação PD x FE
- Ambos os métodos controlam para variáveis que são constantes ao longo do tempo, mas o estimador de efeitos fixos faz isso explicitamente, enquanto o método de primeiras diferenças faz isso implicitamente.
- O método de primeiras diferenças perde um período de dados devido à diferenciação, enquanto o estimador de efeitos fixos não.
- No método de efeitos fixos, variáveis que não variam ao longo do tempo não podem ser incluídas no modelo, enquanto no método de primeiras diferenças essas variáveis são eliminadas automaticamente, o que diminui os graus de liberdade, aumentando a multicolinealidade.
- Estudos mostram que em atpe t-2 período os resultados dos estimadores são idênticos, mas FE tem vantagem em relação a primeiras diferencas em paineis não balanceados.

```r
xtset fcode year
```

```R
xtreg lscrap d88 d89 grant grant_1, fe
```
![3](https://github.com/HenrySchall/Panel-Data/assets/96027335/7bc851ba-ec29-471e-a8e3-0fa3050ab947)

- Nosso modelo é significativo do ponto de vista global (Prob > F = 0.0001)
- Controlado por outos fatores as taxas de descarte de 88 não são diferentes de em 89 estatiscamente falando
- As taxas de descarte de 88, controlado por outros fatores, são menores do que em 89
- Subsídios, controlado por outros fatores, reduz a taxa de descarte
- Controladas por outros fatores, os subsidios diminuem as taxas de descarte

### LSDV (Least Squares Dummy Variable)
> O Estimador de Efeito Fixo pode ser descrito de outra forma, chamada de LSDV (Least Squares Dummy Variable), esse método consiste em incluir uma dummy ou intercepto para cada i, com isso mostra-se explicitasmente o efeito dixo de cada i. Essa metodológia possui a vantagem de possbilitar a análise do efeito fixo individual, todavia o excesso de dummies reduz os graus de liberade (diminuindo o número de observações), que podem levar a estimativas menos precisas já dividinde-se a variabilidade entre mais parâmetros. Sendo assim recomenda-se o uso desse modelo apenas quando procura-se saber o efeito fixo individual de cada i;

```R
tabulate fcode, generate(dum)
```

```R
xtreg lscrap d88 d89 grant grant_1 dum*
```

Observaçóes: 
- Paineis desbalanceados são aqueles que apresentam algum tipo de atrito nos seus dados (falta de informação em algum período), nesse caso se as variáveis explicativas estiverem correlacionadas com o termo de erro endossicrático teremos o problema de seleção amostral (solução: Estimador de Heckman).
- Demonstrando como calcular a primeira diferença de uma variável:

``` r
generate ccrmrte2 = D.crmrte
```

### Estimador de Efeitos Aleatório (RE)
> O Estimador de Efeitos Aleatório presume que as diferenças individuais são capturadas por um termo de erro específico de cada unidade, ou seja, há a presença do ai, ele é aleatório e não correlacionado com as variáveis explicativas, com isso o estimador MQO Agrupado não será viesado. Ele até pode não ser viesado (é consistente), mas ele não será eficiente, porque haverá autocorrelação serial no termo de erro composto, ou sejam o erro de um período será levado para o outro, já que o ai não é eliminado. A solução para esse problema é a realização de uma transformação de Mínimos Quadrados Generalizados (GLS), em outras palavras, uma transformação "quase na média", isso ocorre porque conhece-se a COR (Vit, Vit-1) e essa correlação está associada a variância do termo de erro endossincrático e à variância de ai. Sendo assim pode-se ponderar os Xs e o Y, pela estrutura de mudança da variância doas erros, dependendo de X, esse seria todo o processo de obtenção do estimador de Efeito Aleatório (RE). Matemáticamente falando:

![Captura de tela 2024-07-05 154904](https://github.com/HenrySchall/Panel-Data/assets/96027335/2b24bc4e-cdf2-47d5-865f-4f96593df8c5)

- λ -> É a ponderação da estrutura de correlação serial, devido aos efeitos fixos presentes em MQO. Essa é a transformação "quase nada média", poderada por λ (estima-se o λ), em vez da transforma dentro do grupo, para cada Y e cada X de it em relação à média de i.

#### Casos: 
- λ = 1 -> Quando $𝜎^2$ tem uma variância muito alta, sginifica que existe uma diferença muito grande entre os ai's (variância de ai será muito grande), então o efeito fixo é relevante. 
- λ = 0 -> A variãncia de ai é muito pequeuna, então não há efieto fixo, que diferência as unidades de análise.

Sendo assim, podemos concluir que:
- Quanto mais próximo de λ = 0, MQO é o estimador preferível
- Quanto mais próximo de λ = 1, FE é o estimador preferível
- Quanto mais próximo de λ = 0,5 (da média), RE é o estimador preferível

  O estimador de GLS, no contexto de efeitos aleatoris é uma stiuação intermediária.
    
#### Exemplo 
Carregar Base -> WAGEPAN.DTA"

Legenda de variáveis:
- ui -> ai
- eit -> uit
- sigma_u -> desvio padrão do efeito fixo (ai)
- sigma_e -> desvio padrão do componente endiossincráico (uit)
- rho -> correlação intraclasse do erro v (composto) ou devido ao ai.
- r2_o -> quadrado do coeficiente de correlação entre valores observados e ajustados (ignorando ai) para variabilidade nas duas dimensões.
- r2_b -> quadrado do coeficiente de correlação entre valores observados e ajustados (ignorando ai) para variabilidade entre grupos.
- r2_w -> quadrado do coeficiente de correlação entre valores observados e ajustados (ignorando ai) para variabilidade intra grupos.
- theta -> lambda

```R
# MQO
reg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, vce(cluster nr)
# vce(cluster nr) -> controle de heterocedasticidade
```
![imagg1](https://github.com/HenrySchall/Panel-Data/assets/96027335/c2694844-9211-4fae-8741-3e02db132ba7)

```r
iis nr
```

```r
tis year
```

```r
# Efeito Fixo (FE)
xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87,fe vce(cluster nr)
```

![imagg2](https://github.com/HenrySchall/Panel-Data/assets/96027335/07ee40f2-59ae-4d23-9b44-850ab7ae844c)

```R
# Efeito Aleatório (RE)
xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87,re vce(cluster nr) theta
```
![imagg3](https://github.com/HenrySchall/Panel-Data/assets/96027335/8afe11f1-09c0-4fa9-a49c-79a1982770de)


##### Gerar Tabela Comparativa 
```R
# MQO
# quietly é para não apresentar os resultados
quietly regress lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, vce(cluster nr)
```

```r 
estimates store OLS
```

```R
# Efeito Fixo (FE)
quietly xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, fe vce(cluster nr)
```

```r
estimates store FE
```

```R
# Efeito Aleatório (RE)
quietly xtreg lwage black hisp exper expersq union educ married d81 d82 d83 d84 d85 d86 d87, re vce(cluster nr)
```

```r
estimates store RE
```

```R
# Gerar Tabela Conjunta
estimates table OLS FE RE, b se t stats(N r2 r2_o r2_b r2_w sigma_u sigma_e rho theta)
```

**A questão é, qual é o modelo adequado a ser usada, dado nossa base de dados? Na literatura, sugere-se o uso de testes estatísticos para determinar o melhor modelo, seguindo a ordem proposta abaixo:**

#### Teste Breusch and Pagan Lagrangian multiplier test for random effects

- Hipótese nula (H0): var(ai) = 0
- Hipótese alternativa (H1): var(ai) ≠ 0
- A rejeição da hipótese nula indica que MQO agrupado não é o modelo apropriado, pois a estrutura de variabilidade dos erros compostos é sigma2. RE é escolha entre eles

```R
xtreg lwage exper expersq union married, re vce(cluster nr) theta
```

```R
xttest0
```
![di1](https://github.com/HenrySchall/Panel-Data/assets/96027335/03c94b56-7c55-4209-a21b-5cdc54e984a2)

- prob > chibar2 = 0 -> rejeita H0, então a variância de ui é diferente de zero, melhor especificação não é MQO Agrupado. **Então RE é preferida a MQO Agrupado**

#### Teste de Chow ou Teste F (Teste de igualdade de interceptos e inclinações do POLS).

> Ele estima uma equação auxiliar, em que se analisa o efeito de um variável explicativa, influenciando a variável dependente, de modo diferente para cada indivíduo, ou seja, é como se eu cria-se uma dummy para cada indivíduo e multiplicasse pela variável explicativa selecionada e ao realizar um teste de hipótese em conjunto (teste de Chow), se os parâmetros forem em conjunto estatisticamente significativos, não há igualdade entre os interceptos, então há efeitos específicos para cada indivíduo.

- Hipótese nula (H0): Há igualdade de interceptos e inclinações para todos os "is"
- Hipótese alternativa (H1): Não há igualdade de interceptos e inclinações para todos os "is"

> A rejeição da hipótese nula indica que os parâmetros são diferentes entre indivíduos, desta forma FE é preferível à MQO Agrupado.

```R
xtreg lwage exper expersq union married, fe
```
![di2](https://github.com/HenrySchall/Panel-Data/assets/96027335/dde40069-11c5-4b84-81f3-df02f0d8766a)

- p-valor > F = 0 -> rejeito H0, então Não há igualdade de interceptos e inclinações para todos os "is". **Então FE é preferida a MQO Agrupado**
- OBS: Note que há dois p-valor > F um em cima e outro em baixo, o primeiro é a significância global do modelo e o segundo o Teste de Chow.

**Primeiro teste sugeriu RE o segundo FE, nos dois casos a solução de agrupadamento foi descartada. Então qual devo escolher FE ou RE?**

#### Teste de Hausman

> Ele é usado para comparar modelos, para verificar se há diferença sistemática nos parâmentros estimados entre os modelos, com o o bjetivo deselecionar o modelo mais parcimonioso.

- Hipótese nula (H0): Diferença nos coeficientes não é sistemática -> EA é consistente (heterogeneidade aleatória)
- Hipótese alternativa (H1): Diferença nos coeficientes é sistemática -> EA não é consistente (homogeneidade aleatória)

> A rejeição da hipótese nula indica que FE é melhor que RE

```R
# Etapa 1 -> Estimar com o Efeito Fixo
xtreg lwage exper expersq union married, fe 
```

```R
estimates store FE
```

```R
# Etapa 2 -> Estimar com o Efeito Aleatório
xtreg lwage exper expersq union married, re
```
```R
# Rodando Teste
hausman FE
```
![di3](https://github.com/HenrySchall/Panel-Data/assets/96027335/db9b16e3-a18a-427e-b540-94ef25d8773d)


