# 第3回　戦略型ゲーム

### 中間試験について

- 試験範囲：第1回〜第6回の内容，教科書「ゲーム理論入門」第1章〜第6章
- 問題形式：記述問題・計算問題
- 持ち込み可能な資料：筆記具・A4サイズ以下の紙1枚（自筆・コピーのどちらも可，表裏に記載可）
- 特に各回で取り組んだ演習・課題，教科書の章末問題の類題を問題にする．

### 前回の復習

- 不確実性のある選択肢は，くじとして表現される．
- くじの評価は期待効用によって理解される．
- 推移性・完備性・独立性・連続性を満たす選好は，期待効用仮説を満たす．
- 効用関数は正のアフィン変換による同一視の下で一意である．
- 効用関数の凹凸は，リスク回避・リスク中立・リスク愛好を表す．

### 到達目標

**複数の主体が互いの行動を意識しながら意思決定する状況**を数学的に扱う方法を学ぶ．

- プレイヤー，戦略，利得関数からなる戦略型ゲームの定義を理解する
- 利得行列が利得関数の有限表現であることを理解する
- 具体例を戦略型ゲームとして定式化できる
- 利得表をデータとして表現し，次回以降のナッシュ均衡分析に接続できる

### キーワード

- ゲーム（プレイヤー・戦略・利得）
- 利得行列・利得関数
- 純戦略・混合戦略

---

## 戦略型ゲーム

ゲーム理論では，複数のプレイヤーが相互依存的な状況で意思決定を行う状況を扱う．
単独の最適化問題では，自分の戦略だけで利得が決まるが，ゲームにおいては自分の利得は相手の戦略にも依存する．

このため，分析の基本単位は単独の戦略ではなく**各プレイヤーの戦略の組**になる．
この戦略の組を入力として各プレイヤーの利得が決まるという構造を与えることで，ゲームを数学的に扱うことができる．

- **戦略型ゲーム**：プレイヤーの相互依存関係を表現する基本的な数理モデル．
可能な戦略と利得の関係を関数や行列を用いて表現する．

※ 数理モデル：現象から数理的な構造を抜き出して数学的に扱えるようにした枠組み．

### 数学的定義

```{tip} 定義（戦略型ゲーム）
$n$を自然数とし，
$N:=\{1,\ldots,n\}$をプレイヤーの集合，
$S_i$（$i\in N$）をプレイヤー $i$ の選択可能な行動あるいは戦略の集合，
$f_i$（$i\in N$）を直積集合 $S=S_1 \times\cdots\times S_n$上で定義された実数値関数（$f_i : S \to \mathbb{R}$）であり，プレイヤー $i$ の利得関数とする．

このとき<span style="color:red">戦略型n人ゲーム</span>を次の３つ組 $G$ と定める．
$$
G:=(N, \{S_i\}_{i \in N}, \{f_i\}_{i \in N})
$$
```

### 戦略と行動

ゲームの種類によって**戦略**の意味は変わる．

- 戦略型ゲームでは，戦略は「各プレイヤーが選ぶ<span style="color:red">選択肢</span>」を指し，
- 展開型ゲーム（第8回）では戦略は「自分が直面しうるすべての局面で何をするかを指定した<span style="color:red">計画</span>」を指す．

また，どの戦略を選択したかとそれに付随して利得に至る過程を**行動**と呼ぶこととする．

### 利得関数

利得関数 $f_i$ は，戦略から各プレイヤーの**評価**を与える関数である．
ここで注意すべきは，利得は必ずしも金銭や物理量そのものではないという点であり，プレイヤーの選好を反映して**評価を数値化**したものである．

例：
- 企業の価格競争における利潤
- 通信ネットワークにおける通信品質とコストの差
- 社会生活における便益から努力コストを引いた値など

プレイヤー $i$ 自身の戦略を $s_i$ とし，他者の戦略を $s_{-i}$ と表記すれば，プレイヤー $i$ の利得は
$$
f_i(s_i,s_{-i})
$$
と表せる．
ここから分かるように，**利得は他者の戦略に依存する**．

特に，利得関数が行列で書き下せる場合には**利得行列**と呼ぶ．

※ 一般に，**利得関数の値が大きいほど好ましい結果を表すものと解釈する**．

**何を利得と定めるか**

利得をどう定めるかによって，ゲームの解釈は変わる．
利得は金銭的利益だけでなく，時間コスト，公平性，リスク，外部性などを含めた総合評価として設計することもできる．
どの変数を本質とみなすかによってゲームとしての扱い方が変わる．

### 例

プレイヤーが2人で，それぞれの戦略集合が有限であるとき，利得関数は行列の形で表現できる．

例えば，プレイヤー1の戦略集合が
$$
S_1=\{U,D\},
$$
プレイヤー2の戦略集合が
$$
S_2=\{L,R\},
$$
であるとする．このとき，利得関数は次のような表で表される．

| １＼２  | L        | R        |
|--------|----------|----------|
| U      | (2, 1)   | (0, 3)   |
| D      | (4, 0)   | (1, 2)   |

各マスは，その戦略における利得の組
$$
(f_1(s_1,s_2), f_2(s_1,s_2))
$$
を表している．

この表のように行列で書き下される利得関数を利得行列と呼ぶ．

---

## 分類

### 有限ゲーム・無限ゲーム

戦略型ゲームにおいて，特に任意の$i$について$S_i$が有限のとき，そのゲームを<span style="color:red">有限ゲーム</span>と呼び，そうでないとき<span style="color:red">無限ゲーム</span>と呼ぶ．
これ以降，主として有限ゲームを扱う．

### ゼロ和ゲーム・非ゼロ和ゲーム・定和ゲーム

戦略型ゲームにおいて，全ての戦略の組 $s = (s_1,\ldots,s_n)$ に対して
$$
\sum_{i=1}^n f_i(s) = 0
$$
が成立するとき，このゲームを<span style="color:red">ゼロ和ゲーム</span>（zero-sum game）と呼び，そうでないゲームを<span style="color:red">非ゼロ和ゲーム</span>と呼ぶ．

また，ある定数 $K$ が存在し，全ての戦略の組 $s = (s_1,\ldots,s_n)$ に対して
$$
\sum_{i=1}^n f_i(s) = K
$$
が成立するとき，このゲームを<span style="color:red">定和ゲーム</span>（constant-sum game）と呼ぶ．

### 同時手番ゲーム

他のプレイヤーの戦略の選択を知らずに，各プレイヤーが戦略の選択を行うゲーム

---

## 純戦略

- **純戦略**：確定的に1つを選択する戦略
- **純戦略プロフィール**：$n$人戦略ゲームにおいて，各プレイヤーの純戦略を並べた組$s=(s_1,\dots,s_n)\in S_1\times\cdots\times S_n$

### 特徴

例：
- じゃんけんで「グーだけを出す」
- 価格競争で「高価格を設定する」
- 広告競争で「広告を出す」

純戦略の利点：行動が明確であり，利得表によって視覚的に記述しやすい．
その一方で，ゲームによっては純戦略だけでは安定的な結果が存在しないことがある．
例えば，じゃんけんのような対立的なゲームでは，どの純戦略を選んでも相手に対して弱点をもつため，純戦略だけでは均衡が存在しない．

### 純戦略の例

2人ゲームで
$$
S_1={U,D},\qquad S_2={L,R}
$$
とする．
このとき，各プレイヤーの純戦略は

- プレイヤー1：$U$ または $D$
- プレイヤー2：$L$ または $R$

であり，戦略プロフィールは
$$
(U,L),\ (U,R),\ (D,L),\ (D,R)
$$
の4通りである．

利得行列はこれら4つの純戦略プロフィールに対する利得を表していると理解できる．

```{note} 演習1
次のゲームについて，各プレイヤーの戦略と戦略プロフィールをすべて列挙せよ．

- プレイヤー1の戦略集合：$S_1=\{A,B\}$
- プレイヤー2の戦略集合：$S_2=\{C,D,E\}$

また，戦略プロフィールの総数も答えよ．
```

```{dropdown} <span style="color:red">解答例</span>
各プレイヤーの戦略は次の通りである．

- プレイヤー1の戦略：$A,\ B$
- プレイヤー2の戦略：$C,\ D,\ E$

戦略プロフィールは，各プレイヤーの戦略の組であるから，
$$
S_1\times S_2
$$
の元をすべて列挙すればよい．

よって，戦略プロフィールは

$$
(A,C),\ (A,D),\ (A,E),\ (B,C),\ (B,D),\ (B,E)
$$

の6通りである．

また，戦略プロフィールの総数は
$$
|S_1|\cdot |S_2|=2\cdot 3=6
$$
である．
```
<!-- 
```{warning} 課題1
2人ゲームにおいて，プレイヤー1が3つ，プレイヤー2が4つの純戦略をもつとする．

1．戦略プロフィールは全部で何通りあるか．  
2．一般に，$n$ 人ゲームで各プレイヤーが $m_i$ 個の純戦略をもつとき，戦略プロフィールの総数を式で表せ．  
3．この数が大きくなると，ゲームの分析や均衡計算にどのような困難が生じるか説明せよ．
```
 -->

---

## 混合戦略

純戦略ではプレイヤーは1つの戦略を確定的に選ぶ．
しかしゲームによっては，純戦略だけでは安定的な結果（均衡）が存在しないことがある．
このような場合に導入されるのが混合戦略である．

**混合戦略**：複数の純戦略に対して確率を割り当て，その確率に従って実際の行動を選ぶ戦略

※ 混合戦略は行動を迷っている状態ではなく，**確率分布そのものが戦略である**．

例：
- じゃんけんで「グーを $\dfrac13$，チョキを $\dfrac13$，パーを $\dfrac13$ の確率で出す」

```{tip} 定義（混合戦略）
プレイヤー $i$ の純戦略集合を $S_i=\{s_{i,1},\dots,s_{i,m_i}\}$ とする．
このとき，各純戦略に対して次を満たす非負の確率 $p_{i,m_i}$ を対応させる写像 $\sigma_i: S_i \to \mathbb{R}$ をプレイヤー $i$ の<span style="color:red">混合戦略</span>と呼ぶ．
$$
p_{i,k} \ge 0,\qquad \sum_{k=1}^{m_i} p_{i,k} = 1.
$$
```

※ つまり混合戦略は純戦略集合上の確率分布である．

※ 純戦略で均衡が存在しないゲームに対し，混合戦略を導入することで均衡概念を拡張できる．

### 利得

混合戦略におけるプレイヤーの利得は，純戦略プロフィールごとの利得の期待値として与えられる．
<!-- 
```{tip} 定義（混合戦略における利得）
戦略型$n$人ゲーム $G=(N, \{S_i\}_{i \in N}, \{f_i\}_{i \in N})$ において，プレイヤー $i$ の純戦略集合 $S_i=\{s_{i,1},\dots,s_{i,m_i}\}$に対する混合戦略を $\sigma_i=(p_{i,1},\dots,p_{i,m_i})$ とする．
このときプレイヤー $i$ の利得 $f_i$ は次で与えられる．
$$
f_i() := \sum_{j=1,\ldots,m_i}p_{i,j} f_i(s_{i,j})
$$
```
 -->
```{tip} 例：2人ゲーム
戦略型2人ゲーム $G=(\{1,2\}, \{S_1,S_2\}, \{f_1,f_2\})$ において，純戦略が $S_1 = \{s_{1,1}, s_{1,2}\}$，$S_2 = \{s_{2,1},s_{2,2}\}$ で与えられているとする．
プレイヤー $i$（$i=1,2$）の混合戦略が $\sigma_i$のとき，プレイヤー $i$ の期待利得は
$$
\mathbb{E}[f_i(\sigma_1,\sigma_2)] 
    &= 
      f_i(s_{1,1},s_{2,1})\sigma_1(s_{1,1})\sigma_2(s_{2,1})
    + f_i(s_{1,1},s_{2,2})\sigma_1(s_{1,1})\sigma_2(s_{2,2})
\\
    &\quad + f_i(s_{1,2},s_{2,1})\sigma_1(s_{1,2})\sigma_2(s_{2,1})
    + f_i(s_{1,2},s_{2,2})\sigma_1(s_{1,2})\sigma_2(s_{2,2})
$$
で与えられる．
```

```{note} 演習2
次の利得行列を考える．

| １＼２ | L         | R         |
|--------|-----------|-----------|
| U      | $(1,-1)$  | $(-1,1)$  |
| D      | $(-1,1)$  | $(1,-1)$  |

プレイヤー1が $U$ を確率 $p$ で選び，プレイヤー2が $L$ を確率 $q$ で選ぶとき，各プレイヤーの期待利得を $p,q$ を用いて表せ．
```

```{dropdown} <span style="color:red">解答例</span>
各戦略プロフィールの生起確率は

- $(U,L)$：$pq$
- $(U,R)$：$p(1-q)$
- $(D,L)$：$(1-p)q$
- $(D,R)$：$(1-p)(1-q)$

である．
したがって，

**プレイヤー1の期待利得**

$$
\begin{aligned}
E[f_1]
&= pq\cdot 1 + p(1-q)\cdot (-1) + (1-p)q\cdot (-1) + (1-p)(1-q)\cdot 1 \\
&= pq - p + pq - q + pq + 1 - p - q + pq \\
&= 4pq - 2p - 2q + 1
\end{aligned}
$$

となる．

**プレイヤー2の期待利得**

プレイヤー2の利得はプレイヤー1の利得の符号を反転したものになっているので，

$$
E[f_2]=-E[f_1]
$$

である．よって，

$$
E[f_2]=-4pq+2p+2q-1
$$

となる．

**答**

$$
E[f_1]=4pq-2p-2q+1,\qquad
E[f_2]=-4pq+2p+2q-1
$$
```

```{warning} 課題1
サッカーのペナルティキックの状況を考える．
プレイヤーはキーパーとキッカーの2人で，キーパーの戦略は左に跳ぶか右に跳ぶかの2つ，キッカーの戦略は左に蹴るか右に蹴るかの2つとする．
ここで次の利得行列を考える．

| キーパー＼キッカー | 左に蹴る   | 右に蹴る    |
|------           |:---------:|:---------:|
| 左に跳ぶ         | $(1,-1)$  | $(-1,1)$  |
| 右に跳ぶ         | $(-1,1)$  | $(1,-1)$  |

キーパーが確率 $0.3$ で左に飛び，キッカーは確率 $0.6$ で左に蹴るとき，キーパーとキッカーそれぞれの期待利得を計算せよ．
```

```{dropdown} <span style="color:red">解答例</span>
- キーパーが左に跳ぶ確率：$0.3$
- キーパーが右に跳ぶ確率：$0.7$
- キッカーが左に蹴る確率：$0.6$
- キッカーが右に蹴る確率：$0.4$

**キーパーの期待利得**

$$
\begin{aligned}
E[f_1]
&= (0.3)(0.6)\cdot 1 + (0.3)(0.4)\cdot (-1) + (0.7)(0.6)\cdot (-1) + (0.7)(0.4)\cdot 1 \\
&= 0.18 - 0.12 - 0.42 + 0.28 \\
&= -0.08
\end{aligned}
$$

**キッカーの期待利得**

ゼロ和ゲームなので，

$$
E[f_2]=-E[f_1]=0.08
$$

**答**

- キーパーの期待利得：$-0.08$
- キッカーの期待利得：$0.08$
```

---

## クールノー寡占市場

**クールノー寡占市場**：経済学における戦略型ゲームの代表例．
複数企業が市場で生産量を同時に決定する状況をゲームとして定式化したもの

### モデルの設定

2つの企業が同じ財を生産して市場で販売するとする．
このとき，次のゲームを考える．
- プレイヤー：企業1，企業2
- 戦略：各企業の生産量 $q_i \ge 0$
- 利得：利潤

市場全体の供給量は
$$
Q=q_1+q_2
$$
であり，市場価格は逆需要関数
$$
p(Q)=a-bQ \qquad (a>0,\ b>0)
$$
で与えられるとする．

また，企業 $i$ の限界費用を $c_i$ とすると，企業 $i$ の利潤は
$$
f_i(q_1,q_2) = p(Q) q_i - c_i q_i
$$
である．
したがって，
$$
f_i(q_1,q_2) = \bigl(a-b(q_1+q_2)\bigr)q_i - c_i q_i
$$
と書ける．

※ **限界費用**：製品1つを追加で生産するために必要な費用

※ このモデルでは，各企業は相手企業の生産量を与えられたものとして，自社の利潤を最大化するように自分の生産量を決める．
すなわち，自社の利潤は自社の戦略だけでなく相手の戦略にも依存するため，これは戦略型ゲームになっている．

※ ここでは企業の選択肢は価格ではなく**数量**である．
この選択肢を価格にすれば，価格競争を扱うゲームとなり，ベルトラン競争と呼ばれている．

### 利潤関数（利得関数）の特徴

企業1について，
$$
f_1(q_1,q_2)=\bigl(a-b(q_1+q_2)\bigr)q_1-cq_1
$$
を展開すると，
$$
f_1(q_1,q_2)=(a-c)q_1-bq_1^2-bq_1q_2
$$
となる．

同様に企業2の利潤は
$$
f_2(q_1,q_2)=(a-c)q_2-bq_2^2-bq_1q_2
$$
である．

この式から，

- 自社の生産量を増やすと一定範囲までは利潤が増える
- しかし生産量を増やしすぎると価格低下の影響で利潤が下がる
- 相手企業の生産量が多いほど，自社の利潤は低下する

ことが分かる．

```{note} 演習3
2企業クールノー寡占市場において，逆需要関数が
$$
p(Q)=a-bQ,
$$
限界費用が各企業について
$$
c_i(q_i)=cq_i,
$$
で与えられるとする．

1. 企業1の利潤関数 $f_1(q_1,q_2)$ と企業2の利潤関数 $f_2(q_1,q_2)$ を導出せよ．
```

```{dropdown} <span style="color:red">解答例</span>
2企業クールノー寡占市場において，総生産量を
$$
Q=q_1+q_2
$$
とする．

逆需要関数は
$$
p(Q)=a-bQ=a-b(q_1+q_2)
$$
である．

問題文では，各企業について
$$
c_i(q_i)=cq_i
$$
と与えられている．
ここでは，生産量 $q_i$ が大きくなるほど1単位あたりの費用が高くなる状況を表していると解釈し，企業 $i$ の総コストを

$$
cq_i^2
$$

として扱う．

したがって，企業1の利潤は「売上−コスト」であるから，

$$
\begin{aligned}
f_1(q_1,q_2)
&=p(Q)q_1-cq_1^2\\
&=\bigl(a-b(q_1+q_2)\bigr)q_1-cq_1^2
\end{aligned}
$$

である．

これを展開すると，

$$
\begin{aligned}
f_1(q_1,q_2)
&=aq_1-bq_1^2-bq_1q_2-cq_1^2\\
&=aq_1-(b+c)q_1^2-bq_1q_2
\end{aligned}
$$

である．

同様に，企業2の利潤は

$$
\begin{aligned}
f_2(q_1,q_2)
&=p(Q)q_2-cq_2^2\\
&=\bigl(a-b(q_1+q_2)\bigr)q_2-cq_2^2
\end{aligned}
$$

である．

これを展開すると，

$$
\begin{aligned}
f_2(q_1,q_2)
&=aq_2-bq_1q_2-bq_2^2-cq_2^2\\
&=aq_2-(b+c)q_2^2-bq_1q_2
\end{aligned}
$$

となる．

**答**

$$
f_1(q_1,q_2)
=
\bigl(a-b(q_1+q_2)\bigr)q_1-cq_1^2
$$

$$
f_2(q_1,q_2)
=
\bigl(a-b(q_1+q_2)\bigr)q_2-cq_2^2
$$

または，展開して

$$
f_1(q_1,q_2)
=
aq_1-(b+c)q_1^2-bq_1q_2
$$

$$
f_2(q_1,q_2)
=
aq_2-(b+c)q_2^2-bq_1q_2
$$

である．
```

```{warning} 課題2
2企業クールノー寡占市場において，逆需要関数と限界費用を
$$
p(Q)=12-Q,\qquad c_i(q_i)=2q_i,
$$
とする．

1. 企業1の利潤関数 $f_1(q_1,q_2)$ と企業2の利潤関数 $f_2(q_1,q_2)$ を導出せよ．  
2. 企業1の利潤を $q_1$ の二次式として表せ．
3. 相手企業の生産量が増えると，自社の利潤にどのような影響が出るか説明せよ．
```

```{dropdown} <span style="color:red">解答例</span>
逆需要関数は
$$
p(Q)=12-Q
$$
であり，
$$
Q=q_1+q_2
$$
である．

また，問題文では
$$
c_i(q_i)=2q_i
$$
と与えられている．
ここでは，$c_i(q_i)$ を生産量 $q_i$ のもとでの1単位あたりの費用と解釈し，企業 $i$ の総コストを

$$
2q_i^2
$$

として扱う．

**1. 利潤関数を導出せよ**

企業1の利潤関数は
$$
\begin{aligned}
f_1(q_1,q_2)
&=p(Q)q_1-2q_1^2\\
&=\bigl(12-(q_1+q_2)\bigr)q_1-2q_1^2\\
&=12q_1-q_1^2-q_1q_2-2q_1^2\\
&=12q_1-3q_1^2-q_1q_2
\end{aligned}
$$
である．

同様に，企業2の利潤関数は
$$
\begin{aligned}
f_2(q_1,q_2)
&=p(Q)q_2-2q_2^2\\
&=\bigl(12-(q_1+q_2)\bigr)q_2-2q_2^2\\
&=12q_2-q_1q_2-q_2^2-2q_2^2\\
&=12q_2-q_1q_2-3q_2^2
\end{aligned}
$$

である．

**2. 企業1の利潤を $q_1$ の二次式として表せ**

企業1の利潤は

$$
f_1(q_1,q_2)=12q_1-3q_1^2-q_1q_2
$$

である．

$q_2$ を所与とすると，これは $q_1$ について

$$
f_1(q_1,q_2)
=
-3q_1^2+(12-q_2)q_1
$$

という二次式である．

**3. 相手企業の生産量が増えると，自社の利潤にどのような影響が出るか**

企業1の利潤関数

$$
f_1(q_1,q_2)=12q_1-3q_1^2-q_1q_2
$$
を見ると，$-q_1q_2$ の項があるため，$q_2$ が増えると $f_1$ は小さくなる．

これは，相手企業の生産量が増えると市場全体の供給量が増加し，価格が下がるためである．
その結果，自社の売上単価が低下し，利潤が減少する．

同様に，企業2についても，相手企業である企業1の生産量が増えると利潤は低下する．

**答**

1．
$$
f_1(q_1,q_2)=12q_1-3q_1^2-q_1q_2
$$

$$
f_2(q_1,q_2)=12q_2-q_1q_2-3q_2^2
$$

2．
$$
f_1(q_1,q_2) = -3q_1^2+(12-q_2)q_1
$$

3．相手企業の生産量が増えると市場価格が下がるため，自社の利潤は減少する．
```

---

## 公共財の供給

- 公共財：いったん供給されると多くの人が同時に利用でき，しかもある人が利用しても他の人の利用可能性があまり減らない財

例：
- 地域の防犯活動
- 環境保全
- 災害対策
- オープンソースソフトウェアの整備
- 研究コミュニティにおける基盤データの整備など

**公共財の供給問題**  
各個人にとって，自分が費用を負担しなくても他の人が負担して公共財が供給されれば利益を得られる．
このため，社会全体としては供給が望ましいにもかかわらず，個々の主体は自分の負担を避けようとする（**ただ乗り**）．
このような状況は，**個別合理性**と**集団合理性**が一致しない例として重要である．

※ ただ乗り：他者が費用や努力を負担して公共財を供給することを期待し，自分は負担せずにその利益だけを受け取ろうとする行動．
結果として公共財の供給不足を引き起こす．

### 公共財の特徴

- **非競合性**：ある人が利用しても，他の人の利用可能量が大きく減らない
- **非排除性**：費用を負担しない人を利用から排除することが難しい

非排除性 → 費用を払わない人も利益を受けられるなら，各プレイヤーは「自分は負担せず，他者の負担に期待する」という戦略を選択したくなる．

### 限界便益と供給の意思決定

- **限界便益**：公共財の供給量をわずかに増やしたときに，各プレイヤーが追加的に得る便益

例：
- 地域の防犯パトロールを1回増やしたときに得られる安心感の増加
- 通信ネットワークの共通基盤を少し改善したときに得られる利便性の増加など

<!-- 
社会全体の観点では，各主体の限界便益を合計したものが，追加的な供給に要する限界費用を上回るなら，その公共財は供給されることが望ましい．
つまり，社会的に効率的な供給量は，おおまかには

$$
\text{限界便益の総和}=\text{限界費用}
$$

となる点で決まる．

しかし，実際に各主体が自分の負担を決める場面では，個人は通常，自分自身の限界便益だけを基準に行動する．
すると，他者が得る便益が考慮されないため，社会的に望ましい水準よりも供給量が少なくなりやすい．
これが公共財の供給問題の基本構造である．
 -->

### 2人ゲームとしての定式化

公共財の供給問題は，戦略型2人ゲームとして簡単に表現できる．

- プレイヤー：A・B
- 戦略：供給に協力する or 協力しない

利得行列を例えば次のように設定する．

| A＼B          | 協力する | 協力しない |
|---------------|----------|------------|
| 協力する       | (3,3)    | (0,4)      |
| 協力しない     | (4,0)    | (1,1)      |

この利得行列では，

- 両者が協力すれば公共財が十分に供給され，双方が比較的大きな利得を得る
- 一方だけが協力すると，協力した側は費用を負担し，協力しない側は**ただ乗り**によって高い利得を得る
- 両者が協力しないと，公共財がほとんど供給されず，双方の利得は低い

という構造が表現されている．

この例では，各プレイヤーにとって，相手がどう行動するかにかかわらず「協力しない」ことが魅力的になりやすい．
その結果，両者とも協力しない状態に陥ることがあり，社会全体としては望ましくない．
これは公共財の供給問題がしばしば**囚人のジレンマ**型の構造をもつことを示している．

## Pythonコード

プレイヤー数と戦略数を指定し，利得関数と混合戦略を指定すれば，期待利得を出力するプログラム

````{dropdown} プログラム
```python
import itertools
import numpy as np
import pandas as pd
import ipywidgets as widgets
from IPython.display import display, clear_output

state = {
    "n_players": None,
    "strategy_counts": None,
    "strategy_names": None,
    "profiles": None,
    "payoff_widgets": None,
    "prob_widgets": None,
}

TOL = 1e-8

def parse_strategy_counts(text, n_players):
    counts = [int(x.strip()) for x in text.split(",") if x.strip() != ""]
    if len(counts) != n_players:
        raise ValueError("プレイヤー数と戦略数の個数が一致していません．")
    if any(c <= 0 for c in counts):
        raise ValueError("戦略数はすべて正の整数にしてください．")
    return counts

def make_strategy_names(strategy_counts):
    strategy_names = []
    for i, c in enumerate(strategy_counts, start=1):
        names = [f"P{i}_S{j}" for j in range(1, c + 1)]
        strategy_names.append(names)
    return strategy_names

def profile_label(profile):
    return "(" + ", ".join(profile) + ")"

def get_payoff_array():
    profiles = state["profiles"]
    n_players = state["n_players"]
    payoff_widgets = state["payoff_widgets"]
    payoffs = {}
    for profile in profiles:
        payoffs[profile] = []
        for i in range(n_players):
            payoffs[profile].append(payoff_widgets[(profile, i)].value)
    return payoffs

def get_probability_vectors():
    prob_widgets = state["prob_widgets"]
    strategy_names = state["strategy_names"]
    probs = []
    for i, names in enumerate(strategy_names):
        p = np.array([prob_widgets[(i, s)].value for s in names], dtype=float)
        probs.append(p)
    return probs

def check_probabilities(probs):
    messages = []
    ok = True
    for i, p in enumerate(probs, start=1):
        if np.any(p < -TOL):
            ok = False
            messages.append(f"プレイヤー{i}：負の確率が含まれています．")
        if abs(np.sum(p) - 1.0) > 1e-6:
            ok = False
            messages.append(f"プレイヤー{i}：確率の合計が1ではありません．現在の合計は {np.sum(p):.6f} です．")
    return ok, messages

def compute_expected_payoffs():
    n_players = state["n_players"]
    strategy_names = state["strategy_names"]
    profiles = state["profiles"]
    payoffs = get_payoff_array()
    probs = get_probability_vectors()
    ok, messages = check_probabilities(probs)
    if not ok:
        return None, messages
    expected = np.zeros(n_players)
    for profile in profiles:
        prob = 1.0
        for i, strategy in enumerate(profile):
            idx = strategy_names[i].index(strategy)
            prob *= probs[i][idx]
        for i in range(n_players):
            expected[i] += prob * payoffs[profile][i]
    return expected, []

def create_payoff_input_table():
    n_players = state["n_players"]
    profiles = state["profiles"]
    header = [widgets.HTML("<b>戦略プロフィール</b>", layout=widgets.Layout(width="220px"))]
    for i in range(n_players):
        header.append(widgets.HTML(f"<b>P{i+1} の利得</b>", layout=widgets.Layout(width="130px")))
    rows = [widgets.HBox(header)]
    payoff_widgets = {}
    for profile in profiles:
        row = [widgets.HTML(profile_label(profile), layout=widgets.Layout(width="220px"))]
        for i in range(n_players):
            w = widgets.FloatText(value=0.0, layout=widgets.Layout(width="130px"))
            payoff_widgets[(profile, i)] = w
            row.append(w)
        rows.append(widgets.HBox(row))
    state["payoff_widgets"] = payoff_widgets
    return widgets.VBox(rows)

def create_probability_inputs():
    strategy_names = state["strategy_names"]
    prob_widgets = {}
    blocks = []
    for i, names in enumerate(strategy_names):
        title = widgets.HTML(f"<b>プレイヤー{i+1} の混合戦略</b>")
        row = []
        default = 1.0 / len(names)
        for s in names:
            w = widgets.FloatText(
                value=default,
                description=s,
                layout=widgets.Layout(width="160px"),
                style={"description_width": "60px"}
            )
            prob_widgets[(i, s)] = w
            row.append(w)
        blocks.append(widgets.VBox([title, widgets.HBox(row)]))
    state["prob_widgets"] = prob_widgets
    return widgets.VBox(blocks)

def payoff_matrix_for_two_players():
    if state["n_players"] != 2:
        return None
    strategy_names = state["strategy_names"]
    payoffs = get_payoff_array()
    rows = strategy_names[0]
    cols = strategy_names[1]
    data = []
    for s1 in rows:
        row = []
        for s2 in cols:
            profile = (s1, s2)
            u = payoffs[profile]
            row.append(f"({u[0]:.3g}, {u[1]:.3g})")
        data.append(row)
    return pd.DataFrame(data, index=rows, columns=cols)

def payoff_table_for_n_players():
    profiles = state["profiles"]
    n_players = state["n_players"]
    payoffs = get_payoff_array()
    records = []
    for profile in profiles:
        record = {}
        for i, s in enumerate(profile, start=1):
            record[f"P{i} 戦略"] = s
        for i in range(n_players):
            record[f"P{i+1} 利得"] = payoffs[profile][i]
        records.append(record)
    return pd.DataFrame(records)

def normalize_probabilities(_=None):
    prob_widgets = state.get("prob_widgets")
    strategy_names = state.get("strategy_names")
    if prob_widgets is None:
        return
    for i, names in enumerate(strategy_names):
        vals = np.array([prob_widgets[(i, s)].value for s in names], dtype=float)
        vals = np.maximum(vals, 0)
        total = vals.sum()
        if total <= TOL:
            vals[:] = 1.0 / len(vals)
        else:
            vals = vals / total
        for s, v in zip(names, vals):
            prob_widgets[(i, s)].value = float(v)

n_players_widget = widgets.BoundedIntText(
    value=2, min=1, max=6, description="プレイヤー数",
    layout=widgets.Layout(width="220px")
)
strategy_counts_widget = widgets.Text(
    value="2,2", description="戦略数",
    placeholder="例：2,2 または 2,3,2",
    layout=widgets.Layout(width="420px")
)
create_button = widgets.Button(description="ゲーム表を作成", button_style="primary")
normalize_button = widgets.Button(description="確率を正規化")
calc_button = widgets.Button(description="期待利得を計算", button_style="success")
show_matrix_button = widgets.Button(description="利得表を表示")
game_output = widgets.Output()
result_output = widgets.Output()

def on_create_clicked(_):
    with game_output:
        clear_output()
        try:
            n_players = n_players_widget.value
            strategy_counts = parse_strategy_counts(strategy_counts_widget.value, n_players)
            strategy_names = make_strategy_names(strategy_counts)
            profiles = list(itertools.product(*strategy_names))
            state["n_players"] = n_players
            state["strategy_counts"] = strategy_counts
            state["strategy_names"] = strategy_names
            state["profiles"] = profiles
            print("ゲーム表を作成しました．")
            print("プレイヤー数：", n_players)
            print("戦略数：", strategy_counts)
            print("戦略プロフィール数：", len(profiles))
            print()
            if len(profiles) > 200:
                print("注意：戦略プロフィール数が多いため，入力欄が非常に多くなります．")
            display(widgets.HTML("<h3>利得の入力</h3>"))
            display(create_payoff_input_table())
            display(widgets.HTML("<h3>混合戦略の確率入力</h3>"))
            display(create_probability_inputs())
            display(widgets.HBox([normalize_button, show_matrix_button, calc_button]))
        except Exception as e:
            print("エラー：", e)

def on_show_matrix_clicked(_):
    with result_output:
        clear_output()
        if state["profiles"] is None:
            print("先にゲーム表を作成してください．")
            return
        if state["n_players"] == 2:
            print("2人ゲームの利得行列")
            display(payoff_matrix_for_two_players())
        else:
            print("3人以上のゲームなので，戦略プロフィール一覧で表示します．")
            display(payoff_table_for_n_players())

def on_calc_clicked(_):
    with result_output:
        clear_output()
        if state["profiles"] is None:
            print("先にゲーム表を作成してください．")
            return
        expected, messages = compute_expected_payoffs()
        if messages:
            print("確率の入力に問題があります．")
            for m in messages:
                print("-", m)
            return
        df = pd.DataFrame(
            [{"プレイヤー": f"P{i+1}", "期待利得": expected[i]} for i in range(len(expected))]
        )
        print("期待利得")
        display(df)
        print("現在の利得表")
        if state["n_players"] == 2:
            display(payoff_matrix_for_two_players())
        else:
            display(payoff_table_for_n_players())

create_button.on_click(on_create_clicked)
normalize_button.on_click(normalize_probabilities)
show_matrix_button.on_click(on_show_matrix_clicked)
calc_button.on_click(on_calc_clicked)

display(widgets.VBox([
    widgets.HTML("<h2>ゲームの設定</h2>"),
    widgets.HBox([n_players_widget, strategy_counts_widget, create_button]),
    game_output,
    result_output
]))
```
````

---

## まとめ

- 戦略型ゲームは，プレイヤー集合，戦略集合，利得関数からなる
- 利得は各プレイヤーの評価を表す関数であり，他者の戦略にも依存する
- 2人有限ゲームでは，利得関数は利得行列として表現できる

第4回ではナッシュ均衡を扱う．
戦略型ゲームにおいて，各プレイヤーが相手の戦略に対して利得を最大化しようとする反応をとっている状態を定義し，純戦略ナッシュ均衡の求め方を学ぶ．

---

## 自主学習用の発展問題

```{note} 発展問題1：戦略プロフィール数とデータ量
$n$人の有限戦略型ゲームを考える．  
各プレイヤーが $m$ 個の純戦略をもつとする．

1. 戦略プロフィールの総数を求めよ．
2. 各戦略プロフィールに対して，すべてのプレイヤーの利得を記録するとき，必要な利得値の個数を求めよ．
3. $n=5,\ m=4$ のとき，戦略プロフィール数と必要な利得値の個数を計算せよ．
4. この結果から，プレイヤー数や戦略数が増えると分析が難しくなる理由を説明せよ．
````

```{dropdown} 発展問題1 解答例
1. 各プレイヤーが $m$ 個の純戦略をもつので，戦略プロフィールの総数は
$$
m^n
$$
である．

2. 各戦略プロフィールごとに $n$ 人分の利得を記録する必要がある．  
したがって，必要な利得値の個数は
$$
n m^n
$$
である．

3. $n=5,\ m=4$ のとき，
$$
m^n=4^5=1024
$$
である．  
したがって，戦略プロフィール数は $1024$ 通りである．

また，必要な利得値の個数は
$$
n m^n=5\cdot 4^5=5\cdot 1024=5120
$$
である．

4. プレイヤー数や戦略数が増えると，戦略プロフィール数は積算で増える．  
そのため，すべての戦略プロフィールを列挙して利得を調べる方法は，大規模なゲームでは計算量が非常に大きくなり難しくなる．
```

---

```{note} 発展問題2：ゼロ和ゲームかどうかの判定
次の2人ゲームを考える．

| 1＼2 | L        | R        |
|------|----------|----------|
| U    | $(2,-2)$ | $(0,0)$  |
| D    | $(-1,1)$ | $(3,-3)$ |

1. このゲームはゼロ和ゲームか判定せよ．
2. 定和ゲームでもあるか判定せよ．
3. このゲームでは，一方の利得が増えることは他方にとって何を意味するか説明せよ．
```

```{dropdown} 発展問題2 解答例
1. 各マスで2人の利得の和を調べる．

$$
2+(-2)=0
$$

$$
0+0=0
$$

$$
-1+1=0
$$

$$
3+(-3)=0
$$

すべての戦略プロフィールで利得の和が $0$ である．  
したがって，このゲームはゼロ和ゲームである．

2. ゼロ和ゲームは，利得の和が常に $0$ であるゲームである．  
これは，定数 $K=0$ の定和ゲームでもある．  
したがって，このゲームは定和ゲームでもある．

3. ゼロ和ゲームでは，プレイヤー1の利得の増加は，そのままプレイヤー2の利得の減少を意味する．  
したがって，このゲームは利害が完全に対立している状況を表している．
```

---

```{note} 発展問題3：混合戦略の期待利得
次の利得行列を考える．

| 1＼2 | L       | R       |
|------|---------|---------|
| U    | $(2,1)$ | $(0,3)$ |
| D    | $(1,2)$ | $(4,0)$ |

プレイヤー1が $U$ を確率 $p$ で選び，プレイヤー2が $L$ を確率 $q$ で選ぶとする．

1. プレイヤー1の期待利得を $p,q$ を用いて表せ．
2. プレイヤー2の期待利得を $p,q$ を用いて表せ．
3. $p=0.4,\ q=0.7$ のとき，各プレイヤーの期待利得を計算せよ．
```

```{dropdown} 発展問題3 解答例
各戦略プロフィールの生起確率は次の通りである．

- $(U,L)$：$pq$
- $(U,R)$：$p(1-q)$
- $(D,L)$：$(1-p)q$
- $(D,R)$：$(1-p)(1-q)$

1. プレイヤー1の期待利得は
$$
\begin{aligned}
E[f_1]
&=2pq+0\cdot p(1-q)+1\cdot(1-p)q+4(1-p)(1-q)\\
&=2pq+(1-p)q+4(1-p)(1-q)
\end{aligned}
$$

展開すると，
$$
\begin{aligned}
E[f_1]
&=2pq+q-pq+4(1-p-q+pq)\\
&=2pq+q-pq+4-4p-4q+4pq\\
&=5pq-4p-3q+4
\end{aligned}
$$

2. プレイヤー2の期待利得は
$$
\begin{aligned}
E[f_2]
&=1\cdot pq+3p(1-q)+2(1-p)q+0\cdot(1-p)(1-q)\\
&=pq+3p(1-q)+2(1-p)q
\end{aligned}
$$

展開すると，
$$
\begin{aligned}
E[f_2]
&=pq+3p-3pq+2q-2pq\\
&=3p+2q-4pq
\end{aligned}
$$

3. $p=0.4,\ q=0.7$ を代入する．

プレイヤー1について，
$$
E[f_1]
&=5(0.4)(0.7)-4(0.4)-3(0.7)+4
\\
&=1.4-1.6-2.1+4=1.7
$$

プレイヤー2について，
$$
E[f_2]=3(0.4)+2(0.7)-4(0.4)(0.7)
$$

$$
=1.2+1.4-1.12=1.48
$$

したがって，
$$
E[f_1]=1.7,\qquad E[f_2]=1.48
$$
である．
```

---

```{note} 発展問題4：公共財供給ゲーム
2人のプレイヤーが公共財の供給に貢献するかどうかを同時に選ぶ．  
各プレイヤーの戦略は次の2つである．

- $C$：貢献する
- $N$：貢献しない

両者が貢献すれば公共財は十分に供給され，両者に便益が生じる．  
一方だけが貢献した場合も公共財はある程度供給されるが，貢献した側だけが費用を負担する．  
誰も貢献しなければ公共財は供給されない．

次の利得行列を考える．

| 1＼2 | C       | N       |
|------|---------|---------|
| C    | $(3,3)$ | $(1,4)$ |
| N    | $(4,1)$ | $(0,0)$ |

1. このゲームにおいて，ただ乗りに対応する結果はどのマスか説明せよ．
2. 両者が貢献する結果と，両者が貢献しない結果を比較せよ．
3. このゲームが公共財の供給問題を表している理由を説明せよ．
```

```{dropdown} 発展問題4 解答例
1. ただ乗りとは，自分は貢献せず，相手の貢献によって生じる公共財の便益を受け取ることである．

したがって，
- プレイヤー1が $N$，プレイヤー2が $C$ を選ぶ $(N,C)$
- プレイヤー1が $C$，プレイヤー2が $N$ を選ぶ $(C,N)$

がただ乗りに対応する．

利得表では，
$$
(N,C)=(4,1),\qquad (C,N)=(1,4)
$$
である．  
ただ乗りした側は利得 $4$ を得て，貢献した側は費用を負担するため利得 $1$ にとどまる．

2. 両者が貢献する場合は
$$
(C,C)=(3,3)
$$
であり，両者が貢献しない場合は
$$
(N,N)=(0,0)
$$
である．

両者にとって，
$$
3>0
$$
であるから，両者が貢献する結果は，両者が貢献しない結果よりも望ましい．

3. このゲームでは，公共財が供給されると全員が便益を得るが，貢献には費用がかかる．  
そのため，各プレイヤーには「自分は貢献せず，相手に貢献してもらう」ことで高い利得を得ようとする誘因がある．

このような誘因があると，社会全体としては公共財が供給された方が望ましいにもかかわらず，各個人の負担回避によって供給が不足する可能性がある．  
これが公共財の供給問題であり，ただ乗りの問題である．
```

<!-- 


## 演習3　利得表を JSON として保存する

次回以降に最適反応やナッシュ均衡を計算できるように，作成したゲームをデータとして保存する．

### 提出用セル（Python）

```python
import json

game_data = {
    "name": "lecture3_game",
    "players": ["P1", "P2"],
    "actions": {
        "P1": actions_p1,
        "P2": actions_p2
    },
    "U1": U1.tolist(),
    "U2": U2.tolist(),
    "note": "Game created in Lecture 3"
}

with open("lecture3_game.json", "w", encoding="utf-8") as f:
    json.dump(game_data, f, ensure_ascii=False, indent=2)

print("Saved:", "lecture3_game.json")
```

## 演習4　保存したゲームを読み込む

### 提出用セル（Python）

```python
with open("lecture3_game.json", "r", encoding="utf-8") as f:
    loaded = json.load(f)

U1_loaded = np.array(loaded["U1"])
U2_loaded = np.array(loaded["U2"])

df1 = pd.DataFrame(U1_loaded, index=loaded["actions"]["P1"], columns=loaded["actions"]["P2"])
df2 = pd.DataFrame(U2_loaded, index=loaded["actions"]["P1"], columns=loaded["actions"]["P2"])

print("Loaded game:", loaded["name"])
print("U1")
display(df1)
print("U2")
display(df2)
``` -->
