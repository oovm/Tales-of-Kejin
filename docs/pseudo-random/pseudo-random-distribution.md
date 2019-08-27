# 伪随机分布



设 $a$ 是真实概率, $p$ 是等价概率, $p(a)$ 就表示固定 $a$ 计算等价概率, $a(p)$ 则反过来固定 $p$ 计算真实概率, 两者在单调区间内互为反函数.

注意这个单调区间的限定, 因为这俩函数不一定单调.




---

## 伪随机分布代数方法



这谁顶得住啊, 有没有高级点的解析方法呢?

---

## 伪随机分布解析方法

嗯, 虽然很无聊, 但是上述和式确实有封闭形式:

$$\begin{aligned}
p(a) &= \frac{a}{\phi+\varphi}\\
\phi &= \frac{e^{1/a} E_{-\frac{a+1}{a}}\left(\frac{1}{a}\right)-a (a+2)}{a+1}\\
\varphi &= \frac{(-a)^{\left\lfloor \frac{1}{a}\right\rfloor } \left(a \left(\left\lfloor \frac{1}{a}\right\rfloor  \left(a \left\lfloor \frac{1}{a}\right\rfloor +2 a-1\right)+a\right)-e^{1/a} E_{\left\lfloor \frac{1}{a}\right\rfloor -\frac{1}{a}+1}\left(\frac{1}{a}\right)\right) \Gamma \left(\left\lfloor \frac{1}{a}\right\rfloor -\frac{1}{a}+1\right)}{\Gamma \left(\frac{a-1}{a}\right)}
\end{aligned}$$

我有点担心这个式子太长以至于无法在书上印下来.

所幸某些情况下这个公式能简化, 如果我们限定 $a$ 的形式, 就能化简为:

$$p_z(a) = \frac{a+1}{e^{1/a} a^{\frac{1}{a}+1} \Gamma \left(2+\frac{1}{a},\frac{1}{a}\right)-a-2}$$

其中 $a = 1/n, n\in\mathbb{Z_+}$.

注意到当 $n$ 很大时 $\dfrac{1}{n}$ 与 $\dfrac{1}{n+1}$ 之间的间隔非常小, 于是有 $p(a)∼p_z(a)$ 成立.

---


然而这个式子并不是很好求值, 分母三个指数项相乘会导致巨大的数值误差.

所以现在的问题归结为分母部分如何近似计算, 核心在于下列式子如何计算:

$$g(n)= e^n n^{-n} \Gamma (n+2,n), n>0$$

对于不完全 $\Gamma$ 函数, 我们有如下渐近展开:

$$\Gamma(z, z) \sim z^{z-1} \mathrm{e}^{-z}\left(
\sqrt{\frac{\pi}{2}} z^{\frac{1}{2}}-\frac{1}{3}
+\frac{\sqrt{2 \pi}}{24 }z^{-\frac{1}{2}}-\frac{4}{135}z^{-1}
+\frac{\sqrt{2 \pi}}{576}z^{-\frac{3}{2}}+\frac{8}{2835}z^{-2}
+\cdots\right)$$

同时我们有以下递推关系:

$$ \Gamma (s+1,x)=s\Gamma (s,x)+x^{s}\mathrm {e} ^{-x}$$

然后带入递推展开得到:

$$\Gamma (n+2,n)=e^{-n}n^n(2 n+1) +(n+1) n \Gamma (n,n)$$

接着渐近展开代入 $\Gamma (n,n)$ 得到:

$$g(n)\sim\sqrt{\frac{\pi }{2}} n^{3/2}+\frac{5}{3}n+\sqrt{\frac{169 \pi }{288}}n^{1/2}+\frac{2}{3}+\sqrt{\frac{\pi }{288}} n^{-1/2} + O(n^{-1})$$

最后代回去就可以获得 $p(a)$ 的各阶近似:

$$\begin{aligned}
p_1(a)\sim&\frac{6\sqrt{a}}{18\pi-2\sqrt{a}}\\
p_2(a)\sim&\frac{24}{\sqrt{2\pi}\left(\sqrt{a}+\frac{12}{\sqrt{a}}\right)-8}\\
p_3(a)\sim&\frac{1080\sqrt{a}}{\sqrt{2\pi}(45a+540)-\sqrt{a}(32 a+360)}
\end{aligned}$$

然后对求 $p_1(a)$ 反函数, 得到 $a(p)$ 的一阶近似:

$$a_1(p) = \frac{9 \pi  p^2}{2 (p+3)^2}$$

同理可得二阶近似:

$$a_2(p)=k-\sqrt{k^2-144}, k=\dfrac{16}{\pi}\left(\dfrac{3}{p}+1\right)^2-12$$

这个公式在 $0< p < 0.1$ 这个区间内非常精确.

---

## 伪随机分布概率最大值

何时取得概率最大值

这个不难, 做差即可:

$$\frac{s(n+1)}{s(n)} = \frac{1}{n}+1-a (n+1) >1$$

不等式解得到:

$$n > \sqrt{\frac{1}{a}+\frac{1}{4}}-\frac{1}{2}$$

然后上取整就能得到对应的概率最大的次数.

换算成 $p$ 的话就是:

$$n \approx \sqrt{\frac{2}{9 \pi } \left(\frac{3}{p}+1\right)^2+\frac{1}{4}}-\frac{1}{2}$$

在这个时间点之前, 成功的累计概率视 $a$ 而定, 约为 $40\%\sim55\%$.


注意啊, **迟来的保底可不是保底!**

保底这个性质是 不大的时候, 确切的说 10% 才有的, 接着保底次数会平方增长

