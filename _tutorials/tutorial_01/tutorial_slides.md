---
number: 1
title: "Probability Theory and Predictions" 
---

<section class="center" markdown="1">

## Example

</section><section markdown="1">

### Example

<br><br><br>

![random_process](./media/supervised.png){: .no-background width="1200px"}

</section><section class="center" markdown="1">

## Background - Probability Theory Review

</section><section markdown="1">

### Example

<br>

![Pouring coffee](./media/coffee.jpeg){: .no-background}

</section><section markdown="1">

### 🎰 Basic Concepts

<div>
  <div class="slide-image" style="position:absolute;width:100%;background-color:white;border-radius:20px">
    <img src="{{ site.baseurl }}/media/diagrams/random_process_layers/random_process_layer-1.svg" style="width:80%"/>
  </div>
  <div class="slide-image fragment" style="position:absolute;width:100%">
    <img src="{{ site.baseurl }}/media/diagrams/random_process_layers/random_process_layer-2.svg" style="width:80%" />
  </div>
  <div class="slide-image fragment" style="position:absolute;width:100%">
    <img src="{{ site.baseurl }}/media/diagrams/random_process_layers/random_process_layer-3.svg" style="width:80%" />
  </div>
  <div class="slide-image fragment" style="position:absolute;width:100%">
    <img src="{{ site.baseurl }}/media/diagrams/random_process_layers/random_process_layer-4.svg" style="width:80%" />
  </div>
  <div class="slide-image fragment" style="position:absolute;width:100%">
    <img src="{{ site.baseurl }}/media/diagrams/random_process_layers/random_process_layer-5.svg" style="width:80%" />
  </div>
  <div class="slide-image fragment" style="position:absolute;width:100%">
    <img src="{{ site.baseurl }}/media/diagrams/random_process_layers/random_process_layer-6.svg" style="width:80%" />
  </div>
</div>

</section><section markdown="1">

### 🎰 Basic Concepts

#### Conditional Probability

<br><br><br>

$$Pr\left(A\lvert B\right)$$ is the probability of event A to occur given that event B has occurred.

<br><br>

By definition:

$$Pr\left(A\lvert B\right)=\frac{Pr\left(A\cap B\right)}{Pr\left(B\right)}$$

</section><section markdown="1">

### 🎰 Basic Concepts

| name | Usually donated by | Definition | Example  |
| :--- | --- | --- | --- |
| **A random phenomenon** |- | Some process which generates random outcomes |  Spilling a glass of juice on the floor and examining at the shape of the spill |
| **A sample** | $$\omega$$ | A single outcome of the process |  Some specific spill shape |
| **Sample space** | $$\Omega$$ | The space of all possible outcomes of the given process. $$\Omega=\left\lbrace\forall\omega\right\rbrace$$ |  The space of all possible spill shapes |
| **Random Variables (RV)** | $$X\left(\omega\right)$$,$$Y\left(\omega\right)$$,... | A function $$X:\Omega\rightarrow\mathbb{R}$$ which assigns a real number to a given sample | A function which returns the perimeter of a spill:<br>$$X_1\left(\omega\right)$$<br>A function which returns the area of a spill:<br> $$X_2\left(\omega\right)$$ |
| **An event** | $$A$$,$$B$$,... | A collection of events, i.e., a subset of the sample space $$A\subseteq\Omega$$.<br>We would often define an event through a condition on random variables. |  The collection of all spills with a perimeter smaller than 2:<br>$$A=\left\lbrace\omega: X_1\left(\omega\right)<2 \right\rbrace$$<br>The collection of all spills with an area larger than 1:<br>$$B=\left\lbrace\omega: X_2\left(\omega\right)>1 \right\rbrace$$ |
| **Event space** | $$\mathcal{F}$$ | A space of events. $$A\in\mathcal{F}$$  | The space of all possible collections of spills shape |
| **Probability measure** | $$Pr\left(A\right)$$ | A function $$Pr:\mathcal{F}\rightarrow\left[0,1\right]$$ which returns the probability of a random sample to be an element in some event $$A$$ | $$Pr\left(A\right)=Pr\left(X_1<2\right)=0.1$$<br>$$Pr\left(X_1<0\right)=Pr\left(\emptyset\right)=0$$<br>$$Pr\left(0\leq X_1\right)=Pr\left(\Omega\right)=1$$<br>$$Pr\left(A\cup B\right)=Pr\left(X_1<2\ \text{or}\ X_2>1\right)=0.6$$<br>$$Pr\left(A\cap B\right)=Pr\left(X_1<2\ \text{and}\ X_2>1\right)=0.01$$ |
| **Conditional probability measure** | $$Pr\left(AǀB\right)$$ | A function $$Pr:\mathcal{F}_1\times\mathcal{F}_2\rightarrow\left[0,1\right]$$ which returns the probability of a random sample to be an element in event $$A$$ given that it is an element in event $$B$$ | The probability of a spill to have a diameter smaller than 2, given that it has an area larger than 1:<br>$$Pr\left(AǀB\right)=Pr\left(X_1<2ǀX_2>1\right)=0.02$$ |
{: style="font-size: 20px !important"}

</section><section markdown="1">

### 🎰 Basic Concepts

#### Common abuse of notation

<br>

<ul><li markdown="1">
Realizations: The outcome of an RV (random variable) for a given sample: 
<br>

$$x=X\left(\omega\right)$$

It is common to refer to the realization as the samples or the random variables.
<br><br>
</li><li class="fragment" markdown="1">
It is common to use $$X<2$$ as a shorthand for $$\left\lbrace\omega:X\left(\omega\right)<2\right\rbrace$$
</li></ul>

<br>

</section><section markdown="1">

### 🎰 Basic Concepts

#### Random Vectors

<br>

A series of RVs packed together in a vector:

$$
\boldsymbol{X}=\left[X_1,X_2,\ldots,X_n\right]^T
$$

<br>

and it's realization:

$$
\boldsymbol{x}=\left[x_1,x_2,\ldots,x_n\right]^T
$$

</section><section markdown="1">

### ✍️ Exercise 1.1 - Warm-Up

#### Toy Model:<br>The 🍕 Pizza & Pancakes 🥞 Drive-Thru

<br>
<br>
<br>

We would like to help a new local drive-thru business that sells pizzas and pancakes. Which would like to be able to make some predictions regarding his business.

</section><section markdown="1">

### ✍️ Exercise 1.1 - Warm-Up

The random phenomenon we will be interested in is that of a customer making an order. Our sample will a single customer making an order. Give examples for:

- 2 discrete random variables
- 2 continuous random variables
- 2 events
- 2 possible probability measures.
- A possible probability measure using the union of the 2 events.
- A possible probability measure using the intersection of the 2 events.
- A possible probability measure using the exclusion of the 2 events.
- A possible conditional probability measure.

Make sure that all the probability measures are consistent with one another.

</section><section markdown="1">

### ✍️ Exercise 1.1 - Warm-Up

#### 💡 Solution

<ul>
  <li>
    2 discrete random variables
    <br><br>
    <ul class="fragment">
      <li>$X\left(\omega\right)$: The number of pizza slices the customer ordered.🍕</li>
      <li>$Y\left(\omega\right)$: The number of pancakes the customer ordered.🥞</li>
    </ul><br>
  </li>
  <li class="fragment">
    2 continuous random variables
    <br><br>
    <ul class="fragment">
      <li>$L\left(\omega\right)$: The length of the customer's car in meters. 🚗</li>
      <li>$T\left(\omega\right)$: The amount of tip the customer left in dollars. 💵</li>
    </ul><br>
  </li>
  <li class="fragment">
    2 events
    <br><br>
    <ul class="fragment">
      <li>The customer ordered exactly 1 slice of pizza: $X=1$.</li>
      <li>The customer left more then 2 USD tip $T>2$.</li>
    </ul><br>
  </li>
</ul>

</section><section markdown="1">

### ✍️ Exercise 1.1 - Warm-Up

#### 💡 Solution - Cont.

<ul>
  <li>
    2 possible probability measures.
    <br><br>
    <ul class="fragment">
      <li>The prob. a customer will order 1 slice: $$Pr\left(X=1\right)=0.2$$</li>
      <li>The prob. a customer will leave more than 2 USD tip: $$Pr\left(T>2\right)=0.5$$</li>
    </ul><br>
  </li>
  <li class="fragment">
    A possible prob. measure using the <strong>union</strong> of the 2 events.
    <br><br>
    <ul class="fragment">
      <li>The prob. of <strong>either</strong> "will order 1 slice" <strong>or</strong> "tip more than 2 USD" $$Pr\left(X=1 \cup T>2\right)=0.6$$</li>
    </ul><br>
  </li>
</ul>

</section><section markdown="1">

### ✍️ Exercise 1.1 - Warm-Up

#### 💡 Solution - Cont. 2

<ul>
  <li>
    A possible probability measure using the <strong>intersection</strong> of the 2 events.
    <br><br>
    <ul class="fragment">
      <li>The prob. of "order 1 slice" <strong>and</strong> "tip more than 2 USD" $$Pr\left(X=1 \cap T>2\right)=0.1$$</li>
    </ul><br>
  </li>
  <li class="fragment">
    A possible probability measure using the <strong>exclusion</strong> of the 2 events.
    <br><br>
    <ul class="fragment">
      <li>The prob. of "order 1 slice" <strong>but not</strong> "tip more than 2 USD" $$Pr\left(X=1 - T>2\right)=0.1$$</li>
    </ul><br>
  </li>
</ul>

</section><section markdown="1">

### ✍️ Exercise 1.1 - Warm-Up

#### 💡 Solution - Cont. 3

##### Venn Diagram

<br>

![Venn diagram](./media/venn.png){: .no-background}
  
</section><section markdown="1">

### ✍️ Exercise 1.1 - Warm-Up

#### 💡 Solution - Cont. 4

<ul>
  <li>
    A possible <strong>conditional</strong> probability measure.
    <br><br>
    <ul class="fragment">
      <li>The prob. of "order 1 slice" <strong>given that</strong> "tip more than 2 USD" $$Pr\left(X=1 \lvert T>2\right)=\frac{Pr\left(X=1\cap T>2\right)}{Pr\left(T>2\right)}=0.2$$</li>
    </ul><br>
  </li>
</ul>

</section><section markdown="1">

### 📊 Distribution Function

<div class="fragment" markdown="1">

#### CDF (Cumulative Distribution Function)

$$
F_X\left(x\right)=Pr\left(X\leq x\right)\left(=Pr\left(\omega:\left\lbrace X\left(\omega\right)\leq x\right\rbrace\right)\right)
$$

</div><div class="fragment" markdown="1">

<br>

#### PMF (Probability Mass Function) - (Discrete)

$$
p_{X}\left(x\right)=Pr\left(X=x\right)
$$

</div><div class="fragment" markdown="1">

<br>

#### PDF (Probability Density Function) - (Continuous)

$$
p_{X}\left(x\right)=\frac{\partial}{\partial x}F_{X}\left(x\right)
$$

Or (more accurately):

$$
F_{X}\left(x\right)=\int_{-\infty}^{x}p_{X}\left(x\right)dx
$$
  
</div>
</section><section markdown="1">

### 📊 Multivariate Distributions

#### CDF (Cumulative Distribution Function)

$$
F_{\boldsymbol{X}}\left(\boldsymbol{x}\right)=F_{X_1,X_2,\ldots,X_n}\left(x_1,x_2,\ldots,x_n\right)=\\
Pr\left(X_1\leq x_1 \cap X_2\leq x_2 \ldots \cap X_n\leq x_n\right)
$$

<br>

#### PMF (Probability Mass Function) - (Discrete)

$$
p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)=p_{X_1,X_2,\ldots,X_n}\left(x_1,x_2,\ldots,x_n\right)=\\
Pr\left(X_1=x_1 \cap X_2=x_2 \ldots \cap X_n=x_n\right)
$$

<br>

#### PDF (Probability Density Function) - (Continuous)

$$
p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)=p_{X_1,X_2,\ldots,X_n}\left(x_1,x_2,\ldots,x_n\right)=\\
=\frac{\partial}{\partial x_1}\frac{\partial}{\partial x_3}\ldots\frac{\partial}{\partial x_n}F_{\boldsymbol{X}}\left(\boldsymbol{x}\right)
$$
  
</section><section markdown="1">

### Conditional Distribution

#### CDF

$$
F_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(\boldsymbol{x}\lvert \boldsymbol{Y}=\boldsymbol{y}\right)=Pr\left(X_1\leq x_1 \cap X_2\leq x_2 \ldots \cap X_n\leq x_n\lvert \boldsymbol{Y}=\boldsymbol{y}\right)
$$

#### PMF

$$
p_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(\boldsymbol{x}\lvert \boldsymbol{Y}=\boldsymbol{y}\right)=Pr\left(X_1=x_1 \cap X_2=x_2 \ldots \cap X_n=x_n\lvert \boldsymbol{Y}=\boldsymbol{y}\right)
$$

#### PDF

$$
p_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(\boldsymbol{x}\lvert \boldsymbol{Y}=\boldsymbol{y}\right)=\frac{\partial}{\partial x_1}\frac{\partial}{\partial x_3}\ldots\frac{\partial}{\partial x_n}F_{X}\left(\boldsymbol{x}\lvert \boldsymbol{Y}=\boldsymbol{y}\right)
$$

</section><section markdown="1">

### Some Basic Rules

<div class="fragment" markdown="1">

#### The law of total probability (Marginal Probability)

$$
p_\boldsymbol{X}\left(\boldsymbol{x}\right)=\underbrace{\sum_{\boldsymbol{y}\in\left\lbrace \boldsymbol{Y}\left(\omega\right),\omega\in\Omega\right\rbrace}p_{\boldsymbol{X},\boldsymbol{Y}}\left(\boldsymbol{x},\boldsymbol{y}\right)}_\text{For discrete RV}=\underbrace{\int_{-\infty}^{\infty}p_{\boldsymbol{X},\boldsymbol{Y}}\left(\boldsymbol{x},\boldsymbol{y}\right)d\boldsymbol{y}}_\text{For cont. RV}
$$

</div><div class="fragment" markdown="1">
<br>

#### The Conditional Distributions (Definition):

$$
p_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(\boldsymbol{x}\lvert \boldsymbol{Y}=\boldsymbol{y}\right)=\frac{p_{\boldsymbol{X},\boldsymbol{Y}}\left(\boldsymbol{x},\boldsymbol{y}\right)}{p_{\boldsymbol{Y}}\left(\boldsymbol{y}\right)}
$$

</div>

</section><section markdown="1">

### Some Basic Rules - Cont.

#### Bayes' Theorem:

<br>

$$
p_{\boldsymbol{Y}\lvert \boldsymbol{X}}\left(\boldsymbol{y}\lvert \boldsymbol{X}=\boldsymbol{x}\right)
=\frac{p_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(x\lvert \boldsymbol{Y}=\boldsymbol{y}\right)p_{\boldsymbol{Y}}\left(\boldsymbol{y}\right)}{p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)}
\left(=\frac{p_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(x\lvert \boldsymbol{Y}=\boldsymbol{y}\right)p_{\boldsymbol{Y}}\left(\boldsymbol{y}\right)}{\sum_{\tilde{y}}p_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(x\lvert \boldsymbol{Y}=\boldsymbol{\tilde{y}}\right)p_{\boldsymbol{Y}}\left(\boldsymbol{\tilde{y}}\right)}\right)
$$

<div class="fragment" markdown="1">
<br>

Interpertation

- $$Y=y$$: proposition
- $$X=x$$: evidence

- $$p_{\boldsymbol{Y}}\left(\boldsymbol{y}\right)$$: Prior
- $$p_{\boldsymbol{X}\lvert \boldsymbol{Y}}\left(x\lvert \boldsymbol{Y}=\boldsymbol{y}\right)$$: Likelihood of $$y$$.
- $$p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)$$: Normalization

</div>

</section><section markdown="1">

### ✍️ Exercise 1.2 - Discrete Distributions

#### Back to The 🍕 Pizza & Pancakes 🥞 Drive-Thru

We are given the following joint distribution:

| $$X$$ 🍕 \ $$Y$$ 🥞 |  0   |  1   |  2   |  3   |
| ------------------- | ---- | ---- | ---- | ---- |
|          0          | 0    | 0.15 | 0.2  | 0.05 |
|          1          | 0.08 | 0.03 | ???  | 0.04 |
|          2          | 0.02 | 0.03 | 0.04 | 0.01 |
|          3          | 0.1  | 0.05 | 0.05 | 0.1  |
{: style="font-size:25px !important"}

**A**) What is the missing number in the table?

**B**) What is the probability of 1 slice of pizza, given that 0 pancakes?

**C**) what is the probability that 2 independent customers will buy 3 pizza slices?

</section><section markdown="1">

### ✍️ Exercise 1.2 - Discrete Distributions

| $$X$$ 🍕 \ $$Y$$ 🥞 |  0   |  1   |  2   |  3   |
| ------------------- | ---- | ---- | ---- | ---- |
|          0          | 0    | 0.15 | 0.2  | 0.05 |
|          1          | 0.08 | 0.03 | ???  | 0.04 |
|          2          | 0.02 | 0.03 | 0.04 | 0.01 |
|          3          | 0.1  | 0.05 | 0.05 | 0.1  |
{: style="font-size:25px !important"}

**A**) What is the missing number in the table?

#### 💡 Solution

<div class="fragment" markdown="1">

**A**) The sum of all possible event should always be 1, therefore the missing value must be equal to:

$$
p_{X,Y}\left(1,2\right) = 1 - \sum_{\left(x,y\right)\neq\left(1,2\right)} p_{X,Y}\left(x, y\right) = 0.05
$$

</div>

</section><section markdown="1">

### ✍️ Exercise 1.2 - Discrete Distributions

| $$X$$ 🍕 \ $$Y$$ 🥞 |  0   |  1   |  2   |  3   |
| ------------------- | ---- | ---- | ---- | ---- |
|          0          | 0    | 0.15 | 0.2  | 0.05 |
|          1          | 0.08 | 0.03 | 0.05 | 0.04 |
|          2          | 0.02 | 0.03 | 0.04 | 0.01 |
|          3          | 0.1  | 0.05 | 0.05 | 0.1  |
{: style="font-size:25px !important"}

**B**) What is the probability of 1 slice of pizza, given that 0 pancakes?

#### 💡 Solution

<div class="fragment" markdown="1">

**B**) By definition:

$$
p_{X\lvert Y}\left(1\lvert Y=0\right)
= \frac{p_{X,Y}\left(1,0\right)}{p_{Y}\left(0\right)}
= \frac{p_{X,Y}\left(1,0\right)}{\sum_{x=0}^3 p_{X,Y}\left(x,0\right)}
= \frac{0.08}{0+0.08+0.02+0.1} = 0.4
$$

</div>

</section><section markdown="1">

### ✍️ Exercise 1.2 - Discrete Distributions

**C**) what is the probability that 2 independent customers will buy 3 pizza slices?

#### 💡 Solution

<div class="fragment" markdown="1">

**C**) We shall note that

- We take the sum over all the combinations: (0 & 3, 1 & 2, etc.. ).
- The probabilityies are i.i.d -> each probability is the product of the two identical probabilities.

Therefore:

$$
\begin{aligned}
Pr\left(X_1+X_2=3\right)
& = Pr\left(X_1=0 \cap X_2=3\right) + Pr\left(X_1=1 \cap X_2=2\right) \\
& \quad + Pr\left(X_1=2 \cap X_2=1\right) + Pr\left(X_1=3 \cap X_2=0\right) \\
& \\
& = P_X\left(0\right)\cdot P_X\left(3\right) + P_X\left(1\right)\cdot P_X\left(2\right) \\
& \quad + P_X\left(2\right)\cdot P_X\left(1\right) + P_X\left(3\right)\cdot P_X\left(0\right)
\end{aligned}
$$

</div>

</section><section markdown="1">

### ✍️ Exercise 1.2 - Discrete Distributions

| $$X$$ 🍕 \ $$Y$$ 🥞 |  0   |  1   |  2   |  3   |
| ------------------- | ---- | ---- | ---- | ---- |
|          0          | 0    | 0.15 | 0.2  | 0.05 |
|          1          | 0.08 | 0.03 | 0.05 | 0.04 |
|          2          | 0.02 | 0.03 | 0.04 | 0.01 |
|          3          | 0.1  | 0.05 | 0.05 | 0.1  |
{: style="font-size:25px !important"}

#### 💡 Solution

We shall calculate the marginal distribution:

$$
p_X\left(x\right)=\sum_y p_{X,Y}\left(x,y\right)=\begin{cases}
0.4 & x=0 \\
0.2 & x=1 \\
0.1 & x=2 \\
0.3 & x=3
\end{cases}
$$

</section><section markdown="1">

### ✍️ Exercise 1.2 - Discrete Distributions

#### 💡 Solution - Cont. 2

$$
p_X\left(x\right)=\sum_y p_{X,Y}\left(x,y\right)=\begin{cases}
0.4 & x=0 \\
0.2 & x=1 \\
0.1 & x=2 \\
0.3 & x=3
\end{cases}
$$

<br>

Therefore the probability of two customers buying 3 slices is:

$$
\begin{aligned}
Pr\left(X_1+X_2=3\right)
& = P_X\left(0\right)P_X\left(3\right)
+ P_X\left(1\right)P_X\left(2\right) \\
& \ \ + P_X\left(2\right)P_X\left(1\right)
+ P_X\left(3\right)P_X\left(0\right) \\
& = 0.4\cdot0.3+0.2\cdot0.1+0.1\cdot0.2+0.3\cdot0.4 \\
& = 0.28
\end{aligned}
$$

</section><section markdown="1">

### ✍️ Exercise 1.3 - Mixed Distributions

We shell look at the joint distribution of the length of a customer's car and the number of pizza slices he orders.

It is known that the length of a car, $$L$$, conditioned on the number of slices $$X$$, has the following normal distribution:

$$
L \lvert \left(X=x\right) \sim N\left(4 + 0.2\cdot x, 0.1^2\right)
$$

Find the conditional distribution of the number of pizza slices given a car length of 4.4m:

$$p_{X\lvert L}\left(x\lvert L=4.4\right)$$

</section><section markdown="1">

### ✍️ Exercise 1.3 - Mixed Distributions

#### 💡 Solution

According to Bayes' theorem:

$$
\begin{aligned}
p_{X\lvert L}\left(x,L=4.4\right)
& =\frac{p_{L\lvert X}\left(4.4\lvert X=x\right)p_X\left(x\right)}{p_L\left(4.4\right)} \\
& \\
& =\frac{p_{L\lvert X}\left(4.4\lvert X=x\right)p_X\left(x\right)}{\sum_{\tilde{x}} p_{L\lvert X}\left(4.4\lvert X=\tilde{x}\right)p_X\left(\tilde{x}\right)}
\end{aligned}
$$

<br>

We shell calculate the nominator, $$p_{L\lvert X}\left(4.4\lvert X=x\right)p_X\left(x\right)$$, for every possible value of $$x$$.

The denominator will be the normalization factor.

</section><section markdown="1">

### ✍️ Exercise 1.3 - Mixed Distributions

#### 💡 Solution

$$
\begin{aligned}
p_{L|X}\left(4.4\lvert X=x\right)p_X\left(x\right)
& = \begin{cases}
\frac{1}{0.1\sqrt{2\pi}}\exp\left(-\frac{\left(4.4-4-0.2\cdot 0\right)^2}{2\cdot0.1^2}\right)\cdot0.4 & x=0 \\
\frac{1}{0.1\sqrt{2\pi}}\exp\left(-\frac{\left(4.4-4-0.2\cdot 1\right)^2}{2\cdot0.1^2}\right)\cdot0.2 & x=1 \\
\frac{1}{0.1\sqrt{2\pi}}\exp\left(-\frac{\left(4.4-4-0.2\cdot 2\right)^2}{2\cdot0.1^2}\right)\cdot0.1 & x=2 \\
\frac{1}{0.1\sqrt{2\pi}}\exp\left(-\frac{\left(4.4-4-0.2\cdot 3\right)^2}{2\cdot0.1^2}\right)\cdot0.3 & x=3
\end{cases}\\
& = \begin{cases}
0.26\cdot 0.4=0.11 & x=0 \\
1.2\cdot 0.2=0.24 & x=1 \\
2\cdot 0.1=0.2 & x=2 \\
1.2\cdot 0.3=0.36 & x=3
\end{cases}\\
\end{aligned}
$$

</section><section markdown="1">

### ✍️ Exercise 1.3 - Mixed Distributions

#### 💡 Solution

$$
p_{L|X}\left(4.4\lvert X=x\right)p_X\left(x\right)
= \begin{cases}
0.26\cdot 0.4=0.11 & x=0 \\
1.2\cdot 0.2=0.24 & x=1 \\
2\cdot 0.1=0.2 & x=2 \\
1.2\cdot 0.3=0.36 & x=3
\end{cases}
$$

![Likelihood](./media/likelihood.png){: width="800px"}

</section><section markdown="1">

### ✍️ Exercise 1.3 - Mixed Distributions

#### 💡 Solution

Now we can easily calculate the denominator (the normalization factor):

$$
p_L\left(4.4\right)=\sum_{\tilde{x}} p_{L\lvert X}\left(4.4\lvert X=\tilde{x}\right)p_X\left(\tilde{x}\right)=0.912
$$

<br>

Therefore:

$$
p_{X\lvert L}\left(x\lvert L=4.4\right)
=\frac{1}{0.912}\begin{cases}
0.11 & x=0 \\
0.24 & x=1 \\
0.2 & x=2 \\
0.36 & x=3
\end{cases}
=\begin{cases}
0.12 & x=0 \\
0.27 & x=1 \\
0.22 & x=2 \\
0.4 & x=3
\end{cases}
$$

</section><section markdown="1">

### 🗜️ Expectations

#### The expectation value\Mean

$$
\mu_{\boldsymbol{X}}=\mathbb{E}\left[\boldsymbol{X}\right]
=\underbrace{\sum_{\boldsymbol{x}\in\left\lbrace \boldsymbol{X}\left(\omega\right),\omega\in\Omega\right\rbrace} \boldsymbol{x}\cdot p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)}_\text{For discrete RV}
\left(=\underbrace{\int_{-\infty}^\infty \boldsymbol{x}\cdot p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)d\boldsymbol{x}}_\text{For cont. RV}\right)
$$

<div class="fragment" markdown="1">
<br><br>

it can also be shown that:

$$
\mathbb{E}\left[\boldsymbol{g}\left(\boldsymbol{X}\right)\right]
=\sum_{\boldsymbol{x}\in\left\lbrace \boldsymbol{X}\left(\omega\right),\omega\in\Omega\right\rbrace} \boldsymbol{g}\left(\boldsymbol{x}\right)\cdot p_{{\boldsymbol{X}}\left(\boldsymbol{x}\right)
\left(=\int_{-\infty}^\infty \boldsymbol{g}\left(\boldsymbol{x}\right)\cdot p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)d\boldsymbol{x}\right)
$$

</div>

</section><section markdown="1">

### 🗜️ Expectations - Cont.

#### Variance

$$
\sigma_X^2=\text{var}\left(X\right)=\mathbb{E}\left[\left(X-\mu_X\right)^2\right]=\mathbb{E}\left[\left(X^2\right)\right]-\mu_X^2
$$

<br>

$$\sigma_X=\sqrt{\text{var}\left(X\right)}$$ is the standard deviation

<div class="fragment" markdown="1">
<br>

#### Covariance

For a pair of RV, the covariance is defined by:

$$
\text{cov}\left(X,Y\right)=\mathbb{E}\left[\left(X-\mu_X\right)\left(Y-\mu_Y\right)\right]=\mathbb{E}\left[\left(XY\right)\right]-\mu_X\mu_Y
$$

</div>

</section><section markdown="1">

### 🗜️ Expectations - Cont.

#### Covariance Matrix

For a random vector:

$$
\Sigma_{\boldsymbol{X},i,j}=\text{cov}\left(X_i,X_j\right)
$$

This can also be written as:

$$
\Sigma_{\boldsymbol{X}}=\mathbb{E}\left[XX^T\right]-\mu_{\boldsymbol{X}}\mu_{\boldsymbol{X}}^T
$$

</section><section markdown="1">

### Gaussian Vectors<br>(Multivariate Normal Distribution)

A random vector where any linear combination of its components has a normal distribution.

$$
p_\boldsymbol{X}\left(\boldsymbol{x}\right)=\frac{1}{\sqrt{\left(2\pi\right)^n\left\lvert\Sigma\right\rvert}}\exp\left(-\tfrac{1}{2}\left(\boldsymbol{x}-\boldsymbol{\mu}_X\right)^T\Sigma^{-1}\left(\boldsymbol{x}-\boldsymbol{\mu}_X\right)\right)
$$

<div style="display:grid">
<div style="grid-column:1/2" markdown="1">
![Mutlivariate gaussian 3D](./media/mvg1.png)
</div><div style="grid-column:2/2" markdown="1">
![Mutlivariate gaussian contours](./media/mvg2.png)
</div>
</div>

<!-- </section><section markdown="1">

### Gaussian Vectors<br>(Multivariate Normal Distribution) - Cont.

#### Conditional Distributions

If we split a Gaussian vector into:

$$
\boldsymbol{X}=\left[\boldsymbol{X}_a^t,\boldsymbol{X}_b^t\right]^T
$$

And it's mean and covariance matrix:

$$
\boldsymbol{\mu}_\boldsymbol{X}=\left[\boldsymbol{\mu}_a^t,\boldsymbol{\mu}_b^t\right]^T \\
\Sigma_{\boldsymbol{X}}=\begin{bmatrix}\Sigma_{a,a} & \Sigma_{a,b} \\ \Sigma_{b,a} & \Sigma_{b,b}\end{bmatrix}
$$

The distribution of $$\boldsymbol{X}_a\lvert \boldsymbol{X}_b=\boldsymbol{x}_b$$ will also be a multivariate normal distribution

</section><section markdown="1">

### Gaussian Vectors<br>(Multivariate Normal Distribution) - Cont. 2

#### Conditional Distributions -Cont.

The conditional distribution will have the following parameters:

<br>

$$
\bar{\boldsymbol{\mu}}=\boldsymbol{\mu}_a+\Sigma_{a,b}\Sigma_{b,b}^{-1}\left(\boldsymbol{x}_b-\boldsymbol{\mu}_b\right) \\
\bar{\Sigma}=\Sigma_{a,a}-\Sigma_{a,b}\Sigma_{b,b}^{-1}\Sigma_{b,a}
$$

</section><section markdown="1">

#### ✍️ Exercise 1.4<br>Conditional Multivariate Normal Distribution

**A**) We are given the following parameters of a Gaussian vector:

$$
\boldsymbol{\mu}_\boldsymbol{X}=\left[0, 0, 0\right]^T ,
\Sigma_{\boldsymbol{X}}=\begin{bmatrix}1 & 0 & 0 \\ 0 & 4 & 3 \\ 0 & 2 & 5\end{bmatrix}
$$

Calculate $$p_{X_1\lvert X_2,X_3}$$

</section><section markdown="1">

##### 💡 Solution

<br>

$$
\boldsymbol{\mu}_a=\begin{bmatrix}0\end{bmatrix},
\boldsymbol{\mu}_b=\begin{bmatrix}0 \\ 0\end{bmatrix},
\Sigma_{a,a}=\begin{bmatrix}1\end{bmatrix},
\Sigma_{a,b}=\begin{bmatrix}0 & 0\end{bmatrix},
\Sigma_{b,a}=\begin{bmatrix}0 \\ 0\end{bmatrix},
\Sigma_{b,b}=\begin{bmatrix}4 & 3 \\ 2 & 5\end{bmatrix}
$$

<br>

Therefore:

$$
\bar{\boldsymbol{\mu}}=\begin{bmatrix}0\end{bmatrix}+\begin{bmatrix}0 & 0\end{bmatrix}\begin{bmatrix}4 & 3 \\ 2 & 5\end{bmatrix}^{-1}\left(\boldsymbol{x}_b-\begin{bmatrix}0 \\ 0\end{bmatrix}\right)=0 \\
\bar{\Sigma}=\begin{bmatrix}1\end{bmatrix}-\begin{bmatrix}0 & 0\end{bmatrix}\begin{bmatrix}4 & 3 \\ 2 & 5\end{bmatrix}^{-1}\begin{bmatrix}0 \\ 0\end{bmatrix}=1
$$

</section><section markdown="1">

#### ✍️ Exercise 1.4<br>Conditional Multivariate Normal Distribution

**B**) We are given the following parameters of a Gaussian vector:

$$
\boldsymbol{\mu}_\boldsymbol{X}=\left[0, 0, 0\right]^T \\
\Sigma_{\boldsymbol{X}}=\begin{bmatrix}1 & 2 & 0 \\ 2 & 4 & 0 \\ 0 & 0 & 5\end{bmatrix}
$$

Calculate $$p_{X_1\lvert X_2,X_3}$$

</section><section markdown="1">

##### 💡 Solution

<br>

$$
\boldsymbol{\mu}_a=\begin{bmatrix}0\end{bmatrix},
\boldsymbol{\mu}_b=\begin{bmatrix}0 \\ 0\end{bmatrix},
\Sigma_{a,a}=\begin{bmatrix}1\end{bmatrix},
\Sigma_{a,b}=\begin{bmatrix}2 & 0\end{bmatrix},
\Sigma_{b,a}=\begin{bmatrix}2 \\ 0\end{bmatrix},
\Sigma_{b,b}=\begin{bmatrix}4 & 0 \\ 0 & 5\end{bmatrix}
$$

<br>

Therefore:

$$
\bar{\boldsymbol{\mu}}=\begin{bmatrix}0\end{bmatrix}+\begin{bmatrix}2 & 0\end{bmatrix}\begin{bmatrix}4 & 0 \\ 0 & 5\end{bmatrix}^{-1}\left(\boldsymbol{x}_b-\begin{bmatrix}0 \\ 0\end{bmatrix}\right)=\tfrac{1}{2}x_2 \\
\bar{\Sigma}=\begin{bmatrix}1\end{bmatrix}-\begin{bmatrix}2 & 0\end{bmatrix}\begin{bmatrix}4 & 0 \\ 0 & 5\end{bmatrix}^{-1}\begin{bmatrix}2 \\ 0\end{bmatrix}=0
$$

</section><section markdown="1">

#### ✍️ Exercise 1.4<br>Conditional Multivariate Normal Distribution

**C**) We are given the following parameters of a Gaussian vector:

$$
\boldsymbol{\mu}_\boldsymbol{X}=\left[0, 0, 0\right]^T \\
\Sigma_{\boldsymbol{X}}=\begin{bmatrix}1 & 1 & 1 \\ 1 & 2 & 1 \\ 1 & 1 & 2\end{bmatrix}
$$

Calculate $$p_{X_1\lvert X_2,X_3}$$

</section><section markdown="1">

##### 💡 Solution

<br>

$$
\boldsymbol{\mu}_a=\begin{bmatrix}0\end{bmatrix},
\boldsymbol{\mu}_b=\begin{bmatrix}0 \\ 0\end{bmatrix},
\Sigma_{a,a}=\begin{bmatrix}1\end{bmatrix},
\Sigma_{a,b}=\begin{bmatrix}1 & 1\end{bmatrix},
\Sigma_{b,a}=\begin{bmatrix}1 \\ 1\end{bmatrix},
\Sigma_{b,b}=\begin{bmatrix}2 & 1 \\ 1 & 2\end{bmatrix}
$$

<br>

Therefore:

$$
\bar{\boldsymbol{\mu}}=\begin{bmatrix}0\end{bmatrix}+\begin{bmatrix}1 & 1\end{bmatrix}\begin{bmatrix}2 & 1 \\ 1 & 2\end{bmatrix}^{-1}\left(\boldsymbol{x}_b-\begin{bmatrix}0 \\ 0\end{bmatrix}\right)=\tfrac{1}{3}x_2+\tfrac{1}{3}x_3 \\
\bar{\Sigma}=\begin{bmatrix}1\end{bmatrix}-\begin{bmatrix}1 & 1\end{bmatrix}\begin{bmatrix}2 & 1 \\ 1 & 2\end{bmatrix}^{-1}\begin{bmatrix}1 \\ 1\end{bmatrix}=\tfrac{1}{3}
$$ -->

</section><section class="center" markdown="1">

## Prediction Theory

</section><section markdown="1">

### 🔮 The Problem

Give an "optimal" prediction for the number of slices a customer will buy given that his car length is 4.4m.

<br>

<div class="fragment" markdown="1">
**We must first define what do we mean by "optimal" prediction.**
</div>

<br>

<div class="fragment" markdown="1">
A few optional definitions:

1. The prediction with the lowest probability to be wrong.
1. The prediction with the lowest error on average.
1. The prediction with the lowest squared error on average.

</div>

</section><section markdown="1">

## Prediction Theory

### 🔮 The Problem

A few optional definitions:

1. The prediction with the lowest probability to be wrong.
1. The prediction with the lowest error on average.
1. The prediction with the lowest squared error on average.

<br>

- Each of the above definitions results in a different prediction.
<br>
- There is an infinite amount of ways to define the optimal prediction
<br>
- Each definition is preferable in different scenarios.

</section><section markdown="1">

### 📉 The Loss and The Risk Functions

<br>

In most cases we are searching for:

<br>

The prediction which minimizes some penalty function, on average.

<br>

*Let's write it in a more formal way.*

</section><section markdown="1">

### 📉 The Loss and The Risk Functions - Cont.

Notations:

- $$\hat{\boldsymbol{x}}$$ - a prediction for $$\boldsymbol{X}$$.

- **Loss** - a function for how bad is a prediction: $$l\left(\boldsymbol{x,}\hat{\boldsymbol{x}}\right)$$

- **Risk** - The expectation value of the loss function: $$R\left(\hat{\boldsymbol{x}}\right)=\mathbb{E}\left[l\left(\hat{\boldsymbol{x}},\boldsymbol{X}\right)\right]$$

<br>

The "optimal" prediction is the solution to the following optimization problem:

<br>

$$
\hat{\boldsymbol{x}}^*=\underset{\hat{\boldsymbol{x}}}{\arg\min}\quad R\left(\hat{\boldsymbol{x}}\right)=\underset{\hat{\boldsymbol{x}}}{\arg\min}\quad \mathbb{E}\left[l\left(\hat{\boldsymbol{x}},\boldsymbol{X}\right)\right]\\
$$

</section><section markdown="1">

### 📉 The Loss and The Risk Functions - Cont.

<br>

Back to the 3 examples for before:

<br>

| Definition | Loss | Loss Name | Risk Name |
| ---------- | ---- | --------- | --------- |
| lowest probability to be wrong | $$l\left(x,\hat{x}\right)=I\left\lbrace\hat{x}\neq x\right\rbrace$$ | Zero-one loss | Misclassification rate |
| lowest error on average | $$l\left(x,\hat{x}\right)=\left\lvert\hat{x}-x\right\rvert$$ | $$l_1$$ | MAE (mean absolute error) |
| lowest squared error on average | $$l\left(x,\hat{x}\right)=\left(\hat{x}-x\right)^2$$ | $$l_2$$ | MSE (mean squared error) |
{: style="font-size: 25px !important"}

</section><section markdown="1">

### 🔧 A Note About Optimization Problems

<br>

Optimization problems are problems of the following form:

$$
\boldsymbol{x}^*=\underset{\boldsymbol{x}}{\arg\min}\quad f\left(\boldsymbol{x}\right) \\
\begin{aligned}
\text{subject to}\quad
& g_i\left(\boldsymbol{x}\right)\leq 0,\qquad i=1,\ldots,m \\
& h_j\left(\boldsymbol{x}\right)=0,\qquad j=1,\ldots,p
\end{aligned}
$$

<br>

- $$\boldsymbol{x}$$ is either a scalar or a vector.
- $$f$$ an arbitrary function called the objective.
- $$g_i$$s and $$h_i$$s are optional additional equality and inequality constraints.

<br>

Goal: to find $$\boldsymbol{x}^*$$ which produces the minimal value of $$f\left(\boldsymbol{x}\right)$$ among all $$\boldsymbol{x}$$s which obey the constraints.


</section><section markdown="1">

### 🔧 A Note About Optimization Problems - Cont.

In this course, we will care about 4 cases:

<br>

- No constraints and analytically solvable by differentiating and comparing to zero (for simple functions).

<br>

- With equality constraints and analytically solvable using Lagrange Multipliers.

<br>

- Brute force, i.e. checking all possible solutions (for  discrete cases with a small set of values).

<br>

- Using a method called **gradient descent**, which we will present later in this course.

</section><section markdown="1">

### 📚 Solutions For Popular Loss Functions

<br>
<br>

#### ✍️ Exercise 1.5

**A**) Show that in the discrete case, the optimal predictor for the zero-one loss is the point with the maximal PMF:

<br>

$$
\hat{x}^*=\underset{\hat{x}}{\arg\max}\quad p_X\left(\hat{x}\right)\\
$$

</section><section markdown="1">

##### 💡 Solution

**A**) The zero one-loss is given by $$l\left(x,\hat{x}\right)=I\left\lbrace\hat{x}\neq x\right\rbrace$$, therefore:

$$
\begin{aligned}
\hat{x}^*
& = \underset{\hat{x}}{\arg\min}\quad \mathbb{E}\left[l\left(\hat{x},X\right)\right] \\
& = \underset{\hat{x}}{\arg\min}\quad \mathbb{E}\left[I\left\lbrace\hat{x}\neq X\right\rbrace\right] \\
& = \underset{\hat{x}}{\arg\min}\quad \sum_xI\left\lbrace\hat{x}\neq x\right\rbrace p_X\left(x\right) \\
& = \underset{\hat{x}}{\arg\min}\quad \underbrace{\left(\sum_x p_X\left(x\right)\right)}_{=1} - p_X\left(\hat{x}\right) \\
& = \underset{\hat{x}}{\arg\max}\quad p_X\left(\hat{x}\right)
\end{aligned}
$$

</section><section markdown="1">

### 📚 Solutions For Popular Loss Functions

<br>
<br>

#### ✍️ Exercise 1.5

**B**) Show that in the continuous case, the optimal predictor for the $$l_1$$ loss is the median:

<br>

$$
F_X\left(\hat{x}^*\right)=\tfrac{1}{2}
$$

<br>

(in the discrete case it is the point closest to being the median)

</section><section markdown="1">

##### 💡 Solution

**B**) The $$l_1$$ loss is given by $$\left\lvert\hat{x}-x\right\rvert$$. Therefore:

<br>

$$
\begin{aligned}
\hat{x}^*
& = \underset{\hat{x}}{\arg\min}\quad \mathbb{E}\left[l\left(\hat{x},X\right)\right] \\
& = \underset{\hat{x}}{\arg\min}\quad \mathbb{E}\left[\left\lvert\hat{x}-x\right\rvert\right] \\
& = \underset{\hat{x}}{\arg\min}\quad \int_{-\infty}^{\infty}\left\lvert\hat{x}-x\right\rvert p_X\left(x\right)dx
\end{aligned}
$$

<br>

We will solve this by differentiating according to $$\hat{x}$$ and comparing to zero

</section><section markdown="1">

##### 💡 Solution - Cont.

$$
\frac{d}{d\hat{x}}\int_{-\infty}^{\infty}\left\lvert\hat{x}-x\right\rvert p_X\left(x\right)dx = 0 \\
\Leftrightarrow\int_{-\infty}^{\infty}\frac{d}{d\hat{x}}\left\lvert\hat{x}-x\right\rvert p_X\left(x\right)dx = 0 \\
\Leftrightarrow\int_{-\infty}^{\infty}\text{sign}\left(\hat{x}-x\right) p_X\left(x\right)dx = 0 \\
\Leftrightarrow\underbrace{\left(\int_{-\infty}^{\hat{x}}p_X\left(x\right)dx\right)}_{=F_x\left(\hat{x}\right)} - \underbrace{\left(\int_{\hat{x}}^{\infty}p_X\left(x\right)dx\right)}_{=1 - F_x\left(\hat{x}\right)} = 0 \\
\Leftrightarrow F_x\left(\hat{x}\right) = \tfrac{1}{2} \\
$$

</section><section markdown="1">

### 📚 Solutions For Popular Loss Functions

<br>
<br>

#### ✍️ Exercise 1.5

**C**) Show that the optimal predictor for the $$l_2$$ loss is the mean:

<br>

$$
\hat{x}^*\mathbb={E}\left[X\right]
$$

</section><section markdown="1">

##### 💡 Solution

**C**) The $$l_1$$ loss is given by $$\left(\hat{x}-x\right)^2$$. Therefore:

<br>

$$
\begin{aligned}
\hat{x}^*
& = \underset{\hat{x}}{\arg\min}\quad \mathbb{E}\left[l\left(\hat{x},X\right)\right] \\
& = \underset{\hat{x}}{\arg\min}\quad \mathbb{E}\left[\left(\hat{x}-x\right)^2\right] \\
\end{aligned}
$$

<br>

We will solve this by differentiating according to zero

</section><section markdown="1">

##### 💡 Solution - Cont.

$$
\frac{d}{d\hat{x}}\mathbb{E}\left[\left(\hat{x}-x\right)^2\right]=0 \\
\mathbb{E}\left[\frac{d}{d\hat{x}}\left(\hat{x}-x\right)^2\right]=0 \\
\mathbb{E}\left[2\left(\hat{x}-x\right)\right]=0 \\
2\hat{x}\underbrace{\mathbb{E}\left[1\right]}_{=1} - 2\mathbb{E}\left[x\right]=0 \\
\hat{x} = \mathbb{E}\left[x\right] \\
$$

</section><section markdown="1">

#### ✍️ Exercise 1.6 - Predicting The Number of Pizza Slices

<br>
We would now like to make a prediction for the number of pizza slices given a car length of 4.4m. 

<br>

Calculate the optimal prediction for each of the 3 loss functions.

</section><section markdown="1">

##### 💡 Solution

We have found earlier that:

$$
p_{X|L}\left(x|L=4.4\right)=\begin{cases}
0.12 & x=0 \\
0.27 & x=1 \\
0.22 & x=2 \\
0.4 & x=3
\end{cases}
$$

Therefore:

<div markdown="1">
Zero-one loss:
<div class="fragment" style="text-align:center" markdown="1">
$$\hat{x}^*=\underset{\hat{x}}{\arg\max}\quad p_{X\lvert L}\left(\hat{x}\lvert L=4.4\right)=3$$
</div>
</div>

<div class="fragment" markdown="1">
$$l_1$$ loss:
<div class="fragment" style="text-align:center" markdown="1">
The value closest to the median is $$\hat{x}^*=2$$
</div>
</div>

<div class="fragment" markdown="1">
$$l_2$$ loss:
<div class="fragment" style="text-align:center" markdown="1">
$$\hat{x}^*=\mathbb{E}\left[X\lvert L=0.44\right]=1.896$$
</div>
</div>

<!-- </section><section markdown="1">

#### ✍️ Exercise 1.7  Heart Rate and Blinking

A new research has found a connection between the blinking rate of a person and his heart rate.

- $$X_1$$: A person's heart rate.
- $$X_2$$: A person's blinking rate.
- $$X=\left[X_1,X_2\right]^T$$ has a multivariate normal distribution with:

$$
\boldsymbol{\mu} = \begin{bmatrix}70\\10\end{bmatrix}
$$

$$
\Sigma = \begin{bmatrix}100 & 8\\8 & 4\end{bmatrix}
$$

<br>

Find the function $$\hat{x}^*_1=h^*\left(x_2\right)$$ which predicts $$X_1$$ given $$X_2$$.

</section><section markdown="1">

##### 💡 Solution

Using the formula for the conditional multivariate normal distribution:

$$
\mu_{X_1\lvert X_2=x_2}=\mu_{1}+\frac{\Sigma_{1,2}}{\Sigma_{2,2}}\left(x_2-\mu_{2}\right)=70+\frac{8}{4}\left(x_2-10\right)=50+2x_2 \\
\sigma_{X_1\lvert X_2=x_2}^2=\Sigma_{1,1}-\frac{\Sigma_{1,2}^2}{\Sigma_{2,2}}=100-\frac{8^2}{4} = 84
$$

<br>

Therefore:

$$
X_1\lvert X_2 \sim N\left(50+2x_2,84\right)
$$

</section><section markdown="1">

##### 💡 Solution - Cont.

The mean, the median and the point of the maximal distribution are all the same point. Therefore all the three predictors will give the same prediction:

<br>

$$
\hat{x}^*_1=h^*\left(x_2\right)=\mu_{X_1\lvert X_2}=50+2x_2
$$

<br><br>

This will always be true for symmetrical distributions such as the normal distribution. -->

</section><section markdown="1">

### Lagrange Multipliers

A method of for solving optimization problems with only equality constraints:

<br>

$$
\boldsymbol{x}^*=\underset{\boldsymbol{x}}{\arg\min}\quad f\left(\boldsymbol{x}\right) \\
\begin{aligned}
\text{subject to}\quad
& h_i\left(\boldsymbol{x}\right)=0,\qquad i=1,\ldots,m \\
\end{aligned}
$$

<br>

$$f$$ and the $$h_i$$s must all be differentiable.

<br>

</section><section markdown="1">

### Lagrange Multipliers

<br>

We will defeine:

- $$\lambda_i$$s: one Lagrange multiplier for every constraints.
- Lagrangian:

$$
\mathcal{L}\left(\boldsymbol{x},\boldsymbol{\lambda}\right) = f\left(\boldsymbol{x}\right) + \sum_i \lambda_i h_i\left(\boldsymbol{x}\right)
$$

<br>
<br>

If $$\boldsymbol{x}^*$$ is a solution of the original optimization problem, then there exist some set of values $$\boldsymbol{\lambda}^*$$s such that:

$$
\nabla_{\boldsymbol{x},\boldsymbol{\lambda}}\mathcal{L}\left(\boldsymbol{x}^*,\boldsymbol{\lambda}^*\right) = 0
$$

</section><section markdown="1">

#### ✍️ Exercise 1.8  Lagrange Multipliers

<br>

Solve the following optimization problem:

<br>

$$
\underset{p_1,p_2}{\arg\max}\quad p_1\cdot p_2 \\
\begin{aligned}
\text{subject to}\quad
& p_1 + p_2 = 1 \\
\end{aligned}
$$

</section><section markdown="1">

##### 💡 Solution

We will introduce one Lagrange multiplier $$\lambda$$ and define the following Lagrangian:

$$
\mathcal{L}=p_1\cdot p_2 + \lambda \left(p_1 + p_2-1\right)
$$

<br>

By differentiating and comparing to zero we get the following result:

$$
\begin{aligned}
& \begin{cases}
p_2+\lambda=0\\
p_1+\lambda=0\\
p_1+p_2=1\\
\end{cases}\\
\Rightarrow & \begin{cases}
p_1-p_2=0\\
p_1+p_2=1\\
\end{cases}\\
\Leftrightarrow & \begin{cases}
p_2=\tfrac{1}{2}\\
p_1=\tfrac{1}{2}\\
\end{cases}
\end{aligned}
$$

</section>
