[![License](https://img.shields.io/badge/license-LPPL-blue)](https://www.latex-project.org/lppl/)
[![Last Commit](https://img.shields.io/github/last-commit/raraLi/swufe-recommendation-letter)](https://github.com/raraLi/swufe-recommendation-letter)
[![Issues](https://img.shields.io/github/issues/raraLi/swufe-recommendation-letter)](https://github.com/raraLi/swufe-recommendation-letter/issues)
![Repo Size](https://img.shields.io/github/repo-size/raraLi/swufe-recommendation-letter.svg)

# SWUFE 推荐信 LaTeX 模板

西南财经大学（Southwestern University of Finance and Economics，SWUFE）推荐信 LaTeX 模板。

## 项目简介

本项目用于制作西南财经大学推荐信，基于 LaTeX 制作，适用于 Overleaf 或本地 LaTeX 环境。

模板包含：

* 学校及学院信息
* 推荐信正文
* 教授签名
* 学校 Logo 水印
* 联系方式

## 使用方法

### 1. 使用 Overleaf

将整个项目上传至 Overleaf，然后打开 `main.tex`。

建议编译器选择：

```text
XeLaTeX
```

### 2. 本地编译

需要安装 LaTeX 环境，例如：

* TeX Live
* MiKTeX

然后使用 XeLaTeX 编译：

```bash
xelatex main.tex
```

## 修改内容

使用模板前，请根据实际情况修改：

```text
Professor Name
Professor Email
Professor Phone
Recommendation Letter Content
```

同时根据实际推荐人替换：

```text
img/signature.jpg
```
