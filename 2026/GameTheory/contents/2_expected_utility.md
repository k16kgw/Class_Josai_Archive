# 第2回：期待効用理論

### 前回の復習

- ゲーム理論は，複数のプレイヤーが互いの行動に影響を与え合う状況を分析する理論である．
- ゲームは主に **プレイヤー・戦略・利得** によって記述される．
- 各プレイヤーは，自分にとって望ましい結果を実現しようとして行動すると考える．

今回の講義では，この「望ましい結果」をどのように数値で表すかを考える．
特に，不確実性がある状況での意思決定を扱うために，**期待効用理論**を学ぶ．

### 到達目標

- 不確実性の下での意思決定を，くじ・選好・効用関数を用いて表現できる．
- 期待効用を計算し，複数の選択肢を比較できる．
- 期待値最大化と期待効用最大化の違いを説明できる．
- リスク回避・リスク中立・リスク愛好を，効用関数の形と結びつけて理解できる．
- 期待効用理論が，混合戦略や情報不完備ゲームの基礎になることを理解できる．

### キーワード

- 選好
- 効用関数
- 期待効用
- フォン・ノイマン=モルゲンシュテルン効用
- リスク回避・リスク中立・リスク愛好

---

## 期待効用理論

ゲーム理論では，プレイヤーが戦略を選んだ結果として利得を得る．
しかし，現実の意思決定では結果が確実に決まるとは限らない．

例

- 企業が新製品を投入するが，成功するか失敗するかは確率的である．
- 入札者は他の入札者の評価額を知らないままオークションで入札する．
- サッカーのペナルティキック（PK）ではキッカーがどこにシュートを放つかを確率的に決めている．
- 相手が「協力的なタイプ」か「攻撃的なタイプ」かを完全には知らない．

このような状況では，単に結果の金額や点数を見るだけではなく**確率を含む選択肢全体**を比較する必要がある．
期待効用理論は，この比較を数理的に扱うための基礎である．

```{tip} 注意
ゲーム理論の多くのモデルではプレイヤーは自分の期待効用を最大化するように行動すると仮定する．
この仮定のおかげで混合戦略，ナッシュ均衡，ベイジアンゲームなど，数理的に扱いやすくなる．
```

### 確実な結果の選好

不確実性がない場合を考える．

プレイヤーが選択する対象を**選択対象**と呼び，選択対象の集合を $X$ とする．

2つの選択対象のうち，プレイヤーがどちらを選択しがちかという好みを，**選好関係** $\succsim$ で表す．

```{tip} 定義：選好関係
2つの選択対象 $x, y \in X$ に対して，$x$ が $y$ よりも好ましいことを $x\succ y$（えっくす・さっく・わい）と表す．

$x$ と $y$ が同程度に好きであるとき，$x$ と $y$ に関して**無差別**であるといい，$x\sim y$ と表す．

$x\succ y$ または $x\sim y$ であるとき，まとめて $x\succsim y$ と表す．この $\succsim$ を<span style="color:red">選好関係</span>と呼ぶ．
```

これ以降，選好関係は次の2つの仮定を満たすものとする．

- **完備性**：任意の選択対象 $x, y \in X$ に対して $x \succsim y$ または $y \succsim x$ が成り立つ．
- **推移性**：任意の選択対象 $x, y, z \in X$ に対して $x \succsim y$ かつ $y \succsim z$ が成り立つならば $x \succsim z$が成り立つ．

※ 推移性は選好に循環的な矛盾がないことを意味する．
例えば，$L$ は $M$ 以上に好ましく，$M$ は $N$ 以上に好ましいのに，$N$ を $L$ より好む，というような判断を排除する．

**推移性**を満たす選好関係を<span style="color:red">選好順序</span>と呼ぶ．

| 性質 | 前順序 | 半順序 | 全順序 | 選好順序 |
| --- | :-: | :-: | :-: | :-: |
| 反射律 | ⚪︎ | ⚪︎ | ⚪︎ | ⚪︎ |
| 推移律 | ⚪︎ | ⚪︎ | ⚪︎ | ⚪︎ |
| 反対称律 | × | ⚪︎ | ⚪︎ | × |
| 完全律（完備性） | × | × | ⚪︎ | ⚪︎ |

例：単純に金額をもらうだけの話であれば，

$$
\text{1000円を得る} \succeq \text{500円を得る} \succeq \text{0円を得る}
$$

と考えられる．

### 不確実性の下での意思決定

不確実性がある場合，戦略に付随する結果は単一ではなく，複数の結果が確率的に生じるものになる．
これを**くじ**と呼ぶ．

```{tip} 定義：くじ
結果 $x_1,\ldots,x_m$ がそれぞれ確率 $p_1,\ldots,p_m$ で生じる選択対象を<span style="color:red">くじ</span>という．
ただし，

$$
p_k\ge 0,\qquad \sum_{k=1}^m p_k=1
$$

である．
くじ$L$を次のように表す．

$$
L=(p_1,x_1;\ p_2,x_2;\ \dots;\ p_m,x_m)
$$
```

くじ $L$ を

$$
L=(0.5,100;\ 0.5,0)
$$

とする．
これを「確率$0.5$で$100$万円を得て，確率$0.5$で$0$万円を得る」選択対象とする．
また，確実に$40$万円を得る選択対象を

$$
C=(1,40)
$$

とおく．

このとき，二つの選択対象$L$と$C$のどちらを選ぶかを考える．
金額の期待値を比較すると，

$$
E[L]=0.5\cdot 100+0.5\cdot 0=50,\qquad E[C]=40
$$

となるため，$L$の方が大きい．
しかし，どちらの選択対象を選ぶ戦略を取るかは人によって異なる．
これは，人々が金額の期待値だけでなく，結果に対する**効用**を考えているためである．

---

## 期待効用

```{tip} 定義：効用関数
集合$\bar{X}$を取り得る結果全ての集合とする．
このとき，<span style="color:red">効用関数</span> $u:\bar{X}\to\mathbb{R}$ は次を満たす関数と定める．

$$
x\succeq y \iff u(x)\geq u(y)
$$

また，実数 $u(x)$ を結果 $x$ に対する<span style="color:red">効用</span>と呼ぶ．
```

ここでは，効用の数値そのものではなく**大小関係が本質**である．

```{tip} 定義：期待効用
結果 $x_k$ ($k=1,\ldots,m$) に対して効用 $u(x_k)$ が与えられているとする．
くじ $L=(p_1,x_1;\dots;p_m,x_m)$ の<span style="color:red">期待効用</span> $E_u(L)$ は，次で定義される．

$$
E_u(L) = E[u(L)] = \sum_{k=1}^m p_k u(x_k).
$$
```

```{tip} 定義：期待効用仮説
任意の結果 $x$ に対して効用 $u(x)$ が対応しているとする．
<!-- このとき，不確実性を含む選択対象の選好順序が期待効用の順序に従うものとする． -->
このとき，くじの選好順序が期待効用の順序に従うものとする．
すなわち

$$
L\succsim M \iff E_u(L)\geq E_u(M)
$$

によって選択が決まるものとする．
```

期待効用仮説は，合理的なプレイヤーを考える上で必要な仮説である．
これ以降，期待効用仮説を仮定する．

### 期待値と期待効用の違い

金額そのものを $x$ とすると，期待値は

$$
E[L]=\sum_{k=1}^m p_k x_k
$$

である．
一方，期待効用は

$$
E_u(L)=\sum_{k=1}^m p_k u(x_k)
$$

である．

期待値は「結果を平均する」計算であり，期待効用は「結果の効用を平均する」計算である．
効用関数が線形でない場合，この2つは同じ判断を導くとは限らない．

```{note} 演習1
効用関数を

$$
u(x)=x^2\qquad (x\ge 0)
$$

とする．
このとき，くじ $L=(0.5,100;\ 0.5,0)$ と $C=(1,40)$ の期待効用を計算し，どちらを選択するかを答えよ．
```

```{dropdown} <span style="color:red">解答例</span>
くじ $L$ の期待効用は

$$
E_u(L)=0.5 \times 100^2 + 0.5 \times 0^2 = 5000
$$

である．一方，確実な選択肢 $C$ の期待効用は

$$
E_u(C)= 40^2 = 1600
$$

である．
したがって，$E_u(L)>E_u(C)$ であるから，この効用関数をもつプレイヤーは $L$ を選ぶ．
```

```{warning} 課題1
効用関数を

$$
u(x)=\sqrt{x}\qquad (x\ge 0)
$$

とする．
このとき，くじ $L=(0.5,100;\ 0.5,0)$ と $C=(1,40)$ の期待効用を計算し，どちらを選択するかを答えよ．
```

```{dropdown} <span style="color:red">解答例</span>
くじ $L$ の期待効用は

$$
E_u(L)=0.5\sqrt{100}+0.5\sqrt{0}=5
$$

である．一方，確実な選択肢 $C$ の期待効用は

$$
E_u(C)=\sqrt{40}\simeq 6.32
$$

である．
したがって，$E_u(C)>E_u(L)$ であるから，この効用関数をもつプレイヤーは $C$ を選ぶ．
期待値では $L$ の方が大きいが，期待効用では確実な $C$ の方が大きくなる点に注意する．
```

### 期待効用定理

期待効用理論の中心にあるのは，von NeumannとMorgensternによる表現定理である．

期待効用仮説が成り立つために必要な，選好順序に対する仮定を考える．

- **独立性**：任意の選択対象 $x,y,z$ と任意の実数 $\alpha\in(0,1)$ について，
$$
x\succsim y
\iff
\alpha x+(1-\alpha)z \succsim \alpha y+(1-\alpha)z
$$
が成り立つ．
これは共通の部分 $z$ を同じ確率で混ぜても，$x$ と $y$ の比較は変わらないという条件である．
独立性は期待効用の線形な形を導くうえで特に重要である．
- **連続性**：選択対象$x,y,z$ が $x\succ y\succ z$ を満たすとき，次を満たす実数 $\alpha\in(0,1)$ が存在する：
$$
y\sim \alpha x+(1-\alpha)z.
$$
直観的には，中間的な選択対象 $y$ は，良い選択対象 $x$ と悪い選択対象 $z$ を適切な確率で混ぜたものと無差別になるという条件である．

```{tip} 定理：期待効用定理
結果の集合 $X$ とその上の選好関係 $\succsim$ に対して，推移性・完備性・独立性・連続性を満たすための必要十分条件は，次を満たす効用関数 $u$ が存在することである：

任意の選択対象 $x,y \in X$ に対して
$$
x \succsim y \iff u(x) \geq u(y)
$$
が成り立つ．  
さらに，任意の $\alpha \in (0,1)$ に対して
$$
u(\alpha x + (1-\alpha)y) = \alpha u(x) + (1-\alpha)u(y)
$$
が成り立つ．
```

このときの効用関数を特に，選好順序 $\succsim$ に関する<span style="color:red">von Neumann–Morgenstern効用関数</span>と呼ぶ．

<!-- 
```{tip}
独立性は強い仮定であり，現実の人間の選択では破れることがある．
有名な例にアレのパラドックスがある．
それでも，ゲーム理論では合理的プレイヤーの標準的なモデルとして期待効用最大化を用いることが多い．
```
 -->

### 効用関数の一意性

期待効用を表す効用関数は正のアフィン変換したものを同一視すれば一意である．

```{tip} 定理：効用関数の一意性
効用関数 $u$ が選好を表しているとき，

$$
v(x)=a u(x)+b \qquad (a>0)
$$

で定義される $v$ も同じ選好を表す．
```

実際，

$$
E_v(L)
=\sum_k p_k\{a u(x_k)+b\}
=a\sum_k p_k u(x_k)+b\sum_k p_k
=a E_u(L)+b
$$

である．
$a>0$ なので，期待効用の大小関係は変わらない．

この性質は，ゲーム理論で利得を扱うときに重要である．
利得の数値は，プレイヤーの選好を表すための尺度であり，単位や原点の取り方には自由度がある．

---

## リスクに対する態度

金額 $x$ に対する効用関数 $u(x)$ の形は，リスクに対する態度を表す．

### リスク回避型

効用関数が凹関数であるとき，プレイヤーは**リスク回避的**であるという．

$$
u''(x)<0
$$

直観的には，金額が増えるほど追加的な満足の増え方が小さくなる．
例えば，

$$
u(x)=\sqrt{x},\qquad u(x)=\log x
$$

はリスク回避的な効用関数である．

リスク回避的なプレイヤーでは，しばしば次が成り立つ．

$$
u(E[X]) > E[u(X)]
$$

つまり，確率的な収入よりも，同じ期待値を持つ確実な収入を好みやすい．

### リスク中立型

効用関数が線形であるとき，プレイヤーは**リスク中立的**であるという．

$$
u(x)=ax+b \qquad (a>0)
$$

この場合，期待効用最大化は期待値最大化と一致する．

### リスク愛好型

効用関数が凸関数であるとき，プレイヤーは**リスク愛好的**であるという．

$$
u''(x)>0
$$

この場合，同じ期待値であれば，確実な結果よりもばらつきのあるくじを好みやすい．

```{note} 演習2
次の効用関数を用いる．

$$
u(x)=x^2\qquad (x\ge 0)
$$

くじ $L=(0.5,100;\ 0.5,0)$ と $C=(1,40)$ について，次の問いに答えよ．

この効用関数は凸関数であるからリスク愛好型である．このプレイヤーがリスク愛好型であることと，$L$または$C$を選ぶこととが整合的である直観的理由を説明せよ．
```

```{dropdown} <span style="color:red">解答例</span>
期待値は

$$
E[L]=0.5\cdot100+0.5\cdot0=50,\qquad E[C]=40
$$

である．期待効用は

$$
E_u(L)=0.5\cdot100^2+0.5\cdot0^2=5000,\qquad E_u(C)=40^2=1600
$$

である．したがって，このプレイヤーは $L$ を選ぶ．

$u(x)=x^2$ は凸関数であり，大きな結果を得たときの効用の増え方が大きい．そのため，同じ程度の期待値であれば，確実に小さい結果を得るよりも，大きい結果をある程度の確率で得られるくじを好みやすい．この意味でリスク愛好型であることと $L$ を選ぶことは整合的である．
```

```{warning} 課題2
次の効用関数を用いる．

$$
u(x)=\sqrt{x}\qquad (x\ge 0)
$$

くじ $L=(0.5,100;\ 0.5,0)$ と $C=(1,40)$ について，次の問いに答えよ．

この効用関数は凹関数であるからリスク回避型である．このプレイヤーがリスク回避型であることと，$L$または$C$を選ぶこととが整合的である直観的理由を説明せよ．
```

```{dropdown} <span style="color:red">解答例</span>
期待値は

$$
E[L]=0.5\cdot100+0.5\cdot0=50,\qquad E[C]=40
$$

である．期待効用は

$$
E_u(L)=0.5\sqrt{100}+0.5\sqrt{0}=5,\qquad E_u(C)=\sqrt{40}\simeq6.32
$$

である．したがって，このプレイヤーは $C$ を選ぶ．

$u(x)=\sqrt{x}$ は凹関数であり，金額が増えるほど追加的な効用の増え方が小さくなる．そのため，大きい結果と小さい結果のどちらも得る可能性のあるくじよりも，ある程度確実に得られる結果を好みやすい．この意味でリスク回避型であることと $C$ を選ぶことは整合的である．
```

---

## 確実性等価とリスクプレミアム

リスク回避をより定量的に見るために，**確実性等価**を定義する．

```{tip} 定義：確実性等価
くじ $L$ と無差別になる確実な金額 $c$ を，くじ $L$ の<span style="color:red">確実性等価</span>という．

$$
u(c)=E_u(L)
$$
```

例えば，$u(x)=\sqrt{x}$，$L=(0.5,100;\ 0.5,0)$ のとき，

$$
E_u(L)=5
$$

である．
確実性等価 $c$ は，

$$
u(c) = \sqrt{c} = 5
$$

を満たすので，

$$
c=25
$$

である．

一方，$L$ の期待値は 50 であるから，このプレイヤーは「確実な 25」と「50 の期待値を持つくじ」を同じ程度に評価している．

```{tip} 定義：リスクプレミアム
くじの期待値と確実性等価の差

$$
E[L]-c
$$

を<span style="color:red">リスクプレミアム</span>と呼ぶ．
```

上の例では，リスクプレミアムは

$$
50-25=25
$$

である．
これはリスクを避けるために最大 $25$ までなら支払っても良いと解釈される．

---

## PC演習

[コードのダウンロード](./2_expected_utility.ipynb)

### PC演習1：Pythonで期待効用を計算する

次のコードを実行し，演習2の計算結果と一致することを確認せよ．

```python
import math

def expected_value(lottery):
    """
    lottery: list of (probability, outcome)
    """
    return sum(p * x for p, x in lottery)

def expected_utility(lottery, u):
    """
    lottery: list of (probability, outcome)
    u: utility function
    """
    return sum(p * u(x) for p, x in lottery)

u = lambda x: math.sqrt(x)

L = [(0.5, 100), (0.5, 0)]
C = [(1.0, 40)]

EV_L = expected_value(L)
EV_C = expected_value(C)
EU_L = expected_utility(L, u)
EU_C = expected_utility(C, u)

print("E[L] =", EV_L)
print("E[C] =", EV_C)
print("E_u(L) =", EU_L)
print("E_u(C) =", EU_C)
print("choose", "L" if EU_L > EU_C else "C")
```

### PC演習2：効用関数による選択の違い

同じくじ $L=(0.5,100;\ 0.5,0)$ と $C=(1,40)$ を，次の3つの効用関数で比較せよ．

- リスク回避型：$u_1(x)=\sqrt{x}$
- リスク中立型：$u_2(x)=x$
- リスク愛好型：$u_3(x)=x^2$

```python
u1 = lambda x: math.sqrt(x)
u2 = lambda x: x
u3 = lambda x: x**2

for name, ufun in [("sqrt(x)", u1), ("x", u2), ("x^2", u3)]:
    EU_L = expected_utility(L, ufun)
    EU_C = expected_utility(C, ufun)
    if EU_L > EU_C:
        choice = "L"
    elif EU_L < EU_C:
        choice = "C"
    else:
        choice = "indifferent"

    print(name, "      \t", "E_u(L) =", EU_L, "E_u(C) =", EU_C, "choice =", choice)
```

```{warning} 課題3
3つの効用関数で選択がどのように変わったかを説明せよ．
その際，効用関数の凹凸の形状と，リスク回避・リスク中立・リスク愛好とを結びつけること．
```

```{dropdown} <span style="color:red">解答例</span>
3つの効用関数について，期待効用は次のようになる．

| 効用関数 | 型 | $E_u(L)$ | $E_u(C)$ | 選択 |
| --- | --- | --- | --- | --- |
| $u_1(x)=\sqrt{x}$ | リスク回避型 | $5$ | $\sqrt{40}\simeq6.32$ | $C$ |
| $u_2(x)=x$ | リスク中立型 | $50$ | $40$ | $L$ |
| $u_3(x)=x^2$ | リスク愛好型 | $5000$ | $1600$ | $L$ |

リスク回避型では効用関数が凹関数であり，確実な結果を相対的に高く評価しやすいため $C$ を選ぶ．
リスク中立型では期待効用の比較が期待値の比較と一致するため，期待値の大きい $L$ を選ぶ．
リスク愛好型では効用関数が凸関数であり，大きい結果を得たときの効用を大きく評価するため，確率的であっても大きい結果を得る可能性のある $L$ を選びやすい．
```
<!-- 
### PC演習3：確実性等価を計算する

$u(x)=\sqrt{x}$ とする．
くじ

$$
L=(0.5,100;\ 0.5,0)
$$

について，次の問いに答えよ．

1. $E_u(L)$ を計算せよ．
2. 確実性等価 $c$ を求めよ．
3. リスクプレミアムを求めよ．
4. リスクプレミアムの意味を説明せよ．

```python
EU_L = expected_utility(L, u)
certainty_equivalent = EU_L**2
risk_premium = expected_value(L) - certainty_equivalent

print("E_u(L) =", EU_L)
print("certainty equivalent =", certainty_equivalent)
print("risk premium =", risk_premium)
```
 -->
---

## 発展演習：自分のリスク態度を推定する

本節のコードは，いくつかのくじの選択問題に対する回答から，リスク回避度のパラメタを簡易的に推定する例である．
時間に余裕がある場合に実行してみると良い．

効用関数を次で定義し，いくつかのくじに対する選択の結果を元に効用関数のパラメタ $\gamma$ の値を推定する．

$$
u(x)= \begin{cases}\log x & (\gamma=1) \\ \frac{x^{1-\gamma}-1}{1-\gamma} & (\gamma \neq 1)\end{cases}
$$

推定した $\gamma$ の値に応じて

- $\gamma > 0.15$: リスク回避的
- $\gamma < −0.15$: リスク愛好的
- それ以外: リスク中立に近い

と評価する．

```python
import math
import random

def crra_utility(x, gamma):
    """
    CRRA utility.
    gamma > 0: risk averse
    gamma = 0: risk neutral
    gamma < 0: risk loving
    """
    x = max(x, 1e-8)
    if abs(gamma - 1.0) < 1e-8:
        return math.log(x)
    return (x ** (1.0 - gamma) - 1.0) / (1.0 - gamma)

def expected_utility_crra(lottery, gamma):
    return sum(p * crra_utility(x, gamma) for p, x in lottery)

def generate_lottery():
    p = random.choice([0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8])
    x_high = random.choice([40, 60, 80, 100, 120, 150])
    x_low = random.choice([0, 5, 10, 20, 30])

    if x_high <= x_low:
        x_high = x_low + 20

    return [(p, x_high), (1 - p, x_low)]

def lottery_to_text(lottery):
    return " + ".join([f"{p:.1f}で{x}" for p, x in lottery])

def generate_question_set(n_questions=8, seed=42):
    random.seed(seed)
    questions = []

    for i in range(n_questions):
        A = generate_lottery()
        B = generate_lottery()
        questions.append({
            "id": i + 1,
            "A": A,
            "B": B,
            "A_text": lottery_to_text(A),
            "B_text": lottery_to_text(B),
        })

    return questions

def show_questions(questions):
    for q in questions:
        print(f"問題 {q['id']}:")
        print(f"  A: {q['A_text']}")
        print(f"  B: {q['B_text']}")

def collect_answers_interactive(questions):
    answers = []
    print("各問題について A または B を入力してください．")

    for q in questions:
        print(f"\n問題 {q['id']}")
        print(f"  A: {q['A_text']}")
        print(f"  B: {q['B_text']}")

        while True:
            ans = input("選択（A/B）: ").strip().upper()
            if ans in ["A", "B"]:
                answers.append(ans)
                break
            print("A または B を入力してください．")

    return answers

def choice_prob_A(EU_A, EU_B, beta=1.0):
    d = beta * (EU_A - EU_B)
    if d >= 0:
        return 1.0 / (1.0 + math.exp(-d))
    ed = math.exp(d)
    return ed / (1.0 + ed)

def negative_log_likelihood(gamma, questions, answers, beta=1.0):
    nll = 0.0
    eps = 1e-12

    for q, ans in zip(questions, answers):
        EU_A = expected_utility_crra(q["A"], gamma)
        EU_B = expected_utility_crra(q["B"], gamma)
        pA = choice_prob_A(EU_A, EU_B, beta=beta)

        if ans == "A":
            nll -= math.log(max(pA, eps))
        else:
            nll -= math.log(max(1 - pA, eps))

    return nll

def estimate_gamma_grid(questions, answers, beta=1.0):
    candidates = [round(-2.0 + 0.05 * i, 2) for i in range(101)]
    best_gamma = None
    best_score = float("inf")

    for gamma in candidates:
        score = negative_log_likelihood(gamma, questions, answers, beta=beta)
        if score < best_score:
            best_gamma = gamma
            best_score = score

    return best_gamma, best_score

def interpret_gamma(gamma, tol=0.15):
    if gamma > tol:
        return "リスク回避的"
    if gamma < -tol:
        return "リスク愛好的"
    return "リスク中立に近い"

questions = generate_question_set(n_questions=8, seed=42)
show_questions(questions)

answers = collect_answers_interactive(questions)
gamma_hat, score = estimate_gamma_grid(questions, answers)

print("推定された gamma =", gamma_hat)
print("解釈：", interpret_gamma(gamma_hat))
print("負の対数尤度 =", round(score, 4))
```

この推定はマクロ経済学で用いられる簡略化された例であり，厳密な心理測定ではない．
ここでは効用関数の形をデータから考える発想をつかむことに留める．

---

## まとめ

- 不確実性のある選択肢は，くじとして表現される．
- くじの評価は期待効用によって理解される．
- 推移性・完備性・独立性・連続性を満たす選好は，期待効用仮説を満たす．
- 効用関数は正のアフィン変換による同一視の下で一意である．
- 効用関数の凹凸は，リスク回避・リスク中立・リスク愛好を表す．

<!-- 
## 次回

第3回は戦略形ゲームを扱う．
プレイヤー・戦略・利得関数を用いてゲームを定式化し，その後のナッシュ均衡の分析につなげる．
 -->
