# 🚖 The NYC Taxi Dataset

As part of the effort of NYC to make its data publicly available and accessible, the city releases every month the full list of all taxi rides around the city. We will be using the dataset from January 2016, which can be found [here](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

The full dataset includes over 10M taxi rides. In our course, we will be using a smaller subset of this dataset with only 100k rides (which has also been cleaned up a bit). The smaller dataset can be found [here](https://technion046195.github.io/semester_2019_spring/datasets/nyc_taxi_rides.csv)



---new slide---

## The Data Fields and Types

Here are the first 10 rows in the dataset:

<table border="1" style="text-align:center;">
  <thead>
    <tr>
      <th></th>
      <th>passenger
          count</th>
      <th>trip
          distance</th>
      <th>payment
          type</th>
      <th>fare
          amount</th>
      <th>tip
          amount</th>
      <th>pickup
          easting</th>
      <th>pickup
          northing</th>
      <th>dropoff
          easting</th>
      <th>dropoff
          northing</th>
      <th>duration</th>
      <th>day
          of
          week</th>
      <th>day
          of
          month</th>
      <th>time
          of
          day</th>
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

In this exercise we will only be interested in the two following columns:

- **duration**: The total duration of the ride (in minutes)
- **time_of_day**: A number between 0 and 24 indicating the time of the pickup. The integer part is the hour in 24H format and the decimal part are the minutes and seconds

(A full description for each of the other columns can be found [here](https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf))



---new slide---

## ❓️ Problem: Estimating the Distribution of Trip Duration

A taxi driver would like to give an estimation for the distributions of trip durations. 

He has taken the course in machine learning and has figured that he can use historical rides data to estimate this distribution.

Let us help the driver with his estimation.

Formally, we would like to estimate the distribution of the rides durations and represent them as a CDF or a PDF.

---new slide---

## 💡 Method I: ECDF

- We shall donate the set of 100k ride durations as $$\left\lbrace x_i\right\rbrace$$

- We shall calculate the ECDF numerically over a *grid*:

  - Grid step size 0.001 min from $$0$$ to $$\max\left(\left\lbrace x_i\right\rbrace\right)$$

  

<img src="./media/ecdf.png" alt="ecdf" style="zoom:80%;" /><img src="./media/ecdf_zoom.png" alt="ecdf_zoom" style="zoom:80%;" />



*Note that the ECDF is a sum of step functions.*

---new slide---

## 

### ✍️ Question

According to the ECDF graph, what is the estimated probability of a ride to have a duration longer than 20 min?

### Solution

The CDF graph describes the probability of $$X_\text{duration}\leq x$$. We want to evaluate:

$$
P\left(X_\text{duration}>20 \text{min}\right)=1 - P\left(X_\text{duration}\leq 20 \text{min}\right)=1-\hat{F}_{X}\left(20\right)=1-0.89=0.11
$$

---new slide---

#### The Dependency on the Dataset's size

To see the dependency of the ECDF on the dataset's size we shall recalculate the EDCF using a smaller amount of data. We will randomly sample N = 10, 100 and 1000 samples from the train set and use them to calculate the ECDF.

![ecdf_subsets](./media/ecdf_subsets.png)

Not surprisingly, we can see that as we increase the number of points, the estimation becomes smoother, and although we have not defined an evaluation method, we will note that for all the popular distribution evaluation methods the error indeed decreases.

---new slide---

## 💡 Method II: Histogram

We shall calculate the histogram of ride durations using 30, 300 and 3000 bins.

*Reminder*: the rule of thumb suggests to use a number of bins equal to $$\sqrt{N}=\sqrt{80000}\approx 280$$

![historgam](./media/histograms.png)

---new slide---

Before we examine the results we shall run another test:

- **Split** the train set into **8 equal subsets**
- **Calculate** the histogram for each of the subsets.

![historgam](./media/histograms_subsets.png)

---new slide---

To better visualize the variance let us plot the above graphs after removing the mean value:

![historgam](./media/histograms_subsets2.png)

- **For a large number of bins**, the deviations between the subsets are large, but the bins are narrow.
  - **high variance** - large deviations between different subsets
  - **low bias** - small discretization error.
- **For the small number of bins**, the deviations between the subsets are small, but the bins are wide.
  - **low variance** - small deviations between different subsets.
  - **high bias** - large discretization error (the histogram is less smooth)

---new slide---

#### The Sources of Error

- Using a large amount of bins, the main source of error is due to the stochastic nature of the process which results in a ***high variance*** in our estimation. This error will be very significant for a small amount of data, but it will decrease as we add more data.
- Using a small number of bins, the main source of estimation error will be mostly due to the model's limited representation capability (***high bias***). This type of error is unrelated to the amount of data.
- We should **minimize the bias-variance tradeoff** by setting the number of bins to an intermediate value. In this sense, the middle graphs gives the best results. Notice that it is close to the value predicted by the rule of thumb.



---new slide---

## 💡 Method III: KDE

We shall estimate the PDF of ride durations using KDE using a Gaussian Parzen window with bandwidth ($$\sigma$$) of 0.08, 0.8, 8.

*Reminder*: the rule of thumb suggests a width of: $$\sigma=\left(\frac{4\cdot\text{std}\left\lbrace x_i\right\rbrace}{3N}\right)^\frac{1}{5}\approx0.775$$

We will plot the resulting PDFs on top of the histogram with 300 bins for comparison.

![kde](./media/kde.png)

Again we see behavior similar to that of the histogram:

- **For a narrow bandwidth**, we get finer details, but the estimation is more "noisy".

  - **low bias**
  - **high variance** of the estimation.

- **For a wide bandwidth**, we get fewer details, but we expect the estimation to have smaller variance.

  - **high bias**
  - **low variance**


---new slide---

## ❓️ Problem: Work Hours Prediction

We would like to predict whether a random given ride has occurred during the work hours or not, based only on the duration of the ride.

We shall define the work hours as between 7 a.m. and 18 p.m.



Let define the random binary variable $$Y$$:

$$Y$$ is equal to 1 if a ride occurred during the work hours, and 0 otherwise.



We shall denote the PMF of $$Y$$ by $$p_Y\left(y\right)$$



---new slide---

## Risk Function definition

We will use the **misclassification** rate as a risk function:
$$
R(\hat y) = \frac{1}{N} \sum_{i=0}^N I\{\hat y(x_i) \neq y_i \}
$$
We will choose to predict $\hat y(x_i)$ by the prediction the minimizes $R(\hat y)$:

$$
\hat y = \arg\min_h R(h) = \frac{1}{N} \sum_{i=0}^N I\{h(x_i) \neq y_i \}
$$
​			

---new slide---

## Solution Attempt 1: Estimating $$p_Y\left(y\right)$$

Based on the data estimate $$p_Y\left(0\right)$$ and $$p_Y\left(1\right)$$, the probability of a random ride to occur on and off the work hours.

We will estimate $$p_Y\left(y\right)$$ using the empirical measure estimation: $$\frac{1}{N}\sum_i I\left\lbrace y_i=y\right\rbrace$$:

$$p_Y(1)\approx0.51$$

$$p_Y(0)\approx0.49$$

---new slide---

### ⏱️ Performance evaluation - Blind Prediction

Let us evaluate how good would be a blind (without knowing the duration) estimation.

Basically, we would like to select our prediction $$\hat{y}$$ such that:

$$
\hat{y}=\underset{y\in\left\lbrace 0,1\right\rbrace}{\arg\max}\ \ P\left(Y=y\right)=1
$$

Which, not surprisingly, means picking the value of $$Y$$ with the highest probability. Since there is a slightly higher probability of $$Y$$ being equal to 1 our constant prediction would be:

$$
\hat{y}=1
$$

The resulting risk is: $$R_\text{test}\{ \hat{y}=1 \}=0.49$$

Which means that we will be correct 51% of the time, which is only slightly better then a 50:50 random guess.

---new slide---

## Solution Attempt 2: Using KDE to estimate $$p_{X|Y}\left(x|y\right)$$

We will estimate $$p_{X\lvert Y}\left(x\lvert y=0\right)$$ and $$p_{X\lvert Y}\left(x\lvert y=1\right)$$ independently by dividing the data into $$Y=0$$ and $$Y=1$$ and using KDE.

![conditional_kde](./media/conditional_kde.png)

We can see here that during the work hours, $$Y=1$$, a ride has a slightly higher probability to have a longer duration. Let us see if we can use this fact to improve our prediction.

---new slide---

### Solution Attempt 2: Prediction Based on Duration

Let us now try to improve our prediction using the duration data.

We would now like to make our prediction based on the the known duration of the ride:

I.e., we would like to predict:
$$
\hat{y}\left(x\right)=\underset{y\in\left\lbrace 0,1\right\rbrace}{\arg\max}\ \ p_{Y|X}\left(y|x\right)
$$

- Given the input data $x$ of the specific ride, what is it $y$ 
- Instead of **predicting the same value** $\hat y$ for all the rides,
  we predict a **prediction function** $\hat y(x)$

---new slide---

The prediction is equivalent to:
$$
\hat{y}\left(x\right)
=\underset{y\in\left\lbrace 0,1\right\rbrace}{\arg\max}\ \  p_{Y|X}\left(y|x\right)
= 
\begin{cases}
1 & p_{Y|X}\left(y=1|x\right)\geq p_{X|Y}\left(y=0|x\right) \\
0 & \text{otherwise}
\end{cases}
$$

We can use Bayes rule:

$$
p_{Y|X}\left(y|x\right)=\frac{p_{X|Y}\left(x|y\right)\cdot p_Y\left(y\right)}{p_X\left(x\right)}
$$

To evaluate the condition in the prediction function:

$$
p_{Y|X}\left(1|x\right)\overset{?}{\geq}p_{Y|X}\left(0|x\right) \\
\Leftrightarrow
\frac{p_{X|Y}\left(x|1\right)\cdot p_Y\left(1\right)}{p_X\left(x\right)}\overset{?}{\geq}\frac{p_{X|Y}\left(x|0\right)\cdot p_Y\left(0\right)}{p_X\left(x\right)} \\
\Leftrightarrow 
p_{X|Y}\left(x|1\right)\cdot p_Y\left(1\right)\overset{?}{\geq}p_{X|Y}\left(x|0\right)\cdot p_Y\left(0\right)
$$

---new slide---

- Calculate $p_{Y\mid X}(y\mid x)$:

  - Use Bayes rule.
  - Calculate $$p_Y\left(y\right)$$.
  - Calculate $$p_{X\lvert Y}\left(x\lvert y\right)$$.

- For any given $$x$$, evaluate the following equality over a grid of durations:

  - $$
    p_{X|Y}\left(x|1\right)\cdot p_Y\left(1\right)\overset{?}{\geq}p_{X|Y}\left(x|0\right)\cdot p_Y\left(0\right)
    $$

- 

![prediction](./media/prediction.png)


Therefore our prediction would be:

$$
\hat{y}\left(x\right)=
\begin{cases}
1 & x\geq11.4 \\
0 & \text{otherwise}
\end{cases}
$$

---new slide---

### ⏱️ Performance evaluation - Based on Duration

Let us test our full prediction method on the test set:

- The test risk is: $$R_\text{test}\{ \hat{y}(x) \}=0.46$$

- We were able to slightly improve our prediction by using the ride duration.

- As we add more data fields such as the length of the ride, the location, etc., 
  we will be able to further improve our prediction.