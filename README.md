# Panel Data
![Img](https://github.com/user-attachments/assets/65207a8e-e7e9-4cea-aa88-bad29c1651b9)

> Panel data estimation is the analysis of data that have a two-factor structure, i.e., we have one factor that represents different units (such as individuals, companies, countries, etc.) and another that represents different time periods. This repository demonstrates the process of estimating the panel data model.

### General Characteristics
- Heterogeneity of units: Each unit (individual, company, country, etc.) may have its own characteristics that do not vary over time.
- Temporal variability: Variables may change over time for each unit.
- Longitudinal structure: The presence of multiple observations for each unit allows the analysis of both variability within and between units.

> We can say that Panel Data is subdivided into two types: True Panel and Cross-Section Clustering. When we have a True Panel, the same unit of analysis is used over time (all the "i"s are the same), that is, in a survey, for example, the data will be about the same individuals over time. In a Cross-Section Clustering, the "i"s will not be the same between periods, that is, in a survey the data will not be about the same individuals.

### Panel Data Models
1) Pooled Cross Section
2) Panel Data
   - Fixed Effects Model (FE)
   - Random Effects Model (RE)
   - Dynamic Effects Model (GMM)

### General Equation
$Yit = \beta0 + + \beta1Xit + \beta2Xit + eit$

- i = specific units
- t = time

### Repository Bibliographic References:
- Econometric Analysis of Cross Section and Panel Data, Second Edition, by Jeffrey M. Wooldridge
https://www.youtube.com/watch?v=fv5HLjmtkGU
https://core.ac.uk/download/pdf/6379375.pdf
