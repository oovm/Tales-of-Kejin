 记事件$A_{n,i}$为第$n$次选取后第$i$个样本未被选中的情形,于是概率即为相应情形之并.

然后依容斥原理展开:

$$\begin{aligned}
P(X>n) &= P\biggl(\bigcup_{1\leq i\leq n} A_{n,i}\biggr)\\
&=\sum_{1\leq i\leq n}P(A_{n,i}) - \sum_{1\leq i < j\leq n}P(A_{n,i}\cap A_{n,j}) + \sum_{1\leq i < j < k\leq n}P(A_{n,i}\cap A_{n,j}\cap A_{n,k}) + \cdots\\
&= \sum_{J \subseteq \{1, ..., n\}}^{J \ne \phi}(-1)^{|J| + 1}\left(1 - \sum_{j \in J} p_j\right)^{n}\\
\end{aligned}$$

其中,$J$代表一种选法集合, $|J|=\mathrm{card}(J)$, 即集合$J$中元素的数量.

其概率生成函数为:

$$\mathcal{P}(z)=1+(z-1)\sum_{J \subseteq \{1, ..., n\}}^{J \ne \phi} \frac{(-1)^{|J|+1}}{z-1+\sum_{j \in J }p_j}$$

接下来求期望

$$\begin{aligned}
E(n)=&\frac{d}{dz}\mathcal{P}(z)\biggl|_{z=1^-}\\
=&\sum_{J \subseteq \{0, 1, ..., n-1\}}^{J \ne \phi} \frac{(-1)^{|J|+1}}{\sum_{j \in J }p_j}\\
=&\sum_{i=1}^n (-1)^{i+1}\sum_{1\leq j_1 < \cdots < j_i\leq n} (-1)^{i+1}\frac{1}{p_{j_1}+\cdots + p_{j_i}} \\
=&\sum_{i=1}^n \frac{1}{p_i} - \sum_{1\leq j_1<j_2\leq n}\frac{1}{p_{j_1} + p_{j_2}} + \cdots \end{aligned}$$

注意到 $\displaystyle \int_0^\infty e^{-px}dx=\frac{1}{p},\, p>0$

所以上式可以进一步可以写成:

$$\begin{aligned}
E(n)=&\sum_{i=1}^n \int_0^\infty e^{-p_ix}dx- \sum_{1\leq j_1<j_2\leq n}\int_0^\infty e^{-(p_{j_1} + p_{j_2})x}dx + \cdots\\
=&\int_0^\infty1-\prod_{i=1}^n(1-e^{p_ix})dx
\end{aligned}$$

由于在无穷区间上做数值计算不好采样, 所以我们再做一步代换得到:

$$E(n)=\int_0^1\left[1-\prod_{i=1}^n(1-x^{p_i})\right]\frac{dx}{x}$$

方差可以从期望转化得到:

$$\begin{aligned}
V(n)&=\int_0^1 (2 \ln x+1)v(x) \, dx - E^2(n)\\
v(x)&=\frac{1}{x}\left[\prod_{i=1}^n(1-x^{p_i})-1\right]\\
\end{aligned}$$

当然也可以从概率生成函数出发计算,但是我找不到关系不会化简...

设定的时候可能用的是权重,那只要归一化就行了.

浮点误差也无所谓,这个公式不至于加起来不是1就爆炸.

### 近似计算

使用容斥原理计算的复杂度高达 $O(2^n)$, 这是无法承受的.

如果你身经百战见的多了,看到这个期望的表达形式可能就会猜测:

$$\mathrm{CDF}(x)\sim \prod_{i=1}^n(1-e^{p_ix})$$

实验表明这是个不错的近似, 这暗示当概率相同时, 有:

$$\frac{n!}{n^k} \mathcal{S}_2(k - 1, n - 1)\sim\frac{\partial }{\partial n}\left(1-e^{-\frac{n}{k}}\right)^k=e^{-\frac{n}{k}} \left(1-e^{-\frac{n}{k}}\right)^{k-1}$$

数值计算表明这其实是个相对而言很烂的近似,也许是误差累积了起来,反正是劣化了...

这玩意甚至满足归一化条件(零阶矩):

$$\int_0^{\infty } e^{-\frac{x}{n}} \left(1-e^{-\frac{x}{n}}\right)^{n-1} \, \mathrm{d}x=1$$

可以通过这个计算高阶矩...

$$\int_0^{\infty } x e^{-\frac{x}{n}} \left(1-e^{-\frac{x}{n}}\right)^{n-1} \, \mathrm{d}x =nH_n$$

真是神奇, Confused...

我们可以定义一个变限积分:

$$f(t)=\int_0^t e^{-\frac{x}{n}} \left(1-e^{-\frac{x}{n}}\right)^{n-1} \, \mathrm{d}x=\left(1-e^{-\frac{t}{n}}\right)^n$$

那么如果取最佳效益 $t=nH_n$,此时 $f(t)=e^{-e^{-\gamma }}\approx 57\%$.


```Mathematica
ps=Internal`StringToDouble/@{"48%","28%","19%","5%"}/100
Plot[Evaluate[vx=(Product[1-x^i,{i,ps}]-1)/x],{x,0,1}]
en=-NIntegrate[vx,{x,0,1}]
vn=NIntegrate[(2Log[x]+1)vx,{x,0,1}]-en^2



1-Total[-(-1)^Length[ps[[#]]](1-Total[ps[[#]]])^(n-1)&/@Rest@Subsets[{1,2,3,4}]];
a=Differences[Table[%,{n,1,30}]]
b=Table[3 2^(3-2 n) StirlingS2[-1+n,3],{n,1,30}]//N
ListPlot[{a,b},PlotLegends->{"非均匀情况","均匀情况"}]
```

