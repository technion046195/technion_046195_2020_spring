---
---
# Cheat Sheet

## Mathematical Notations

- **Scalar**: Non-bold lower case letter. Example $$y$$
- **Column vector**: Bold lower case letter. Example $$\boldsymbol{x}$$
- **Matrix**: Upper case letter. Example $$A$$
- **A set of scalars/vectors**: Curly brackets. Example $$\left\lbrace2, 3, 5, 7\right\rbrace$$, $$\left\lbrace y_i\right\rbrace$$ or $$\left\lbrace\boldsymbol{x}_i\right\rbrace$$
- **An element of a vector, a matrix or a set**: Subscript index. Example $$x_i$$ or $$a_{i,j}$$
- **The value in an iterative process**: Superscript index in parentheses. Example $$\theta^{\left(t\right)}$$

## Probability Notations

- **A single random sample**: $$\omega$$
- **A random variable (RV)**: $$X\left(\omega\right)$$ (usually shorten to $$X$$. Note that capital letters are also used for matrices)
- **A realization of an RV**: $$x=X\left(\omega\right)$$
- **The probability of an event** $$Pr\left(0.2<X<0.6\right)$$
- **Probability Mass Function (PMF)**: (for a discrete RV) $$p_X\left(x\right)=Pr\left(X=x\right)$$
- **Cumulative Distribution Function (CDF)**: $$F_X\left(x\right)=Pr\left(X\leq x\right)$$
- **Probability Density Function (PDF)**: $$f_X\left(x\right)$$ define by $$F_X\left(x\right)=\int_{-\infty}^xf_Xdx$$

## Common notation to describe a dataset:

- $$N$$ - The number of samples in a dataset.
- $$d$$ The dimension of the data.
- $$\boldsymbol{x}$$ - A vector of measured values related to a single sample.
- $$\left\lbrace\boldsymbol{x}_i\right\rbrace$$ - The set of measurements in a dataset.
- $$X$$ - The matrix of measurements $$\left[\boldsymbol{x}_0,\boldsymbol{x}_1,\ldots,\boldsymbol{x}_{N-1}\right]^T$$.

 (Note that $$X$$ is also sometime used as the random variable generating $$\boldsymbol{x}$$).
- $$x_{i,j}$$ - The $$j$$-th element of the $$i$$-th measurement (which is the $$\left(i,j\right)$$-th element of the matrix $$X$$).
- $$\left\lbrace  y_i\right\rbrace$$ - The set of labels in a dataset.
- $$\boldsymbol{y}$$ - the vector of labels $$\left[y_0,y_1,\ldots,y_{N-1}\right]^T$$.
- $$y_i$$ - The $$i$$-th label (which is the $$i$$-th element of the vector $$\boldsymbol{y}$$).
