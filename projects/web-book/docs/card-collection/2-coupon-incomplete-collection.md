Question:

假设有n种赠券，每种赠券获取机率相同，而且赠券亦无限供应。若取赠券k张，能集齐其中m种赠券的机率多少

恰好在第 $k$ 次试验得到指定 $m$ 张不同赠券的试验次数是 $ m! \mathcal{S}_2(k - 1, m - 1)$.

从 $n$ 张不同的赠券中收集 $m$ 张共有 $\mathcal{C}(n,m)$ 种方法.

最后总方法数仍是 $n^k$.

综上所述, 恰好在第 $n$ 次试验完成收集全部 $k$ 张不同的赠券的概率是:

$$P(n)=m! \mathcal{S}_2(k - 1, m - 1)\mathcal{C}(n,m)/n^k$$



其概率生成函数为:

$$\begin{aligned}
\mathcal{P}(z)=&z^m m!\binom{n}{m}\biggl/\prod _{i=0}^{m-1} (n-i z)\\
=&\frac{(-1)^{-m} \Gamma (n+1) \Gamma \left(-\frac{n}{z}\right)}{\Gamma (n-m+1) \Gamma \left(m-\frac{n}{z}\right)}
\end{aligned}$$

然后用与上一篇文章类似的方法计算:

$$\begin{aligned}
\mathcal{P}(z)&=m! z^m \binom{n}{m}\biggl/\prod _{i=0}^{m-1} (n-i z)\\
\ln \mathcal{P}(z)&=\ln \left[m!\binom{n}{m}\right]+m\ln z-\sum_{i=0}^{m-1}\ln (n-iz)\\
\end{aligned}$$

求导得:

$$\begin{aligned}
(\ln \mathcal{P}(z))'&=\frac{m}{z}-\sum_{i=1}^{m-1} \frac{i}{n-iz}\\
(\ln \mathcal{P}(z))''&=-\frac{m}{z^2}+\sum_{i=1}^{m-1} \frac{i^2}{(n-iz)^2}\\
\end{aligned}$$

于是算得期望与方差分别是:

$$\begin{aligned}
E(n)=&n \left(H_n-H_{n-m}\right)\\
V(n)=&[\psi_1(n-m+1)-\psi_1(n)]n^2\\
+&[\psi_0(n-m+1)-\psi_0(n)]n\\
\end{aligned}$$

其中: $\displaystyle \psi_n(z)=\frac{d^n}{dz^n}\psi (z),\psi (z)=\frac{\Gamma '(z)}{\Gamma (z)}$