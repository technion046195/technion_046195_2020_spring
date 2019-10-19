---
number: 3
title: "Parametric Probability Density Estimation" 
hide: true
---
## 🎛️ Theory: Parametric Estimation

- In previous tutorial we saw how to evaluate probabilty distributions in a non-parametric wasy.
- A much more popular approach is to use some parametric model for the distribution, $$p_{\boldsymbol{X}\lvert\boldsymbol{\Theta}}\left(\boldsymbol{x}\lvert\boldsymbol{\theta}\right)$$. where the vector $$\boldsymbol{\theta}$$ is the vector of parameters of the model.
- For example, a commonly used model the normal distribution which has two parameters: the mean and the standard deviation

Given the parametric model, we need to find the set of parameters wich makes the model fit besh to the dataset. In this course we will present the two most popular method for producing an estimation $$\hat{\boldsymbol{\theta}}$$ for the model's parameters, given a dataset.

### Maximum A Posteriori Estimation (MAP)

- In this approach, we assume that the unknown model parameters $$\boldsymbol{\theta}$$ are random variables which have been drawn from some known distribution $$p_\boldsymbol{\tilde{\theta}}$$, called the **prior distribution** (or the **a priori distribution**).
- (more accuratly: $$\boldsymbol{\theta}$$ is a realization of some random variable $$\boldsymbol{\Theta}$$)
- Under this assumption we can define the joint distribution $$p_{\boldsymbol{X},\boldsymbol{\Theta}}\left(\boldsymbol{x},\boldsymbol{\theta}\right)$$, and more importantly the conditional distribution $$p_{\boldsymbol{\Theta}\lvert\boldsymbol{X}}\left(\boldsymbol{\theta}\lvert\boldsymbol{x}\right)$$
- The conditional distribution $$p_{\boldsymbol{\Theta}\lvert\boldsymbol{X}}\left(\boldsymbol{\theta}\lvert\boldsymbol{x}\right)$$ is called the **posterior** (or **a posteriori**) **distribution** of $$\boldsymbol{\theta}$$.
- The maximum a posteriori estimattion is the value of $$\boldsymbol{\theta}$$ which maximizes the posteriori distribution:

$$
\hat{\boldsymbol{\theta}}=\underset{\boldsymbol{\theta}}{\arg\max}\ p_{\boldsymbol{\Theta}|\boldsymbol{X}}\left(\boldsymbol{\theta}|\boldsymbol{x}\right)
$$

- This is an optimization problem
- To solve this, we will use Bayes rule to write the posteriori distribution as:

$$
p_{\boldsymbol{\tilde{\theta}}|\boldsymbol{X}}\left(\boldsymbol{\theta}|\boldsymbol{x}\right)=\frac{
p_{\boldsymbol{X}|\boldsymbol{\tilde{\theta}}}\left(\boldsymbol{x}|\boldsymbol{\theta}\right)
p_{\boldsymbol{\tilde{\theta}}}\left(\boldsymbol{\theta}\right)}{
p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)
}
$$

Let us give an interpretation to each of the terms:

- $$p_{\boldsymbol{X}\lvert\boldsymbol{\tilde{\theta}}}\left(\boldsymbol{x}\lvert\boldsymbol{\theta}\right)$$ - The likelihood: How good a given $$\boldsymbol{\theta}$$ explains the measured data.
- $$p_{\boldsymbol{\tilde{\theta}}}\left(\boldsymbol{\theta}\right)$$ - The prior distribution: How probable is it for the random variable $$\boldsymbol{\tilde{\theta}}$$ to be equal to a specific set of values $$\boldsymbol{\theta}$$.
- $$p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)$$ - The model evidence: How probable is it for the random variable $$\boldsymbol{X}$$ to be equal to the actual measured data $$\boldsymbol{x}$$. This is based on the complete model, unrelated related to any specific value of $$\boldsymbol{\theta}$$. This term is simply the normalization factor which is necessary for making the posterior distribution a valid probability

So we need to solve:

$$
\begin{align*}
\hat{\boldsymbol{\theta}}
& = \underset{\boldsymbol{\theta}}{\arg\max}\ p_{\boldsymbol{\Theta}|\boldsymbol{X}}\left(\boldsymbol{\theta}|\boldsymbol{x}\right) \\
& = \underset{\boldsymbol{\theta}}{\arg\max}\ \frac{
p_{\boldsymbol{X}|\boldsymbol{\Theta}}\left(\boldsymbol{x}|\boldsymbol{\theta}\right)
p_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right)}{
p_{\boldsymbol{X}}\left(\boldsymbol{x}\right)} \\
& =\underset{\boldsymbol{\theta}}{\arg\max}\ p_{\boldsymbol{X}|\boldsymbol{\Theta}}\left(\boldsymbol{x}|\boldsymbol{\theta}\right)
p_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right) \\
\end{align*}
$$

- An intuitive interpretation is that we would like to select the optimal $$\boldsymbol{\theta}$$ which can both explain the measured data (high likelihood) and has a high prior probability.

**The main problem with this method**: Usually we will not know any thing about the prior distribution of $$\boldsymbol{\theta}$$.

#### Using the negative $$\log$$ log of the distribution.

As we will see in this course, it is usually beneficiary to also make the following change to the optimization problem

$$
\begin{align*}
\hat{\boldsymbol{\theta}}
& =\underset{\boldsymbol{\theta}}{\arg\max}\ p_{\boldsymbol{X}|\boldsymbol{\Theta}}\left(\boldsymbol{x}|\boldsymbol{\theta}\right)
p_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right) \\
& =\underset{\boldsymbol{\theta}}{\arg\min}\ -\log\left(p_{\boldsymbol{X}|\boldsymbol{\Theta}}\left(\boldsymbol{x}|\boldsymbol{\theta}\right)\right)
-\log\left(p_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right)\right)
\end{align*}
$$

Which is correct due to the fact that $$\log$$ is a monotonically increasing function. This transformation is usually usfull sine log replaces products to summations.

### Maximum Likelihood Estimation (MLE)

- In this approach, we assume that the unknown model parameters $$\boldsymbol{\theta}$$ are some unknown **fixed** values (with to distribution related to them).
- The maximum likelihood estimattion is simply the value of $$\boldsymbol{\theta}$$ which maximizes the likelihood function $$p_{\boldsymbol{X}\ ;\boldsymbol{\theta}}\left(\boldsymbol{\boldsymbol{x}\ ;\theta}\right)$$:

$$
\begin{align*}
\hat{\boldsymbol{\theta}}
& = \underset{\boldsymbol{\theta}}{\arg\max}\ p_{\boldsymbol{X}\ ;\boldsymbol{\theta}}\left(\boldsymbol{\boldsymbol{x}\ ;\theta}\right) \\
& = \underset{\boldsymbol{\theta}}{\arg\min}\ -\log\left(p_{\boldsymbol{X}\ ;\boldsymbol{\theta}}\left(\boldsymbol{x}\ ;\boldsymbol{\theta}\right)\right)
\end{align*}
$$

#### A few comments about notations

- Since in this case $$\boldsymbol{\theta}$$ is no longer a random variable we have replaced $$p_{\boldsymbol{X}\lvert\boldsymbol{\Theta}}\left(\boldsymbol{x}\lvert\boldsymbol{\theta}\right)$$ with $$p_{\boldsymbol{X}\ ;\boldsymbol{\theta}}\left(\boldsymbol{x}\ ;\boldsymbol{\theta}\right)$$. This is only a semantic issue and has no effect on the calculations.
- In the case of MLE it is common to denote the likelihood function $$p_{\boldsymbol{X}\ ;\boldsymbol{\theta}}\left(\boldsymbol{\boldsymbol{x}\ ;\theta}\right)$$ by $$\mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right)$$, simply to emphasize the fact that we are dealing with the case where the data is given and fixed, and we would like to look at the likelihood as a function of $$\boldsymbol{\theta}$$.
- It is also common to denote the $$log$$ of the likelihood function by $$l\left(\boldsymbol{\theta};\boldsymbol{x}\right)=\log\left(\mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right)\right)$$

### The i.i.d. (Idependent and Identically Distributed) Dataset assumption

In all cases in this course, we will assume that the $$N$$ smaples in our dataset are i.i.d. Therefore:

$$
p_{\boldsymbol{X}\ ;\boldsymbol{\theta}}\left(\boldsymbol{\boldsymbol{x}\ ;\theta}\right)=\prod_{i=0}^{N-1} p_{X\ ;\boldsymbol{\theta}}\left(\boldsymbol{x_i\ ;\theta}\right)
$$

and

$$
\log\left(p_{\boldsymbol{X}\ ;\boldsymbol{\theta}}\left(\boldsymbol{\boldsymbol{x}\ ;\theta}\right)\right)=\sum_{i=0}^{N-1} \log\left(p_{X\ ;\boldsymbol{\theta}}\left(\boldsymbol{x_i\ ;\theta}\right)\right)
$$

## Hands-on

### 🚖 Reminder: The NYC Taxi Dataset

The first 10 out of 100k taxi rides in NYC.

<table border="1" style="text-align:center;">
  <thead>
    <tr>
      <th></th>
      <th>passenger_count</th>
      <th>trip_distance</th>
      <th>payment_type</th>
      <th>fare_amount</th>
      <th>tip_amount</th>
      <th>pickup_easting</th>
      <th>pickup_northing</th>
      <th>dropoff_easting</th>
      <th>dropoff_northing</th>
      <th>duration</th>
      <th>day_of_week</th>
      <th>day_of_month</th>
      <th>time_of_day</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>2.768065</td>
      <td>2</td>
      <td>9.5</td>
      <td>0.00</td>
      <td>586.996941</td>
      <td>4512.979705</td>
      <td>588.155118</td>
      <td>4515.180889</td>
      <td>11.516667</td>
      <td>3</td>
      <td>13</td>
      <td>12.801944</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>3.218680</td>
      <td>2</td>
      <td>10.0</td>
      <td>0.00</td>
      <td>587.151523</td>
      <td>4512.923924</td>
      <td>584.850489</td>
      <td>4512.632082</td>
      <td>12.666667</td>
      <td>6</td>
      <td>16</td>
      <td>20.961389</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>2.574944</td>
      <td>1</td>
      <td>7.0</td>
      <td>2.49</td>
      <td>587.005357</td>
      <td>4513.359700</td>
      <td>585.434188</td>
      <td>4513.174964</td>
      <td>5.516667</td>
      <td>0</td>
      <td>31</td>
      <td>20.412778</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>0.965604</td>
      <td>1</td>
      <td>7.5</td>
      <td>1.65</td>
      <td>586.648975</td>
      <td>4511.729212</td>
      <td>586.671530</td>
      <td>4512.554065</td>
      <td>9.883333</td>
      <td>1</td>
      <td>25</td>
      <td>13.031389</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>2.462290</td>
      <td>1</td>
      <td>7.5</td>
      <td>1.66</td>
      <td>586.967178</td>
      <td>4511.894301</td>
      <td>585.262474</td>
      <td>4511.755477</td>
      <td>8.683333</td>
      <td>2</td>
      <td>5</td>
      <td>7.703333</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>1.561060</td>
      <td>1</td>
      <td>7.5</td>
      <td>2.20</td>
      <td>585.926415</td>
      <td>4512.880385</td>
      <td>585.168973</td>
      <td>4511.540103</td>
      <td>9.433333</td>
      <td>3</td>
      <td>20</td>
      <td>20.667222</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1</td>
      <td>2.574944</td>
      <td>1</td>
      <td>8.0</td>
      <td>1.00</td>
      <td>586.731409</td>
      <td>4515.084445</td>
      <td>588.710175</td>
      <td>4514.209184</td>
      <td>7.950000</td>
      <td>5</td>
      <td>8</td>
      <td>23.841944</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1</td>
      <td>0.804670</td>
      <td>2</td>
      <td>5.0</td>
      <td>0.00</td>
      <td>585.344614</td>
      <td>4509.712541</td>
      <td>585.843967</td>
      <td>4509.545089</td>
      <td>4.950000</td>
      <td>5</td>
      <td>29</td>
      <td>15.831389</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1</td>
      <td>3.653202</td>
      <td>1</td>
      <td>10.0</td>
      <td>1.10</td>
      <td>585.422062</td>
      <td>4509.477536</td>
      <td>583.671081</td>
      <td>4507.735573</td>
      <td>11.066667</td>
      <td>5</td>
      <td>8</td>
      <td>2.098333</td>
    </tr>
    <tr>
      <th>9</th>
      <td>6</td>
      <td>1.625433</td>
      <td>1</td>
      <td>5.5</td>
      <td>1.36</td>
      <td>587.875433</td>
      <td>4514.931073</td>
      <td>587.701248</td>
      <td>4513.709691</td>
      <td>4.216667</td>
      <td>3</td>
      <td>13</td>
      <td>21.783056</td>
    </tr>
  </tbody>
</table>

### ❓️ Same Problem: Estimating the Distribution of Trip Duration

We would like to estimate the distribution of the rides durations and represent them as a CDF or a PDF.

### 💡 Method I: Normal Distribution + MLE

- In this case we will try to use a **normal distribution** as our parametric model.
- The model parameters are it's mean value $$\mu$$ and it's standard deviation $$\sigma$$.

Se shall define:

- $$N$$ - The number of samples points in the dataset.
- $$\boldsymbol{\theta}=\left[\mu,\sigma\right]^T$$ - The vector of parameters.
- $$p_\text{normal}\left(\boldsymbol{x};\boldsymbol{\theta}\right)=\prod_{i=0}^{N-1}\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{\left(x_i-\mu\right)^2}{2\sigma^2}\right)$$ - our model.

The negative log-likelihood function for the normal distribution model is then:

$$
\begin{align*}
-l_\text{normal}\left(\boldsymbol{\theta}\ ;\boldsymbol{x}\right)
& = -\log\left(\mathcal{L}_\text{normal}\left(\boldsymbol{\theta}\right|\boldsymbol{x})\right) \\
& = -\log\left(\prod_i p_\text{normal}\left(x_i;\boldsymbol{\theta}\right)\right) \\
& = -\sum_i\log\left(p_\text{normal}\left(x_i;\boldsymbol{\theta}\right)\right) \\
& = -\sum_i\log\left(\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{\left(x_i-\mu\right)^2}{2\sigma^2}\right)\right) \\
& = N\log\left(\sqrt{2\pi}\sigma\right)+\frac{1}{2\sigma^2}\sum_i\left(x_i-\mu\right)^2 \\
\end{align*}
$$

Under the MLE approach, the optimal parameters $$\boldsymbol{\theta}^*$$ for the model are given by

$$
\begin{align*}
\hat{\boldsymbol{\theta}}
& = \underset{\boldsymbol{\theta}}{\arg\min}\ -l_\text{normal}\left(\boldsymbol{\theta};\{x\}\right) \\
& = \underset{\boldsymbol{\theta}=\left(\mu,\sigma\right)^T}{\arg\min}\ N\log\left(\sqrt{2\pi}\sigma\right)+\frac{1}{2\sigma^2}\sum_i\left(x_i-\mu\right)^2 \\
\end{align*}
$$

In the special case of MLE and a normal distribution, the optimization problem can be solved analytically. Sadly, this is will not be true in the general case, and we will have to resort to numerical solutions.

We will fine the solution for this optimization problem by comparing the derivative of the log-likelihood function to zero.

$$
\begin{align*}
& \begin{cases}
\displaystyle{\frac{\partial l\left(\boldsymbol{\theta}|\boldsymbol{x}\right)}{\partial\mu}}=0 \\
\displaystyle{\frac{\partial l\left(\boldsymbol{\theta}|\boldsymbol{x}\right)}{\partial\sigma}}=0 \\
\end{cases}
\\
\Leftrightarrow & \begin{cases}
\displaystyle{\frac{\sum_i\left(x_i-\mu\right)}{\sigma^2}}=0 \\
\displaystyle{-\frac{N}{\sigma}+\frac{2\sum_i\left(x_i-\mu\right)^2}{2\sigma^3}}=0 \\
\end{cases}\\
\Leftrightarrow & \begin{cases}
\mu=\displaystyle{\frac{1}{N}\sum_i x_i} \\
\sigma=\sqrt{\displaystyle{\frac{1}{N}\sum_i\left(x_i-\mu\right)^2}} \\
\end{cases}
\end{align*}
$$

Which results in our case in:

$$\hat{\mu} = 11.4\ \text{min}$$

$$\hat{\sigma} = 7.0\ \text{min}$$

We will plot the estimated PDF on top of the histogram.

![normal](./media/normal.png)

It seems that the normal distribution gives a very rough approximation of the real distribution. In some cases this would be good enough as a first order approximation, but in this case we would like to do better.

One very disturbing fact, for example, is the that there is a non zero probability to get negative ride durations, which is obviously not realistic.

Let us try to propose a better model in order to get a better approximation.

### 💡 Method II : Rayleigh Distribution + MLE

The Rayleigh distribution describes the distribution of the magnitude of a 2D Gaussian vector with zero mean and no correlation between it's two components. I.e. if $$Z$$ has the following distribution:

$$
\boldsymbol{Z}\sim N\left(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \begin{bmatrix} \sigma & 0 \\ 0 & \sigma \end{bmatrix}\right)
$$

Than $$\left\lVert\boldsymbol{Z}\right\rVert_2=\sqrt{Z_x^2+Z_y^2}$$ has a Rayleigh distribution.

The PDF of the Rayleigh distribution is given by:

$$
p_\text{Rayleigh}\left(z;\sigma\right)=\frac{z}{\sigma^2}\exp\left({-\frac{z^2}{2\sigma^2}}\right), \quad z\geq0
$$

Notice that here the distribution is only defined for positive values. The Rayleigh distribution has only one parameter $$\sigma$$ which is called the scale parameter. Unlike in case of the normal distribution, here $$\sigma$$ is not equal to the standard deviation.

For consistency we will denote the 1D vector of parameters: $$\boldsymbol{\theta}=\left[\sigma\right]$$

We will give a short motivation for preferring the Rayleigh distribution. This section can be skipped, and the Rayleigh distribution can be assumed to be simply selected as a good guess.

> #### Motivation For Using Rayleigh Distribution
>
> We have started with an assumption that the duration a taxi ride is normally distributed. Let us instead assume that the quantity which is normally distributed is the 2D distance $$\boldsymbol{D}$$, between the pickup location to the drop off location.
>
> I.e., we are assuming that the random variable $$\boldsymbol{D}$$ is a 2D Gaussian vector. For simplicity, we will also assume that the $$x$$ and $$y$$ components of $$\boldsymbol{D}$$ are uncorrelated with equal variance and zero mean. I.e. we assume that:
>
> $$\boldsymbol{D}\sim N\left(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \begin{bmatrix} \sigma_D & 0 \\ 0 & \sigma_D \end{bmatrix}\right)$$
>
> In addition, let us also assume that the taxis speed, $$v$$ is constant. Therefore the relation between the ride duration $$X$$ and the distance vector $$\boldsymbol{D}$$ is:
>
> $$X = \frac{\left\lVert D\right\rVert_2}{v}$$
>
> In this case $$x$$ will have a Rayleigh distribution with a scale parameter $$\sigma=\frac{\sigma_D}{v}$$

The model in this case will be:

$$
p_\text{rayleigh}\left(\boldsymbol{x};\boldsymbol{\theta}\right)=\prod_{i=0}^{N-1}\frac{x_i}{\sigma^2}\exp\left(-\frac{x_i^2}{2\sigma^2}\right)
$$

The negative log-likelihood function will be:

$$
\begin{align*}
-l_\text{rayleigh}\left(\boldsymbol{\theta}|\{x\}\right)
& = -\sum_i\log\left(p_\text{rayleigh}\left(x_i;\boldsymbol{\theta}\right)\right) \\
& = -\sum_i\log\left(x_i\right)+2N\log\left(\sigma\right)+\frac{1}{2\sigma^2}\sum_ix^2
\end{align*}
$$

Our optimization problem will now be:

$$\hat{\boldsymbol{\theta}}=\underset{\boldsymbol{\theta}}{\arg\min}\ -\sum_i\log\left(x_i\right)+2N\log\left(\sigma\right)+\frac{1}{2\sigma^2}\sum_ix^2$$

Also for the Rayleigh distribution the optimization can be solved analitically. The solution will be:

$$
\frac{\partial l_\text{rayleigh}\left(\theta|\{x\}\right)}{\partial\sigma}=0 \\
\Leftrightarrow -\frac{2N}{\sigma}+\frac{\sum_ix^2}{\sigma^3}=0 \\
\Leftrightarrow \sigma = \sqrt{\frac{1}{2N}\sum_i x^2}
$$

Which results in:

$$\hat{\sigma} = 9.5$$

![rayleigh](./media/rayleigh.png)

Judging by the similarity to the histogram, the Rayleigh distribution does a slightly better job at approximating the distribution and solves the negative values problem.

Let us try one more model.

### 💡 Method III: Generalized Gamma Distribution + MLE

The Rayleigh distribution is a special case of a more general family of distributions called the Generalized Gamma distribution. The PDF of the Generalized Gamma distribution is given by the following complex expression:

$$
p_\text{gengamma}\left(z;\sigma,a,c\right)=
\frac{cz^{ca-1}\exp\left(-\left(z/\sigma\right)^c\right)}{\sigma^{ca-1}\Gamma\left(a\right)}
, \quad z\geq0
$$

($$\Gamma$$ here is the [gamma function](https://en.wikipedia.org/wiki/Gamma_function))

This model has 3 parameters: $$\boldsymbol{\theta}=\left[\sigma, a, c\right]^T$$

For $$c=2$$ and $$a=1$$ we get the Rayleigh distribution.

Unlike the case of the normal and Rayleigh distributions, here we will not be able to find a simple analytic solution for the optimal MLE parameters. However we can use numerical methods for finding the optimal parameters. In practice we will use [SciPy's model for the General Gamma distribution](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.gengamma.html#scipy.stats.gengamma) to find the optimal parameters. You will use a similar method in your homework assignments.

By using SciPy's numerical solver we get the following result:

$$\hat{a} = 4.4$$

$$\hat{c} = 0.8$$

$$\hat{\sigma} = 1.6$$

![generalized_gamma](./media/generalized_gamma.png)

The Generalized Gamma distribution results in a distribution with a PDF which is much similar to the shape of the histogram.