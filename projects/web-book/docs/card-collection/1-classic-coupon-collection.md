Question:

假设有n种赠券，每种赠券获取机率相同，而且赠券亦无限供应。若取赠券k张，能集齐n种赠券的机率多少？
在第 $k$ 次试验后恰好第一次完成全部收集,则在前 $k - 1$次试验收集了 $n - 1$ 张不同的赠券.前 $k - 1$ 次试验相当于将 $k - 1$ 个元素的集合划分成有序的 $n - 1$ 个非空子集的个数.即 $(n - 1)! \mathcal{S}_2(k - 1, n - 1)$ 个,其中$\mathcal{S}_2 (k, n )$ 是第二类Stirling 数.

从 $n$ 张不同的赠券中收集到 $n - 1$ 张有 $\mathcal{C}(n,n-1)$ 种组合, 其中$\mathcal{C}(n,k)$ 为二项式系数.

最后除以总方法数,也就是将 $k$ 个元素的集合划分成 $n$ 个子集的方式,共 $n^k$ 种.

综上所述,恰好在第 $k$ 次试验完成收集全部 $n$ 张不同的赠券的试验的概率是:

$$\begin{aligned}
P(n)
  =&(n - 1)! \mathcal{S}_2(k - 1, n - 1)\mathcal{C}(n,n-1)/ n^k\\
  =&\frac{n!}{n^k} \mathcal{S}_2(k - 1, n - 1)\\
\end{aligned}$$



其概率生成函数为:

$$\begin{aligned}
\mathcal{P}(z)=(n-1)! z^n \biggl/\prod_{i=1}^{n-1} (n-i z)=\frac{(-z)^{1-n} \Gamma (n)z^n}{\left(1-\dfrac{n}{z}\right)_{n-1}}\\
\end{aligned}$$

我们知道期望是概率生成函数在$z=1$处的导数,但是对上式求导无疑是计算量极为巨大的,而且涉及到特殊函数.

那有没有什么办法构造出这个量呢?

有了,注意到$\mathcal{P}(1)=1$,构造:

$$E(n)=\frac{d}{dz}\mathcal{P}(z)\biggl|_{z=1^-}=\lim_{z\to 1^-}\frac{\mathcal{P}'(z)}{\mathcal{P}(z)}$$

然后使用对数求导法即可!

$$\begin{aligned}
\mathcal{P}(n)&=(n-1)! z^n\biggl/\prod_{i=1}^{n-1} (n-i z)\\
\ln \mathcal{P}(z)&=\ln (n-1)!+n \ln z - \sum_{i=1}^{n-1} \ln (n-i z)\\
\frac{\mathcal{P}'(z)}{\mathcal{P}(z)}&=\frac{n}{z}-\sum_{i=1}^{n-1} \frac{i}{n-iz}\\
\therefore E(n)&=n-\sum_{i=1}^{n-1} \frac{i}{n-i}=n H_n \\
\end{aligned}$$

其中$H_n$是调和级数.

方差也是类似的构造,巧妙地使用期望的可加性.

$$\begin{aligned}
V(n)&=E(n^2)-E^2(n)\\
&=E(n(n+1))-E(n)-E^2(n)\\
&=\lim_{z\to 1}\frac{\mathcal{P}''(z)}{\mathcal{P}(z)}+\frac{\mathcal{P}'(z)}{\mathcal{P}(z)}-\left(\frac{\mathcal{P}'(z)}{\mathcal{P}(z)}\right)^2\\
&=\lim_{z\to 1}(\ln \mathcal{P}(z))'+(\ln \mathcal{P}(z))''\\
\end{aligned}$$

然后分别计算代入即可:

$$\begin{aligned}
(\ln \mathcal{P}(z))'&=\frac{n}{z}-\sum_{i=1}^{n-1} \frac{i}{n-ix}\\
(\ln \mathcal{P}(z))''&=-\frac{n}{z^2}+\sum_{i=1}^{n-1} \frac{i^2}{(n-ix)^2}\\
\therefore V(n)&=\sum_{i=1}^{n-1} \frac{i^2}{(n-i)^2}-\sum_{i=1}^{n-1} \frac{i}{n-i}\\
&=n^2 H_n^{(2)}-n H_n
\end{aligned}$$

$H_n^{(2)}$是高阶调和级数: $\displaystyle H_n^{(r)}=\sum _{i=1}^n \frac{1}{i^r}$

当然,概率生成函数有了怎么求高阶矩就是计算问题了,剩下的不求了.

近似计算:

因为对数函数在无穷远处有个本性奇点,所以在无穷远处展开可以得到含对数的渐进表达式.

$$\begin{aligned}
E(n)&\sim (\ln n+\gamma )n+\frac{1}{2}-\frac{1}{12 n}+O\left(\frac{1}{n^3}\right)\\
V(n)&\sim \left(\frac{\pi ^2}{6}n-\ln n-\gamma -1\right)n-\frac{1}{12 n}+O\left(\frac{1}{n^3}\right)
\end{aligned}$$

然后分析余项能得到误差估计,现在数值计算这么发达这部分我就不展开了...
