---
number: 10
title: "CNN" 
---
{% raw %}
## Convolutional Neural Networks (CNN) - רשתות קונבולוציה

אחת מהתכונות של רשת Fully Connected (FC) MLP היא חוסר רגישות לסדר בכניסות לרשת. תכונה זאת נרכשת משום שכל היחידות בכל שכבה מחוברות לכל היחידות בשכבה העוקבת. במקרים רבים תכונה זאת נדרשת אך עולה במספר רב של פרמטרים.

לכן במקרים בהם לכניסות לרשת (data) יש מבנה או תלות מרחבית, כלומר יש משמעות לסדר של הכניסות, נרצה לנצל את ההיתרון המרחבי של הכניסות בזמן קביעת ארכיטקטורת הרשת. דוגמא לסוג כזה של מידע היא תמונות.

רשת קונבולציה היא רשת feed-forward בעלת ארכיטקטורה אשר מנצלת את התלות המרחבית בכניסות לכל שכבה.

## 1D Convolutional Layer
קונבולוציה חד-ממדית מבצעת פעולת קרוס קורלציה בין שני ווקטורים, וקטור הכניסות $$\boldsymbol{x}$$ ווקטור המשקולות $$\boldsymbol{w}$$ באורך $$K$$: 

$$
\boldsymbol{y}\left[n\right]=\sum_{m=0}^{K-1} \boldsymbol{x}\left[n+m\right]\boldsymbol{w}\left[m\right]
$$

וקטור המשקולות של שכבת הקונבולציה $$\boldsymbol{w}$$ נקרא **גרעין הקונבולוציה (convolution kernel)** 
 
**הערה:**
הפעולה היא **לא** פעולת קונבולציה כפי שאתם מכירים: $$\boldsymbol{y}\left[n\right]=\sum_{m=0}^{K-1} \boldsymbol{x}\left[n-m\right]\boldsymbol{w}\left[m\right]$$
![png](figs/conv_layer.png)

נשים לב להבדלים מרשת FC:

1. היציאות מחוברות לחלק מהכניסות, כאשר הכניסות קרובות אחת לשניה
2. כל היציאות מופקות מאותן משקולות

ההנחות שמובילות לארכיטקטורה זאת:
- הקשר בין כניסות קרובות הוא יותר חזק ומשמעותי מאשר כניסות רחוקות.
-  אזורים מקומיים במידע חולקים את אותם מאפיינים מקומיים משותפים, כך שלאזורים שונים יש מאפיינים שונים.

שכבת קונבולוציה מורידה באופן דרסטי את מס' במשקולות לעומת שכבת FC. בשכבת FC קיימות $$N_\text{inputs}\times N_\text{outputs}$$ משקולות בעוד שלשכבת קונבולציה יש $$K$$ משקולות.

דרך נוספת להצגת שכבת קונבולוציה:

![Alt Text](figs/conv_layer.gif)

כאשר:  $$h\left(\boldsymbol{z}\right)=\boldsymbol{w}^T\boldsymbol{z}=w_1z_1+w_2z_2+w_3z_5+b$$, ו- $$b$$ היינו איבר ההסט.


## אקטיבציה לא לינארית 
באותו אופן בשכבת קונבולציה נעשה שימוש בפונקציות אקטיבציה לא לינאריות לאחר פעולת הקונבולציה שהיינה פעולה לינארית.
 גם כאן השימוש הכי נפוץ היינו בפונקציית ReLU: $$\varphi\left(x\right)=\max\left(x,0\right)$$ אך ניתן להשתמש בכל פונקציה אחרת.
 בפועל מפרידים בין פעולת הקונבולוציה לבין פעולת האקטיבציה והארכיטקטורה נראת כך:
 ![png](figs/conv_layer_nonlinear.png)


##  קלט רב-ממדי 
במקרים רבי נרצה ששכבת הקונבולציה תקבל קלט רב ממדי, לדוגמא, תמונה בעלת שלושה ערוצי צבע או קלט שמע ממספר ערוצי הקלטה. מבנה זה מאפשר לאזור מרחבי בקלט להכיל אינפורמציה ממספר ערוצי כניסה.

על כן הניורון $$h$$ הוא פונקציה של כל ערוצי הקלט:
![Alt Text](figs/conv_layer_multi_channel.gif)

הפונקציה $$h$$ היינה קומבינציה לינארית של כל ערוצי הקלט, לרוב מסיפים איבר הסט $$b$$ ופונקציית אקטיבציה.


## פלט רב-ממדי 
נקודה נוספת, לרוב על איזור מרחבי מסויים נרצה להפעיל יותר מגרעין קונבולציה אחד $$h$$, המטרה להשיג מספר גדול יותר של מאפיינים על אותו אזור שמתורגם לפלט רב-ממדי:
[Alt Text](figs/conv_layer_multi_channel2.gif)

בארכיטקטורה הזאת אין שיתוף בין משקולות הגרעינים לערוצים הפלט השונים, כלומר כל גרעין קונבולציה הוא בעל סט משקולות יחודי הפועל על כל הערוצים על מנת להוציא פלט יחיד. 
מספר הפרמטרים בשכבת כזאת היינו:  $$\underbrace{C_\text{in}\times C_\text{out}\times K}_\text{the weights}+\underbrace{C_\text{out}}_\text{the bias}$$

כאשר:
- $$C_\text{in}$$ - מספר ערוצי קלט.
- $$C_\text{out}$$ - מספר ערוצי פלט.
- $$K$$ - גודל הגרעין.

## היפר-פרמטרים של שכבות קונבולוציה 
**גודל הגרעין** ו **מספר ערוצי הפלט** הינם היפר-פרמטרים שעל מתכנן הרשת לקבועי.

בנוסף יש תכונות נוספות על שכבת הקונבולציה שיש לקבוע שגם נחשבים כהיפר-פרמטרים:

### Padding - ריפוד
משום שפעולת קונבולציה היינה מרחבית, בקצוות הקלט ישנה בעיה שאין ערכים חוקיים שניתן לבצע עליהם פעולות, לכן נהוג לרפד את שולי הקלט (באפסים או שכפול של אותו ערך בקצה)
![Alt Text](figs/conv_layer_padding.gif)

### Stride - צעידות
ניתן להניח שלרוב הקשר המרחבי נשמר באזורים קרובים, לכן על מנת להקטין בחישוביות ניתן לדלג על הפלט ולהפעיל את פעולת הקונבולציה באופן יותר דליל. בפשטות: מדלגית על היציאות בגודל הצעד.
לרוב גודל הצעד מסומן ב $$s$$, בדוגמא הבאה גודל הצעד היינו $$s=2$$ .
![Alt Text](figs/conv_layer_stride.gif)


### Dilation - התרחבות
שוב על מנת להקטין בחישובית, אפשר לפעול על אזורים יותר גדולים תוך הנחה שערכים קרובים גיאוגרפית הם בעלי ערך זהה על כן נרחיב את פעולת הקונבולציה תוך השמטה של ערכים קרובים.
לרוב נסמן את ההתרחבות ב $$d$$ בדוגמא הבאה $$d=2$$.
![Alt Text](figs/conv_layer_dilation.gif)

**דגש:** צעידות מצמצמות את הפלט, התרחבות גם מצמצם את הפלט אך על חשבון התחרבות על הקלט. 

## Max Pooling
לרוב ב CNN נעשה שימוש בשכבת נוספות על מנת לצמצם את הגודל המרחבי של הקלט. שכבה כזאת לדוגמא היינה שכבת Max Pooling, שכבה זאת לוקחת את המקסימום מבין ערכי הכניסה. המוטיבציה לפעולה זאת היינה שהערכים הגבוהים מייצגים מאפיינים בעלי יותר אינפורמציה על כן נרצה לשמר את הערכים אלה על חשבון המאפייינים בעלי פחות אינפורציה. 

בדוגמא הבאה גודל ב Max Pooling היינו 2 וגודל הצעד (stride) גם כן 2:
![Alt Text](figs/max_pool.gif)

בשכבה זאת אין פרמטרים נלמדים, אך גודל הגרעין היינו היפר-פרמטר נוסף.

## 2D Convolutional Layer
עבור קלט דו-ממדי (תמונות), הקלט מסודר כמטריצה. ופעולת הקונבולוציה (קרוס-קורלציה כפי שאתם מכירים) נראה כך כאשר השכבה הכחולה היא הקלט והשכבה הירוקה היא הפלט:

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
    <td><img width="150px"src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/no_padding_strides.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/padding_strides.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/padding_strides_odd.gif?raw=true"></td>
    <td><img width="150px" src="https://github.com/vdumoulin/conv_arithmetic/blob/master/gif/dilation.gif?raw=true"></td>
  </tr>
</table>

* \[1\] Vincent Dumoulin, Francesco Visin - [A guide to convolution arithmetic
  for deep learning](https://arxiv.org/abs/1603.07285)
  ([BibTeX](https://gist.github.com/fvisin/165ca9935392fa9600a6c94664a01214))


# חלק מעשי 
## LeNet-5
בחלק זה נעבור על היישום המעשי הראשון של רשתות קונבולוציה. הארכיטקטורה זאת הומצאה ב1998 ושימש לזהות ספרות בכתב יד על צק'ים במערכות בנקאיות.
![Alt text](figs/lenet.gif)

הרשת מקבלת תמונה רמת אפור בגודל 32x32 ומשתמש באריטקטורה הבאה על מנת להוציא וקטור פלט באורך 10 אשר מציג את הסבירות שהתמונה שייכת לכל אחת מ 10 הספרות.  

###  אריכטקטורה 
![png](figs/lenet_arch.png)

אם לא צויין אחרת הארכיטקטורה לא עושה שימוש בריפוד ו-dilation. 

- C1: Convolutional layer + ReLU activation: kernel size=5x5, output channels=6.
- S2: Max pooling layer: size=2x2, stride=2
- C3: Convolutional layer + ReLU activation: kernel size=5x5, output channels=16.
- S4: Max pooling layer: size=2x2, stride=2
- C5: Convolutional layer + ReLU activation: kernel size=5x5, output channels=120. (this is, in fact, a fully connected layer)
- F6: Fully connected layer + ReLU: output vector length= 84
- Output layer: Fully connected layer: output vector length=10

על מנת לייצג הסתברות שהתמונה שייכת לאחת מהמחלקות נעשה ביציאה שימוש בשכבת Softmax, שלא נרחיב עליה בקורס.

# Dataset: MNIST
.לאימון הרשת נעשה שימוש במאגר המידע MNIST. הוא סט פופולרי מאוד שנעשה בו שימוש נרחב עד היום. הסט מורכב 70000  תמונות בינאריות בגודל 28x28 של ספרות בכתב יד, מתוכן 10000 הינם בסט המבחן.


ניתן להוריד את הסט מ
[Yann LeCun's web site](http://yann.lecun.com/exdb/mnist/) 
 או לחילופין, ישרות מ -PyTorch
 [torchvision.datasets.MNIST](https://pytorch.org/docs/stable/torchvision/datasets.html#mnist)
 
### דוגמא מתוך המאגר 


Number of rows in the train dataset: $$N=60000$$
Number of rows in the test dataset: $$N=10000$$
Image size: 28x28
Pixels value range: [0.0, 1.0]
![png](output_21_4.png)


## 📜 הגדרת הבעיה 

- המשתנים בבעיה:
  - תנונה בגודל 28x28 של סיפרה בכתב יד  $$x$$
  - ערך הסיפרה: \[0-9\]  $$y$$

המודל יהיה החזאי $$\hat{y}=h^*\left(\boldsymbol{x}\right)$$ שתפקידו למזעזר את פונקציית המחיר misclassification rate:

$$
h^*=\underset{h}{\arg\min}\ E\left[I\left\lbrace h\left(\boldsymbol{x}\right)\neq y\right\rbrace\right]
$$

### 📚 חלוקה של מאגר המידע
משום שהמאגר המידע מחולק כבר לסט מבחן, כל מה שנותר לנו הוא לחלק את סט האימון לסט ולידציה וסט אימון.
אין צורך לקחת סט ולידציה גדול משום שהרצת המודל על סט גדול דורשת הרבה משאבים, נקח סט קטן בגודל 1024 על מנת להעריך את ביצועי המודל בתהליך הלמידה באופן מהיר וחסכוני.

## 💡 אלגוריתם למידה 

נשתמש באלגוריתם הגרדיאנט בגרסת ה-batch, או בשמו stochastic gradient descent (SGD), המשמעות הסטוכנסטית היינה שהBatch מוגרל באופן אחיד מתך מאגר המידע.
האלגוריתם ישמש למציאת משקולות הרשת להקטנת פונקצית המחיר.

תזכורות: משקולות הרשת הינם המשקולות בגרעיני קונבולוציה, בשכבות FC ואיברי ההסט.


### Hyper-parameters

- הארכיטקטורה של הרשת, שבה לא נעשה כל שינוי.
- אלגוריתם SDG:
  - גודל צעד הלימוד.
  - גודל הBatch, אשר אותו נשאיר קבוע בגודל 64.
  - מס' מקסימלי של epochs. 
    epochs - מס המעברים על כל סט האימון


## ⚙️ Learning

### Selecting the Learning Rate

נבחן את השפעת גדלי צעד לימוד על תהליך הלימוד.
נריץ את האלגוריתם למשך epoch אחד עם הגדלים הבאים: $$\alpha=10^{0},10^{-1},10^{-2}$$
![png](output_34_0.png)

קיבלנו שעבור $$\alpha=10^{0}$$ המערכת לא מצליחה לבצע למידה (להקטין את פונקציית המחיר). ניתן להגיד שצעד הלימוד גדול מידי משום שעבור צעד לימוד קטן יותר המערכת כן מצליחה ללמוד.

כמו כן עבור $$\alpha=10^{-1}$$ קיבלנו תהליך התכנסות מהיר הרבה יותר ולמחיר נמוך יותר על פני $$10^{-2}$$. לכן נבחר את גודל הצעד להיות $$\alpha=10^{-1}$$   

## Training
נריץ את באלגוריתם עבור גודל צעד $$\alpha=10^{-1}$$ למשך 20 epochs.
![png](output_37_0.png)

נראה שמודל התכנס יפה, משום שמחיר על סט הולידציה הגיע למישור. ניתן להניח שהמודל הגיע למינימום מקומי (אבל לא ניתן לדעת בוודאות)


## ⏱️ הערכת ביצועים#
נריץ את המודל לאחר הלימוד על סט המבחן ונקבל שפונקצית המחיר היינה

The test risk is: $$0.0091$$

קיבלנו  misclassification rate של כמעט אחוז בודד, כלומר שעבור אחוז מסט המבחן טעינו בחיזוי הסיפרה או לחילופין צדקנו ב99% מסט המבחן. 
![png](output_42_0.png)


{% endraw %}