---
number: 5
title: "K-NN" 
hide: True
---
{% raw %}
## 👨 1-Nearest Neighbors (1-NN)

1-NN is a supervised algorithm solving a classification problem. It is probably the most simple supervised classification algorithm, and it works as follow:

Given a data set $$\left\lbrace\boldsymbol{x}_i\right\rbrace$$ with corresponding labels $$\left\lbrace y_i\right\rbrace$$ the algorithm maps any new vector $$\tilde{\boldsymbol{x}}$$ to the label corresponding to the closest $$\boldsymbol{x}_i$$:

$$
\hat{i} = \underset{i}{\arg\min}\left\lVert \tilde{\boldsymbol{x}} - \boldsymbol{x}_i\right\lVert_2 \\
\hat{y} = y_\hat{i}
$$

## 👫👬 K-Nearest Neighbors (K-NN)

K-NN is a simple extension of the basic 1-NN, where instead just using the single closest neighbor, we will use the $$K$$ nearest neighbors. After retrieving the $$K$$ nearest points we will take the majority vote (the most common label among the $$K$$ samples) to be our prediction.

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

## 🕵️ Data Inspection

After loading the data, let take a look at it by printing out the 10 first rows.

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

Number of rows in the dataset: $$N=569$$


## The Data Fields and Types

For simplicity we will not work with all the data columns and will limit ourselves to the following columns:

- **diagnosis** - The correct diagnosis: M = malignant (cancerous), B = benign (non-cancerous)
- **radius_mean** - The average radius of the cells in the sample.
- **texture_mean** - The average standard deviation of gray-scale values of the cells in the sample.

(A full description for each of the other columns can be found [here](https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.names))

###  📉 Dataset Inspection Plots

The number of malignant and benign samples in the dataset

![png](figs/output_14_0.png)


Distribution of samples as a function of the measured values


![png](figs/output_16_0.png)



![png](figs/output_16_1.png)

And in a 2D plot

![png](figs/output_18_0.png)


## 📜 Problem Definition

### The Task and the Goal

This is a supervised learning problem of binary classification.

We would like to find a prediction function $$h\left(\cdot\right)$$, mapping form the space of $$\boldsymbol{x}=\left[\text{mean_radius},\text{mean_texture}\right]^T$$ to the space of labels $$y$$

### Evaluation Method: The Misclassification Rate

$$
R\left\lbrace h, \left\lbrace\boldsymbol{x},y\right\rbrace\right\rbrace=\frac{1}{N}\sum_i I\left\lbrace h\left(\boldsymbol{x}_i\right)\neq y_i\right\rbrace
$$

### 📚 Splitting the dataset

By the given dataset, we want to split the data to two sets, train set - $$\{\boldsymbol{X}_{train},\boldsymbol{Y}_{train}\}$$ and test set - $$\{\boldsymbol{X}_{test},\boldsymbol{Y}_{test}\}$$ in order to train our model and evaluate the performance.


## 💡 Model & Learning Method Suggestion 1: 1-NN

We will use the 1-NN algorithm to generate our prediction function. The 1-NN has no learning stage

### Voronoi Diagram

Let us plot the prediction function.

We will also add the Voronoi Diagram to it using the [Voronoi](https://docs.scipy.org/doc/scipy-0.18.1/reference/generated/scipy.spatial.Voronoi.html) and [voronoi_plot_2d](https://docs.scipy.org/doc/scipy-0.18.1/reference/generated/scipy.spatial.voronoi_plot_2d.html) function from the SciPy package



![png](figs/output_25_0.png)

#### ⏱️ Performance evaluation


The test risk is: $$0.14$$


## 💡 Model & Learning Method Suggestion 1: K-NN

We expect to be able to improve our results using the K-NN algorithm, the question is how can we select $$K$$? One simple way to do so is to simply test all the relevant values of $$K$$ and pick the best one.

This is a common case in machine learning, where we have some part of the model which we do not have an efficient way to optimally select. We call these parameters the **hyper-parameters** of the model.

Three more hyper-parameters which we have encountered so far are:

- The number of bins in a histogram.
- The kernel and width in KDE.
- The $$K$$ in K-Means.

Two optional methods for selecting the hyper-parameters:

#### Brute Force / Grid Search

In some cases, like this one, we will be able to go over all the relevant range of possible values. In this case, we can simply test all of them and pick the values which result in the minimal risk.

#### Trial and error

In many other cases we will simply start by setting the hyper-parameters manually according to some rule of thumb or some smart guess, and iteratively:

1. Solve the model given the fixed hyper-parameters.
2. Update the hyper-parameters according to the results we get.

## The workflow revisited - Hyper-parameters

Let us add the loop/iterations over the hyper-parameters to our workflow

![png](figs/workflow_clustering.png)


### ✍️ Exercise 5.1

Select the optimal $$K$$ from the range $$\left[1,100\right]$$. Plot the risk as a function of $$K$$

Use SciKit-Learn's [KNeighborsClassifier](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html) class

#### Solution 5.1

The optimal $$K$$ is $$K=12$$
The test risk is: $$0.061$$

![png](figs/output_35_2.png)


## Train-Validation-Test Separation

In the above example, we have selected the optimal $$K$$ based upon the risk which was calculated using the test set. As we stated before this situation is **problematic** since the risk over the test set would be too optimistic due to **overfitting**.

The solution to this problem is to divide the dataset once more. Therefore in cases, where we would also be required to optimize over some hyper-parameters, we would divide our data into three sets: a train-set a validation-set and a test-set.

A common practice is to use 60% train - 20% validation - 20% test.

### ✍️ Exercise 5.2

Repeat the learning process using the 3-fold split.

#### Solution 5.2

The optimal $$K$$ is $$K=19$$
The validation risk is: $$0.097$$

![png](figs/output_40_2.png)


#### ⏱  Performance evaluation
The test risk is: $$0.087$$


## Cross-Validation
When using a 60%-20%-20% split we are in fact using only 60% of the collected data to train our model which is a waste of good data. Cross-validation attempts to partially solve this issue. In Cross-validation we do not set a fixed portion of the data to be a validation set and instead we split all the training data (all the data which is not in the test set) in to $$k$$ equal groups and evaluate the risk using the following method:

- For some given hyper-parameters repeat the process of learning and evaluating the risk each time using a different group as the validation group.
- The report the estimated risk as the average risks from the previous step.

<center><img src="https://scikit-learn.org/stable/_images/grid_search_cross_validation.png" width="700px" style="width:700px"/></center>

*Image taken from <a href="https://scikit-learn.org/stable/modules/cross_validation.html#cross-validation">SciKit Learn</a>*

### ✍️ Exercise 5.4

Repeat the process using cross-validation

Use SciKit-Learn's [cross_val_score](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.cross_val_score.html) function

#### Solution 5.4

We will return to our original 80%-20% split

The optimal $$K$$ is $$K=22$$
The validation risk is: $$0.09$$


![png](figs/output_47_2.png)

#### ⏱  Performance evaluation

The test risk is: $$0.079$$

<link rel="stylesheet" href="../css/style.css"> <!--Setting styles - You can simply ignore this line-->

{% endraw %}