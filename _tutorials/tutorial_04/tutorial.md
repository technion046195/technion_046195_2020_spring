---
number: 4
title: "K-Means" 
hide: True
---
## Hands-on: K-Means

### 🚖 Reminder: The NYC Taxi Dataset

We will use the same [dataset](https://technion046195.github.io/semester_2019_spring/datasets/nyc_taxi_rides.csv) from the last two tutorials. This time focusing on the drop off locations.

### ❓️ Problem: Finding The Optimal Parking Lots Locations

A taxi company is looking to rent $$K$$ parking lots so that their taxis can wait in them in between rides.

The company manager would like to select the optimal locations to place these parking lots so that the average distance from the drop off location to the nearest parking lot will be minimal.

### The Data Fields and Types
This time we will be looking at the following two columns:

- **dropoff_easting** - The horizontal coordinate (east-west) in UTM-WGS84 (~ in kilometers)
- **dropoff_northing** - The vertical coordinate (north-south) in UTM-WGS84 (~ in kilometers)

### Plotting Drop Off  Points

Just for having a nice visualization we will plot the points over the NYC map which can be found [here](../media/taxi_map_gray.png)


![png](output_16_0.png)


## 📜 Problem Definition

### The underlying process

A random phenomenon generating taxi rides.

### The task and goal

Finding locations for $$K$$ parking lots such that the average distance to the nearest parking lot will be minimal.

### Evaluation method

As stated in the goal, the quantity which we would like to minimize is given by:

- $$X$$ as the random variable of the drop off location.
- $$\boldsymbol{c}_i$$: as the location of the $$i$$-th parking lot.
- $$N$$: The number of points in the dataset.

We would like to define and minimize the following risk function:

$$
R\left(\left\lbrace\boldsymbol{c}_i\right\rbrace\right)=\mathbb{E}\left[\min_{\boldsymbol{c}\in\left\lbrace\boldsymbol{c}_i\right\rbrace}\left\lVert\boldsymbol{x}-\boldsymbol{c}\right\rVert\right]
$$

Therefore, this will be our risk function.

As usual, since we do not know the exact distribution of $$X$$ so we would approximate the risk function with an empirical risk. In this case, we will replace the expectation value with the empirical mean calculated on a test set $$\left\lbrace\boldsymbol{x}_j\right\rbrace$$:

$$
\hat{R}\left(\left\lbrace\boldsymbol{c}_i\right\rbrace\right)=\frac{1}{N}\sum_{\boldsymbol{x}_j}\min_{\boldsymbol{c}\in\left\lbrace\boldsymbol{c_i}\right\rbrace}\left\lVert\boldsymbol{x}_j-\boldsymbol{c}\right\rVert
$$

In fact, we can write this problem as a clustering problem. We can do so by rewriting the above summation as a summation over clusters where each cluster is defined by the location of the nearest parking lot.

By denoting the cluster of points for which $$c_i$$ is their closet parking lot as  $$S_{i}$$, we can rewrite the summation as:

$$
\hat{R}\left(\left\lbrace\boldsymbol{c}_i\right\rbrace\right)=\frac{1}{N}\sum_{i=1}^K\sum_{\boldsymbol{x}_j\in S_i}\left\lVert\boldsymbol{x}_j-\boldsymbol{c}_i\right\rVert
$$

## 📚 Splitting the Data

Let us split the data into 80% train set and 20% test set

## 💡 Model & Learning Method Suggestion

### Model

In this case the model is in fact all possible solutions which is any set of $$K$$ 2D points.

### Learning Method: K-Means

To solve this problem, we will use K-means. Note that K-means does not actually solve our exact problem since it minimizes the average **squared** Euclidean distance and not the average Euclidean distance itself. There are some more complicated algorithms for solving our exact problem, but for now we will stick to K-means.

This is, in fact, a common case where we do not have an efficient way to solve our exact so we solve a very similar problem with the understanding that the result which we will get will probably not be the optimal solution, but we hope that it will at least produce a satisfactory result. 

## ⚙️ Learning

### ✍️ Exercise 3 - K-Means

1. Use the data and k-means to select the location of 10 parking lots
2. Evaluate the empirical risk on the train set

#### Solution 3-1

Lets us execute the K-means algorithm (we can either implement the algorithm ourselves or  use [sklearn.cluster.KMeans](https://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html) class to run the K-means algorithm)

![png](output_24_1.png)

#### Solution 3-2

Let us evaluate the empirical risk function on the train set:

$$
\hat{R}\left(\left\lbrace\boldsymbol{c}_i\right\rbrace\right)=\frac{1}{N}\sum_{\boldsymbol{x}_j}\min_{\boldsymbol{c}\in\left\lbrace\boldsymbol{c}\right\rbrace}\left\lVert\boldsymbol{x}_j-\boldsymbol{c}\right\rVert
$$

    The average ride distance to the closest parking lots is approximately 0.70 km


## ⏱️ Performance Evaluation

### ✍️ Exercise 4

1. Evaluate the performance using parking lots locations which were selected using the K-means algorithms.
2. Name 2 reasons why this solution is probably not the optimal solution.
3. Suggest methods to improve our result based on each of the problems from the previous section.

#### Solution 4-1

Let us evaluate the empirical risk function on the test set:

    The average ride distance to the closest parking lots is approximatley 0.70 km


#### Solution 4-(2 & 3)

Two reasons, which we have already mentioned, for why K-means does not converge to the optimal parking lots selection:

1. K-means is only guaranteed to converge to a local minimum and not necessarily the global minimum. One way to slightly overcome this problem is to run the K-means algorithm several times using a different initialization each time.

2. K-means finds the optimal solution for minimizing the average squared distance. To improve our results, we can use the clusters selected by K-mean, but instead of using the mean point of the cluster, we can find the point which minimizes the sum of distances in each cluster.

**A side note**: The point which minimizes the sum of Euclidean distances is called *The Geometric Median* ([wiki](https://en.wikipedia.org/wiki/Geometric_median)), and it can be found for example using an algorithm called the *Weiszfeld's algorithm*.

## ❓️ Problem 2: Finding The Optimal Number of Parking Lots
Now let us address the topic of selecting the number of parking lots (the number of clusters)

Basically, to reduce the average ride distance we would like as much parking lots as possible, but in practice operating a parking lots cost money. Let us assume that:

1. The price of operating a parking lot is 10k$ per month.
2. There will be exactly 100k rides to the parking lots per month.
3. The estimated price per kilometer when driving to the parking lot is estimated at 3$ / kilometer.

## 📜 Problem Definition

### ✍️ Exercise 5-1

Following these assumptions write a risk function which is the expected mean total cost of driving to and operating the parking lots.

#### Solution 5-1

The risk function would be:

$$
R\left(\left\lbrace\boldsymbol{c}_i\right\rbrace, K\right)= 10\cdot K+100\cdot3\cdot\mathbb{E}\left[\min_{\boldsymbol{c}\in\left\lbrace\boldsymbol{c}_i\right\rbrace}\left\lVert\boldsymbol{x}-\boldsymbol{c}\right\rVert\right]
$$

The empirical risk function would be:


$$
\hat{R}\left(\left\lbrace\boldsymbol{c}_i\right\rbrace, K\right)= 10\cdot K+300\cdot\frac{1}{N}\sum_{i=1}^K\sum_{\boldsymbol{x}_j\in S_i}\left\lVert\boldsymbol{x}_j-\boldsymbol{c}_i\right\rVert
$$

## 💡 Model & Learning Method Suggestion

Now the space of solutions is the space of all possible locations and number of parking lots. We saw how to solve the problem for a fixed $$K$$ and we can easily run over all relevant values of $$K$$ to find the optimal value.

This is a common case in machine learning, where we have a method for finding an optimal model configuration only after we fix some parameters of the model. We will refer to this part of the model for which we do not have an efficient way to optimally select as the **hyper-parameters** of the model.

Two more hyper-parameters which we have encountered so far are:

- The number of bins in a histogram.
- The kernel and width in KDE.

Two approaches for selecting the hyper-parameters values are:

#### Brute Force / Grid Search

Some times, like in this case, we will be able to simply the relevant range of possible values of the hyper-parameters. In this case, our solution would be to simply loop over the relevant values and pick the ones which result in the minimal risk.

#### Trial and error

In other cases we would usually start by fixing these hyper-parameters manually according to some rule of thumb or some smart guess, and iteratively:

1. Solve the model given the fixed hyper-parameters.
2. Update the hyper-parameters according to the results we get.

## ⚙️ Learning

### ✍️ Exercise 5-2

Use K-means to select the number and locations of parking lots. Search over the range of $$1\leq K \leq 25$$. Plot the empirical train risk as a function of $$K$$.

#### Solution 5-2

![png](output_39_1.png)

    The optimal number of parking lots is: 12
    The optimal average ride distance is: 0.63 Km
    The train risk is 308.12 k$
