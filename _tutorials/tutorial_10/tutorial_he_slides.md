---
number: 10
title: "CNN" 
hide: True
---

<section markdown="1">

### Convolutional Neural Networks (CNN) -<br>רשתות קונבולוציה

<br>

- מודל MLP (Fully Connected (FC) network) אינו רגיש לסדר בכניסה לרשת.<br><br>
- לפעמים תכונה זו הינה רצויה, אך באה במחיר של מספר רב של פרמטרים.<br><br>
- במקרים בהם למידע יש מבנה מרחבי (לדוגמא תמונות) נרצה לנצל זאת.<br><br>
- רשתות קונבולציה הינם סוג אחד רשתות feed-forward בעלת ארכיטקטורה אשר מנצלת תכונה זו.

</section><section markdown="1">

#### 1D Convolutional Layer

שכבת קונבולוציה חד-ממדית מבצעת פעולת קרוס קורלציה בין וקטור הכניסה $$\boldsymbol{x}$$ ווקטור משקולות $$\boldsymbol{w}$$ באורך $$K$$:

$$
\boldsymbol{y}\left[n\right]=\sum_{m=0}^{K-1} \boldsymbol{x}\left[n+m\right]\boldsymbol{w}\left[m\right]
$$

- וקטור המשקולות נקרא **גרעין הקונבולוציה (convolution kernel)**

**הערה:** שכבת קונבולוציה מחשבת קרוס-קורלציה, ולא קונבולוציה ($$\boldsymbol{y}\left[n\right]=\sum_{m=0}^{K-1} \boldsymbol{x}\left[n-m\right]\boldsymbol{w}\left[m\right]$$).

</section><section markdown="1">

#### 1D Convolutional Layer - המשך

באופן גרפי:

![Conv layer](./media/conv_layer.png){: width="450px"}

$$
\boldsymbol{y}\left[n\right]=\sum_{m=0}^{K-1} \boldsymbol{x}\left[n+m\right]\boldsymbol{w}\left[m\right]
$$

</section><section markdown="1">

#### 1D Convolutional Layer - המשך 2

הבדלים מרשת FC:

1. היציאות מחוברות רק לחלק מהכניסות, כאשר הכניסות קרובות אחת לשניה<br><br>
2. כל היציאות מופקות מאותן משקולות

<br>

ההנחות הארכיטקטורה:

- הקשר בין כניסות קרובות הוא יותר חזק ומשמעותי מאשר כניסות רחוקות.<br><br>
- אזורים שונים בכניסה מתנהגים באופן דומה.<br><br>

<br>

בשכבת FC קיימות $$N_\text{inputs}\times N_\text{outputs}$$ משקולות בעוד שלשכבת קונבולציה יש $$K$$ משקולות.

</section><section markdown="1">

#### 1D Convolutional Layer - המשך 3

דרך נוספת להצגת שכבת קונבולוציה:

![Conv layer](./media/conv_layer.gif){: width="700px"}

- $$h\left(\boldsymbol{z}\right)=\boldsymbol{w}^T\boldsymbol{z}=w_1z_1+w_2z_2+w_3z_5+b$$
- $$b$$ היינו איבר ההסט.

</section><section markdown="1">

#### אקטיבציה לא לינארית

בדומה לשכבות FC, נעשה שימוש בפונקציות אקטיבציה לא לינאריות.

פונקציית האקטיבציה הנפוצה ביותר הינה ReLU: $$\varphi\left(x\right)=\max\left(x,0\right)$$.

![Conv layer + non-linear layer](./media/conv_layer_nonlinear.png)

</section><section markdown="1">

#### קלט רב-ערוצי

נרצה לרוב ששכבת הקונבולציה תקבל קלט רב ערוצי. לדוגמא:

- תמונה בעלת שלושה ערוצי צבע.
- שמע ממספר ערוצי הקלטה.

במקרים אלו הניורון $$h$$ יהיה פונקציה של כל ערוצי הקלט:

![multi-channel conv layer](./media/conv_layer_multi_channel.gif){: width="700px"}

</section><section markdown="1">

#### פלט רב-ערוצי

נרצה לרוב להשתמש ביותר מגרעין קונבולוציה אחד לקבלת מספר ערוצים במוצא:

![multi-input multi-output conv layer](./media/conv_layer_multi_channel2.gif){: width="600px"}

- בשכבות אלו אין שיתוף של משקולות בין ערוצי הפלט השונים.
- מספר הפרמטרים בשכבת כזאת היינו:  $$\underbrace{C_\text{in}\times C_\text{out}\times K}_\text{the weights}+\underbrace{C_\text{out}}_\text{the bias}$$

כאשר:

- $$C_\text{in}$$ - מספר ערוצי קלט.
- $$C_\text{out}$$ - מספר ערוצי פלט.
- $$K$$ - גודל הגרעין.

<!-- **דגש:** שימו לב, יש להבדיל בין מס' הערוצים לממד הקלט/פלט. נגיד עבור ערוץ אחד אנחנו יכולים לקבל קלט רב ממדי (נגיד תמונה) ועבור פלט רב ערוצי, עבור כל ערוץ אנחנו יכולים לקבל מס' ממדים עבור כל ערוץ -->

</section><section markdown="1">

#### היפר-פרמטרים של שכבות קונבולוציה

בנוסף לפהיפר-פרמטרים **גודל הגרעין** ו **מספר ערוצי הפלט**, מקובל להגדיר גם את הפרמטרים הבאים:

<br>

##### Padding - ריפוד

ניתן לרפד את וקטור הכניסה באפסים על מנת לשמר את אורך הוקטור במוצא:

![padding](./media/conv_layer_padding.gif){: width="700px"}

</section><section markdown="1">

#### היפר-פרמטרים של שכבות קונבולוציה - המשך

##### Stride - גודל צעד

ניתן לבצע את הקונבולוציה בדילוגים על מנת לדלל את המוצא. לרוב גודל הצעד מסומן ב $$s$$. בדוגמא הבאה גודל הצעד היינו $$s=2$$ .

![stride](./media/conv_layer_stride.gif){: width="700px"}

</section><section markdown="1">

#### היפר-פרמטרים של שכבות קונבולוציה - המשך 2

##### Dilation - התרחבות

על מנת להקטיןן עוד את מספר הפרמטרים, ניתן לדלל את המשקולות בגרעין הקונבולוציה. פעולה זו נקראת הרחבה (dilation) של הקונבולוציה. לרוב נסמן את ההתרחבות ב $$d$$ בדוגמא הבאה $$d=2$$.

![dilation](./media/conv_layer_dilation.gif){: width="700px"}

</section><section markdown="1">

#### Max Pooling

- לרוב ב CNN נעשה שימוש בשכבת נוספות על מנת לצמצם את גודל הקלט.
- שכבה לדוגמא היינה שכבת Max Pooling.
- שכבה זאת לוקחת את המקסימום מבין ערכי הכניסה.
- המוטיבציה לפעולה זאת היינה שהערכים הגבוהים מייצגים מאפיינים בעלי יותר אינפורמציה.

לדוגמא Max Pooling בגודל 2 עם גודל צעד (stride) 2:

![max pooling](./media/max_pool.gif){: width="700px"}

בשכבה זאת אין פרמטרים נלמדים, אך גודל הגרעין היינו היפר-פרמטר נוסף.

</section><section markdown="1">

#### 2D Convolutional Layer

ניתן באופן דומה להגדיר שכבות קונבולוציה בעבור מימדים שונים מ1. לדוגמאת קונבולוציה דו-מימדית, במקרה זה הכניסות והיציאות יהיו מטריצות.

כמה דוגמאות לקונבולוציות (השכבה הכחולה היא הקלט והשכבה הירוקה היא הפלט):

<table style="width:100%; table-layout:fixed;">
  <tr>
    <td><center>kernel size=3<br>padding=0<br>stride=1<br>dilation=1</center></td>
    <td><center>kernel size=4<br>padding=2<br>stride=1<br>dilation=1</center></td>
    <td><center>kernel size=3<br>padding=1<br>stride=1<br>dilation=1<br>(Half padding)</center></td>
    <td><center>kernel size=3<br>padding=2<br>stride=1<br>dilation=1<br>(Full padding)</center></td>
  </tr>
  <tr>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/no_padding_no_strides.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/arbitrary_padding_no_strides.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/same_padding_no_strides.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/full_padding_no_strides.gif?raw=true"></td>
  </tr>
  <tr>
    <td><center>kernel size=3<br>padding=0<br>stride=2<br>dilation=1</center></td>
    <td><center>kernel size=3<br>padding=1<br>stride=2<br>dilation=1</center></td>
    <td><center>kernel size=3<br>padding=1<br>stride=2<br>dilation=1</center></td>
    <td><center>kernel size=3<br>padding=0<br>stride=1<br>dilation=2</center></td>
  </tr>
  <tr>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/no_padding_strides.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/padding_strides.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/padding_strides_odd.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/dilation.gif?raw=true"></td>
  </tr>
</table>

- \[1\] Vincent Dumoulin, Francesco Visin - [A guide to convolution arithmetic for deep learning](https://arxiv.org/abs/1603.07285)([BibTeX](https://gist.github.com/fvisin/165ca9935392fa9600a6c94664a01214))
  
</section><section markdown="1">

## תרגילים

#### תרגיל 10.1

נתונה רשת קונבולוציה קטנה, הממירה תמונה בגודל 13×13 לווקטור מוצא בגודל 4×1. הרשת מורכבת מהפעולות הבאות:

![network](./media/question_10_1_network.png){: width="450px"}

<br>

- שכבת קונבולוציה עם 3 פילטרים (גרעינים) בגודל 4x4
- פונקציית אקטיבציה Relu
- max pooling
- שכבת Fully-connected (FC)

ברשת זאת אין שימוש בbias.

</section><section markdown="1">

#### תרגיל 10.1 - המשך

![network](./media/question_10_1_network.png){: width="450px"}

א) כמה פרמטרים נלמדים יש בשכבת הקונבולוציה

ב) כמה פעולות אקטיבציה מבוצעות (Relu) במעבר קדמי אחד (forward pass)?

ג) כמה משקולות יש בכל הרשת?

ד) האם רשת בקישוריות מלאה (FC) בעלת גודל שכבות זהה – כלומר רשת זהה שבה שכבת הקונבולוציה מוחלפת בשכבת FC, יכולה לייצג את אותה הפונקציה אותה ממשת הרשת המקורית?

ה) מה ההבדל העיקרי בין רשת CNN ל FC שיכולות לייצג את אותו מסווג?

</section><section markdown="1">

#### תרגיל 10.1 - המשך 2

![network](./media/question_10_1_network.png){: width="450px"}

א) כמה פרמטרים נלמדים יש בשכבת הקונבולוציה

##### פתרון

א) סה"כ 48 פרמטרים. קיימים 3 פילטרים בגודל 4×4, לכן 3⋅4⋅4=48.

</section><section markdown="1">

#### תרגיל 10.1 - המשך 2

![network](./media/question_10_1_network.png){: width="450px"}

ב) כמה פעולות אקטיבציה מבוצעות (Relu) במעבר קדמי אחד (forward pass)?

##### פתרון

ב) מבוצעות 304 פעולות Relu. פעולת האקטיבציה מתבצעת לכל מאפיין במוצא שכבת הקונבולוציה ועוד 4 במוצא שכבת הFC. כלומר: $$10 \cdot 10 \cdot 3 + 4 =304$$

</section><section markdown="1">

#### תרגיל 10.1 - המשך 2

![network](./media/question_10_1_network.png){: width="450px"}

ג) כמה משקולות יש בכל הרשת?

##### פתרון

ג) 348 פרמטרים. נפרט את החישוב. בשכבת הקונבולוציה יש 48 פרמטרים (סעיף א), בשכבת הFC יש $$3\times 5\times 5$$ כניסות שמחוברות ל $$4$$ יציאות, סה"כ $$3\times 5\times 5\times 4=300$$.

</section><section markdown="1">

#### תרגיל 10.1 - המשך 2

![network](./media/question_10_1_network.png){: width="450px"}

ד) האם רשת בקישוריות מלאה (FC) בעלת גודל שכבות זהה – כלומר רשת זהה שבה שכבת הקונבולוציה מוחלפת בשכבת FC, יכולה לייצג את אותה הפונקציה אותה ממשת הרשת המקורית?

##### פתרון

ד) כן, הרשת עם שכבת הקונבולוציה הינה מקרה פרטי של רשת FC, עם בחירה ספציפית של המשקולות.

</section><section markdown="1">

#### תרגיל 10.1 - המשך 2

![network](./media/question_10_1_network.png){: width="450px"}

ה) מה ההבדל העיקרי בין רשת CNN ל FC שיכולות לייצג את אותו מסווג?

##### פתרון

ה) הרשת עם שכבת הקונבולוציה מתארת תת-תחום של מרחב הפונקציות שאותה יכולה לתאר רשת הFC. היתרון שברשת עם שכבת הקונבולוציה הינה שהיא עושה זאת על ידי מספר קטן משמעותית של פרמטרים. לכן, בהנחה שניתן לקרב במידה טובה מספיק את פונקצייית המטרה על ידי פונקציות מתת-תחום זה, היא תגרום פחות לoverfit ולכן בעלת סיכוי להניב תוצאות טובות יותר. לשם השוואה ברשת הFC ישנם כ50k פרמטרים.

</section><section markdown="1">

#### תרגיל 10.2

התמך או הrecptive field של משתנה מסויים ברשת מוגדר להיות כל התחום בכניסה אשר משפיע על אותו המשתנה.

א) מצאו את הrecptive field של ערך מסויים במוצא של שלוש שכבות קונבולוציה רצופות עם גרעין של $$3\times 3$$.

ב) רשמו באופן מטריצי את פעולת הקונבולוציה.

</section><section markdown="1">

#### תרגיל 10.2 - פתרון

א) הrecptive field של שלוש שכבות קונבולוציה $$3\times 3$$ הינו $$7\times 7$$:

![First convilution](./media/question_10_2_a.png)

![Second convilution](./media/question_10_2_b.png)

![Third convilution](./media/question_10_2_c.png)

</section><section markdown="1">

#### תרגיל 10.2 - פתרון - המשך

ב. נרשום את הפילטרים ככפל מטריצות, עבור הפילטר הראשון:

$$
w^1 = 
\begin{pmatrix}
w_1 & w_2 & w_3 & 0 & \cdots & 0 & w_4 & w_5 & w_6 & 0 & \cdots \\
0 & w_1 & w_2 & w_3 & 0 & \cdots & 0 & w_4 & w_5 & w_6 &  \cdots \\
\vdots & \vdots \vdots  & \vdots & \vdots & \vdots & \vdots & \vdots & \vdots & \vdots & \vdots 
\end{pmatrix}
\in \mathbb{R}^{d_1\times d_0 = 25 \times 49}
$$

ובאופן זהה עבור פילטר מס' שתיים ושלוש.

$$
w^2 \in \mathbb{R}^{d_2\times d_1 = 9 \times 25} 
$$

$$
w^3 \in \mathbb{R}^{d_3\times d_2 = 1 \times 9}
$$

נרשום את הקלט בצורה וקטורית: $$ x = (x_1, \cdots, x_{49})^T$$

וסה"כ נקבל:
$$
y=w^3 w^2 w^1 x
$$

</section><section markdown="1">

## סכמות אתחול

#### מוטיבציה

ראינו בתרגול 8 שבחירה לא טובה של האתחול יכולה להוביל לכך שפונקציית האקטיבציה תהיה ברוויה והעדכון של המשקולות יהיה איטי ולא אפקטיבי:

<br>

- בעבור משקולות קטנות, האות דועך בין שכבה לשכבה ולא מחלחל לשכבות ראשונות. (vanishing gradients).<br><br>
- בעבור משקולות גדולות, האות גדל בין שכבה לשכבה מה שיכול לגרום לחריגה מתחום ייצוג. (exploding gradients).

</section><section markdown="1">

## סכמות אתחול

![initilization 1](./media/init_1.png){: width="700px"}

![initilization 2](./media/init_2.png){: width="700px"}

בגרפים אלו ניתן לראות את הבעיה של הvanishing gradients.

נרצה למצוא אתחול טוב של המשקולות אשר יאפשר לאות לפעפע דרך הרשת בצורה טובה.

</section><section markdown="1">

#### תרגיל 10.3

בשאלה זו נרצה למצוא סכמת אתחול עבור משקולות הרשת. לשם כך, נתחיל מלבחון נוירון ליניארי בודד.

![Graph](./media/question_10_3_1.png)

**א)** נניח כי כל רכיבי המשקולות וכל רכיבי הכניסה הם משתנים אקראיים IID. בנוסף, נניח כי התפלגות המשקולות סימטרית סביב 0.

</section><section markdown="1">

#### תרגיל 10.3 א

1) חשבו את התוחלת של המוצא $$v$$ כתלות בתוחלות של המשקולות והכניסה. בפרט, הראו כי $$\mathbb{E}\left[v\right]=0$$.

<br>

##### פתרון:

$$\mathbb{E}\left[v\right]=\mathbb{E}\left[w_1 x_1+w_2 x_2+⋯+w_n x_n\right]=n\mathbb{E}\left[w_1 x_1\right]=n\mathbb{E}\left[w_1\right]\mathbb{E}\left[x_1\right]=0$$

</section><section markdown="1">

#### תרגיל 10.3 א - המשך

2) הראו כי לכל זוג משתנים אקראיים בלתי תלויים $$x,y$$ מתקיים:

$$\text{Var}\left(xy\right)=\mathbb{E}\left[x\right]^2\text{Var}\left(y\right)+\mathbb{E}\left[y\right]^2\text{Var}\left(x\right)+\text{Var}\left(x\right)\text{Var}\left(y\right)$$

<br>

##### פתרון:

נעזר בקשר $$\text{Var}\left(z\right)=\mathbb{E}\left[z^2\right]-\mathbb{E}\left[z\right]^2$$:

$$
\begin{aligned}
\text{Var}\left(xy\right)
& = \mathbb{E}\left[x^2y^2\right]-\mathbb{E}\left[xy\right]^2 \\
& = \mathbb{E}\left[x^2\right]\mathbb{E}\left[y^2\right]-\mathbb{E}\left[x\right]^2\mathbb{E}\left[y\right]^2 \\
& = \left(\mathbb{E}\left[x^2\right]-\mathbb{E}\left[x\right]^2+\mathbb{E}\left[x\right]^2\right)\left(\mathbb{E}\left[y^2\right]-\mathbb{E}\left[y\right]^2+\mathbb{E}\left[y\right]^2\right)-\mathbb{E}\left[x\right]^2\mathbb{E}\left[y\right]^2 \\
& = \left(\text{Var}\left(x\right)+\mathbb{E}\left[x\right]^2\right)\left(\text{Var}\left(y\right)+\mathbb{E}\left[y\right]^2\right)-\mathbb{E}\left[x\right]^2\mathbb{E}\left[y\right]^2 \\
& = \text{Var}\left(x\right)\text{Var}\left(y\right)+\text{Var}\left(x\right)\mathbb{E}\left[y\right]^2+\text{Var}\left(y\right)\mathbb{E}\left[x\right]^2 \\
\end{aligned} \\
$$

</section><section markdown="1">

#### תרגיל 10.3 א - המשך 2

3) כעת, נניח כי לכל $$i$$: $$\mathbb{E}\left[x_i\right]=0$$ (בסעיף הבא נראה הצדקה להנחה זו). השתמשו בנוסחה מהסעיף הקודם על מנת לבטא את השונות של $$v$$ באמצעות השונות של $$x_1,w_1$$.

<br>

##### פתרון:

תחת ההנחה כי התוחלות של המשקולות ושל הכניסה הן 0, הנוסחה שהוכחנו בסעיף הקודם מצטמצמת ל$$\text{Var}\left(w_ix_i\right)=\text{Var}\left(x_i\right)\text{Var}\left(w_i\right)$$. בנוסף, עבור מוצא הניורון $$v$$ ניתן לכתוב:

$$
v=w_1 x_1+w_2 x_2+\cdots+w_n x_n
$$

מכיוון שהנחנו שכל המשתנים מפולגים IID נקבל:

$$
\text{Var}\left(v\right)=n\text{Var}\left(w_1 x_1\right)=n\text{Var}\left(w_1\right)\text{Var}\left(x_1\right)
$$

</section><section markdown="1">

#### תרגיל 10.3 א - המשך 3

4) כיצד ניתן לשמור על השונות של המוצא $$v$$ זהה לשונות של כל אחת מרכיבי הכניסה $$x_i$$?

<br>

##### פתרון:

קיבלנו בסעיף הקודם כי שונות המוצא הוא שונות הכניסה מוכפל בפקטור של $$n\text{Var}\left(w_i\right)$$ כאשר $$n$$ הוא מספר הניורונים המוזנים לניורון. לכן, על מנת לשמור על שונות זהה בין כניסה למוצא נבחר את אתחול המשקולות כך שיתקיים:

$$
\text{Var}\left(w_i\right)= \frac{1}{n}
$$

</section><section markdown="1">

#### תרגיל 10.3 -המשך

**ב)** כעת, נרצה להרחיב את הסכמה לנוירונים **לא ליניאריים**:

![Graph](./media/question_10_3_2.png)

- כעת מתקיים כי $$x_i=\sigma\left(y_i\right), \forall i=1, \dots,n$$
- $$\sigma\left(\cdot\right)\$$ היא פונקציית האקטיבציה.
- $$v=w_1 x_1+w_2 x_2+\cdots+w_n x_n$$
- $$y_1,\dots,y_n$$ הם המוצאים של ניורונים מהשכבה הקודמת ברשת.

</section><section markdown="1">

#### תרגיל 10.3

1. לאילו מפונקציות האקטיבציה שלמדנו בקורס (sigmoid, tahn ו-ReLU) ההנחה $$Ex_i=0$$ שביצענו בסעיף הקודם היא עדיין הנחה "סבירה"? תזכורת:
  ![png](Q3_3.png)
2. כעת לא נניח דבר על התוחלת של  $$x_i$$. כיצד ישתנה הביטוי של השונות של  $$v$$ מסעיף א.3?
3. עבור פונקציית האקטיבציה ReLU, בטאו את השונות של $$v$$ באמצעות השונות של אחת הכניסות $$y_i$$. הניחו כי $$Var(y_1 )=Var(y_2 )=\cdots=Var(y_n)$$ 

הדרכה: היעזרו בתוצאות הסעיפים הקודמים.

</section><section markdown="1">

#### תרגיל 10.3 ב

1) לאילו מפונקציות האקטיבציה הבאות: sigmoid, tahn ו-ReLU, ההנחה $$\mathbb{E}\left[x_i\right]=0$$ שביצענו בסעיף הקודם היא עדיין הנחה "סבירה"? תזכורת:

![Activation function](./media/question_10_3_3.png){: width="700px"}

</section><section markdown="1">

#### תרגיל 10.3 ב1

##### פתרון:

אם התפלגות המשקולות סימטרית סביב 0, נקבל כי התפלגות $$y_i$$ סימטרית סביב 0 לכל $$i$$. לכן, ההנחה עדיין סבירה עבור tanh אך לא עבור ReLU וsigmoid. עבור tanh נקבל:
  
$$
\mathbb{E}\left[x\right]=\mathbb{E}\left[\sigma\left(y\right)\right]=\int_{-\infty}^{\infty} \sigma\left(y\right) f_Y\left(y\right)dy=0
$$

כאשר סימנו $$x=x_i,y=y_i$$.

</section><section markdown="1">

#### תרגיל 10.3 ב - המשך

2) כעת לא נניח דבר על התוחלת של $$x_i$$. כיצד ישתנה הביטוי של השונות של $$v$$ מסעיף א.3?

##### פתרון:

משימוש בתוצאות הסעיפים הקודמים, נקבל:
  
$$
\begin{aligned}
\text{Var}\left(v\right)
& = n\text{Var}\left(w_1 x_1\right) \\
& = n\left(\mathbb{E}\left[w_1\right]^2 \text{Var}\left(x_1\right)+\mathbb{E}\left[x_1\right]^2\text{Var}\left(w_1\right)+\text{Var}\left(x_1\right)\text{Var}\left(w_1\right)\right) \\
& = n\text{Var}\left(w_1\right)\left(\mathbb{E}\left[x_1\right]^2+\text{Var}\left(x_1\right)\right) \\
& = n\text{Var}\left(w_1\right)\mathbb{E}\left[x_1^2\right]
\end{aligned}
$$

</section><section markdown="1">

#### תרגיל 10.3 ב - המשך

3) עבור פונקציית האקטיבציה ReLU, בטאו את השונות של $$v$$ באמצעות השונות של אחת הכניסות $$y_i$$. הניחו כי $$\text{Var}\left(y_1\right)=\text{Var}\left(y_2\right)=\cdots=\text{Var}\left(y_n\right)$$

##### פתרון:

אם התפלגות המשקולות סימטרית סביב 0, נקבל כי התפלגות $$y_i$$ סימטרית סביב 0 לכל $$i$$. לכן, עבור פונקציית אקטיבציה ReLU נקבל:
  
$$
\begin{align}
\mathbb{E}\left[x_1^2\right]
& = \mathbb{E}\left[\max\left(0,y_1\right)^2 \right] \\
& = \int_{-\infty}^{\infty} \max\left(0,y_1\right)^2 f_Y\left(y\right)dy \\
& = \int_{0}^{\infty} y_1^2 f_Y\left(y\right)dy \\
& = \frac{1}{2}\int_{-\infty}^{\infty} y_1^2 f_Y\left(y\right)dy \\
& = \frac{1}{2}\mathbb{E}\left[y_1^2\right] = \frac{1}{2}\text{Var}\left(y_1\right)
\end{align}
$$

</section><section markdown="1">

#### תרגיל 10.3 ב - המשך

נשלב את התוצאה יחד עם תוצאות הסעיפים הקודמים ונקבל:

$$
\text{Var}\left(v\right)=n\text{Var}\left(w_1\right)\mathbb{E}\left[x_1^2\right]=\frac{n}{2}\text{Var}\left(w_1\right)\text{Var}\left(y_1\right)
$$

לכן, על מנת לשמור על שונות זהה בין כניסה למוצא נבחר את אתחול המשקולות כך שיתקיים:

$$
\text{Var}\left(w_i\right)= \frac{2}{n}
$$

</section><section markdown="1">

## חלק מעשי

### LeNet-5

בחלק זה נעבור על היישום המעשי הראשון של רשתות קונבולוציה. הארכיטקטורה זאת שימשה ב1998 ושימש לזהות ספרות בכתב יד על צק'ים במערכות בנקאיות.

![LeNet results](./media/lenet.gif){: width="500px"}

הרשת מקבלת תמונה רמת אפור בגודל 32x32 ומשתמש באריטקטורה הבאה על מנת להוציא וקטור פלט באורך 10 אשר מציג את הסבירות שהתמונה שייכת לכל אחת מ 10 הספרות.  

</section><section markdown="1">

#### אריכטקטורה

![LeNet architecture](./media/lenet_arch.png){: width="100%"}

<div dir="ltr" markdown="1">
- C1: Conv + ReLU: kernel size=5x5, output channels=6.
- S2: Max pooling layer: size=2x2, stride=2
- C3: Conv + ReLU: kernel size=5x5, output channels=16.
- S4: Max pooling layer: size=2x2, stride=2
- C5: Conv + ReLU: kernel size=5x5, output channels=120.<br>(this is, in fact, a fully connected layer)
- F6: Fully connected layer + ReLU: output vector length= 84
- Output layer: Fully connected layer: output vector length=10
</div>

על מנת לייצג הסתברות נעשה ביציאה שימוש בשכבת Softmax.

</section><section markdown="1">

#### Dataset: MNIST

לאימון הרשת נעשה שימוש במאגר המידע MNIST. הוא סט פופולרי מאוד שנעשה בו שימוש נרחב עד היום. הסט מורכב 70000  תמונות בינאריות בגודל 28x28 של ספרות בכתב יד, מתוכן 10000 הינם בסט המבחן.

![mnist](output_21_4.png){: width="700px"}

</section><section markdown="1">

#### הגדרת הבעיה

- המשתנים בבעיה:
  - תמונה בגודל 28x28 של סיפרה בכתב יד - $$x$$
  - ערך הסיפרה: \[0-9\] - $$y$$

<br>

המודל יהיה החזאי $$\hat{y}=h^*\left(\boldsymbol{x}\right)$$ שתפקידו למזעזר את פונקציית המחיר misclassification rate:

$$
h^*=\underset{h}{\arg\min}\ E\left[I\left\lbrace h\left(\boldsymbol{x}\right)\neq y\right\rbrace\right]
$$

</section><section markdown="1">

#### חלוקה של מאגר המידע

משום שהמאגר המידע מחולק כבר לסט מבחן, כל מה שנותר לנו הוא לחלק את סט האימון לסט ולידציה וסט אימון.
אין צורך לקחת סט ולידציה גדול משום שהרצת המודל על סט גדול דורשת הרבה משאבים, נקח סט קטן בגודל 1024 על מנת להעריך את ביצועי המודל בתהליך הלמידה באופן מהיר וחסכוני.

</section><section markdown="1">

### לימוד

נשתמש באלגוריתם הגרדיאנט בגרסת ה-mini-batch, או בשמו stochastic gradient descent (SGD), המשמעות הסטוכנסטית היינה שהBatch מוגרל באופן אחיד מתך מאגר המידע. האלגוריתם ישמש למציאת משקולות הרשת להקטנת פונקצית המחיר.

תזכורות: משקולות הרשת הינם המשקולות בגרעיני קונבולוציה, בשכבות FC ואיברי ההסט.

</section><section markdown="1">

#### Hyper-parameters

- הארכיטקטורה של הרשת, שבה לא נעשה כל שינוי.
- אלגוריתם SDG:
  - גודל צעד הלימוד.
  - גודל הBatch, אשר אותו נשאיר קבוע בגודל 64.
  - מס' מקסימלי של epochs.
    epochs - מס המעברים על כל סט האימון

</section><section markdown="1">

#### בחירת גודל צעד הלימוד

נבחן את השפעת גדלי צעד לימוד על תהליך הלימוד.
נריץ את האלגוריתם למשך epoch אחד עם הגדלים הבאים: $$\alpha=10^{0},10^{-1},10^{-2}$$
![png](output_34_0.png){: width="75%"}

קיבלנו שעבור $$\alpha=10^{0}$$ המערכת לא מצליחה לבצע למידה (להקטין את פונקציית המחיר). ניתן להגיד שצעד הלימוד גדול מידי משום שעבור צעד לימוד קטן יותר המערכת כן מצליחה ללמוד.

כמו כן עבור $$\alpha=10^{-1}$$ קיבלנו תהליך התכנסות מהיר הרבה יותר ולמחיר נמוך יותר על פני $$10^{-2}$$. לכן נבחר את גודל הצעד להיות $$\alpha=10^{-1}$$

</section><section markdown="1">

#### האימון

נריץ את באלגוריתם עבור גודל צעד $$\alpha=10^{-1}$$ למשך 20 epochs.

![png](output_37_0.png)

נראה שמודל התכנס יפה, משום שמחיר על סט הולידציה הגיע למישור. ניתן להניח שהמודל הגיע למינימום מקומי (אבל לא ניתן לדעת בוודאות)

</section><section markdown="1">

### הערכת ביצועים

קיבלנו  misclassification rate של כמעט אחוז בודד, כלומר שעבור אחוז מסט המבחן טעינו בחיזוי הסיפרה או לחילופין צדקנו ב99% מסט המבחן.

![png](output_42_0.png){: width="700px"}

</section>
