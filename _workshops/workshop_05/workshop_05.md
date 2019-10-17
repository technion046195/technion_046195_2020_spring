---
number: 5
title: "K-NN" 
---
{% raw %}
## 👨 1-Nearest Neighbors (1-NN)

1-NN is a supervised algorithm solving a classification problem. It is probably the most simple supervised classification algorithm, and it works as follow:

Given a data set $\left\lbrace\boldsymbol{x}_i\right\rbrace$ with corresponding labels $\left\lbrace y_i\right\rbrace$ the algorithm maps any new vector $\tilde{\boldsymbol{x}}$ to the label corresponding to the closest $\boldsymbol{x}_i$:

$$
\hat{i} = \underset{i}{\arg\min}\left\lVert \tilde{\boldsymbol{x}} - \boldsymbol{x}_i\right\lVert_2 \\
\hat{y} = y_\hat{i}
$$

## 👫👬 K-Nearest Neighbors (K-NN)

K-NN is a simple extension of the basic 1-NN, where instead just using the single closest neighbor, we will use the $K$ nearest neighbors. After retrieving the $K$ nearest points we will take the majority vote (the most common label among the $K$ samples) to be our prediction.

<center><h1 class="workshop-title">Workshop 5<br>K-NN</h1></center>

## 🦠 Dataset: Breast Cancer Wisconsin

One of the methods which are used today to diagnose cancer is through a procedure called **Fine-needle aspiration (FNA)**. In this procedure a sample of the tissue in question is extracted using a needle, and is then investigated under a microscope to determine whether the tissue is:

- Malignant - cancerous tissue
- or Benign - non-cancerous tissue

An example of a sample collected using FNA:

<center><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Adenoid_cystic_carcinoma_cytology.jpg/1024px-Adenoid_cystic_carcinoma_cytology.jpg" width="500px" style="width:500px"/></center>

*Image taken from <a href="https://en.wikipedia.org/wiki/Fine-needle_aspiration">Wikipedia</a>*

The **Breast Cancer Wisconsin Diagnostic** is a dataset which was collected by researchers at the University of Wisconsin. It includes 30 numeric properties, such as the average cell area, which were extracted from 569 different samples. The samples are provided along with the labels of whether the sample is malignant or benign.

This dataset is commonly used as an example of a binary classification problem.

The original dataset can be found here: [Breast Cancer Wisconsin (Diagnostic) Data Set](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29)

The dataset which we will be using in this course can be found [here](https://yairomer.github.io/ml_course/datasets/breast_cancer.csv)

## ❓️ Problem: Predict the Correct Diagnostic

We would like to help the medical crew make the correct diagnostic by giving them a prediction based on the 30 values which can be extracted from each sample.

**A comment**: Usually in problems such as this we do not intend to replace experienced human making the diagnostic, but merely to give him an extra suggestion.

## 🔃 The Workflow

<center><img src="../media/diagrams/workflow/workflow_intro.png" width="300px" style="width:300px"/></center>

## 🛠️ Preparations


```python
# Importing packages
import numpy as np  # Numerical package (mainly multi-dimensional arrays and linear algebra)
import pandas as pd  # A package for working with data frames
import matplotlib.pyplot as plt  # A plotting package

## Setup matplotlib to output figures into the notebook
## - To make the figures interactive (zoomable, tooltip, etc.) use ""%matplotlib notebook" instead
%matplotlib inline

plt.rcParams['figure.figsize'] = (5.0, 5.0)  # Set default plot's sizes
plt.rcParams['figure.dpi'] = 90  # Set default plot's dpi (increase fonts' size)
plt.rcParams['axes.grid'] = True  # Show grid by default in figures

## A function to add Latex (equations) to output which works also in Google Colabrtroy
## In a regular notebook this could simply be replaced with "display(Markdown(x))"
from IPython.display import HTML
def print_math(x):  # Define a function to preview markdown outputs as HTML using mathjax
    display(HTML(''.join(['<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [[\'$\',\'$\'], [\'\\\\(\',\'\\\\)\']]}});</script><script src=\'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML\'></script>',x,'</p>'])))
```

## 🕵️ Data Inspection

We will start by loading the data and taking a look at it by printing out the 10 first rows.


```python
data_file = 'https://technion046195.github.io/semester_2019_spring/datasets/breast_cancer.csv'

## Loading the data
dataset = pd.read_csv(data_file)

## Print the number of rows in the data set
number_of_rows = len(dataset)
print_math('Number of rows in the dataset: $N={}$'.format(number_of_rows))

## Show the first 10 rows
dataset.head(10)
```


<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>Number of rows in the dataset: $N=569$</p>





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>diagnosis</th>
      <th>radius_mean</th>
      <th>texture_mean</th>
      <th>perimeter_mean</th>
      <th>area_mean</th>
      <th>smoothness_mean</th>
      <th>compactness_mean</th>
      <th>concavity_mean</th>
      <th>concave points_mean</th>
      <th>...</th>
      <th>radius_worst</th>
      <th>texture_worst</th>
      <th>perimeter_worst</th>
      <th>area_worst</th>
      <th>smoothness_worst</th>
      <th>compactness_worst</th>
      <th>concavity_worst</th>
      <th>concave points_worst</th>
      <th>symmetry_worst</th>
      <th>fractal_dimension_worst</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>842302</td>
      <td>M</td>
      <td>17.99</td>
      <td>10.38</td>
      <td>122.80</td>
      <td>1001.0</td>
      <td>0.11840</td>
      <td>0.27760</td>
      <td>0.30010</td>
      <td>0.14710</td>
      <td>...</td>
      <td>25.38</td>
      <td>17.33</td>
      <td>184.60</td>
      <td>2019.0</td>
      <td>0.1622</td>
      <td>0.6656</td>
      <td>0.7119</td>
      <td>0.2654</td>
      <td>0.4601</td>
      <td>0.11890</td>
    </tr>
    <tr>
      <th>1</th>
      <td>842517</td>
      <td>M</td>
      <td>20.57</td>
      <td>17.77</td>
      <td>132.90</td>
      <td>1326.0</td>
      <td>0.08474</td>
      <td>0.07864</td>
      <td>0.08690</td>
      <td>0.07017</td>
      <td>...</td>
      <td>24.99</td>
      <td>23.41</td>
      <td>158.80</td>
      <td>1956.0</td>
      <td>0.1238</td>
      <td>0.1866</td>
      <td>0.2416</td>
      <td>0.1860</td>
      <td>0.2750</td>
      <td>0.08902</td>
    </tr>
    <tr>
      <th>2</th>
      <td>84300903</td>
      <td>M</td>
      <td>19.69</td>
      <td>21.25</td>
      <td>130.00</td>
      <td>1203.0</td>
      <td>0.10960</td>
      <td>0.15990</td>
      <td>0.19740</td>
      <td>0.12790</td>
      <td>...</td>
      <td>23.57</td>
      <td>25.53</td>
      <td>152.50</td>
      <td>1709.0</td>
      <td>0.1444</td>
      <td>0.4245</td>
      <td>0.4504</td>
      <td>0.2430</td>
      <td>0.3613</td>
      <td>0.08758</td>
    </tr>
    <tr>
      <th>3</th>
      <td>84348301</td>
      <td>M</td>
      <td>11.42</td>
      <td>20.38</td>
      <td>77.58</td>
      <td>386.1</td>
      <td>0.14250</td>
      <td>0.28390</td>
      <td>0.24140</td>
      <td>0.10520</td>
      <td>...</td>
      <td>14.91</td>
      <td>26.50</td>
      <td>98.87</td>
      <td>567.7</td>
      <td>0.2098</td>
      <td>0.8663</td>
      <td>0.6869</td>
      <td>0.2575</td>
      <td>0.6638</td>
      <td>0.17300</td>
    </tr>
    <tr>
      <th>4</th>
      <td>84358402</td>
      <td>M</td>
      <td>20.29</td>
      <td>14.34</td>
      <td>135.10</td>
      <td>1297.0</td>
      <td>0.10030</td>
      <td>0.13280</td>
      <td>0.19800</td>
      <td>0.10430</td>
      <td>...</td>
      <td>22.54</td>
      <td>16.67</td>
      <td>152.20</td>
      <td>1575.0</td>
      <td>0.1374</td>
      <td>0.2050</td>
      <td>0.4000</td>
      <td>0.1625</td>
      <td>0.2364</td>
      <td>0.07678</td>
    </tr>
    <tr>
      <th>5</th>
      <td>843786</td>
      <td>M</td>
      <td>12.45</td>
      <td>15.70</td>
      <td>82.57</td>
      <td>477.1</td>
      <td>0.12780</td>
      <td>0.17000</td>
      <td>0.15780</td>
      <td>0.08089</td>
      <td>...</td>
      <td>15.47</td>
      <td>23.75</td>
      <td>103.40</td>
      <td>741.6</td>
      <td>0.1791</td>
      <td>0.5249</td>
      <td>0.5355</td>
      <td>0.1741</td>
      <td>0.3985</td>
      <td>0.12440</td>
    </tr>
    <tr>
      <th>6</th>
      <td>844359</td>
      <td>M</td>
      <td>18.25</td>
      <td>19.98</td>
      <td>119.60</td>
      <td>1040.0</td>
      <td>0.09463</td>
      <td>0.10900</td>
      <td>0.11270</td>
      <td>0.07400</td>
      <td>...</td>
      <td>22.88</td>
      <td>27.66</td>
      <td>153.20</td>
      <td>1606.0</td>
      <td>0.1442</td>
      <td>0.2576</td>
      <td>0.3784</td>
      <td>0.1932</td>
      <td>0.3063</td>
      <td>0.08368</td>
    </tr>
    <tr>
      <th>7</th>
      <td>84458202</td>
      <td>M</td>
      <td>13.71</td>
      <td>20.83</td>
      <td>90.20</td>
      <td>577.9</td>
      <td>0.11890</td>
      <td>0.16450</td>
      <td>0.09366</td>
      <td>0.05985</td>
      <td>...</td>
      <td>17.06</td>
      <td>28.14</td>
      <td>110.60</td>
      <td>897.0</td>
      <td>0.1654</td>
      <td>0.3682</td>
      <td>0.2678</td>
      <td>0.1556</td>
      <td>0.3196</td>
      <td>0.11510</td>
    </tr>
    <tr>
      <th>8</th>
      <td>844981</td>
      <td>M</td>
      <td>13.00</td>
      <td>21.82</td>
      <td>87.50</td>
      <td>519.8</td>
      <td>0.12730</td>
      <td>0.19320</td>
      <td>0.18590</td>
      <td>0.09353</td>
      <td>...</td>
      <td>15.49</td>
      <td>30.73</td>
      <td>106.20</td>
      <td>739.3</td>
      <td>0.1703</td>
      <td>0.5401</td>
      <td>0.5390</td>
      <td>0.2060</td>
      <td>0.4378</td>
      <td>0.10720</td>
    </tr>
    <tr>
      <th>9</th>
      <td>84501001</td>
      <td>M</td>
      <td>12.46</td>
      <td>24.04</td>
      <td>83.97</td>
      <td>475.9</td>
      <td>0.11860</td>
      <td>0.23960</td>
      <td>0.22730</td>
      <td>0.08543</td>
      <td>...</td>
      <td>15.09</td>
      <td>40.68</td>
      <td>97.65</td>
      <td>711.4</td>
      <td>0.1853</td>
      <td>1.0580</td>
      <td>1.1050</td>
      <td>0.2210</td>
      <td>0.4366</td>
      <td>0.20750</td>
    </tr>
  </tbody>
</table>
<p>10 rows × 32 columns</p>
</div>



## The Data Fields and Types

For simplicity we will not work with all the data columns and will limit ourselves to the following columns:

- **diagnosis** - The correct diagnosis: M = malignant (cancerous), B = benign (non-cancerous)
- **radius_mean** - The average radius of the cells in the sample.
- **texture_mean** - The average standard deviation of gray-scale values of the cells in the sample.

(A full description for each of the other columns can be found [here](https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.names))

###  📉 Some Plots

The number of malignant and benign samples in the dataset


```python
fig, ax = plt.subplots()
dataset.groupby('diagnosis').size().plot.bar(ax=ax)
ax.set_title('Diagnosis')
ax.set_xlabel('diagnosis')
ax.set_ylabel('Number of samples');
```


![png](output_14_0.png)


Distribution of samples as a function of the measured values


```python
fig, ax = plt.subplots(figsize=(5, 3))
ax.hist(dataset.query('diagnosis == "M"')['radius_mean'].values, bins=20, alpha=0.5, label='M')
ax.hist(dataset.query('diagnosis == "B"')['radius_mean'].values, bins=20, alpha=0.5, label='B')
ax.set_title('Radius Mean')
ax.set_xlabel('Radius')
ax.set_ylabel('Number of samples');
ax.legend()

fig, ax = plt.subplots(figsize=(5, 3))
ax.hist(dataset.query('diagnosis == "M"')['texture_mean'].values, bins=20, alpha=0.5, label='M')
ax.hist(dataset.query('diagnosis == "B"')['texture_mean'].values, bins=20, alpha=0.5, label='B')
ax.set_title('Texture Mean')
ax.set_xlabel('Gray levels STD')
ax.set_ylabel('Number of samples');
ax.legend();
```


![png](output_16_0.png)



![png](output_16_1.png)


And in a 2D plot


```python
fig, ax = plt.subplots()
ax.grid(True)
ax.axis('equal')

ax.plot(dataset.query('diagnosis == "M"')['radius_mean'].values, 
        dataset.query('diagnosis == "M"')['texture_mean'].values,
        '.r', label='M')
ax.plot(dataset.query('diagnosis == "B"')['radius_mean'].values, 
        dataset.query('diagnosis == "B"')['texture_mean'].values,
        '.b', label='B')
ax.legend()
ax.set_title('Radius Mean vs. Texture Mean')
ax.set_xlabel('Radius')
ax.set_ylabel('Gray levels STD');
```


![png](output_18_0.png)


## 📜 Problem Definition

### The Underlying System

It is usually convenient to describe supervised problems using conditional probability, where the label is generated first from the label's distribution, and then the measured data is generated based upon a distribution conditioned by the label:

<center><img width="500px" src="../media/diagrams/breast_cancer_process.png?"/></center>

### The Task and the Goal

This is a supervised learning problem of binary classification.

We would like to find a prediction function $h\left(\cdot\right)$, mapping form the space of $\boldsymbol{x}=\left[\text{mean_radius},\text{mean_texture}\right]^T$ to the space of labels $y$

### Evaluation Method: The Misclassification Rate

$$
R\left\lbrace h, \left\lbrace\boldsymbol{x},y\right\rbrace\right\rbrace=\frac{1}{N}\sum_i I\left\lbrace h\left(\boldsymbol{x}_i\right)\neq y_i\right\rbrace
$$

### 📚 Splitting the dataset


```python
n_samples = len(dataset)

## Generate a random generator with a fixed seed (this is important to make our result reproducible)
rand_gen = np.random.RandomState(0)

## Generating a vector of indices
indices = np.arange(n_samples)

## Shuffle the indices
rand_gen.shuffle(indices)

## Split the indices into 80% train / 20% test
n_samples_train = int(n_samples * 0.8)
train_indices = indices[:n_samples_train]
test_indices = indices[n_samples_train:]

train_set = dataset.iloc[train_indices]
test_set = dataset.iloc[test_indices]
```

## 💡 Model & Learning Method Suggestion 1: 1-NN

We will use the 1-NN algorithm to generate our prediction function. The 1-NN has no learning stage

### Voronoi Diagram

Let us plot the prediction function.

We will also add the Voronoi Diagram to it using the [Voronoi](https://docs.scipy.org/doc/scipy-0.18.1/reference/generated/scipy.spatial.Voronoi.html) and [voronoi_plot_2d](https://docs.scipy.org/doc/scipy-0.18.1/reference/generated/scipy.spatial.voronoi_plot_2d.html) function from the SciPy package


```python
## Define x & y
x = train_set[['radius_mean', 'texture_mean']].values
y = train_set['diagnosis'].values == 'M'

## Import Voronoi and voronoi_plot_2d
from scipy.spatial import Voronoi, voronoi_plot_2d

## Add some far point to make all cells colsed cell (for ploting only)
x2 = np.concatenate([x, [[0, 1e3], [0, -1e3], [1e3, 0], [1e3, 0]]], axis=0)
y2 = np.concatenate([y, [0, 0, 0, 0]], axis=0)

# generate Voronoi tessellation
vor = Voronoi(x)

# plot Voronoi diagram, and coloer according to labels
fig, ax = plt.subplots(figsize=(10, 10))

voronoi_plot_2d(ax=ax, vor=vor, show_points=False, show_vertices=False, s=1)
ax.set_xlim([5, 35])
ax.set_ylim([5, 35])

vor = Voronoi(x2)

for r in range(len(vor.point_region)):
    region = vor.regions[vor.point_region[r]]
    if not -1 in region:
        polygon = [vor.vertices[i] for i in region]
        plt.fill(*zip(*polygon), color=('r' if y2[r] else 'b'))
plt.plot(x[:, 0], x[:, 1], '.k', markersize=3);
ax.set_title('Voronoi Diagram')
ax.set_xlabel('Radius')
ax.set_ylabel('Gray levels STD');
```


![png](output_25_0.png)


### ✍️ Exercise 5.1

Write a function implementing the 1-NN mapping

#### Solution 5.1


```python
def one_nn(x, stored_x, stored_y):
    distances = ((stored_x - x) ** 2).sum(axis=1)
    nn_index = np.argmin(distances)
    return stored_y[nn_index]
```

## ⏱️ Performance evaluation


```python
## Define x & y for the test set
x_test = test_set[['radius_mean', 'texture_mean']].values
y_test = test_set['diagnosis'].values == 'M'

## Initilize the predictions vector
predictions = np.zeros((len(x_test)))
for i in range(len(predictions)):
    predictions[i] = one_nn(x_test[i], x, y)

test_risk = (y_test != predictions).mean()
print_math('The test risk is: ${:.2}$'.format(test_risk))
```


<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The test risk is: $0.14$</p>


## 💡 Model & Learning Method Suggestion 1: K-NN

We expect to be able to improve our results using the K-NN algorithm, the question is how can we select $K$? One simple way to do so is to simply test all the relevant values of $K$ and pick the best one.

This is a common case in machine learning, where we have some part of the model which we do not have an efficient way to optimally select. We call these parameters the **hyper-parameters** of the model.

Three more hyper-parameters which we have encountered so far are:

- The number of bins in a histogram.
- The kernel and width in KDE.
- The $K$ in K-Means.

Two optional methods for selecting the hyper-parameters:

#### Brute Force / Grid Search

In some cases, like this one, we will be able to go over all the relevant range of possible values. In this case, we can simply test all of them and pick the values which result in the minimal risk.

#### Trial and error

In many other cases we will simply start by setting the hyper-parameters manually according to some rule of thumb or some smart guess, and iteratively:

1. Solve the model given the fixed hyper-parameters.
2. Update the hyper-parameters according to the results we get.

## The workflow revisited - Hyper-parameters

Let us add the loop/iterations over the hyper-parameters to our workflow

<center><img src="../media/diagrams/workflow/workflow_clustering.png" width="300px" style="width:300px"/></center>

## ⚙️ Learning

### ✍️ Exercise 5.2

Select the optimal $K$ from the range $\left[1,100\right]$. Plot the risk as a function of $K$

Use SciKit-Learn's [KNeighborsClassifier](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html) class

#### Solution 5.2


```python
## import KNeighborsClassifier
from sklearn.neighbors import KNeighborsClassifier

k_array = np.arange(1, 101)
risk_array = np.zeros((len(k_array), ))

for i_k in range(len(k_array)):
    knn = KNeighborsClassifier(n_neighbors=k_array[i_k])
    knn.fit(x, y)
    
    predictions = knn.predict(x_test)

    risk_array[i_k] = (y_test != predictions).mean()

optimal_index = np.argmin(risk_array)
optimal_k = k_array[optimal_index]
optimal_risk = risk_array[optimal_index]

print_math('The optimal $K$ is $K={}$'.format(optimal_k))
print_math('The test risk is: ${:.2}$'.format(optimal_risk))

fig, ax = plt.subplots()
ax.plot(k_array, risk_array)
ax.plot(optimal_k, optimal_risk, '.r')
ax.set_xlabel('$K$')
ax.set_ylabel('Risk')
ax.set_title('Risk vs. $K$');
```


<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The optimal $K$ is $K=12$</p>



<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The test risk is: $0.061$</p>



![png](output_35_2.png)


## Train-Validation-Test Separation

In the above example, we have selected the optimal $K$ based upon the risk which was calculated using the test set. As we stated before this situation is problematic since the risk over the test set would be too optimistic due to overfitting.

The solution to this problem is to divide the dataset once more. Therefore in cases, where we would also be required to optimize over some hyper-parameters, we would divide our data into three sets: a train-set a validation-set and a test-set.

A common practice is to use 60% train - 20% validation - 20% test.

### ✍️ Exercise 5.3

Repeat the learning process using the 3-fold split.

#### Solution 5.3

We shall start by splitting the data


```python
## Generate a random generator with a fixed seed
rand_gen = np.random.RandomState(0)

## Generating a vector of indices
indices = np.arange(n_samples)

## Shuffle the indices
rand_gen.shuffle(indices)

## Split the indices into 60% train / 20% validation / 20% test
n_samples_train = int(n_samples * 0.6)
n_samples_validation = int(n_samples * 0.2)
n_samples_test = n_samples - n_samples_train
train_indices = indices[:n_samples_train]
validation_indices = indices[n_samples_train:(n_samples_train + n_samples_validation)]
test_indices = indices[(n_samples_train + n_samples_validation):]

train_set = dataset.iloc[train_indices]
x = train_set[['radius_mean', 'texture_mean']].values
y = train_set['diagnosis'].values == 'M'

validation_set = dataset.iloc[validation_indices]
x_validation = validation_set[['radius_mean', 'texture_mean']].values
y_validation = validation_set['diagnosis'].values == 'M'

test_set = dataset.iloc[test_indices]
x_test = test_set[['radius_mean', 'texture_mean']].values
y_test = test_set['diagnosis'].values == 'M'
```


```python
risk_array = np.zeros((len(k_array), ))

for i_k in range(len(k_array)):
    knn = KNeighborsClassifier(n_neighbors=k_array[i_k])
    knn.fit(x, y)
    
    predictions = knn.predict(x_validation)

    risk_array[i_k] = (y_validation != predictions).mean()

optimal_index = np.argmin(risk_array)
optimal_k = k_array[optimal_index]
optimal_risk = risk_array[optimal_index]

print_math('The optimal $K$ is $K={}$'.format(optimal_k))
print_math('The validation risk is: ${:.2}$'.format(optimal_risk))

fig, ax = plt.subplots()
ax.plot(k_array, risk_array)
ax.plot(optimal_k, optimal_risk, '.r')
ax.set_xlabel('$K$')
ax.set_ylabel('Risk')
ax.set_title('Risk vs. $K$');
```


<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The optimal $K$ is $K=19$</p>



<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The validation risk is: $0.097$</p>



![png](output_40_2.png)


## ⏱️ Performance evaluation


```python
knn = KNeighborsClassifier(n_neighbors=optimal_k)
knn.fit(x, y)

predictions = knn.predict(x_test)
test_risk = (y_test != predictions).mean()
print_math('The test risk is: ${:.2}$'.format(test_risk))
```


<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The test risk is: $0.087$</p>


## Cross-Validation

When using a 60%-20%-20% split we are in fact using only 60% of the collected data to train our model which is a waste of good data. Cross-validation attempts to partially solve this issue. In Cross-validation we do not set a fixed portion of the data to be a validation set and instead we split all the training data (all the data which is not in the test set) in to $k$ equal groups and evaluate the risk using the following method:

- For some given hyper-parameters repeat the process of learning and evaluating the risk each time using a different group as the validation group.
- The report the estimated risk as the average risks from the previous step.

<center><img src="https://scikit-learn.org/stable/_images/grid_search_cross_validation.png" width="700px" style="width:700px"/></center>

*Image taken from <a href="https://scikit-learn.org/stable/modules/cross_validation.html#cross-validation">SciKit Learn</a>*

## ⚙️ Learning

### ✍️ Exercise 5.4

Repeat the process using cross-validation

Use SciKit-Learn's [cross_val_score](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.cross_val_score.html) function

#### Solution 5.4

We will return to our original 80%-20% split


```python
## Generate a random generator with a fixed seed (this is important to make our result reproducible)
rand_gen = np.random.RandomState(0)

## Generating a vector of indices
indices = np.arange(n_samples)

## Shuffle the indices
rand_gen.shuffle(indices)

## Split the indices into 80% train / 20% test
n_samples_train = int(n_samples * 0.8)
train_indices = indices[:n_samples_train]
test_indices = indices[n_samples_train:]

train_set = dataset.iloc[train_indices]
test_set = dataset.iloc[test_indices]

train_set = dataset.iloc[train_indices]
x = train_set[['radius_mean', 'texture_mean']].values
y = train_set['diagnosis'].values == 'M'

test_set = dataset.iloc[test_indices]
x_test = test_set[['radius_mean', 'texture_mean']].values
y_test = test_set['diagnosis'].values == 'M'
```


```python
## import cross_val_score
from sklearn.model_selection import cross_val_score

number_of_cross_validation_groups = 4
risk_array = np.zeros((len(k_array), ))

for i_k in range(len(k_array)):
    knn = KNeighborsClassifier(n_neighbors=k_array[i_k])
    
    risks = 1 - cross_val_score(knn, x, y, cv=number_of_cross_validation_groups)
    
    risk_array[i_k] = risks.mean()

optimal_index = np.argmin(risk_array)
optimal_k = k_array[optimal_index]
optimal_risk = risk_array[optimal_index]

print_math('The optimal $K$ is $K={}$'.format(optimal_k))
print_math('The validation risk is: ${:.2}$'.format(optimal_risk))

fig, ax = plt.subplots()
ax.plot(k_array, risk_array)
ax.plot(optimal_k, optimal_risk, '.r')
ax.set_xlabel('$K$')
ax.set_ylabel('Risk')
ax.set_title('Risk vs. $K$');
```


<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The optimal $K$ is $K=22$</p>



<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The validation risk is: $0.09$</p>



![png](output_47_2.png)


## ⏱️ Performance evaluation


```python
knn = KNeighborsClassifier(n_neighbors=optimal_k)
knn.fit(x, y)

predictions = knn.predict(x_test)
test_risk = (y_test != predictions).mean()
print_math('The test risk is: ${:.2}$'.format(test_risk))
```


<p><script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script><script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/latest.js?config=TeX-AMS_CHTML'></script>The test risk is: $0.079$</p>



```python
%%html
<link rel="stylesheet" href="../css/style.css"> <!--Setting styles - You can simply ignore this line-->
```


<link rel="stylesheet" href="../css/style.css"> <!--Setting styles - You can simply ignore this line-->



{% endraw %}