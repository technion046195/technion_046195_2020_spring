---
number: 13
title: "Summary" 
hide: True
---

## Background

### Mathematical Notations

- **Scalar**: Non-bold lower case letter. Example $$y$$
- **Column vector**: Bold lower case letter. Example $$\boldsymbol{x}$$
- **Matrix**: Upper case letter. Example $$A$$
- **A set of scalars/vectors**: Curly brackets. Example $$\left\lbrace\boldsymbol{x}_i\right\rbrace$$ or $$\left\lbrace y_i\right\rbrace$$
- **An element of a vector, a matrix or a set**: Subscript index. Example $$x_i$$ or $$a_{i,j}$$
- **The value in an iterative process**: Superscript index in parentheses. Example $$\theta^{\left(t\right)}$$

### Probability Notations

- **A single random sample**: $$\omega$$
- **A random variable (RV)**: $$X\left(\omega\right)$$ (usually shorten to $$X$$. Note that capital letters are also used for matrices)
- **A realization of an RV**: $$x=X\left(\omega\right)$$
- **The probability of an event** $$Pr\left(0.2<X<0.6\right)$$
- **Probability Mass Function (PMF)**: (for a discrete RV) $$p_X\left(x\right)=Pr\left(X=x\right)$$
- **Cumulative Distribution Function (CDF)**: $$F_X\left(x\right)=Pr\left(X\leq x\right)$$
- **Probability Density Function (PDF)**: $$f_X\left(x\right)$$ define by $$F_X\left(x\right)=\int_{-\infty}^xf_Xdx$$

### Common notation to describe a dataset:

- $$N$$ - The number of samples in a dataset.
- $$d$$ The dimension of the data.
- $$\boldsymbol{x}$$ - A vector of measured values related to a single sample.
- $$\left\lbrace\boldsymbol{x}_i\right\rbrace$$ - The set of measurements in a dataset.
- $$X$$ - The matrix of measurements $$\left[\boldsymbol{x}_0,\boldsymbol{x}_1,\ldots,\boldsymbol{x}_{N-1}\right]^T$$.

 (Note that $$X$$ is also used as the a random variable generating $$\boldsymbol{x}$$).
- $$x_{i,j}$$ - The $$j$$-th element of the $$i$$-th measurement (which is the $$\left(i,j\right)$$-th element of the matrix $$X$$).
- $$\left\lbrace  y_i\right\rbrace$$ - The set of labels in a dataset.
- $$\boldsymbol{y}$$ - the vector of labels $$\left[y_0,y_1,\ldots,y_{N-1}\right]^T$$.
- $$y_i$$ - The $$i$$-th label (which is the $$i$$-th element of the vector $$\boldsymbol{y}$$).

### Optimization Problems

Optimization problems have the following form:

$$
\boldsymbol{x}^*=\underset{\boldsymbol{x}}{\arg\min}\quad f\left(\boldsymbol{x}\right) \\
\begin{aligned}
\text{subject to}\quad
& g_i\left(\boldsymbol{x}\right)\leq 0,\qquad i=1,\ldots,m \\
& h_j\left(\boldsymbol{x}\right)=0,\qquad j=1,\ldots,p
\end{aligned}
$$

Where:

- $$\boldsymbol{x}$$ is either a scalar or a vector.
- $$f$$ is some arbitrary function (usually referred to as the objective function)
- The $$g_i$$s and $$h_i$$s are optional additional equality and inequality constraints on $$\boldsymbol{x}$$.

The optimal solution of an optimization problem is commonly denoted by "$$*$$": for example: $$x^*$$

#### Some method to solve optimization problems

With out constraints:

- Analytic solution
- Gradient descent / Stochastic gradient descent

With only equality constraints:

- Lagrangian multipliers

With general constraints + convex:

- Convex optimization methods

#### Lagrange Multipliers

An optimization problem with equality constraints can be solved by adding a set of variables $$\lambda_i$$, one for each constraint, and define the lagrangian:

$$
\mathcal{L}\left(\boldsymbol{x},\boldsymbol{\lambda}\right) = f\left(\boldsymbol{x}\right) + \sum_i \lambda_i h_i\left(\boldsymbol{x}\right)
$$

If $$\boldsymbol{x}^*$$ is a solution of the original optimization problem, then there exist some set of values $$\boldsymbol{\lambda}^*$$s such that:

$$
\nabla_{\boldsymbol{x},\boldsymbol{\lambda}}\mathcal{L}\left(\boldsymbol{x}^*,\boldsymbol{\lambda}^*\right) = 0
$$

Therefore candidates for $$\boldsymbol{x}^*$$ can be found by differentiating and solving the above equation.

### Prediction Theory

The problem of coming up with a mapping $$\hat{y}=h\left(\boldsymbol{x}\right)$$ which is optimal under some criteria, based on the joint distribution $$f_{X,Y}\left(\boldsymbol{x},y\right)$$.

- **Classification**: $$y$$ is discrete.
- **Regression**: $$y$$ is continues.

#### The Common Criteria - Minimal Expected Loss

Minimizing the **risk**/**cost** function $$R$$, which is defined as defined as the expectation value of some loss function $$l$$:

$$
h^* = \underset{h}{\arg\min}\quad R\left(h\right) = \underset{h}{\arg\min}\quad E\left[l\left(h\left(\boldsymbol{x}\right),y\right)\right]
$$

If $$h$$ can be any function than:

$$
h^*\left(x\right) = \underset{\hat{y}}{\arg\min}\quad R\left(h\right) = E\left[l\left(\hat{y},y\right)\lvert X \right]
$$

If $$h$$ is a parametric function than:

$$
\theta^* = \underset{\theta}{\arg\min}\quad E\left[l\left(h_{\theta}\left(\boldsymbol{x}\right),y\right)\right]
$$

#### Common Loss Function and Their Optimal Predictors

| Loss Name | Risk Name | Loss Function | Optimal Predictor |
|-----------|-----------|---------------|-------------------|
| Zero-One loss | Misclassification rate | $$l\left(y_1,y_2\right)=I\left\lbrace  y_1\neq y_2\right\rbrace$$ | $$h^*\left(x\right)=\underset{y}{\arg\max}\ f_{Y\mid X}\left(y\mid X=x\right)$$ |
| L1 | Mean absolute<br>error| $$l\left(y_1,y_2\right)=\left\vert y_1-y_2\right\vert$$ | Median: $$h^*\left(x\right)=\hat{y}$$<br>$$s.t.\ F_{Y\mid X}\left(\hat{y}\mid X=x\right)=0.5$$ |
| L2 | Mean squared<br>error (MSE) |$$l\left(y_1,y_2\right)=\left(y_1-y_2\right)^2$$ | $$h^*\left(x\right)=E_{Y\mid X}\left[y\right]$$ |

Zero-one loss is usually used for classification problems and L1 & L2 for regression problems.

## Distribution Estimation

### Non-Parametric Estimation

#### Estimating PMF

For discrete RV the PMF can be estimated by:

$$
\hat{p}_{X}\left(x\right)=\tfrac{1}{N}\sum_{i=1}^N I\left\lbrace x_i = x\right\rbrace
$$

#### The Empirical Cumulative Distribution Function (the ECDF)

The ECDF is an estimation of the CDF and is given by:

$$
\hat{F}_{X}\left(x\right)=\tfrac{1}{N}\sum_{i=1}^N I\left\lbrace x_i \leq x\right\rbrace
$$

The ECDF results in a non-continuous CDF which is a sum of step functions.

#### Histogram

The histogram is an estimation of the PDF and is given by:

- $$l_k$$, $$r_k$$ - The left and right edges of the $$k$$'s bin.

$$
h_X\left(l_k \leq x < r_k\right) = \tfrac{1}{N\cdot\left(r_k-l_k\right)}\sum_{i=1}^N I\left\lbrace l_k \leq x_i < r_k\right\rbrace
$$

A common rule of thumb for selecting the bins is to divide the range of values into $$\sqrt{N}$$ equal bins.

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

### Parametric Estimation

In parametric estimation we assume that $$f$$ has a known form up to some parameters $$\boldsymbol{\theta}$$. For example, a Gaussian with unknown mean and STD (in this case $$\boldsymbol{\theta}=\left[\mu, \sigma\right]^T$$).

#### Estimating the parameters as random variables (the Bayesian point of view)

##### Maximum A Posteriori Estimation

We have an assumption on the a priori distribution $$f_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right)$$ of $$\boldsymbol{\theta}$$ and we would like to fine the most probable $$\boldsymbol{\theta}$$ given the data in the dataset. I.e. we would like to solve the following optimization problem:

$$
\boldsymbol{\theta}^*=\underset{\boldsymbol{\theta}}{\arg\max}\ f_{\boldsymbol{\Theta}\lvert\boldsymbol{X}}\left(\boldsymbol{\theta}\lvert\boldsymbol{x}\right)=\underset{\boldsymbol{\theta}}{\arg\max}\ 
f_{\boldsymbol{X}\lvert\boldsymbol{\Theta}}\left(\boldsymbol{x}\lvert\boldsymbol{\theta}\right)
f_{\boldsymbol{\Theta}}\left(\boldsymbol{\theta}\right)
$$

#### Estimating the parameter as fixed unknowns (the Frequentist point of view)

### Maximum Likelihood Estimation (MLE)

Here we have no prior assumption on $$\boldsymbol{\theta}^*$$ and we would like to find the most likely $$\boldsymbol{\theta}^*$$ given the data.

- The likelyhood function is defined as: $$\mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right)=p_{\boldsymbol{X}}\left(\boldsymbol{x}\ ;\boldsymbol{\theta}\right)$$
- The log-likelyhood is define as $$l\left(\boldsymbol{\theta};\boldsymbol{x}\right)=\log\left(\mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right)\right)$$

We would there for want to solve the following optimization problem:

$$
\begin{aligned}
\boldsymbol{\theta}^*
& = \underset{\boldsymbol{\theta}}{\arg\max}\ \mathcal{L}\left(\boldsymbol{\theta};\boldsymbol{x}\right) \\
& = \underset{\boldsymbol{\theta}}{\arg\min}\ -l\left(\boldsymbol{\theta};\boldsymbol{x}\right)
\end{aligned}
$$

## Supervised Learning Principles

Making Predictions for an Unknown Distribution Using a Dataset. There are 3 approaches for using the dataset to solve the problem:

1. **The generative approach**: Use the dataset to infer the joint distribution $$f_{X,Y}\left(x,y\right)$$. Then use the joint distribution to find the optimal predictor $$h^*$$.
  In classification problems we will usually decompose $$f_{X,Y}$$ into $$f_{X,Y}\left(x,y\right)=f_{X\lvert Y}\left(x\lvert y\right)f_Y\left(y\right)$$
2. **The type I discriminative approach**: Use the data to infer the conditional distribution $$f_{Y\lvert X}\left(y\lvert x\right)$$. Then use the conditional distribution to find the optimal predictor $$h^*$$.
3. **The type II discriminative approach**: Use the data to directly find $$h^*$$ by using some direct method or by solving the optimization problem through replacing the risk's expectation value with an empirical equivalent.

For example, empirical risk minimization (ERM):

$$
h^*=\underset{h}{\arg\min}\ \frac{1}{N}\sum_il\left(h\left(x_i\right),y_i\right)
$$

### Overfitting

When looking for the optimal function $$f_{X,Y}\left(x,y\right)$$, $$f_{Y\lvert X}\left(y\lvert x\right)$$ or $$h\left(x_i\right)$$ in the range of all function, we are most likely find a solution which is extremely optimal for the specific dataset but is far from optimal for any other dataset drawn from the same distribution. We would like to find a solution which generalizes well, i.e. will produce reasonable results for any dataset drawn from the data's (usually unknown) distribution.

#### Ways to Reduce Overfitting

##### Restricting the Search Space

We can limit the space in which we look for a solution. The smaller space might not contain the optimal solution, but will hopefully contain a "good enough" approximation of it. One way to do so is by using a parametric family of functions.

##### Regularization

Add a penalty term to the optimization problem to encourage it to converge to a "simpler" solution. Common penalty terms are:

- **Tikhonov Regularization**: adding the $$L2$$ norm of the parameters vector to the optimization. Encourages the algorithm to select a solution with smaller parameters.
- **$$L1$$ Regularization**: adding the $$L1$$ norm of the parameters vector to the optimization. Encourages the algorithm to select a solution with smaller and sparser set of parameters.

#### The Bias vs. Variance Trade Off

Since the data is randomly generated the resulting prediction function, which is calculated from the data is random as well.

- **Bias**: The difference between the mean (over different datasets) of the prediction and the optimal one.
- **Variance**: The variance of the prediction (over different datasets).

When pushing/limiting the algorithm to a specific subset of solutions, the result will usually by a worse approximation of the optimal solution, and will increase the bias of the solution. On the other hand, it will make the algorithm less sensitive to the specific value of each single data point and therefore will reduce the variance. This is known as the bias vs. variance trade off.

### Pre-Processing and Using Features

When selecting a model we can always change the input to the model from the measurements themselves to any set of functions of the measurements, $$\varphi_i\left(\boldsymbol{x}\right)$$, called features.

The vector of measurements will be replace by the vector of features:
$$
\boldsymbol{\varphi}\left(\boldsymbol{x}\right)=\left[\phi_0\left(\boldsymbol{x}\right),\phi_0\left(\boldsymbol{x}\right),\ldots,\phi_{m-1}\left(\boldsymbol{x}\right)\right]^T
$$

And the measurements matrix will be replaced by the features matrix:

$$
\Phi=\left[\boldsymbol{\varphi}\left(\boldsymbol{x}_0\right),\boldsymbol{\varphi}\left(\boldsymbol{x}_1\right),\ldots,\boldsymbol{\varphi}\left(\boldsymbol{x}_{N-1}\right)\right]^T
$$

An example: we take $$h$$ to be a linear function of the features and use the powers of $$x$$ up to the $$10$$-th order as our features.

#### Normalizing

Replacing the measurements with a version of them with zero mean and STD of 1:

$$
\varphi_j\left(\boldsymbol{x}\right) = \frac{x_j-\bar{x}_j}{\sigma_j}\qquad\bar{x}_j=\frac{1}{N}\sum_ix_{i,j}\qquad\sigma_j=\sqrt{\frac{1}{N}\sum_i\left(x_{i,j}-\bar{x}_j\right)^2}
$$

This is important when the data comes in arbitrary scale (or units) and the algorithm is sensitive to distances between points.

#### Dimensionality reduction

One way of making the model "simpler" is to use a smaller but more meaningful set of input features. One way of doing so is by using the PCA algorithm.

##### Principal Component Analysis (PCA)

A linear projection of the data on to the $$m$$ most significant direction in the data space.

The sample-covariance matrix:

$$
P=\frac{1}{N}X^TX
$$

($$P$$ is a positive semi-definite (PSD) matrix)

The eigen-decomposition of $$P$$:

$$
P=V\Lambda V^T
$$

Where $$V$$ is the unitary matrix with the eigen-vectors, $$\boldsymbol{v}_i$$, of $$P$$ on each column and $$\Lambda$$ is the a diagonal matrix with the eigen-values on the diagonal sorted from large to small.

The PCA projection is performed by projecting a measurements vector onto the $$m$$ first columns of $$V$$ (the eiven-vector which correspond to the largest eigen-values).

$$
\varphi_i\left(x\right) = \boldsymbol{v}_i^Tx\qquad i\in\left[0,\ldots,m-1\right]
$$

### Parameters and Hyper-Parameters

Usually an algorithm will have some parameters which can be optimally selected using an analytic or numeric method, and some parameter which will have to be selected by running a grid search or a by trail and error. These parameters are refer to to as **hyper-parameters**.

#### Validation Set

Evaluation of the hyper-parameters is usually done on a validation set different then the train and the test sets.

#### Cross Validation

In stead of using a designated validation-set we can divide the train set into $$K$$ subsets and repeat the evaluation $$K$$ times, each time using a different subset as the validation set and average the results.

## Supervised Learning Algorithms

### Linear Least Squares (LLS, also known as ordinary least squares-OLS)

- Solves: Regression problems with MSE risk
- Approach: Discriminative type II
- Model: $$h\left(x\right)=\boldsymbol{\theta}^T\boldsymbol{x}$$
- Parameters: $$\theta$$

Optimization problem:

$$
\boldsymbol{\theta}^* =\underset{\boldsymbol{\theta}}{\arg\min}\ \left\lvert X\boldsymbol{\theta}-\boldsymbol{y}\right\rVert_2
$$

Has a closed form solution:

$$
\boldsymbol{\theta}^*=\left(X^TX\right)^{-1}X\boldsymbol{y}
$$

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

#### Least Absolute Shrinkage and Selection Operator (LASSO) -  LLS with $$L1$$ Regularization

Optimization problem:

$$
\boldsymbol{\theta}^*
= \underset{\boldsymbol{\theta}}{\arg\min}\ \left\lvert X\boldsymbol{\theta}-\boldsymbol{y}\right\rVert_2^2 +\lambda\left\lvert\boldsymbol{\theta}\right\rVert_1
$$

- Hyper-Parameters: $$\lambda$$

Has an efficient numerical solution.

### K-Nearest Neighbors (K-NN)

- Solves: Classification and regression problems
- Approach: Discriminative type II
- Non-Parametric Model
- Hyper-Parameters: $$K$$

$$h\left(\boldsymbol{x}\right)$$ finds the $$K$$ euclidean nearest neighbors to $$\boldsymbol{x}$$ form the training set, and return the mean value for regression, or the majority vote value for classification of the the labels of the $$K$$ neighbors.

- Requires amount of data which is exponential in the dimension.

### Linear Discriminant Analysis (LDA)

- Solves: Classification problems
- Approach: Generative
- Model: $$f_{X\lvert Y}=\frac{1}{\sqrt{\left(2\pi\right)^d\left\lvert\Sigma\right\lvert}}e^{-\frac{1}{2}\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)^T\Sigma^{-1}\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)}$$
- Parameters: $$\Sigma$$ and $$\left\lbrace\boldsymbol{\mu}_k\right\rbrace$$

Computing the model's parameters:

$$N_k=\sum_i I\left\lbrace y_i=k\right\rbrace$$

$$p_Y\left(y=k\right)=\frac{N_k}{N}$$

$$\boldsymbol{\mu}_k = \frac{1}{N_k}\sum_{i\ \text{s.t.}\ y_i=k}\boldsymbol{x}_i$$

$$\Sigma = \frac{1}{N}\sum_{i}\left(\boldsymbol{x}_i-\boldsymbol{\mu}_{y_i}\right)\left(\boldsymbol{x}_i-\boldsymbol{\mu}_{y_i}\right)^T$$

For misclassification rate:

$$
h^*\left(\boldsymbol{x}\right)=\underset{k}{\arg\max}\ f_{X\lvert Y}\left(\boldsymbol{x}\lvert y=k\right)p_Y\left(y=k\right)
$$

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

- Produces good results when the data distribution of each class can be well approximated by a Gaussian (mainly when it is concentrated in and oval like area)

### Quadric Discriminant Analysis (QDA)

Similar to LDA but with a different covariance matrix for each class.

- Solves: Classification problems
- Approach: Generative
- Model: $$f_{X\lvert Y}=\frac{1}{\sqrt{\left(2\pi\right)^d\left\lvert\Sigma_y\right\rVert}}e^{-\frac{1}{2}\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)^T\Sigma^{-1}_y\left(\boldsymbol{x}-\boldsymbol{\mu}_y\right)}$$
- Parameters: $$\left\lbrace\Sigma_y\right\rbrace$$ and $$\left\lbrace\boldsymbol{\mu}_k\right\rbrace$$

Computing the model's parameters is similar to LDA but with:

$$
\Sigma_k = \frac{1}{N_k}\sum_{i\ \text{s.t.}\ y_i=k}\left(\boldsymbol{x}_i-\boldsymbol{\mu}_k\right)\left(\boldsymbol{x}_i-\boldsymbol{\mu}_k\right)^T
$$

For misclassification rate:

$$
h^*\left(\boldsymbol{x}\right)=\underset{k}{\arg\max}\ f_{X\lvert Y}\left(\boldsymbol{x}\lvert y=k\right)p_Y\left(y=k\right)
$$

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

### Linear Logistic Regression

- Solves: Classification problems
- Approach: Discriminative type I
- Model:
  
  $$f_{Y\lvert X}\left(Y=y\lvert X=x\right)=\frac{e^{\boldsymbol{\theta}_y^T\boldsymbol{x}}}{\sum_\tilde{y}e^{\boldsymbol{\theta}_\tilde{y}^T\boldsymbol{x}}}$$

- Parameters: $$\left\lbrace\boldsymbol{\theta}_k\right\rbrace$$. Without loss of generality we can set $$\boldsymbol{\theta}_0=0$$
- Hyper-Parameters: the optimization solver parameters.

Optimization problem (MLE):

$$
\boldsymbol{\theta}^* =\underset{\boldsymbol{\theta}}{\arg\max}\ \prod_i\frac{e^{\boldsymbol{\theta}_y^T\boldsymbol{x_i}}}{\sum_\tilde{y}e^{\boldsymbol{\theta}_\tilde{y}^T\boldsymbol{x_i}}}$$
$$

- Solved using gradient decent

in the binary case reduces to:

$$f_{Y\lvert X}=\frac{1}{1+e^{-\boldsymbol{\theta}^T\boldsymbol{x}}}$$

For misclassification rate:

$$
h^*\left(\boldsymbol{x}\right)=\underset{k}{\arg\max}\ \boldsymbol{\theta}_k^T\boldsymbol{x}
$$

### Multi Layer Perceptron (MLP)

- Solves:
  - Regression - By using a discriminative type II approach
  - Classification - By using a discriminative type I approach
- Model: A neural network of fully connected layers.
- Parameters: The weights of the fully connected layers
- Hyper-Parameters: The number of layers and the width of each layer + the optimization solver parameters.
- Solved using gradient decent (using back-propagation).

- Usually has a lot of parameters and tends to overfit.

### Convolutional Neural Network (CNN)

- Solves:
  - Regression - By using a discriminative type II approach
  - Classification - By using a discriminative type I approach
- Model: A neural network of convolutional layers and fully connected layers.
- Parameters: The weights of the layers
- Hyper-Parameters: The number of layers and the parameters of each layer.
- Solved using gradient decent (using back-propagation).

- Works very well when the data has some spatial structure.

### Support Vector Machine (SVM)

#### Hard SVM

- Solves: Binary Classification problems.
- Approach: Discriminative type II.
- Model: $$h^*\left(\boldsymbol{x}\right)=\text{sign}\left(\boldsymbol{\theta}^T\boldsymbol{x}\right)$$
- Parameters: $$\boldsymbol{\theta}$$
- Solved using convex optimization methods.

- Works very well when the data is linearly separable.

#### Soft SVM

- Solves: Binary Classification problems.
- Approach: Discriminative type II.
- Model: $$h^*\left(\boldsymbol{x}\right)=\text{sign}\left(\boldsymbol{\theta}^T\boldsymbol{x}\right)$$
- Adds slack variables in the optimization process to deal with data which is not linearly separable.
- Parameters: $$\boldsymbol{\theta}$$
- Hyper-parameters: The weighting of the slack variables.
- Solved using convex optimization methods.

- Works very well when the data is close to being linearly separable.

### Decision Trees

- Solves: Regression or classification
- Discriminative type II
- Model a decision tree
- Parameters: the decision on brach branch
- Hyper-parameters: The number of branches / stopping criteria and the metric.
- Tree is constructed top down in a greedy approach by selecting at each branch the decision in the following way:

1. For each possible decision i$$A$$ calculate the resulting sub-datasets $$\left\lbrace D_1,D_2,\ldots,D_M\right\rbrace$$.
2. Evaluate the selected impurity metric on each sub dataset: $$Q\left(D_m\right)$$
3. Evaluate the weighted impurity of the decision as $$\sum_{m=1}^M \frac{\left\lvert D_m\right\rvert}{N}Q\left(D_m\right)$$
4. Select the decision with the lowest weighted impurity

#### Popular metrics

## Other subjects which are missing out

- Perceptron
- Bagging
- Boosting
- K-Means
- Kernel methods
