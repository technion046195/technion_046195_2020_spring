---
number: 13
title: "Summary" 
hide: True
---

<section markdown="1">

<div class="hebrew" markdown="1">
## תקציר הנושאים בקורס

<br><br>

**הבהרה**: זהו רק תקציר בראשי פרקים של **רוב** החומרים שנלמדו בקורס. החומר למבחן כולל את כל הנושאים אשר נלמדו (גם אם לא הופיעו בתקציר זה)

</div>

</section><section markdown="1">

## Background

### Mathematical Notations

- **Scalar**: $$y$$
  <br><br>
- **Column vector**: $$\boldsymbol{x}$$
  <br><br>
- **Matrix**: $$A$$
  <br><br>
- **A set of scalars/vectors**: $$\left\lbrace\boldsymbol{x}_i\right\rbrace$$ or $$\left\lbrace y_i\right\rbrace$$
  <br><br>
- **An element of a vector, a matrix or a set**: $$x_i$$ or $$a_{i,j}$$
  <br><br>
- **The value in an iterative process**: $$\theta^{\left(t\right)}$$

</section><section markdown="1">

### Probability Notations

- **A single random sample**: $$\omega$$
  <br><br>
- **A random variable (RV)**: $$X\left(\omega\right)$$ (usually shorten to $$X$$. Note that capital letters are also used for matrices)
  <br><br>
- **A realization of an RV**: $$x=X\left(\omega\right)$$
  <br><br>
- **The probability of an event** $$Pr\left(0.2<X<0.6\right)$$
  <br><br>
- **Probability Mass Function (PMF)**: (for a discrete RV) $$p_X\left(x\right)=Pr\left(X=x\right)$$
  <br><br>
- **Cumulative Distribution Function (CDF)**: $$F_X\left(x\right)=Pr\left(X\leq x\right)$$
  <br><br>
- **Probability Density Function (PDF)**: $$f_X\left(x\right)$$ define by $$F_X\left(x\right)=\int_{-\infty}^xf_Xdx$$

</section><section markdown="1">

### Common notation to describe a dataset:

- $$N$$ - The number of samples in a dataset.
  <br><br>
- **A realization of an RV**: $$x=X\left(\omega\right)$$
  <br><br>
- $$d$$ The dimension of the data.
  <br><br>
- $$\boldsymbol{x}$$ - A vector of measured values related to a single sample.
  <br><br>
- $$\left\lbrace\boldsymbol{x}_i\right\rbrace$$ - The set of measurements in a dataset.
  <br><br>
- $$X$$ - The matrix of measurements $$\left[\boldsymbol{x}_0,\boldsymbol{x}_1,\ldots,\boldsymbol{x}_{N-1}\right]^T$$.
  <br><br>
- $$x_{i,j}$$ - The $$j$$-th element of the $$i$$-th measurement (which is the $$\left(i,j\right)$$-th element of the matrix $$X$$).
  <br><br>
- $$\left\lbrace  y_i\right\rbrace$$ - The set of labels in a dataset.
  <br><br>
- $$\boldsymbol{y}$$ - the vector of labels $$\left[y_0,y_1,\ldots,y_{N-1}\right]^T$$.
  <br><br>
- $$y_i$$ - The $$i$$-th label (which is the $$i$$-th element of the vector $$\boldsymbol{y}$$).

</section><section markdown="1">

### Optimization Problems

$$
\boldsymbol{x}^*=\underset{\boldsymbol{x}}{\arg\min}\quad f\left(\boldsymbol{x}\right) \\
\begin{aligned}
\text{subject to}\quad
& g_i\left(\boldsymbol{x}\right)\leq 0,\qquad i=1,\ldots,m \\
& h_j\left(\boldsymbol{x}\right)=0,\qquad j=1,\ldots,p
\end{aligned}
$$

Where:

- $$\boldsymbol{x}$$ is a scalar or a vector.
- $$f$$ the objective function
- The $$g_i$$s and $$h_i$$s are equality and inequality constraints.

</section><section markdown="1">

#### Some method to solve optimization problems

With out constraints:

<div class="fragment" markdown="1">
- Analytic solution
- Gradient descent / Stochastic gradient descent
</div><div class="fragment" markdown="1">

<br>

With only equality constraints:

</div><div class="fragment" markdown="1">
- Lagrangian multipliers
</div><div class="fragment" markdown="1">

<br>

With general constraints + convex:

</div><div class="fragment" markdown="1">
- Convex optimization methods
</div>

</section><section markdown="1">

#### Lagrange Multipliers

We add a set of variables $$\lambda_i$$ and define the lagrangian:

$$
\mathcal{L}\left(\boldsymbol{x},\boldsymbol{\lambda}\right) = f\left(\boldsymbol{x}\right) + \sum_i \lambda_i h_i\left(\boldsymbol{x}\right)
$$

If $$\boldsymbol{x}^*$$ is a solution of the original optimization problem, then there exist some set of values $$\boldsymbol{\lambda}^*$$s such that:

$$
\nabla_{\boldsymbol{x},\boldsymbol{\lambda}}\mathcal{L}\left(\boldsymbol{x}^*,\boldsymbol{\lambda}^*\right) = 0
$$

Therefore candidates for $$\boldsymbol{x}^*$$ can be found by differentiating and solving the above equation.

</section><section markdown="1">

### Prediction Theory

Finding a mapping $$\hat{y}=h\left(\boldsymbol{x}\right)$$ which is optimal under some criteria, based on $$f_{X,Y}\left(\boldsymbol{x},y\right)$$.

- **Classification**: $$y$$ is discrete.
  <br><br>
- **Regression**: $$y$$ is continues.

</section><section markdown="1">

#### The Common Criteria - Minimal Expected Loss

Minimizing a **risk**/**cost** function $$R$$:

$$
h^* = \underset{h}{\arg\min}\quad R\left(h\right) = \underset{h}{\arg\min}\quad E\left[l\left(h\left(\boldsymbol{x}\right),y\right)\right]
$$

<br>

If $$h$$ can be any function than:

$$
h^*\left(x\right) = \underset{\hat{y}}{\arg\min}\quad R\left(h\right) = E\left[l\left(\hat{y},y\right)\lvert X \right]
$$

<br>

If $$h$$ is a parametric function than:

$$
\theta^* = \underset{\theta}{\arg\min}\quad E\left[l\left(h_{\theta}\left(\boldsymbol{x}\right),y\right)\right]
$$

</section><section markdown="1">

#### Common Loss Function and Their Optimal Predictors

| Loss Name | Risk Name | Loss Function | Optimal Predictor |
|-----------|-----------|---------------|-------------------|
| Zero-One loss | Misclassification rate | $$l\left(y_1,y_2\right)=I\left\lbrace  y_1\neq y_2\right\rbrace$$ | $$h^*\left(x\right)=\underset{y}{\arg\max}\ f_{Y\mid X}\left(y\mid X=x\right)$$ |
| L1 | Mean absolute<br>error| $$l\left(y_1,y_2\right)=\left\vert y_1-y_2\right\vert$$ | Median: $$h^*\left(x\right)=\hat{y}$$<br>$$s.t.\ F_{Y\mid X}\left(\hat{y}\mid X=x\right)=0.5$$ |
| L2 | Mean squared<br>error (MSE) |$$l\left(y_1,y_2\right)=\left(y_1-y_2\right)^2$$ | $$h^*\left(x\right)=E_{Y\mid X}\left[y\right]$$ |
{: style="font-size:25px !important"}

Zero-one loss is usually used for classification problems and L1 & L2 for regression problems.

</section><section markdown="1">

## Distribution Estimation

### Non-Parametric Estimation

#### Estimating PMF

For discrete RV the PMF can be estimated by:

$$
\hat{p}_{X}\left(x\right)=\tfrac{1}{N}\sum_{i=1}^N I\left\lbrace x_i = x\right\rbrace
$$

</section><section markdown="1">

#### The Empirical Cumulative Distribution Function (the ECDF)

The ECDF is an estimation of the CDF and is given by:

$$
\hat{F}_{X}\left(x\right)=\tfrac{1}{N}\sum_{i=1}^N I\left\lbrace x_i \leq x\right\rbrace
$$

The ECDF results in a non-continuous CDF which is a sum of step functions.

</section><section markdown="1">

#### Histogram

The histogram is an estimation of the PDF and is given by:

- $$l_k$$, $$r_k$$ - The left and right edges of the $$k$$'s bin.

$$
h_X\left(l_k \leq x < r_k\right) = \tfrac{1}{N\cdot\left(r_k-l_k\right)}\sum_{i=1}^N I\left\lbrace l_k \leq x_i < r_k\right\rbrace
$$

A common rule of thumb for selecting the bins is to divide the range of values into $$\sqrt{N}$$ equal bins.

</section><section markdown="1">

#### Kernel Density Estimation (KDE)

KDE is an estimation of the PDF and is given by:

- $$\phi\left(x\right)$$ - the smoothing Parzen window.

$$
\hat{f}_{\phi,h,X}\left(x\right) = \frac{1}{N\cdot h}\sum_{i=1}^N \phi\left(\frac{x-x_i}{h}\right)
$$

Two commonly used Parzen windows are:

- A Gaussian: $$\frac{1}{\sqrt{2\pi}}\exp\left(-\frac{x^2}{2}\right)$$
- A rectangular function $$I\left\lbrace\left\lvert x\right\lvert\leq0.5\right\rbrace$$

A rule of thumb for selecting the bandwidth $$h$$ for the Gaussian window is: $$\left(\frac{4\cdot\text{std}\left\lbrace x_i\right\rbrace}{3N}\right)^\frac{1}{5}$$

</section><section markdown="1">

### Parametric Estimation

<br><br>

We assume that $$f$$ has a known form up to some parameters $$\boldsymbol{\theta}$$.

For example, a Gaussian with unknown mean and STD $$\boldsymbol{\theta}=\left[\mu, \sigma\right]^T$$.

</section><section markdown="1">

#### Estimating the parameters as random variables (the Bayesian point of view)

##### Maximum A Posteriori (MAP) Estimation

We assume / have a priori distribution $$f_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right)$$.

we would like to find the most probable $$\boldsymbol{\theta}$$:

$$
\boldsymbol{\theta}^*=\underset{\boldsymbol{\theta}}{\arg\max}\ f_{\boldsymbol{\Theta}\lvert\boldsymbol{X}}\left(\boldsymbol{\theta}\lvert\boldsymbol{x}\right)=\underset{\boldsymbol{\theta}}{\arg\max}\ 
f_{\boldsymbol{X}\lvert\boldsymbol{\Theta}}\left(\boldsymbol{x}\lvert\boldsymbol{\theta}\right)
f_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right)
$$

</section><section markdown="1">

#### Estimating the parameter as fixed unknowns (the Frequentist point of view)

##### Maximum Likelihood Estimation (MLE)

No prior assumption on $$\boldsymbol{\theta}^*$$.

We would like to find the most likely $$\boldsymbol{\theta}^*$$ given the data.

- The likelyhood function:  $$\mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right)=p_{\boldsymbol{X}}\left(\boldsymbol{x}\ ;\boldsymbol{\theta}\right)$$
- The log-likelyhood function: $$l\left(\boldsymbol{\theta};\boldsymbol{x}\right)=\log\left(\mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right)\right)$$

$$
\begin{aligned}
\boldsymbol{\theta}^*
& = \underset{\boldsymbol{\theta}}{\arg\max}\ \mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right) \\
& = \underset{\boldsymbol{\theta}}{\arg\min}\ -l\left(\boldsymbol{\theta};\boldsymbol{x}\right)
\end{aligned}
$$

</section><section markdown="1">

## Supervised Learning Principles

3 approaches for using the dataset to solve the problem:

<ol class="fragment">
<li markdown="1">
**The generative approach**: dataset -> $$f_{X,Y}\left(x,y\right)$$ -> $$h^*$$.
<br><br>
</li><li markdown="1" class="fragment">
**The type I discriminative approach**: dataset -> $$f_{Y\lvert X}\left(y\lvert x\right)$$ -> $$h^*$$.
<br><br>
</li><li markdown="1" class="fragment">
**The type II discriminative approach**: dataset -> $$h^*$$.
</li>
</ol>

</section><section markdown="1">

### Overfitting

<br><br>

The optimal function $$f_{X,Y}\left(x,y\right)$$, $$f_{Y\lvert X}\left(y\lvert x\right)$$ or $$h\left(x_i\right)$$ over the dataset is different than the optimal in general, therefore the optimal solution over the dataset will not generalize well to new data.

</section><section markdown="1">

#### Ways to Reduce Overfitting

##### Restricting the Search Space

Limit the space in which we look for a solution and hope to find a "good enough" solution. 

Usually done by using a parametric family of functions.

</section><section markdown="1">

#### Ways to Reduce Overfitting

##### Regularization

Add a penalty term to the optimization problem to encourage it to converge to a "simpler" solution. 

Common penalty terms are:

- **Tikhonov Regularization**: $$L2$$ norm. Encourages solutions with smaller parameters.
- **$$L1$$ Regularization**: Encourages solutions with smaller and sparser parameters.

</section><section markdown="1">

#### Ways to Reduce Overfitting

##### Bagging

Not covered in this tutorial

</section><section markdown="1">

#### The Bias vs. Variance Trade Off

The data is random therefore the generated model in random and has a:

- **Bias**: The difference between the mean (over different datasets) of the prediction and the optimal one.

- **Variance**: The variance of the prediction (over different datasets).

By using regularization or limiting the model to a small space the bias will **increase** but the variance will usually decrease. This is known as the bias vs. variance trade off.

</section><section markdown="1">

### Pre-Processing and Using Features

We can replace inputs from the measurements to any set of functions of them:

$$\varphi_i\left(\boldsymbol{x}\right)$$

<br><br>

The vector of measurements will be replace by the vector of features:

$$
\boldsymbol{\varphi}\left(\boldsymbol{x}\right)=\left[\phi_0\left(\boldsymbol{x}\right),\phi_0\left(\boldsymbol{x}\right),\ldots,\phi_{m-1}\left(\boldsymbol{x}\right)\right]^T
$$

<br><br>

And the measurements matrix will be replaced by the features matrix:

$$
\Phi=\left[\boldsymbol{\varphi}\left(\boldsymbol{x}_0\right),\boldsymbol{\varphi}\left(\boldsymbol{x}_1\right),\ldots,\boldsymbol{\varphi}\left(\boldsymbol{x}_{N-1}\right)\right]^T
$$

</section><section markdown="1">

#### Normalizing

Replacing the measurements with a version of them with zero mean and STD of 1:

$$
\varphi_j\left(\boldsymbol{x}\right) = \frac{x_j-\bar{x}_j}{\sigma_j}\qquad\bar{x}_j=\frac{1}{N}\sum_ix_{i,j}\qquad\sigma_j=\sqrt{\frac{1}{N}\sum_i\left(x_{i,j}-\bar{x}_j\right)^2}
$$

<br><br>

Important when the data comes in arbitrary scale (or units).

</section><section markdown="1">

#### Dimensionality reduction

One way of making the model "simpler" is to use smaller but more meaningful features. One way of doing so is by using the PCA algorithm.

##### Principal Component Analysis (PCA)

Finds the $$m$$ significant direction to project the data on.

- The sample-covariance matrix: $$P=\frac{1}{N}X^TX$$ (a positive semi-definite (PSD) matrix)
<br><br>
- The eigen-decomposition of $$P$$: $$P=V\Lambda V^T$$.<br>
  $$V$$ was the eigen-vectors, $$\boldsymbol{v}_i$$, of $$P$$ on each column.<br>
  $$\Lambda$$ is the a diagonal matrix of sorted eigen-values.
<br><br>
- The PCA features: $$\varphi_i\left(x\right) = \boldsymbol{v}_i^Tx\qquad i\in\left[0,\ldots,m-1\right]$$

</section><section markdown="1">

### Parameters and Hyper-Parameters

- **Parameters**: can be optimally selected using an analytic or numeric method.
<br><br>
- **Hyper-parameters**: need to be selected by running a grid search or a by trail and error.

#### Validation Set

A dataset different than the train or test set used to evaluate and select the best hyper-parameters.

#### Cross Validation

In stead of using a single validation set for selecting the hyper-parameters we can do the following:

- Divide the train set into $$K$$ subsets
- For a given set of hyper-parameters, fit the model and evaluate $$K$$ times, using a different set as a validation set each time.
- Evaluate the score of the model as the average of the K evaluations

</section><section markdown="1">

## Supervised Learning Algorithms

### Linear Least Squares<br>(LLS, also known as ordinary least squares-OLS)

- Solves: <span class="fragment" markdown="1">Regression problems with MSE risk</span>
- Approach: <span class="fragment" markdown="1">Discriminative type II</span>
- Model: <span class="fragment" markdown="1">$$h\left(x\right)=\boldsymbol{\theta}^T\boldsymbol{x}$$</span>
- Parameters: <span class="fragment" markdown="1">$$\theta$$</span>

<div class="fragment" markdown="1">
Optimization problem:

$$
\boldsymbol{\theta}^* =\underset{\boldsymbol{\theta}}{\arg\min}\ \left\lvert X\boldsymbol{\theta}-\boldsymbol{y}\right\rVert_2
$$

Has a closed form solution:

$$
\boldsymbol{\theta}^*=\left(X^TX\right)^{-1}X\boldsymbol{y}
$$
</div>

</section><section markdown="1">

#### Ridge Regression -  LLS with Tikhonov Regularization ($$L2$$)

Optimization problem:

$$
\boldsymbol{\theta}^*
= \underset{\boldsymbol{\theta}}{\arg\min}\ \left\lvert X\boldsymbol{\theta}-\boldsymbol{y}\right\rVert_2^2 +\lambda\left\lvert\boldsymbol{\theta}\right\rVert_2^2
$$

- Hyper-Parameters: $$\lambda$$

Has a closed form solution:

$$
\boldsymbol{\theta}=\left(X^TX+\lambda I\right)^{-1}X\boldsymbol{y}
$$

- Very naive model. CAn be useful in very simple problems or when very good features are used.

</section><section markdown="1">

#### Least Absolute Shrinkage and Selection Operator (LASSO) -  LLS with $$L1$$ Regularization

Optimization problem:

$$
\boldsymbol{\theta}^*
= \underset{\boldsymbol{\theta}}{\arg\min}\ \left\lvert X\boldsymbol{\theta}-\boldsymbol{y}\right\rVert_2^2 +\lambda\left\lvert\boldsymbol{\theta}\right\rVert_1
$$

- Hyper-Parameters: $$\lambda$$

Has an efficient numerical solution.

</section><section markdown="1">

### K-Nearest Neighbors (K-NN)

- Solves: <span class="fragment" markdown="1">Classification and regression problems</span>
- Approach: <span class="fragment" markdown="1">Discriminative type II</span>
- <span class="fragment" markdown="1">Non-Parametric Model</span>
- Hyper-Parameters: <span class="fragment" markdown="1">$$K$$</span>

<div class="fragment" markdown="1">
<br><br>

$$h\left(\boldsymbol{x}\right)$$ finds the $$K$$ euclidean nearest neighbors to $$\boldsymbol{x}$$ form the training set, and return the mean value for regression, or the majority vote value for classification of the the labels of the $$K$$ neighbors.

<br><br>

- Requires amount of data which is exponential in the dimension.
</div>

</section><section markdown="1">

### Linear Discriminant Analysis (LDA)

- Solves: <span class="fragment" markdown="1">Classification problems</span>
- Approach: <span class="fragment" markdown="1">Generative</span>
- Model: <span class="fragment" markdown="1">$$f_{X\lvert Y}=\frac{1}{\sqrt{\left(2\pi\right)^d\left\lvert\Sigma\right\lvert}}e^{-\frac{1}{2}\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)^T\Sigma^{-1}\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)}$$</span>
- Parameters: <span class="fragment" markdown="1">$$\Sigma$$ and $$\left\lbrace\boldsymbol{\mu}_k\right\rbrace$$</span>

<div class="fragment" markdown="1">
<br><br>

Computing the model's parameters:

$$N_k=\sum_i I\left\lbrace y_i=k\right\rbrace$$

$$p_Y\left(y=k\right)=\frac{N_k}{N}$$

$$\boldsymbol{\mu}_k = \frac{1}{N_k}\sum_{i\ \text{s.t.}\ y_i=k}\boldsymbol{x}_i$$

$$\Sigma = \frac{1}{N}\sum_{i}\left(\boldsymbol{x}_i-\boldsymbol{\mu}_{y_i}\right)\left(\boldsymbol{x}_i-\boldsymbol{\mu}_{y_i}\right)^T$$
</div>

</section><section markdown="1">

For misclassification rate:

$$
h^*\left(\boldsymbol{x}\right)=\underset{k}{\arg\max}\ f_{X\lvert Y}\left(\boldsymbol{x}\lvert y=k\right)p_Y\left(y=k\right)
$$

<br><br>

Which in the binary case reduces to:

$$
\begin{align*}
h^*\left(x\right)=
\begin{cases}
1\qquad \boldsymbol{a}^T \boldsymbol{x} + b > 0 \\
0\qquad \text{otherwise}\\
\end{cases}
\end{align*}
$$

Where:

$$\boldsymbol{a}=\Sigma^{-1}\left(\boldsymbol{\mu}_1-\boldsymbol{\mu}_0\right)$$

$$b=\tfrac{1}{2}\left(\boldsymbol{\mu}_0^T\Sigma^{-1}\boldsymbol{\mu}_0 - \boldsymbol{\mu}_1^T\Sigma^{-1}\boldsymbol{\mu}_1\right) + \log\left(\frac{p\left(y=1\right)}{p\left(y=0\right)}\right)$$

<br><br>

- Produces good results when the classes are distributed in localized groups.

</section><section markdown="1">

### Quadric Discriminant Analysis (QDA)

Similar to LDA but with a different covariance matrix for each class.

- Solves: <span class="fragment" markdown="1">Classification problems</span>
- Approach: <span class="fragment" markdown="1">Generative</span>
- Model: <span class="fragment" markdown="1">$$f_{X\lvert Y}=\frac{1}{\sqrt{\left(2\pi\right)^d\left\lvert\Sigma_y\right\rVert}}e^{-\frac{1}{2}\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)^T\Sigma^{-1}_y\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)}$$</span>
- Parameters: <span class="fragment" markdown="1">$$\left\lbrace\Sigma_y\right\rbrace$$ and $$\left\lbrace\boldsymbol{\mu}_k\right\rbrace$$</span>

<div class="fragment" markdown="1">
<br><br>

Computing the model's parameters is similar to LDA but with:

$$
\Sigma_k = \frac{1}{N_k}\sum_{i\ \text{s.t.}\ y_i=k}\left(\boldsymbol{x}_i-\boldsymbol{\mu}_k\right)\left(\boldsymbol{x}_i-\boldsymbol{\mu}_k\right)^T
$$
</div>

</section><section markdown="1">

For misclassification rate:

$$
h^*\left(\boldsymbol{x}\right)=\underset{k}{\arg\max}\ f_{X\lvert Y}\left(\boldsymbol{x}\lvert y=k\right)p_Y\left(y=k\right)
$$

<br><br>

Which in the binary case reduces to:

$$
\begin{align*}
h^*\left(x\right)
& =
\begin{cases}
0\qquad \boldsymbol{x}^T C \boldsymbol{x} + \boldsymbol{a}^T \boldsymbol{x} + b > 0 \\
1\qquad \text{otherwise}\\
\end{cases}
\end{align*}
$$

Where:

$$C=\tfrac{1}{2}\left(\Sigma_0^{-1}-\Sigma_1^{-1}\right)$$

$$\boldsymbol{a}=\Sigma_1^{-1}\boldsymbol{\mu}_1-\Sigma_0^{-1}\boldsymbol{\mu}_0$$

$$b=\tfrac{1}{2}\left(\boldsymbol{\mu}_1^T\Sigma_1^{-1}\boldsymbol{\mu}_1 - \boldsymbol{\mu}_0^T\Sigma_0^{-1}\boldsymbol{\mu}_0\right) + \log\left(\frac{\left\lvert\Sigma_0\right\rVert^{1/2}p\left(y=1\right)}{\left\lvert\Sigma_1\right\rVert^{1/2}p\left(y=0\right)}\right)$$

</section><section markdown="1">

### Linear Logistic Regression

- Solves: <span class="fragment" markdown="1">Classification problems</span>
- Approach: <span class="fragment" markdown="1">Discriminative type I</span>
- Model:
  <div class="fragment" markdown="1">
  
  $$f_{Y\lvert X}\left(Y=y\lvert X=x\right)=\frac{e^{\boldsymbol{\theta}_y^T\boldsymbol{x}}}{\sum_\tilde{y}e^{\boldsymbol{\theta}_\tilde{y}^T\boldsymbol{x}}}$$

  </div>
- Parameters: <span class="fragment" markdown="1">$$\left\lbrace\boldsymbol{\theta}_k\right\rbrace$$. Without loss of generality we can set $$\boldsymbol{\theta}_0=0$$</span>
- Hyper-Parameters: <span class="fragment" markdown="1">the optimization solver parameters.</span>

<div class="fragment" markdown="1">
<br><br>

Optimization problem (MLE):

$$
\boldsymbol{\theta}^* =\underset{\boldsymbol{\theta}}{\arg\max}\ \prod_i\frac{e^{\boldsymbol{\theta}_y^T\boldsymbol{x_i}}}{\sum_\tilde{y}e^{\boldsymbol{\theta}_\tilde{y}^T\boldsymbol{x_i}}}
$$

Solved using gradient decent
</div>

</section><section markdown="1">

in the binary case reduces to:

$$f_{Y\lvert X}=\frac{1}{1+e^{-\boldsymbol{\theta}^T\boldsymbol{x}}}$$

<br><br>

For misclassification rate:

$$
h^*\left(\boldsymbol{x}\right)=\underset{k}{\arg\max}\ \boldsymbol{\theta}_k^T\boldsymbol{x}
$$

</section><section markdown="1">

### Multi Layer Perceptron (MLP)

- Solves:
  <ul class="fragment" markdown="1">
  <li>Regression - By using a discriminative type II approach</li>
  <li>Classification - By using a discriminative type I approach</li>
  </ul>
- Model: <span class="fragment" markdown="1">A neural network of fully connected layers.</span>
<br><br>
- Parameters: <span class="fragment" markdown="1">The weights of the fully connected layers</span>
<br><br>
- Hyper-Parameters: <span class="fragment" markdown="1">The number of layers and the width of each layer + the optimization solver parameters.</span>
<div class="fragment" markdown="1">
<br><br>
- Solved using gradient decent (using back-propagation).

- Usually has a lot of parameters and tends to overfit.
</div>

</section><section markdown="1">

### Convolutional Neural Network (CNN)

- Solves:
  <ul class="fragment" markdown="1">
  <li>Regression - By using a discriminative type II approach</li>
  <li>Classification - By using a discriminative type I approach</li>
  </ul>
- Model: <span class="fragment" markdown="1">A neural network of convolutional layers and fully connected layers.</span>
<br><br>
- Parameters: <span class="fragment" markdown="1">The weights of the layers</span>
<br><br>
- Hyper-Parameters: <span class="fragment" markdown="1">The number of layers and the parameters of each layer.</span>
<div class="fragment" markdown="1">
<br><br>
- Solved using gradient decent (using back-propagation).

<br><br>

Works very well when the data has some spatial structure.
</div>

</section><section markdown="1">

### Support Vector Machine (SVM)

#### Hard SVM

- Solves: <span class="fragment" markdown="1">Binary Classification problems.</span>
<br><br>
- Approach: <span class="fragment" markdown="1">Discriminative type II.</span>
<br><br>
- Model: <span class="fragment" markdown="1">$$h^*\left(\boldsymbol{x}\right)=\text{sign}\left(\boldsymbol{\theta}^T\boldsymbol{x}\right)$$</span>
<br><br>
- Parameters: <span class="fragment" markdown="1">$$\boldsymbol{\theta}$$</span>
<div markdown="1" class="fragment">
<br><br>
- Solved using convex optimization methods.

- Works very well when the data is linearly separable.
</div>

</section><section markdown="1">

### Support Vector Machine (SVM)

#### Soft SVM

- Solves: <span class="fragment" markdown="1">Binary Classification problems.</span>
<br><br>
- Approach: <span class="fragment" markdown="1">Discriminative type II.</span>
<br><br>
- Model: <span class="fragment" markdown="1">$$h^*\left(\boldsymbol{x}\right)=\text{sign}\left(\boldsymbol{\theta}^T\boldsymbol{x}\right)$$</span>
<br><br>
- Adds slack variables in the optimization process to deal with data which is not linearly separable.
<br><br>
- Parameters: <span class="fragment" markdown="1">$$\boldsymbol{\theta}$$</span>
<br><br>
- Hyper-parameters: <span class="fragment" markdown="1">The weighting of the slack variables.</span>
<div class="fragment" markdown="1">
<br>
- Solved using convex optimization methods.

Works very well when the data is close to being linearly separable.

</div>
</section><section markdown="1">

### Decision Trees

- Solves: <span class="fragment" markdown="1">Regression or classification</span>
<br><br>
- Approach: <span class="fragment" markdown="1">Discriminative type II</span>
<br><br>
- Model: <span class="fragment" markdown="1">a decision tree</span>
<br><br>
- Parameters: <span class="fragment" markdown="1">the decision on brach branch</span>
<br><br>
- Hyper-parameters: <span class="fragment" markdown="1">The number of branches / stopping criteria and the metric.</span>

</section><section markdown="1">

construction by a top down greedy approach for the branches:

<br><br>

1. For each possible decision i$$A$$ calculate the resulting sub-datasets $$\left\lbrace D_1,D_2,\ldots,D_M\right\rbrace$$.
<br><br>
2. Evaluate the selected impurity metric on each sub dataset: $$Q\left(D_m\right)$$
<br><br>
3. Evaluate the weighted impurity of the decision as $$\sum_{m=1}^M \frac{\left\lvert D_m\right\rvert}{N}Q\left(D_m\right)$$
<br><br>
4. Select the decision with the lowest weighted impurity

</section><section markdown="1">

#### Popular metrics

We define the empirical probability of class $$j$$ in a dataset as $$p_j=\frac{1}{N}\sum_{i=1}^N I\left\lbrace y_i=j\right\rbrace$$.

<br>

Some popular impurity metrics are:

- Misclassification: $$Q\left(D\right)=1-\underset{j}\max\ p_j$$
<br><br>
- Gini: $$Q\left(D\right)=\sum_j p_j\left(1-p_j\right)$$
<br><br>
- Entropy: $$Q\left(D\right)\left(=H\left(D\right)\right)=\sum_j p_j\log\left(\frac{1}{p_j}\right)$$

</section><section markdown="1">

## Other subjects which are missing out

- Perceptron
<br><br>
- Bagging
<br><br>
- Boosting
<br><br>
- K-Means
<br><br>
- Kernel methods

</section>
