% Modified NUISTletter.cls (with blogo.jpg + RGB(0,102,204) blue)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NUISTletter}

\RequirePackage{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{epsfig}
\RequirePackage{ifthen}
\RequirePackage{xcolor}

% Updated color
\definecolor{slcolor}{rgb}{0,0.4,0.8}

\DeclareGraphicsExtensions{.png,.jpg,.pdf}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions

\LoadClass[letterpaper]{letter}

\newcommand{\subjectname}{Subject}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{\subjectname: #1}}

%% Change nuist.png → blogo.jpg
\newboolean{logofound}
\IfFileExists{img/blogo.jpg}
    {\setboolean{logofound}{true}}
    {\setboolean{logofound}{false}}

\setlength{\textwidth}{7.2in}        % 宽度更宽，左右边距更窄
\setlength{\textheight}{9.2in}       % 高度更高，上下边距更窄
\setlength{\topmargin}{-1.0in}       % 顶部距离缩小
\setlength{\oddsidemargin}{-0.4in}   % 左边距缩小
\setlength{\evensidemargin}{-0.4in}  % 右边距缩小
\setlength{\footskip}{0.5in}         % 底部距离缩小


\DeclareFixedFont{\xcmrbn}{OT1}{cmr}{b}{n}{10}
\DeclareFixedFont{\xcmrmn}{OT1}{cmr}{m}{n}{10}
\DeclareFixedFont{\ixcmrmn}{OT1}{cmr}{m}{n}{9}

\newsavebox{\departmenthead}
\newsavebox{\departmentfoot}
\newsavebox{\emptyfoot}

%% HEADER BOX (with new blogo.jpg)
\sbox{\departmenthead}{
\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{0.0in}}|@{\extracolsep{0.125in}}l@{}}
    \parbox{4.00in}{
        \raggedright
        \ifthenelse{\boolean{logofound}}
           {\epsfig{file=img/blogo.jpg, height=1.05in}}
           {\parbox[c][2.0in][c]{4.0in}{\hfill}
            \ClassWarning{NUISTletter}{blogo.jpg NOT FOUND!}}
    } &
    \parbox[c][1.8in][c]{2.225in}{~ \\}
\end{tabular*}}

\savebox{\emptyfoot}[\textwidth][c]{\ixcmrmn\hspace*{\textwidth}}

\renewcommand{\ps@firstpage}{
    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{1.0in}
    \renewcommand{\@oddhead}{\usebox{\departmenthead}}
    \renewcommand{\@oddfoot}{\usebox{\departmentfoot}}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{}
}

\renewcommand{\ps@empty}{
    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{0.5in}
    \renewcommand{\@oddhead}{}
    \renewcommand{\@oddfoot}{\usebox{\emptyfoot}}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{\usebox{\emptyfoot}}
}

\providecommand{\@evenhead}{}
\providecommand{\@oddhead}{}
\providecommand{\@evenfoot}{}
\providecommand{\@oddfoot}{}

\pagestyle{empty}

% opening
\renewcommand{\opening}[1]{\thispagestyle{firstpage}%
    \ifx\@empty\fromaddress
    \else
        {\raggedleft
            \begin{tabular}{l@{}}\ignorespaces
            \fromaddress \\*[1\parskip]
            \end{tabular}\par
        }
    \fi
    \vspace{-8em}
    \@date \vspace{2\parskip}\\
    {\raggedright \toname \\ \toaddress \par}
    \vspace{1\parskip}%
    \ifthenelse{\equal{\@subject}{}}{}{\@subject\par}
    \vspace{1\parskip}%
    #1\par\nobreak
}

% closing
\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
    \stopbreaks
    \noindent
    \hspace*{0.6\textwidth}\parbox{0.4\textwidth}{\raggedright
    \ignorespaces #1\\[4\medskipamount]%
    \ifx\@empty\fromsig
        \fromname
    \else \fromsig
    \fi\strut}%
    \par
}
