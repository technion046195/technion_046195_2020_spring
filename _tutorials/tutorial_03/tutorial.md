---
number: 3
title: "Parametric Probability Density Estimation" 
hide: True
---
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
- The model parameters are its mean value $$\mu$$ and standard deviation $$\sigma$$.

Assumptions and notations:

- $$N$$ - The number of samples points in the dataset.
- $$\boldsymbol{\theta}=\left[\mu,\sigma\right]^T$$ - The vector of parameters.
- $$p_\text{normal}\left(x_i;\boldsymbol{\theta}\right)=\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{\left(x_i-\mu\right)^2}{2\sigma^2}\right), i=1,...,N$$ - our model.

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

In the special case of MLE and a normal distribution, the optimization problem can be solved analytically. Sadly, this will not be true in the general case, and we will have to resort to numerical solutions.

We will find the solution for this optimization problem by comparing the derivative of the log-likelihood function to zero.

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

One very disturbing fact, for example, is that there is a non zero probability to get negative ride durations, which is obviously not realistic.

Let us try to propose a better model in order to get a better approximation.

### 💡 Method II : Rayleigh Distribution + MLE

The Rayleigh distribution describes the distribution of the magnitude of a 2D Gaussian vector with zero mean and no correlation between it's two components. In other words, if $$Z$$ has the following distribution:

$$
\boldsymbol{Z}\sim N\left(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \begin{bmatrix} \sigma^2 & 0 \\ 0 & \sigma^2 \end{bmatrix}\right)
$$

Than $$\left\lVert\boldsymbol{Z}\right\rVert_2=\sqrt{Z_x^2+Z_y^2}$$ has a Rayleigh distribution.

The PDF of the Rayleigh distribution is given by:

$$
p_\text{Rayleigh}\left(z;\sigma\right)=\frac{z}{\sigma^2}\exp\left({-\frac{z^2}{2\sigma^2}}\right), \quad z\geq0
$$

Notice that here the distribution is only defined for positive values. The Rayleigh distribution has only one parameter $$\sigma$$ which is called the scale parameter. Unlike in case of the normal distribution, here $$\sigma$$ is not equal to the standard deviation.

For consistency we will denote the 1D vector of parameters: $$\boldsymbol{\theta}=\left[\sigma\right]$$

We will give a short motivation for preferring the Rayleigh distribution.

> #### Motivation For Using Rayleigh Distribution
>
> We have started with an assumption that the duration a taxi ride is normally distributed. Let us instead assume that the quantity which is normally distributed is the 2D distance $$\boldsymbol{D}$$, between the pickup location to the drop off location.
>
> In other words, we are assuming that the random variable $$\boldsymbol{D}$$ is a 2D Gaussian vector. For simplicity, we will also assume that the $$x$$ and $$y$$ components of $$\boldsymbol{D}$$ are uncorrelated with equal variance and zero mean, i.e. we assume that:
> $$
> \boldsymbol{D}\sim N\left(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \begin{bmatrix} \sigma_D^2 & 0 \\ 0 & \sigma_D^2 \end{bmatrix}\right)
> $$
> In addition, let us also assume that the taxis speed, $$v$$ is constant. Therefore the relation between the ride duration $$T$$ and the distance vector $$\boldsymbol{D}$$ is:
>
> $$T = \frac{\left\lVert D\right\rVert_2}{v}$$
>
> In this case $$T$$ will have a Rayleigh distribution with a scale parameter $$\sigma=\frac{\sigma_D}{v}$$.

The model in this case will be:

$$
p_\text{rayleigh}\left(\boldsymbol{x};\boldsymbol{\theta}\right)=\prod_{i=1}^{N}\frac{x_i}{\sigma^2}\exp\left(-\frac{x_i^2}{2\sigma^2}\right)
$$

The negative log-likelihood function will be:

$$
\begin{align*}
-l_\text{rayleigh}\left(\boldsymbol{\theta}|\{x\}\right)
& = -\sum_i\log\left(p_\text{rayleigh}\left(x_i;\boldsymbol{\theta}\right)\right) \\
& = -\sum_i\log\left(x_i\right)+2N\log\left(\sigma\right)+\frac{1}{2\sigma^2}\sum_ix_i^2
\end{align*}
$$

Our optimization problem will now be:
$$
\hat{\boldsymbol{\theta}}=\underset{\boldsymbol{\theta}}{\arg\min}\ -\sum_i\log\left(x_i\right)+2N\log\left(\sigma\right)+\frac{1}{2\sigma^2}\sum_ix_i^2
$$
This optimization problem can be solved analytically. The solution will be:

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

The Rayleigh distribution is a special case of a more general family of distributions called the Generalized Gamma distribution. The PDF of the Generalized Gamma distribution is given by the following expression:

$$
p_\text{gengamma}\left(z;\sigma,a,c\right)=
\frac{cz^{ca-1}\exp\left(-\left(z/\sigma\right)^c\right)}{\sigma^{ca-1}\Gamma\left(a\right)}
, \quad z\geq0
$$

($$\Gamma$$ here is the [gamma function](https://en.wikipedia.org/wiki/Gamma_function))

This model has 3 parameters: $$\boldsymbol{\theta}=\left[\sigma, a, c\right]^T$$

For $$c=2$$ and $$a=1$$ we get the Rayleigh distribution (where $\sigma_{gamma}=2\sigma_{rayleigh}$ ).

Unlike the case of the normal and Rayleigh distributions, here we will not be able to find a simple analytic solution for the optimal MLE parameters. However we can use numerical methods for finding the optimal parameters. In practice we will use [SciPy's model for the General Gamma distribution](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.gengamma.html#scipy.stats.gengamma) to find the optimal parameters. You will use a similar method in your homework assignments.

By using SciPy's numerical solver we get the following result:

$$\hat{a} = 4.4$$

$$\hat{c} = 0.8$$

$$\hat{\sigma} = 1.6$$

![generalized_gamma](./media/generalized_gamma.png)

The Generalized Gamma distribution results in a distribution with a PDF which is much similar to the shape of the histogram.