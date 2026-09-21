# 第6回　Excelによる線形代数

### 前回の復習

- Wordで数式を入力する方法を学んだ．
- UnicodeMath，LaTeX記法，数式タブを用いて，分数，べき乗，添字，総和，積分などを入力した．
- 数式の前後では，記号の意味を本文で説明する必要があることを確認した．
- 教科書の文章，数式，図をWordで再現する課題を行った．

### 概要

- データ解析基礎でExcelの基本操作は既習のものとして，Excelを数学の計算に利用する
- セル参照と数式を用いて，連立1次方程式を解くブックを作成する
- 行列とベクトルをExcel上で表現する
- 行列の積や逆行列を用いて解を求める
- 計算結果が正しいかを検算する

### 到達目標

1. Excelで行列とベクトルを表として表現できる．
2. セル参照を用いて，計算過程が分かるワークシートを作成できる．
3. 2元および3元の連立1次方程式をExcelで解くことができる．
4. 行列の積や逆行列を用いて，連立1次方程式の解を確認できる．
5. Excelの計算結果をそのまま信じるのではなく，検算によって確認できる．

### タイピング（20分）

- 指はホームポジションに置き，ここから各指で所望のキーをタイプする．

![ホームポジション](./figs/TouchTyping_HomePosition_QWERTY.png)

出典：[https://upload.wikimedia.org/wikipedia/commons/6/67/TouchTyping_HomePosition_QWERTY.png](https://upload.wikimedia.org/wikipedia/commons/6/67/TouchTyping_HomePosition_QWERTY.png)

```{note} タイピング練習
次のサイトなどでタイピング練習をすること（各自好きな方法で練習して良い）．

- 寿司打（スシダ）[https://sushida.net/](https://sushida.net/)
- e-typing [https://www.e-typing.ne.jp/](https://www.e-typing.ne.jp/)
```

### 講義スケジュールの変更

**従前**
1. Mac利用環境の構築とタイピングの練習
2. 情報セキュリティ、情報モラル（プライバシー保護、著作権、不正利用）
3. Wordによる文書作成1
4. Wordによる文書作成2と生成系AI
5. 演習：Wordによる文書作成
6. 文章作成術
7. レポート・論文作成法
8. 演習：Wordによるレポート作成
9. PowerPointによるプレゼン資料作成
10. 演習：PowerPointによるプレゼン資料作成
11. Texによる文書作成1
12. Texによる文書作成2
13. 演習：Texによる数式のある文書作成

**向後**
1. Mac利用環境の構築とタイピングの練習
2. 情報セキュリティ、情報モラル（プライバシー保護、著作権、不正利用）
3. Wordによる文書作成1
4. Wordによる文書作成2と生成系AI
5. 演習：Wordによる文書作成
6. <span style="color:red">Excelによる線形代数</span>
7. <span style="color:red">PowerPointによるプレゼン資料作成</span>
8. <span style="color:red">文章作成術</span>
9. <span style="color:red">レポート・論文作成法</span>
10. <span style="color:red">TeXによる文書作成</span>
11. <span style="color:red">演習：TeXによる数式のある文書作成</span>
12. <span style="color:red">Python入門</span>
13. <span style="color:red">Pythonによる加減乗除</span>

---

## 本講義でのExcelの扱い

Excelの基本操作は「データ解析基礎」で既に学んでいるため，本講義ではExcelの起動方法，セルへの入力方法，基本的な表の作成方法は詳しく扱わない．

今回は数学の計算を確認する道具としてExcelを使う．
特に線形代数で現れる行列，ベクトル，連立1次方程式を扱う．

### Excelでできること

- 表の作成：様々な情報を表にまとめることができる
- 計算：豊富な関数が準備されており，簡単な計算から高度な計算までできる
- グラフの作成：分かりやすく見やすいグラフを作成できる
- データの管理：大量のデータを管理できる
- 数学の計算：行列，ベクトル，関数などの計算を確認できる

### 本講義で扱うこと

- セル参照を用いた計算
- 行列とベクトルの入力
- 行列の積
- 逆行列
- 連立1次方程式の解
- 検算

```{tip} 注意
本講義ではExcelの基本操作は既習として進める．
セルの入力，保存，表の罫線，基本的な四則演算などで不安がある場合は，「データ解析基礎」の内容を復習しておくこと．
```

---

## セル参照と計算

Excelではセルに値を直接入力するだけでなく，他のセルを参照して計算できる．
たとえばA1セルとB1セルの和をC1セルに表示したい場合は，C1セルに次のように入力する．

```text
=A1+B1
```

セル参照を用いて計算する利点
- どの数値を使って計算しているかが分かりやすい
- 値を変更したときに再計算しやすい（A1やB1の値を変更したときにC1の結果も自動で更新される）

```{note} 演習1
Excelファイル“第6回_<学籍番号>_<氏名>.xlsx”を作成し，次の計算表を作れ．

<table style="border-collapse: collapse; table-layout: fixed;">
  <thead>
    <tr>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 48px;">セル</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 120px;">A</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 120px;">B</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 120px;">C</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">1</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">a</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">b</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">a+b</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">2</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">2</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">3</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=A2+B2</code></td>
    </tr>
  </tbody>
</table>

その後，A2とB2の値を好きな値に変更し，C2の値が自動で変わることを確認せよ．
```

---

## 2次方程式を解く

```{note} 演習2
新しいシートを作成し，解の公式を用いて次の2次方程式を解け．

$$
x^2-x-6=0
$$

<table style="border-collapse: collapse; table-layout: fixed; ">
  <thead>
    <tr>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 48px;">セル</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 180px;">A</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 180px;">B</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">1</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">2次方程式</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">ax^2+bx+c=0</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">2</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">3</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">a</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">4</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">b</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">-1</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">5</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">c</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">-6</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">6</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">x1</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=(-B4+SQRT(B4^2-4*B3*B5))/(2*B3)</code></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">7</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">x2</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=(-B4-SQRT(B4^2-4*B3*B5))/(2*B3)</code></td>
    </tr>
  </tbody>
</table>
```

---

## 連立1次方程式を解く

次の連立1次方程式を考える．

$$
\begin{cases}
2x + y = 5 \\
x + 3y = 7
\end{cases}
$$

この方程式は，行列を用いて次のように表せる．

$$
A\boldsymbol{x}=\boldsymbol{b}
$$

ここで，

$$
A =
\begin{pmatrix}
2 & 1 \\
1 & 3
\end{pmatrix},
\quad
\boldsymbol{x} =
\begin{pmatrix}
x \\
y
\end{pmatrix},
\quad
\boldsymbol{b} =
\begin{pmatrix}
5 \\
7
\end{pmatrix}
$$

である．

### 逆行列を用いる

行列 $A$ に逆行列 $A^{-1}$ が存在する場合，

$$
A\boldsymbol{x}=\boldsymbol{b}
$$

の両辺に左から $A^{-1}$ をかけると，

$$
\boldsymbol{x}=A^{-1}\boldsymbol{b}
$$

となる．
したがって，逆行列と行列の積を求めれば，連立1次方程式の解を求められる．

### 使う関数

| 関数 | 内容 |
| --- | --- |
| `MINVERSE(範囲)` | 逆行列を求める |
| `MMULT(範囲1, 範囲2)` | 行列の積を求める |
| `MDETERM(範囲)` | 行列式を求める |

行列 $A$ が `B3:C4` にあり，ベクトル $\boldsymbol{b}$ が `E3:E4` にある場合，解ベクトルは次の式で求められる．

```text
=MMULT(MINVERSE(B3:C4),E3:E4)
```

```{note} 演習3
新しいシートを作成し，Excelで次の連立1次方程式を解け．

$$
\begin{cases}
2x + y = 5 \\
x + 3y = 7
\end{cases}
$$

<table style="border-collapse: collapse;">
  <thead>
    <tr>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 48px;">セル</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 180px;">A</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 180px;">B</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 180px;">C</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">1</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">連立1次方程式</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">Ax=b</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">2</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">A</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;">b</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">3</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">2</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">1</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">5</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">4</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">1</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">3</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">7</td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">5</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">6</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">行列式（MDETERM関数）</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=MDETERM(A3:B4)</code></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">7</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">逆行列（MINVERSE関数）</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=MINVERSE(A3:B4)</code></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">8</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">9</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">解（MMULT関数）</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=MMULT(B7#,C3:C4)</code></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">10</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
  </tbody>
</table>
```

---

## 検算

Excelで計算結果が出ても，その結果が正しいとは限らない．
入力ミス，セル範囲の指定ミス，式の入力ミスがあり得るためである．

そのため，求めた解を元の方程式に代入して確認する．

### 行列を用いた検算

解ベクトル $\boldsymbol{x}$ が求まったら，$A\boldsymbol{x}$ を計算し，$\boldsymbol{b}$ と一致するか確認する．

Excelでは，次のように計算する．

```text
=MMULT(B3:C4,解ベクトルの範囲)
```

この結果が `E3:E4` の値と一致していれば，計算結果は正しいと判断できる．

### 差を確認する

さらに，$A\boldsymbol{x}-\boldsymbol{b}$ を計算すると，誤差を確認できる．
理論上は0になるが，小数を含む計算では非常に小さい誤差が出ることがある．

```{note} 演習4
演習3で求めた解について，検算を行え．

1. `MMULT` を用いて $A\boldsymbol{x}$ を計算する．
2. 計算結果が $\boldsymbol{b}$ と一致するか確認する．
3. $A\boldsymbol{x}-\boldsymbol{b}$ を計算し，差が0になるか確認する．

<table style="border-collapse: collapse; table-layout: fixed;">
  <thead>
    <tr>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 48px;">セル</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 120px;">A</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 120px;">B</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 120px;">C</th>
      <th style="border: 1px solid #666; padding: 4px 8px; width: 120px;">D</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">11</td>
      <td style="border: 1px solid #666; padding: 4px 8px;">検算</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=MMULT(A3:B4,B9#)</code></td>
      <td style="border: 1px solid #666; padding: 4px 8px;">差分</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"><code>=C3:C4-B11#</code></td>
    </tr>
    <tr>
      <td style="border: 1px solid #666; padding: 4px 8px;">12</td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
      <td style="border: 1px solid #666; padding: 4px 8px;"></td>
    </tr>
  </tbody>
</table>
```

---

## ワークシート作成の注意

Excelで数学の計算を行うときは，計算結果だけでなく，計算過程が分かるようにワークシートを作成する．

### 見やすいワークシートの条件

- タイトルがある
- どの表が何を表すか分かる
- 行列 $A$，未知数ベクトル $\boldsymbol{x}$，右辺ベクトル $\boldsymbol{b}$ が区別されている
- 入力値と計算結果が区別されている
- 検算結果がある
- 単なる数値だけでなく，説明が書かれている

### 色の使い方

色を使う場合は，意味を決めて使う．

例
- 入力する値：薄い黄色
- 計算結果：薄い青
- 検算結果：薄い緑

色を使いすぎると，かえって見にくくなる．
色だけに頼らず，見出しや罫線でも意味を示す．

---

## 生成AIの利用について

生成AIにExcelの数式や関数の使い方を質問することはできる．
ただし，AIが示した数式やセル範囲が正しいとは限らない．

### 使ってよい例

- `MMULT` の使い方を確認する
- `MINVERSE` の意味を確認する
- ワークシートの見やすい構成を相談する
- エラーの原因の候補を確認する

### 注意すべき例

- AIが出したExcelファイルを内容確認せずに提出する
- セル範囲を確認せずに関数をそのまま使う
- 計算結果を検算せずに提出する

AIを使った場合でも，最終的な計算結果と提出物の責任は自分にある．

---

## 課題

```{warning} 課題
Excelファイル“第6回_<学籍番号>_<氏名>.xlsx”に新しいシートを作成し，次の2つの課題に取り組むこと．

**課題1**：次の2元連立1次方程式をExcelで解き，検算せよ．

$$
\begin{cases}
2x - y = 3 \\
3x + 4y = 10
\end{cases}
$$

**課題2**：次の3元連立1次方程式をExcelで解き，検算せよ．

$$
\begin{cases}
x + y + z = 6 \\
2x - y + z = 3 \\
x + 2y + 3z = 14
\end{cases}
$$

ただし，次の条件を守ること．

- 課題1と2は別々のシートに作成すること
- 各シートにタイトル「課題1」「課題2」と付けること
- 行列 $A$，未知数ベクトル $\boldsymbol{x}$，右辺ベクトル $\boldsymbol{b}$ が分かるように配置すること
- `MINVERSE` と `MMULT` を用いて解を求めること
- $A\boldsymbol{x}$ を計算し，検算結果を示すこと
- 入力値，計算結果，検算結果が見分けられるように表を整えること
```

### 提出方法

- WebClassの「第6回課題」よりファイル“第6回_<学籍番号>_<氏名>.xlsx”を提出する

### 提出期限

<span style="color: red; ">5月29日(金)23:59まで</span>

質問等がある場合には

- メール kkagawa@josai.ac.jp
- Teamsのチャット

で連絡してください．

## 次回の準備

- 次回はPowerPointによるプレゼン資料作成を扱う．
- Mac bookを充電・持参すること
