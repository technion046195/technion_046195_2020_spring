---
number: 3
title: "שיערוך פילוג בשיטות פרמטריות"
hide: true
---

## תיאוריה

סימונים:
- $$N$$ - מספר הדגימות במדגם
- $$\omega_i$$ - הדגם ה $$i$$
- $$X$$, $$Y$$ - משתנים אקראיים
- $$D=\left\lbrace x_i\right\rbrace_{i=1}^N$$ - המדגם (אשר כולל $$N$$ דגמים בלתי תלויים סטטיסטית ובעלי פילוג זהה, i.i.d)
- $$x_i=X\left(\omega_i\right)$$ - הריאלוזציה שמיוחסת לדגם $$\omega_i$$. ערכים אלו נקראים לרוב .**data points**.
- $$p_X\left(x\right)$$ - פונקציית ההסתברות (PMF) או הצפיפות ההסתברות (PDF) של משתנה אקראי.
- $$F_X\left(x\right)$$ - פנקציית הפילוג המצרפי של משתנה אקראי.
- $$I\left\lbrace E\right\rbrace$$ - פונקציית אינדיקטור של האם המאורע $$E$$ התרחש, לדוגמא: $$I\left\lbrace x<y\right\rbrace=\begin{cases}1\ \text{if}\ x<y\\0\ \text{else}\end{cases}$$.
- אנו נשתמש בסימון "כובע" ("hat") על מנת לציין שערוך של ערך בלתי ידוע. לדוגמא נסמן $$\hat{p}_X\left(x\right)$$ לשערוך של $$p_X\left(x\right)$$

המטרה: לשערך את הפילוג של משתנה אקראי מתוך מדגם נתון.

### גישות

כפי שנלמד בהרצאה, ניתן להבחין בין הגישות הבאות להסקה סטטיסטית: 

- גישה פרמטרית לעומת גישה לא-פרמטרית (א-פרמטרית) 
- גישה בייסיאנית לעומת גישה לא-בייסיאנית (קלאסית \ תדירותית). 

בתרגול הקודם התמקדנו בשיטות שערוך לא פרמטריות. בפרט, ראינו מספר שיטות להערכת פונקציית צפיפות ההסתברות $$p_X$$ מתוך מדגם נתון $$D$$ ללא הנחות כלשהן על אופי הפילוג. גישה פופולרית יותר, הינה הגישה הפרמטרית. בגישה זו אנו מניחים כי פונקציית צפיפות ההסתברות אותה אנו מנסים לשערך $$p_X$$  הינה בעל צורה ידועה, עד כדי וקטור פרמטרים $$\boldsymbol{\theta}$$. במילים אחרות, אנו נשתמש במודל פרמטרי בכדי לתאר את פונקציית צפיפות ההסתברות. בהינתן מודל הפרמטרי כלשהו, אנו נרצה למצוא את סט הפרמטרים האופטמאלי כך שהמודל יתאים בצורה מיטבית למדגם. 

נבדיל עתה בין הגישה הבייסאנית לגישה הלא-בייסיאנית לשערוך פרמטרים:

- בגישה בייסיאנית אנו נניח כי וקטור הפרמטרים $$\boldsymbol{\theta}$$ הינו וקטור אקראי בעל פילוג כלשהוא $$P_{\boldsymbol{\Theta}}$$ המכונה ה**פילוג הפריורי** (**prior distribution**) או ה**א-פריורי** (**a priori distribution**)
- בגישה הלא-בייסיאנית (המכונה גם: קלאסית או תדירותית (**Frequintist**)), אנו מתייחסים לוקטור הפרמטרים $$\boldsymbol{\theta}$$ כאל וקטור דטרמיניסטי לא יודע. בפרט, אנו נמנעים מהנחות סטטיסטיות כלשהן לגביו. 



### משערך Maximum a Posteriori (MAP)

משערך הMAP משתייך לקטגוריה של שערוך בייסיאני. עבור משערך זה, נרצה למצוא את אוסף הפרמטרים אשר ממקסם את ההתפלגות האפוסטריורית של המדגם, כלומר ההתפלגות בדיעבד: 

$$p_{\boldsymbol{\Theta}\lvert D}$$ -צפיפות הפילוג של וקטור הפרמטרים בהינתן המדגם $$D$$.

$$
\hat{\boldsymbol{\theta}}_{\text{MAP}}^*=\underset{\hat{\boldsymbol{\theta}}}{\arg\max}\quad p_{\boldsymbol{\Theta}\lvert D}\left(\hat{\boldsymbol{\theta}}\lvert D\right)
$$

נרצה למצוא את משערך MAP ע"י פתרון בעיית אופטימיזציה זו. על לפשט את הבעיה, נעזר חוק בייס: 

$$
\begin{aligned}
\hat{\boldsymbol{\theta}}_{\text{MAP}}^*
& = \underset{\hat{\boldsymbol{\theta}}}{\arg\max}\quad p_{\boldsymbol{\Theta}\lvert D}\left(\hat{\boldsymbol{\theta}}\lvert D\right) \\
& = \underset{\hat{\boldsymbol{\theta}}}{\arg\max}\quad \frac{p_{D\lvert\boldsymbol{\Theta}}\left(D\lvert\boldsymbol{\Theta}=\hat{\boldsymbol{\theta}}\right)p_{\boldsymbol{\Theta}}\left(\hat{\boldsymbol{\theta}}\right)}{p_{D}\left(D\right)} \\
& = \underset{\hat{\boldsymbol{\theta}}}{\arg\max}\quad p_{D\lvert\boldsymbol{\Theta}}\left(D\lvert\boldsymbol{\Theta}=\hat{\boldsymbol{\theta}}\right)p_{\boldsymbol{\Theta}}\left(\hat{\boldsymbol{\theta}}\right)
\end{aligned}
$$

ניתן לראות שלמעשה ההתפלגות האפוסטריורית מושפעת משני גורמים: 

1. הסבירות (likelihood): $$p_{D\lvert\boldsymbol{\Theta}}\left(D\lvert\boldsymbol{\Theta}=\hat{\boldsymbol{\theta}}\right)$$ - צפיפות ההסתברות של המדגם בהינתן וקטור הפרמטרים.

2. הPrior: $$P_{\boldsymbol{\Theta}}\left(\boldsymbol\theta\right)$$ - ההסתברות האפריורית של הפרמטרים.

באופן אינטואיטיבי, יש כאן איזון בין כמה הפרמטר סביר לבין כמה הוא מאפשר הסבר טוב של ה- DATA. זאת בשונה ממשערך ה- MLE שבו אנחנו בודקים רק כמה הפרמטר מסביר את ה- DATA. 

#### משערך Maximum Likelihood Estimator (MLE)

משערך ה-MLE נכנס לקטגוריה של שערוך לא בייסיאני.

משערך הסבירות המירבית (Maximum Likelihood Estimator)  משערך את $$\boldsymbol{\theta}$$ ע"י:

$$
\hat{\boldsymbol{\theta}}_{\text{MLE}}^*=\underset{\hat{\boldsymbol{\theta}}}{\arg\max}\quad p_{D}\left(D;\hat{\boldsymbol{\theta}}\right)=\underset{\hat{\boldsymbol{\theta}}}{\arg\max}\quad \log\left(p_{D}\left(D;\hat{\boldsymbol{\theta}}\right)\right)
$$

כאשר אנו מניחים כי הדגימות IID ולכן: 

$$
p_{D}\left(D;\hat{\boldsymbol{\theta}}\right)=p_{\boldsymbol{x}}\left(x_1,\ldots,x_n;\hat{\boldsymbol{\theta}}\right)=\prod_{i=1}^N p_{X}\left(x_i;\hat{\boldsymbol{\theta}}\right)
$$

ע"י הפעלת פונקציית ה-log נקבל:

$$
\hat{\boldsymbol{\theta}}_{\text{MLE}}^*=\underset{\hat{\boldsymbol{\theta}}}{\arg\max}\quad \sum_{i=1}^N \log\left(p_{X}\left(x_i;\hat{\boldsymbol{\theta}}\right)\right)
$$

עבור מדגם נתון $$D$$, נהוג לסמן $$L\left(\boldsymbol{\theta}\right)\triangleq p_D\left(D;\boldsymbol{\theta}\right)$$. הגודל $$L\left(\boldsymbol{\theta}\right)$$ נקרא **פונקציית הסבירות** (**likelihood**). כמו כן, נהוג לסמן את **פונקציית הסבירות הלוגריתמית** (**log likelihood**) ע"י:

$$
l\left(\boldsymbol{\theta}\right)\triangleq \log\left(L\left(\boldsymbol{\theta}\right)\right)= \sum_{i=1}^N \log\left(p_{X}\left(x_i;\boldsymbol{\theta}\right)\right)= \sum_{i=1}^N l_i\left(\boldsymbol{\theta}\right)
$$

#### ✍️ תרגיל 3.1

א) נתון כי $$X\sim N\left(\mu,\sigma^2\right)$$, כאשר הממוצע  $$\mu$$ והשונות $$\sigma^2$$ אינם ידועים. נתונות $$N$$ דגימות בלתי תלויות של $$X$$: $$\left\lbrace x_i\right\rbrace_{i=1}^N$$.

הראו כי $$\hat{\mu}_{\text{MLE}}=\frac{1}{N}\sum_{i=1}^N x_i$$, $$\sigma^2_{\text{MLE}}=\frac{1}{N}\sum_{i=1}^N\left(x_i-\hat{\mu}_{\text{MLE}}\right)^2$$

ב) נתונות $$N$$ דגימות בלתי תלויות של $$X$$, כאשר $$X\sim U\left[0, \theta\right]$$. מהו משערך הMLE עבור $$\theta$$?

ג) נתונה קוביה בעלת 6 פאות והסתברות $$\left(p_1,\ldots,p_6\right)$$. מתבצע ניסיוי של $$N\leq1$$ הטלות. חשבו את משערך הMLE עבור פונקציית ההסתברות.

ד) (**לקריאה עצמית**) נתונות $$N$$ דגימות בלתי תלויות של $$X$$, כאשר $$X\sim \exp\left(\theta\right)$$. מהו משערך הMLE עבור $$\theta$$?

##### 💡 פיתרון

א) נסמן $$\theta_1=\mu$$, $$\theta_2=\sigma^2$$ כלומר $$\boldsymbol{\theta}=\left[\theta_1,\theta2\right]^T$$

**המטרה**: למצוא $$\boldsymbol{\theta}=\left[\theta_1,\theta2\right]^T$$ הממקסם את $$l\left(\boldsymbol{\theta}\right)$$. כלומר נדרוש:

$$
\begin{cases}
\frac{\partial l\left(\theta\right)}{\partial \theta_1}=0 \\
\frac{\partial l\left(\theta\right)}{\partial \theta_2}=0 \\
\end{cases}
$$

אצלנו:

$$
l_i\left(\boldsymbol{\theta}\right)\triangleq \log p\left(x_i;\boldsymbol{\theta}\right)=-\tfrac{1}{2}\log\left(2\pi\theta_2\right)-\frac{1}{2\theta_2}\left(x_i-\theta_1\right)^2
$$

נגזור ונקבל:

$$
\frac{\partial l_i\left(\theta\right)}{\partial \theta_1}=\frac{1}{\theta_2}\left(x_i-\theta_1\right) \\
\frac{\partial l_i\left(\theta\right)}{\partial \theta_2}=-\frac{1}{2\theta_2}+\frac{1}{2\theta_2^2}\left(x_i-\theta_1\right)^2
$$

בסה"כ נקבל את שני התנאים הבאים למקסימום:

$$
\begin{cases}
\sum_{i=1}^N\frac{1}{\theta_2}\left(x_i-\theta_1\right)=0 \\
-\sum_{i=1}^N\frac{1}{2\theta_2}+\sum_{i=1}^N\frac{1}{2\theta_2^2}\left(x_i-\theta_1\right)^2=0
\end{cases}
$$

מהתנאי הראשון מקבלים:

$$
\sum x_k=n\theta_1\quad \Rightarrow\quad \theta_1=\hat{\mu}=\frac{1}{N}\sum_{i=1}^N x_i
$$

מהתנאי השני:

$$
\frac{1}{\theta_2}n=\frac{1}{\theta_2^2}\sum_{i=1}^N\left(x_i-\theta_1\right)^2\quad\Rightarrow\quad\theta_2=\sigma^2=\frac{1}{N}\sum_{i=1}^N\left(x_i-\theta_1\right)^2
$$

ב) נשים לב, כי:

$$
p_X\left(x_i=x;\theta\right)=
\begin{cases}
\tfrac{1}{\theta} & \theta\geq x_i\geq 0 \\
0 & \theta < x_i
\end{cases}
$$

ולכן:

$$
p\left(D;\theta\right)=
\begin{cases}
\tfrac{1}{\theta} & \forall x_i, \theta\geq x_i\geq 0 \\
0 & \text{else}
\end{cases}
$$

ומכאן נקבל כי משערך הMLE של $$\hat{\theta}=\max\left\lbrace x_i\right\rbrace_{i=0}^N$$

ג) נשים לב כי:

$$
p\left(x_i=x;\theta\right)=\theta\exp\left(-\theta x_i\right)
$$

ולכן:

$$
p\left(D;\theta\right)=\theta^n\exp\left(-\theta\sum_{i=1}^N x_i\right)
$$

נסתכל על הloglikelihood  ונקבל כי:

$$
\log\left(p\left(D;\theta\right)\right)=N\log\left(\theta\right)-\theta\sum_{i=1}^Nx_i
$$

נגזור לפי $$\theta$$:

$$
\frac{\partial}{\partial\theta}\log p\left(D;\theta\right)=\frac{N}{\theta}-\sum_{i=1}^N x_i
$$

ומכאן שמשערך הMLE של $$\hat{\theta}=\frac{N}{\sum_{i=1}^N x_i}$$

ד) הבעיה שאנו רוצים לפתור היא

$$
\begin{aligned}
\underset{\boldsymbol{\theta}}{\arg\max}\quad & p_D\left(D;\boldsymbol{\theta}\right) \\
\text{s.t.} & \left\lVert\boldsymbol{\theta}\right\rVert_1=\sum_{j=1}^6\theta_j=1
\end{aligned}
$$

נרשום את הLagrangian:

$$
\begin{aligned}
L\left(\boldsymbol{\theta},\lambda\right)
& = \log\left(\prod_{i=1}^N p\left(x_i=z;\boldsymbol{\theta}\right)\right)-\lambda\left(\sum_{j=1}^6\theta_j-1\right) \\
& = \log\left(\prod_{i=j}^6 \theta_j^{m_j}\right)-\lambda\left(\sum_{j=1}^6\theta_i-1\right) \\
& = \sum_{j=1}^6m_j\log\left(\theta_j\right)-\lambda\left(\sum_{j=1}^6\theta_i-1\right) \\
\end{aligned}
$$

כאשר $$m_j$$ הינו מספר הפעמים אשר הוגרלה הפיאה ה-$$j$$.

נמישך ונגזור את הLagrangian לפי הפרמטרים $$\boldsymbol{\theta},\lambda$$:

$$
\log\left(L\left(\boldsymbol{\theta},\lambda\right)\right)=\sum_{j=1}^6m_j\log\left(\theta_j\right)-\lambda\left(\sum_{j=1}^6\theta_i-1\right) \\
\Rightarrow
\begin{cases}
\frac{\partial}{\partial\theta_l}\log\left(L\left(\boldsymbol{\theta},\lambda\right)\right)=\frac{m_l}{\theta_l}-\lambda=0\\
\frac{\partial}{\partial\lambda}\log\left(L\left(\boldsymbol{\theta},\lambda\right)\right)=\sum_{j=1}^6\theta_j-1=0\\
\end{cases} \\
\Rightarrow\begin{cases}
\theta_l=\frac{m_l}{\lambda}\\
\sum_{j=1}^6\theta_j=1\\
\end{cases} \\
\Rightarrow\begin{cases}
\theta_l=\frac{m_l}{\lambda}\\
\sum_{j=1}^6\frac{m_l}{\lambda}=1\\
\end{cases} \\
\Rightarrow\begin{cases}
\theta_l=\frac{m_l}{N}\\
\lambda=\sum_{j=1}^6m_l=N\\
\end{cases} \\
$$

קיבלנו כי

$$
\hat{\theta}_l=\frac{m_l}{N}
$$

כלומר משערך הMLE הינו התדירות היחסית.

##### נדון במקרי הקצה

עבור $$N=1$$: עבור הטלה בודדת שתוצאתה $$x\in\left\lbrace1,2,3,4,5,6\right\rbrace$$ המשערך המתאים הינו שבאופן דטרמיניסטי מתקבלת תמיד התוצאה $$i$$. באופן מתמטי $$\hat{\theta}_l=I\left\lbrace l=x\right\rbrace$$

עבור $$N\rightarrow\infty$$: לפי חוק המספרים הגדולים נקבל שהמשערך שלנו מקיים:

$$
\hat{\theta}_l\rightarrow p_X\left(l\right)
$$

#### ✍️ תרגיל 3.2

נתון שהרווח היומי של חברת "רווחילי" מתפלג גאוסית $$X\sim N\left(\theta,\sigma_1\right)$$.  . לשם הפשטות נניח שהרווחים בכל יום בלתי תלויים ברווחים בימים אחרים, כלומר $$\left\lbrace x_i\right\rbrace_{i=1}^N$$ הינם משתנים i.i.d, ונתונים לנו $$N$$ ימים עוקבים של רווחים.

בשאלה זו נניח ש $$\sigma_1$$ הינו פרמטר ידוע וקבוע ונרצה לחשב את תוחלת הרווח היומי, כלומר לשערך את $$\theta$$. יוסי הציע מודל עבור ההתפלגות של $$\theta$$ בהתאם למחקר שביצעו על חברות שונות במשק. יוסי טען שההצלחה של חברות מתפלגת גאוסית, כאשר רק אחוז קטן מהחברות במשק מצליחות. לכן הגדיר את קריטריון ההצלחה של "רווחילי" כ $$\theta\sim N\left(\mu,\sigma_2\right)$$.

א) חשב את משערך הMAP בהתאם למדגם.

ב) נתחו את המקרים השונים של המודל שהציע יוסי, עבור ערכים שונים של $$\sigma_1,\sigma_2$$.

**נתון** כי $$\mu<0$$ וכי המדידות מקיימות $$\sum_{i=1}^N x_i >0 $$.

##### 💡 פיתרון

נחשב את משערך הMAP על פי הגדרה

$$
\begin{aligned}
\hat{\theta}_\text{MAP}^*
& = \underset{\hat{\theta}}{\arg\max}\quad p_{D\lvert\Theta}\left(D\lvert\Theta=\hat{\theta}\right)p_\Theta\left(\hat{\theta}\right) \\
& = \underset{\hat{\theta}}{\arg\max}\quad \prod_{i=1}^Np_{X\lvert\Theta}\left(x_i\lvert\Theta=\hat{\theta}\right)p_\Theta\left(\hat{\theta}\right) \\
& = \underset{\hat{\theta}}{\arg\min}\quad -\sum_{i=1}^N\log\left(p_{X\lvert\Theta}\left(x_i\lvert\Theta=\hat{\theta}\right)\right) - N\log\left(p_\Theta\left(\hat{\theta}\right)\right) \\
& = \underset{\hat{\theta}}{\arg\min}\quad \frac{N}{2}\log\left(2\pi\sigma_1^2\right)+\sum_{i=1}^N\frac{\left(x_i-\theta\right)^2}{2\sigma_1} + \frac{N}{2}\log\left(2\pi\sigma_2\right) + \frac{\left(\theta-\mu\right)^2}{2\sigma_2}\\
& = \underset{\hat{\theta}}{\arg\min}\quad \sum_{i=1}^N\frac{\left(x_i-\theta\right)^2}{2\sigma_1} + \frac{\left(\theta-\mu\right)^2}{2\sigma_2}\\
\end{aligned}
$$

נגזור ונשווה ל-0

$$
\frac{\partial}{\partial\theta}\left(\sum_{i=1}^N\frac{\left(x_i-\theta\right)^2}{2\sigma_1^2} + \frac{\left(\theta-\mu\right)^2}{2\sigma_2^2}\right)=0\\
\Leftrightarrow \sum_{i=1}^N\frac{\theta-x_i}{\sigma_1^2} + \frac{\theta-\mu}{\sigma_2^2}=0 \\
\Leftrightarrow \sum_{i=1}^N\frac{\theta-x_i}{\sigma_1^2} + \frac{\theta-\mu}{\sigma_2^2}=0 \\
\theta=\frac{\frac{\sum_{i=1}^Nx_i}{\sigma_1^2}+\frac{\mu}{\sigma_2^2}}{\frac{N}{\sigma_1^2}+\frac{1}{\sigma_2^2}}
$$

קיבלנו כי:

$$
\hat{\theta}_\text{MAP}^*=\frac{\frac{\sum_{i=1}^Nx_i}{\sigma_1^2}+\frac{\mu}{\sigma_2^2}}{\frac{N}{\sigma_1^2}+\frac{1}{\sigma_2^2}}
$$

נשים לב שקיבלנו משערך הדומה למשערך MLE אק עם תוספת במונה $$\frac{\mu}{\sigma_2^2}$$ ובמכנה $$\frac{1}{\sigma_2^2}$$ שנובעת מהפילוג האפריורי.

ב) נסתכל על מקרי הקצה.

כאשר $$\sigma_1\ll\sigma_2$$:

$$
\hat{\theta}_\text{MAP}^*\approx\frac{\frac{\sum_{i=1}^Nx_i}{\sigma_1^2}}{\frac{N}{\sigma_1^2}}=\frac{1}{N}\sum_{i=1}^Nx_i
$$

נשים לב שקיבלנו בקירוב את הממוצע האמפירי שאותו קיבלנו עבור משערך הMLE. כלומר $$\hat{\theta}_\text{MAP}^*\approx\hat{\theta}_\text{MLE}^*$$

נבאר מקרה פרטי לתוצאה זו $$\sigma_2\rightarrow\infty$$:

כאשר השונות היא אינסופית, למעשה הפילוג הוא אחיד בכל המרחב, לכן, למעשה אין לנו כל הנחה מוקדימה לגבי ההיתכנות של $$\theta$$. במצב כזה נקבל:

$$
\hat{\theta}_\text{MAP}^*=\underset{\hat{\theta}}{\arg\max}\quad p_{\Theta\lvert D}\left(\hat{\theta}\lvert D\right)=\underset{\hat{\theta}}{\arg\max}\quad p_{D\lvert\Theta}\left(D\lvert\Theta=\hat{\theta}\right)1=\hat{\theta}_\text{MLE}^*
$$

כאשר $$\sigma_1\gg\sigma_2$$ 

$$
\hat{\theta}_\text{MAP}^*=\frac{\frac{\mu}{\sigma_2^2}}{\frac{1}{\sigma_2^2}}=\mu
$$

שים לב שהפעם נקבל שהשערוך שלנו תלוי אך ורק בפילוג האפריורי שיוסי הגדירלבעיה. במקרה שלנו, יוסי הניח $$\mu<0$$, אז ההנחה שהחברה תהיה בהפסדים.

האם התוצאה טובה או לא? 

לשאלה זו יש אספקט פילוסופי מסויים. עם זאת, ננסה לענות עליה. כאשר יש לנוDATA רב, כלומר N גדול, ניתן להניח שה- DATA על החברה הספציפית יהיה מייצג טוב יותר את הרווחים שלה, מאשר המידע שנגזר מ- DATA על חברות שונות. 

 לעומת זאת, כאשר N קטן, ניתן לשער שההנחה שלנו על חוסר קורלציה ברווחים היה לא נכון. לכן, שימוש במשערך ה- MAP יכול לתת לנו תוצאה טובה יותר מכיוון שהוא מבוסס על מדגם רחב יותר. חשוב להדגיש שוב, שזהו רק ניתוח סטטיסטי ואין בו חיוב מתמטי. 

כאשר $$\sigma_1\gg\sigma_2$$ 

$$
\hat{\theta}_\text{MAP}^*=\frac{\sum_{i=1}^Nx_i+\mu}{N+1}
$$

ניתן להסתכל על מצב זה כתיקון למשערך ה- MLE של מדידה נוספת אשר מגלמת את מידת הבטחון שלנו בפרמטר. שוב, חשוב להדגיש שמידת הבטחון היא הנחה, ולכן לא בהכרח שמשערך MAP ייתכן תוצאות יותר טובות מאשר MLE. 

## בעיה מעשית

### 🚖 תזכורת: מדגם נסיעות המונית בNew York

עשרת הדגמים הראשונים במדגם הנסיעות בעיר New York

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

### ❓️ הבעיה: שיעורך משך הפילוג של משך הנסיעה

אנו מעוניינים לשערך את הפילוג של משך הנסיעה

### 💡 ניסיון 1: MLE ופילוג גאוסי

נשתמש במודל של פילוג נורמאלי לתיאור הפילוג של משך הנסיעה. למודל זה שני פרמטרים, התוחלת $$\mu$$ והשונות $$\sigma$$ .

#### פתרון

סימונים והנחות:

- $$N$$ - מספר הגדמים במדגם.

- $$\boldsymbol{\theta}=\left[\mu,\sigma\right]^T$$ - וקטור הפרמטרים של המודל
- $$p_\text{normal}\left(x_i;\boldsymbol{\theta}\right)=\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{\left(x_i-\mu\right)^2}{2\sigma^2}\right), i=1,...,N$$ - המודל

ראינו כי בעבור המודל הנורמאלי, ניתן למצוא את הפרמטרים של מעשרך הMLE באופן מפורש (אנליטית), והפתרון נתון על ידי:

$$
\mu=\displaystyle{\frac{1}{N}\sum_i x_i} \\
\sigma=\sqrt{\displaystyle{\frac{1}{N}\sum_i\left(x_i-\mu\right)^2}}
$$

בעבור המדגם הנתון נקבל:

$$
\hat{\mu} = 11.4\ \text{min} \\
\hat{\sigma} = 7.0\ \text{min}
$$

נשרטט את ההיסטוגרמה של של משכי הנסיעה יחד עם הפילוג הנורמאלי המשוערך:

![normal](./media/normal.png)

נראה כי הפילוג הנורמאלי נותן קירוב מאד גס לפילוג האמיתי. במקרים רבים קירוב זה יהיה מספיק, אך במקרה זה ננסה לשפר את השיערוך שלנו.

עובדה אחת שמאד מטרידה לגבי הפילוג שקיבלנו הינו שישנו סיכוי לא אפסי לקבל נסיעות עם משך נסיעה שלילי.

ננסה להציע מודל טוב יותר

### 💡 נסיון 2: MLE ופילוג Rayleigh

פילוג Rayleigh מתאר את הפילוג של האורך האוקלידי ($$l_2$$ norm) של וקטור גאוסי דו מימדי עם תוחלת 0 וחוסר קורלציה ופילוג זהה לשני רכיבי הוקטור. במלים אחרות וקטור בעל הפילוג הבא:

$$
\boldsymbol{Z}\sim N\left(\begin{bmatrix} 0 \\ 0 \end{bmatrix}, \begin{bmatrix} \sigma^2 & 0 \\ 0 & \sigma^2 \end{bmatrix}\right)
$$

פילוג Rayleigh מתאר את הפילוג של הגודל  $$\left\lVert\boldsymbol{Z}\right\rVert_2=\sqrt{Z_x^2+Z_y^2}$$ 

פונקציית צפיפות ההסתברות של פילוג Reyligh נתונה על ידי:

$$
p_\text{Rayleigh}\left(z;\sigma\right)=\frac{z}{\sigma^2}\exp\left({-\frac{z^2}{2\sigma^2}}\right), \quad z\geq0
$$

נשים לב כי הפילוג מוגדר רק בעבור ערכים חיוביים. לפילוג זה פרמטר יחיד $$\sigma$$ שנקרא פרטמטר סקאלה (scale parameter). בניגוד לפילוג הנורמאלי, פה $$\sigma$$ אינה שווה לסטיית התקן של הפילוג.

לשם השלמות נסמן את וקטור הפרמטרים של ב: $$\boldsymbol{\theta}=\left[\sigma\right]$$

ניתן מוטיבציה קצרה לבחירה שלנו במודל זה.

#### מוטיבציה לשימוש בפילוג Rayleigh

נתחיל עם ההנחה שוקטור המחבר את נקודת תחילת הנסיעה עם נקודת סיום הנסיעה הינו וקטור דו מימדי אשר אשר מפולג נרמאלית ולשם הפשטות נניח כי רכיביו מפולגים עם פילוג זהה וחסר קורלציה.

בנוסף לשם הפשטות נניח כי המונית נוסעת בקירוב בקו ישר בין נקודת ההתחלה והסיום ולכן המרחק אותו נוסעת המכונית יהיה מפולג על פי פילוג Reyleigh. נניח בנוסף כי מהירות הנסיעה קבוע ולכן משך הנסיעה פורפורציוני למרחק ולכן גם הוא יהיה מפולג על פי פילוג Reyleigh.

#### פתרון

במקרה זה המודל נתון על ידי:

$$
p_\text{rayleigh}\left(\boldsymbol{x};\boldsymbol{\theta}\right)=\prod_{i=1}^{N}\frac{x_i}{\sigma^2}\exp\left(-\frac{x_i^2}{2\sigma^2}\right)
$$

ופונקציית ה log likelihood תהיה:

$$
\begin{align*}
l_\text{rayleigh}\left(\boldsymbol{\theta}|\{x\}\right)
& = \sum_i\log\left(p_\text{rayleigh}\left(x_i;\boldsymbol{\theta}\right)\right) \\
& = \sum_i\log\left(x_i\right)-2N\log\left(\sigma\right)-\frac{1}{2\sigma^2}\sum_ix_i^2
\end{align*}
$$

בעיית האופטימיזציה שלנו תהיה:

$$
\hat{\boldsymbol{\theta}}=\underset{\boldsymbol{\theta}}{\arg\min}\ -\sum_i\log\left(x_i\right)+2N\log\left(\sigma\right)+\frac{1}{2\sigma^2}\sum_ix_i^2
$$

גם בעבור המקרה הזה נוכל לפתור את בעיית האופטימיזציה באופן אנליטי על ידי גזירה והשוואה לאפס:

$$
\frac{\partial l_\text{rayleigh}\left(\theta|\{x\}\right)}{\partial\sigma}=0 \\
\Leftrightarrow -\frac{2N}{\sigma}+\frac{\sum_ix^2}{\sigma^3}=0 \\
\Leftrightarrow \sigma = \sqrt{\frac{1}{2N}\sum_i x^2}
$$

בעבור המדגם הנתון נקבל:

$$
\hat{\sigma} = 9.5
$$

נוסיף את השיערוך החדש שקיבלנו לגרף ממקודם:

![rayleigh](./media/rayleigh.png)

על הדמיון בין ההיסטוגרמה לפונקציות הפילוג ששיערכנו, נראה כי המודל של פילוג Rayleigh נותן תוצאה מעט יותר טובה מהמודל הנורמאלי, בנוסף ניתן לראות גם כי כעת אין הסתברות שונה מ0 לקבל משך נסיעה שלילי.

ננסה מודל נוסף.

### 💡נסיון 3: MLE ו Generalized Gamma Distribution

פילוג Rayleigh הינו מקרה פרטי של של משפחה כללית יותר של פונקציות פילוג המכונה Generalized Gamma Distribution. פונקציית צפיפות ההסתברות של משפחה זו נתונה על ידי:

$$
p_\text{gengamma}\left(z;\sigma,a,c\right)=
\frac{cz^{ca-1}\exp\left(-\left(z/\sigma\right)^c\right)}{\sigma^{ca-1}\Gamma\left(a\right)}
, \quad z\geq0
$$

(כשאר $$\Gamma$$ היא פונקציה המוכנה [פונקציית גמא (gamma function)](https://en.wikipedia.org/wiki/Gamma_function) )

למודל זה 3 פרמטרים: $$\boldsymbol{\theta}=\left[\sigma, a, c\right]^T$$

בעבור $$c=2$$ ו $$a=1$$ נקבל את פילוג Rayleight כאשר $$\sigma_{gamma}=2\sigma_{rayleigh}$$ 

בניגוד למקרים של פילוג נורמאלי ופילוג Rayleigh, במקרה זה לא נוכל למצוא בקלות את הפרמטרים האופטימאלים של המשערך באופן אנליטי, שם מציאת הפרמטרים נאלץ להעזר פתרון נומרי. בפועל נעזה שימוש באחת החבילה של Python הנקראת SciPy. בחבילה זו מכילה מודלים הסברותיים רבים ומכילה מספר רב של כלים הקשורים למודלים אלו, כגון מציאת הפרמטרים האופטימאלים בשיטת MLE על סמך מגדם נתון. את הפונקציות הקשורות למודל הGeneralized Gamma Distribution ניתן למצא [כאן](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.gengamma.html#scipy.stats.gengamma).

אתם תעשו שימוש בפונקציות זההות בתרגיל הבית הרטוב.

שימוש בפונקציה הנ"ל, מניב את התוצאות הבאות:

$$
\hat{a} = 4.4 \\
\hat{c} = 0.8 \\
\hat{\sigma} = 1.6
$$

נוסיף את השיערוך החדש שקיבלנו לגרף ממקודם:

![generalized_gamma](./media/generalized_gamma.png)

ניתן לראות המודל של Generalized Gamma Distribution אכן מניב תוצאה אשר דומה מאד לצורת ההסטוגרמה.

## תרגילים

#### ✍️ תרגיל 3.3: תרגיל ממבחן - אביב 2019, מועד ב' שאלה 3

נתונות לנו $$N$$ מדידות IID, $$\left\lbrace x_i\right\rbrace_{i=1}^N$$ כאשר $$x_i$$ מגיע מההתפלגות הבאה:

$$
p_X\left(x\right)=\frac{1}{\mu}e^{-\frac{1}{\mu}\left(x-\theta\right)}\qquad x\geq\theta,\mu>0
$$

א) מצאו את משערך הMLE עבור הפרמטר $$\mu$$ בהנחה כי $$\theta$$ פרמטר ידוע

ב) מצאו את משערך הMLE עבור הפרמטר $$\theta$$ בהנחה כי $$\mu$$ פרמטר ידוע

##### 💡 פתרון

א) פונקציית הlikelihood (הפעם כפונקציה של $$\mu$$ כי הוא המשתנה הלא ידוע בסעיף זה):

$$
L\left(\mu\right)\prod_{i=1}^N\frac{1}{\mu}e^{-\frac{1}{\mu}\left(x-\theta\right)}=\frac{1}{\mu^N}e^{-\frac{1}{\mu}\sum_{i=1}^N\left(x-\theta\right)}I\left\lbrace\mu>0\right\rbrace
$$

נניח כאשן כי $$\mu>0$$ אחרת האינדוקטור מתאפס.

$$
l\left(\mu\right)=\log\left(L\left(\mu\right)\right)=-N\log\left(\mu\right)-\frac{1}{\mu}\sum_{i=1}^N\left(x-\theta\right)
$$

מגזירה והשוואה לאפס נקבל:


$$
\frac{\partial}{\partial\mu}l\left(\mu\right)=\frac{N}{\mu}-\frac{1}{\mu^2}\sum_{i=1}^N\left(x-\theta\right)=0 \\
\Rightarrow \hat{\mu}_{\text{MLE}}=\frac{1}{N}\sum_{i=1}^N\left(x-\theta\right)=0
$$

הנגזרת השנייה שלילית ולכן זוהי אכן נקודת מקסימום.

ב) נכתוב את ה-likelihood:

$$
L\left(\theta\right)\prod_{i=1}^N\frac{1}{\mu}e^{-\frac{1}{\mu}\left(x-\theta\right)}I\left\lbrace x_i\geq\theta\right\rbrace=\frac{1}{\mu^N}e^{-\frac{1}{\mu}\sum_{i=1}^N\left(x-\theta\right)}I\left\lbrace \min\left\lbrace x_i\right\rbrace\geq\theta\right\rbrace
$$

נשים לב כי $$L\left(\theta\right)$$ היא פונקציה מונוטונית עולה ב $$\theta$$ בתחום שבו $$\min\left\lbrace x_i\right\rbrace\geq\theta$$. לכן שמערך הסבירות המירבית יתקבל בערך המקסימאלי האפשרי עבור $$\theta$$ בתחום זה: $$\hat{\theta}_{\text{MLE}}=\min\left\lbrace x_i\right\rbrace$$.


