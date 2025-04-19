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


