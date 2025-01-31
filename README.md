# Panel Data
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

```r
# Creating variable suggested by the author
gen age2=age^2
```
> The first step is to identify whether we have a True Panel or a Pooled Cross Section, for this we need to find out how many observations we have in each period.

```r
sort year
```
```r
#kids dependent variable
by year: tab kids
```

> Taking the years 72 and 74 as an example, we can see that in the year 72, we obtained 156 interviews and in the year 74 we obtained 173 interviewees, showing that the data is not the same for each period, so we have a Pooled Cross Section.

```r
# Regression by Grouped OLS
reg kids educ age age2 black east northcen west farm othrural town smcity y74 y76 y78 y80 y82 y84
```
![Captura de tela 2025-01-31 004918](https://github.com/user-attachments/assets/8dd033e8-d737-4d90-8be3-1c1f93b36de2)

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

```r
sum
```
![Captura de tela 2025-01-31 004210](https://github.com/user-attachments/assets/9180194b-1906-4823-b3e8-301ab0bb09e8)

```r
tab year
```
![Captura de tela 2025-01-31 004227](https://github.com/user-attachments/assets/6686be41-e9d4-434e-8893-a7ed823ac6b1)

```
reg lwage educ exper expersq union female
```
![Captura de tela 2025-01-31 004242](https://github.com/user-attachments/assets/a8b78595-8231-4f53-ad23-bfb0edabcd94)

- Our model is significant because we have Prob > F = 0.0000 and all variables are statistically significant (P>|t| = 0.000).
- Taking the variable educ as an example, we can say that an increase of 1 year of education, controlled by the other factors, leads to a salary increase of approximately 8.84%.
- Taking the variable female as an example, we can say that the fact of being a woman, controlled by the other factors, leads to a salary decrease of approximately 25.08%.

> However, what is the real effect on salaries between 1978 and 1985, taking into account the factors education and being a woman. Was there an increase or decrease in salary from 1978 in relation to 1985? In the previous example, we performed the difference between the dummies y82 and y84, to find this real effect, however an alternative would be to use the Difference-in-Differences Estimator (DID).

### Difference-in-Differences (DID) Estimator
> This is an alternative to the Pooled OLS Estimator. It is used when we want to capture the effect before and after an event, that is, of a specific change in the data. Its logic is similar to pharmaceutical tests, where a sample population is selected, in which part of this population receives a treatment (treatment group) of a certain natural process, while the other part of this population does not receive the treatment (control group). Given by the following equation:

$Yit = \beta0 +\delta0D + \beta1DT + \delta1 D * DT + eit$

Onde:

$\delta0D$ = Dummy pós-evento 
- 0 = period observed prior to the event
- 1 = period observed after the event

$\beta1DT$ = Dummy de Tratamento
- 0 = did not receive treatment
- 1 = received the treatment

$\delta1 D * DT$ = Interaction Dummy (difference between receiving and not receiving the treatment = DID)

Descrição das variáveis: 
- y85 -> post-event dummy
- female e educ -> treatment dummy
- y85educ e y85fem -> interaction dummy

```r
reg lwage y85 female exper expersq y85fem
```
![Captura de tela 2025-01-31 010313](https://github.com/user-attachments/assets/1c1b78b9-7198-4902-9b04-baee485fb123)

```r
reg lwage y85 educ exper expersq y85educ
```
![2](https://github.com/user-attachments/assets/8f1720c8-10d6-41e4-bf58-35b1e1ba156c)

```r
# Podemos analisar os dois efeitos em conjunto, diminuindo possível multicolinealidade e aumentando os graus de liberade do modelo
reg lwage y85 educ y85educ exper expersq union female y85fem
```
![3](https://github.com/user-attachments/assets/9413607c-1f57-4947-98a2-0ae9facc72b9)

- A dummy de y85 não é significativa, ou seja, controlado pelos outros fatores os salários de y78 e y85 são estatisticamente iguais.

- Analisando à variável educ e y85educ. Temos que o aumento de 1 ano de estudo em y78, aumenta os salários em 7,47%, controlado pelos outros fatores. Além disso, no ano de y85 esse efeito é 1,85% maior (7,47% - 8,50% = 1,85%), ou seja, aumento do efeito de um ano para o outro)

- Analisando à variável female e y85fem. Temos que diferença salarial em y78, é de -31,67%, controlado pelos outros fatores. Além disso, no ano de y85 esse efeito é 8,50% menor (31,67% - 8,50% = -23,17%), ou seja, diminuição do efeito de um ano para o outro).

#### 3º Terceiro Exemplo 

Carregar Base -> KIELMC.DTA (Efeito da instalação de um incinerador de lixo no preço dos imóveis em uma região de Massachusetts)

```r
tab year
```
![1](https://github.com/HenrySchall/Panel-Data/assets/96027335/565abfdf-50d8-4dac-987b-ee32c129b375)

> Observa-se que não tenho um painel de dados verdadeiro

```r
sum
```
![2](https://github.com/HenrySchall/Panel-Data/assets/96027335/9f5fdf1a-8e46-4bb9-a8e1-7d8e842ce0d2)

```r
#nearinc = dummy de localização
reg rprice nearinc if year==1981
```
![3](https://github.com/HenrySchall/Panel-Data/assets/96027335/f849407f-049c-43fe-a715-552934949a35)

> Nosso modelo será significativo do ponto de vista global e a nossa variável nearinc é significativa e negativa, ou seja, em 81, os imóveis que estão localizados próximos do centro de tratamento de lixo possuem preços menores, em média US$30.688, que os imóveis afastados do centro de tratamento de lixo. Todavia será que essa diferença é causada pelo centro de tratamento de lixo?

```r
reg rprice nearinc if year==1978
```
![4](https://github.com/HenrySchall/Panel-Data/assets/96027335/98e48306-ea46-4b58-9ac7-10200695c592)

- Observa-se que a resposta é  __*Não*__. Porque vemos o mesmo efeito em 78, muito antes da instalação do centro de tratamento de lixo. Sendo assim os preço são mais baixos porque muito possívelmente estamos analisando uma região menos privilegiada da cidade.
- Então o efeito real da instalação do centro de tratamento de lixo, será a diferença entre as dummies y81 e y78 (18.824 - 30.688 = US$11.864), que seria o mesmo que estimar usando estimador DID

```r
# usando estimador DID
reg rprice y81 nearinc y81nrinc
```
![124](https://github.com/HenrySchall/Panel-Data/assets/96027335/1163ddd9-932e-412a-b33e-7ca105269504)

```r
# adicionando mais variáveis explciativas (sugestão do autor)
reg rprice y81 nearinc y81nrinc age agesq intst land area rooms baths
```
![6](https://github.com/HenrySchall/Panel-Data/assets/96027335/aa708ee2-8dcf-422f-a54c-d92f5fcb3f30)

#### 4º Quarto Exemplo
Carregar Base -> INJURY.DTA (Em julho de 1980 havia um limite para recebimento de auxilio compensação por acidente de trabalho em relação a renda dos indivíduos, sendo que indivíudos com renda superior ao limite não recebiam compensação. Após julho de 82, esse limite foi elevado)

```R
reg ldurat afchnge highearn afhigh
```
Descrição das variáveis: 
- afchnge = dummy pós período (1 = indivíduos afastados pós novo legislação e 0 = caso contrário)
- highearn = dummy de tratamento (1 = Individuos com renda acima do limite da legislação antiga e 0 = caso contrário)
- afhigh = dummy de interação

![01](https://github.com/HenrySchall/Panel-Data/assets/96027335/a39ed94c-61fc-4687-9b7f-e2f56cacaf6b)

- afchnge = é não significativa e positiva, controlado pelos outros fatores, pós nova legislação não há mudança na duração do afastamento para os indivíduos de renda baixa, porque os afetados são apenas os indivíduos de renda alta. 
- afhigh = é significativa e positiva, controlado pelos outros fatores, após a mudança da legislação, os indivíduos que tinham renda mais alta (não eram contemplados pela compensação) passaram à se afastar um período muito maior, cerca de 18% no tempo de duração de afastamento.

```R
reg ldurat afchnge highearn afhigh male married indust injtype
```
![02](https://github.com/HenrySchall/Panel-Data/assets/96027335/6bd6cd21-9abb-4b20-a372-d7e11254c69a)

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


