% -----------------------------------------------------------------------------
% LaTeX Class 'learnpad' - LaTeX class for Learn PAd
% 
% Guglielmo De Angelis <guglielmo.deangelis@isti.cnr.it>
% Andrea Polini <andrea.polini@unicam.it>
%
% This Class is based on the LaTeX Class 'choreos' version 0.4
% -----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\def\@learnpadtemplateversion{0.4}
\def\@learnpadtemplatedaterelease{2014/04/24}
\ProvidesClass{learnpad}[ \@learnpadtemplatedaterelease - LaTeX class for the Learn PAd project v. \@learnpadtemplateversion]
% -----------------------------------------------------------------------------

\newcommand{\@ptoption}{1pt}
\newcommand{\@tipo}{oneside}

%\DeclareOption{10pt}{\renewcommand{\@ptoption}{0pt}}
%\DeclareOption{11pt}{\renewcommand{\@ptoption}{1pt}}
%\DeclareOption{12pt}{\renewcommand{\@ptoption}{2pt}}
%\DeclareOption{twoside}{\renewcommand{\@tipo}{twoside}}
%\DeclareOption{oneside}{\renewcommand{\@tipo}{oneside}}
%\DeclareOption{pdf}{\pdftrue}
\ExecuteOptions{oneside,12pt}
\ProcessOptions\relax
\typeout{*****************************************************************}
\typeout{** Document Class 'learnpad' \@learnpadtemplatedaterelease ***************************}
\typeout{** Please report bugs, comments, suggestions, and improvements **}
\typeout{** to Guglielmo De Angelis <guglielmo.deangelis@isti.cnr.it> ****}
\typeout{** to Andrea Polini <andrea.polini@unicam.it> *******************}
\typeout{*****************************************************************}
% -----------------------------------------------------------------------------
% Load the book class for a4 paper dimension
% -----------------------------------------------------------------------------
\LoadClass[\@tipo,a4paper,1\@ptoption]{book}


% -----------------------------------------------------------------------------
% Load support packages
%
% Get the missing packages at ftp://ftp.dante.de/tex-archive
% -----------------------------------------------------------------------------

% set Arial-like font
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault} 
\RequirePackage{times}

% set page geometry
\RequirePackage[total={174mm,269mm},top=12mm, left=18mm,
bindingoffset=0mm, includefoot, includehead,headheight=13.6pt]{geometry}

\RequirePackage{calc}

\RequirePackage{lastpage}

\RequirePackage[english]{varioref}
\RequirePackage[english]{babel}

\RequirePackage{graphicx}

\RequirePackage{fancyhdr}
\RequirePackage{xspace}
\RequirePackage{setspace}

\RequirePackage[pdftex,bookmarks=true,colorlinks=true]{hyperref}
\RequirePackage[font=bf]{caption}
\RequirePackage[normalem]{ulem}

\RequirePackage{bnf}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{pifont}
\RequirePackage{subfigure}
\RequirePackage{array}
% \RequirePackage{longtable}
\RequirePackage{xtab}

\RequirePackage{colortbl}
\RequirePackage{caption}
\RequirePackage{endnotes}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{eso-pic}
\RequirePackage[final]{listings}
\RequirePackage{xcolor}
\RequirePackage{multirow}

\RequirePackage[nottoc]{tocbibind}
\RequirePackage{titlesec}
\RequirePackage{titletoc}

\def\@learnpad{Learn PAd}
\newcommand{\learnpad}{\@learnpad\xspace}
\def\@learnpadurl{http://www.learnpad.eu}
\newcommand{\learnpadurl}{\@learnpadurl\xspace}

\def\@learnpadtemplateversionlabel{\LaTeX{} template v. \@learnpadtemplateversion}
\newcommand{\learnpadtemplateversionlabel}{\@learnpadtemplateversionlabel\xspace}

\usepackage{ifthen}

% ---------------------------------------------------------------------------
% --- Colors
% ---------------------------------------------------------------------------

\definecolor{listingsBackground}{rgb}{0.9,0.9,0.9}
\definecolor{learnpadDefaultTextColor}{RGB}{0,0,0}
% \definecolor{learnpadGray}{RGB}{77,77,77}
\definecolor{learnpadGray}{RGB}{109,110,113}
\definecolor{learnpadLightGray}{RGB}{234,234,234}
\definecolor{learnpadBlue}{RGB}{0,24,100}

\hypersetup{linkcolor=learnpadBlue, citecolor=learnpadBlue, filecolor=learnpadBlue, urlcolor=learnpadBlue}

% ---------------------------------------------------------------------------
% --- Listings Styles
% ---------------------------------------------------------------------------

\lstdefinestyle{xmlCode}{language=XML,frame=tbrl,
  basicstyle=\normalsize\ttfamily\itshape\color{learnpadBlue},
  keywordstyle=\ttfamily\bf\itshape\color{learnpadBlue},
  stringstyle=\itshape\color{learnpadBlue},flexiblecolumns=true,
  commentstyle=\itshape\color{learnpadBlue},captionpos=b,
  abovecaptionskip=10pt,belowcaptionskip=0pt,
  backgroundcolor=\color{listingsBackground}, frame=none, 
}

\lstdefinestyle{javaCode}{language=Java,frame=tbrl,
  basicstyle=\normalsize\ttfamily\itshape\color{learnpadBlue},
  keywordstyle=\ttfamily\bf\itshape\color{learnpadBlue},
  stringstyle=\itshape\color{learnpadBlue},flexiblecolumns=true,
  commentstyle=\itshape\color{learnpadBlue},captionpos=b,
  abovecaptionskip=10pt,belowcaptionskip=0pt,
  backgroundcolor=\color{listingsBackground}, frame=none, 
}

\newcommand\BackgroundPic{
\put(-3,0){
\parbox[b][\paperheight]{\paperwidth}{%
\vfill
\centering
  \ifthenelse{\boolean{isthedeliverablepulic}}
  {
\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{logos/frontpage7.png}  
  }{
\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{logos/frontpage7NoCC.png}  
  }
\vfill
}}}

% ---------------------------------------------------------------------------
% --- Numbering
% ---------------------------------------------------------------------------
\setcounter{secnumdepth}{3}

% ---------------------------------------------------------------------------
% --- Empty pages...
% ---------------------------------------------------------------------------

\renewcommand*\cleardoublepage{\ifodd\c@page\else \hbox{}
    \thispagestyle{plain}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi}

\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage

% ---------------------------------------------------------------------------
% --- Default Variable Settings
% ---------------------------------------------------------------------------
\gdef\@theauthors{}
\gdef\@theauthors{}
\gdef\@theuniversity{}
\gdef\@theschool{}

\gdef\@thetitle{}
\gdef\@thesubtitle{}

\gdef\@thedeliverabletype{}
\gdef\@thedeliverableno{}
\gdef\@thenaturedeliverable{}
\gdef\@thedisseminationlevel{}
\gdef\@theinternalno{}
\gdef\@thecontractualdeliverydate{}
\gdef\@theactualdeliverydate{}
\gdef\@thecontributingwp{}
\gdef\@theeditors{}
\gdef\@thereviewers{}
\gdef\@thedeliverablelicence{}
\gdef\@thedeliverablelicencepublicmessage{Creative Commons Attribution 3.0 License}
\gdef\@thedeliverablelicenceconfidentialmessage{Confidential to \learnpad}
\gdef\@theversion{}
\gdef\@theabstract{}
\gdef\@thekeywords{}

\newboolean{isthedeliverablepulic}
\setboolean{isthedeliverablepulic}{false}

% ---------------------------------------------------------------------------
% --- FRONTPAGE
% ---------------------------------------------------------------------------
\newcommand{\mychaptertitlefont}{\color{learnpadBlue}\fontseries{s}\fontsize{20}{24}\selectfont}
\newcommand{\mytitlefont}{\color{learnpadBlue}\fontseries{b}\sc\fontsize{15}{24}\selectfont}
\newcommand{\mysubtitlefont}{\color{learnpadBlue}\fontseries{s}\fontsize{13}{16}\selectfont}
\newcommand{\authorfont}{\color{learnpadBlue}\fontseries{s}\fontsize{14}{14}\selectfont}
\newcommand{\largefont}{\color{learnpadBlue}\fontseries{s}\fontsize{18}{14}\selectfont}
\newcommand{\bigfont}{\color{learnpadBlue}\fontseries{s}\fontsize{20}{14}\selectfont}
\newcommand{\biggerfont}{\color{learnpadBlue}\fontseries{s}\fontsize{26}{22}\selectfont}
\newcommand{\linkfont}{\color{learnpadGray}\fontsize{16}{16}\selectfont}
\newcommand{\smallfont}{\color{learnpadGray}\fontsize{6}{6}\selectfont}

\newcommand{\tableformat}[1]{\bf\textcolor{learnpadBlue}{#1} }

\def\author#1{\gdef\@theauthors{#1}}
\def\authors#1{\gdef\@theauthors{#1}}
\def\university#1{\gdef\@theuniversity{#1}}
\def\school#1{\gdef\@theschool{#1}}

\def\title#1{\gdef\@thetitle{#1}}
\def\subtitle#1{\gdef\@thesubtitle{#1}}

\def\deliverabletype#1{\gdef\@thedeliverabletype{#1}}
\def\deliverableno#1{\gdef\@thedeliverableno{#1}}
\def\naturedeliverable#1{\gdef\@thenaturedeliverable{#1}}
% \def\disseminationlevel#1{\gdef\@thedisseminationlevel{#1}}
\def\disseminationlevelpublic{\setboolean{isthedeliverablepulic}{true}\gdef\@thedisseminationlevel{Public}\gdef\@thedeliverablelicence{\@thedeliverablelicencepublicmessage}}
\def\disseminationlevelconfidential{\setboolean{isthedeliverablepulic}{false}\gdef\@thedisseminationlevel{Confidential}\gdef\@thedeliverablelicence{\@thedeliverablelicenceconfidentialmessage}}
\def\internalno#1{\gdef\@theinternalno{#1}}
\def\contractualdeliverydate#1{\gdef\@thecontractualdeliverydate{#1}}
\def\actualdeliverydate#1{\gdef\@theactualdeliverydate{#1}}
\def\contributingwp#1{\gdef\@thecontributingwp{#1}}
\def\editors#1{\gdef\@theeditors{#1}}
\def\reviewers#1{\gdef\@thereviewers{#1}}
% \def\deliverablelicence#1{\gdef\@thedeliverablelicence{#1}}
\def\version#1{\gdef\@theversion{#1}}
\def\abstract#1{\gdef\@theabstract{#1}}
\def\keywords#1{\gdef\@thekeywords{#1}}

\def\@thetitle{}
\def\@thesubtitle{}

\newcommand{\HRule}{\rule{\linewidth}{0pt}}

% first page
\renewcommand{\maketitle}{%

\thispagestyle{empty}
\setlength{\TPHorizModule}{5mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{5mm}{5mm}

\begin{textblock}{10}(8.6,46.5) %
  \noindent \linkfont{\rmfamily \learnpadurl}%
\end{textblock}

\begin{textblock}{10}(1,56) %
  \noindent \smallfont{\learnpadtemplateversionlabel}%
\end{textblock}

\enlargethispage{4\baselineskip}
\setlength{\parindent}{0mm}
\setlength{\parskip}{0mm}

\AddToShipoutPicture*{\BackgroundPic}

%\vspace*{2.0 em} 
% \vspace*{-10px} 

% \hspace{7.7 em}{\biggerfont{{\sf
%      \textcolor{learnpadGray}{FP7 ICT STREP Project}}\par}}
{\centering {{\sf
      \textcolor{learnpadGray}{FP7 ICT STREP Project}}\par}}

\vspace*{29.0 em} 

\hspace{7.7 em}{\biggerfont{{\sf
      \textcolor{learnpadBlue}{Deliverable}} \@thedeliverableno}\par}

\vspace*{3.2 em} 
\hspace{7.7 em}{\parbox{0.86\textwidth}{\setstretch{1.5} \biggerfont{{\bf
\textcolor{learnpadBlue}
{\@thetitle}}}}\par}
\vspace*{2.0 em} 
\hspace{7.7 em}{\parbox{0.86\textwidth}{\mysubtitlefont{\@thesubtitle}}\par}

% empty page
\newpage
\thispagestyle{empty}
\color{learnpadDefaultTextColor}
\vspace*\fill

\newpage

% project number and title
\framebox[\textwidth]{%
\begin{tabular*}{\textwidth}[h]{p{0.28\textwidth}cl}
\tableformat{Project Number} & : & FP7-619583\\
\tableformat{Project Title} & : & \learnpad \\
& & Model-Based Social Learning for Public Administrations \\
\end{tabular*}
}

\vspace{3em}

% deliverable  information
\framebox[\textwidth]{%
\begin{tabular*}{\textwidth}[h]{p{0.28\textwidth}cp{0.57\textwidth}}
\tableformat{Deliverable Number} & : & \@thedeliverableno \\
\tableformat{Title of Deliverable} & : & \@thetitle{} \\
\tableformat{Nature of Deliverable} & : & \@thenaturedeliverable \\	
\tableformat{Dissemination level} & : & \@thedisseminationlevel \\
\tableformat{Licence} & : & \@thedeliverablelicence \\
\tableformat{Version} & : & \@theversion \\
\tableformat{Contractual Delivery Date} & : & \@thecontractualdeliverydate \\
\tableformat{Actual Delivery Date} & : & \@theactualdeliverydate \\	
\tableformat{Contributing WP} & : & \@thecontributingwp \\
\tableformat{Editor(s)}  & : & \@theeditors\\
\tableformat{Author(s)}  & : & \@theauthors\\
\tableformat{Reviewer(s)}  & : &  \@thereviewers \\
\end{tabular*}
}

\vspace{3em}

% abstract
\framebox[\textwidth]{%
\parbox{0.98\textwidth}{{\tableformat{\LARGE\bf Abstract\vspace{0.3 em}}} \\ 
\@theabstract
}
}

\vspace{3em}

% keywords
\framebox[\textwidth]{%
\begin{tabular*}{\textwidth}[h]{p{0.3\textwidth}l}
\tableformat{\LARGE\bf Keyword List \vspace{0.3 em}}  &\\
\multicolumn{2}{p{0.98\textwidth}}{\@thekeywords} \\
\end{tabular*}
}

\setlength{\parindent}{1em}
\setlength{\parskip}{2pt}
\cleardoublepage
} % end of the maketitle definition!!

% ---------------------------------------------------------------------------
%    Front Matter
% ---------------------------------------------------------------------------

\renewcommand{\frontmatter}{ 
  \hspace{7.7 em}{}
  \pagenumbering{Roman}
  \setcounter{page}{1}
}

% ---------------------------------------------------------------------------
%    Main Matter
% ---------------------------------------------------------------------------

\renewcommand{\mainmatter}{
  \cleardoublepage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

% ---------------------------------------------------------------------------
%    Headers
% ---------------------------------------------------------------------------
\pagestyle{fancy}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}

\renewcommand{\headrule}{{\color{learnpadGray}\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
    \hrule height\headrulewidth width\headwidth
    \vskip-\headrulewidth}}

\renewcommand{\footrule}{\color{learnpadGray}{\if@fancyplain\let\footrulewidth\plainfootrulewidth\fi
    \vskip-\footruleskip\vskip-\footrulewidth \hrule width\headwidth
    height\footrulewidth\vskip\footruleskip}}

\lhead{}
\chead{}
\rhead{}
\lfoot{\parbox[c]{3cm}{\footnotesize \color{learnpadGray} \learnpad \\
    FP7-619583}}
\cfoot{\parbox[c]{5cm}{\centering 
  \ifthenelse{\boolean{isthedeliverablepulic}}
  {
\includegraphics[height=0.5cm]{logos/ccLogoSmall.png}
  }{
\color{learnpadGray} \footnotesize \textbf{-- \@thedeliverablelicenceconfidentialmessage --}
  }}}
\rfoot{\parbox[c]{3cm}{\flushright \color{learnpadGray} \footnotesize
    \thepage}}%\thepage/\pageref{LastPage}

% plain style is the same as "global" style
\fancypagestyle{plain}{%
  \lhead{}%\@thedate
  \chead{}
  \rhead{}
  \lfoot{\parbox[c]{3cm}{\footnotesize \color{learnpadGray}  \learnpad \\
      FP7-619583}}
  \cfoot{\parbox[c]{5cm}{\centering 
  \ifthenelse{\boolean{isthedeliverablepulic}}
  {
\includegraphics[height=0.5cm]{logos/ccLogoSmall.png}
  }{
\color{learnpadGray} \footnotesize \textbf{-- \@thedeliverablelicenceconfidentialmessage --}
  }}}
  \rfoot{\parbox[c]{3cm}{\flushright \color{learnpadGray} \footnotesize
      \thepage}}%\thepage/\pageref{LastPage}
\color{learnpadDefaultTextColor} 
}

% ---------------------------------------------------------------------------
% --- MISC COMMANDS
% ---------------------------------------------------------------------------

\def\date#1{\gdef\@thedate{#1}}

\newcommand{\comment}[2]{\marginpar{\textcolor{red}{\ding{74}}}\footnote{\textcolor{red}{\it\scriptsize
      {\textbf{\sf \underline{#1}:~}#2}}}}

% ---------------------------------------------------------------------------
% --- TITLES FORMAT COMMANDS
% ---------------------------------------------------------------------------

\titleformat{\chapter}
  {\large}
  {\vspace{-12mm}}
  {1ex}{\mychaptertitlefont\bfseries \thechapter \hspace{4mm}}

\titleformat{\section}
    {\bfseries\Large\upshape}
    {\color{learnpadBlue}\thesection.}{.2em}{\color{learnpadBlue}}

\titleformat{\subsection}
 {\bfseries\large\upshape}
{\color{learnpadBlue}\thesubsection.}{.6em}{\color{learnpadBlue}}

\titleformat{\subsubsection}
 {\itshape\normalsize}
{}{0em}{\underline}

\titlecontents{part}[0pt] {\addvspace{4mm} \sc\Large}%
{\thecontentslabel\quad}{}{\titlerule*[5pt]{}\contentspage}

\titlecontents{chapter} %section
[0pt] % left
{\addvspace{4mm} \bfseries\large \color{learnpadBlue}} %above
{\color{learnpadBlue}{\thecontentslabel}\quad } %before with label
{} %before without label
{\color{learnpadBlue}\titlerule*[5pt]{.}\color{learnpadBlue}\contentspage}% filler and page
[]%after

\titlecontents{section}[4mm] {\addvspace{2pt} \itshape
  }{\thecontentslabel\quad}{}{\titlerule*[5pt]{.}\contentspage}

\titlecontents{subsection}[9mm] {\addvspace{2pt} \itshape}
  {\thecontentslabel\quad}{}{\titlerule*[5pt]{.}\contentspage}

\titlecontents{figure}[0pt] {\addvspace{4mm}}{Figure
  \thecontentslabel :\enspace}{}{\titlerule*[5pt]{.}\contentspage}

\titlecontents{table}[0pt] {\addvspace{4mm}}{Table
  \thecontentslabel :\enspace}{}{\titlerule*[5pt]{.}\contentspage}


% ---------------------------------------------------------------------------
% --- ANNEXES AND BIBLIOGRAPHY COMMANDS
% ---------------------------------------------------------------------------
\renewcommand{\ULthickness}{1.5pt}

\def\@annexname{Annex\xspace}
\newboolean{annexfound}
\setboolean{annexfound}{false}

\newcommand\annex[1]{
  \ifthenelse{\boolean{annexfound}}
  {}{
    \setboolean{annexfound}{true}
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \cleardoublepage  
  }
  \par
  \gdef\@chapapp{\@annexname}%
  \gdef\thechapter{\@annexname \@Alph\c@chapter}

\titleformat{\chapter}
  {\large}
  {\vspace{-12mm}}
  {1ex}{\mychaptertitlefont\bfseries \uline{\thechapter} \hspace{4mm}}
  \chapter{#1}
}

\renewenvironment{thebibliography}[1]{%
    \setcounter{chapter}{0}%
    \gdef\thechapter{\@Alph\c@chapter}
    \bibsection
    \begin{thebibitemlist}{#1}}{\end{thebibitemlist}  
} 


% ---------------------------------------------------------------------------
% --- HISTORY
% ---------------------------------------------------------------------------

\newcommand{\historyitem}[3]{#1 & #2 & #3 \tabularnewline \hline}
\newenvironment{history} { 
\cleardoublepage
% \newpage
  \section*{\color{learnpadBlue}{Document History}}
    \begin{center}
%     \begin{longtable}{|>{\centering}m{0.1\textwidth}|m{0.5\textwidth}|m{0.25\textwidth}|}
    \begin{xtabular}{|>{\centering}m{0.1\textwidth}|m{0.5\textwidth}|m{0.25\textwidth}|}
      \hline 
      \tableformat{Version} &  \centering \tableformat{Changes}  & \centering \tableformat{Author(s)} \tabularnewline
      \hline
    }
    {
    \end{xtabular}
%     \end{longtable}
    \end{center}
}

% ---------------------------------------------------------------------------
% --- DOCUMENT REVIEW TABLE
% ---------------------------------------------------------------------------

\gdef\@outlinedate{} \gdef\@outlineversion{} \gdef\@outlinereviewers{}
\gdef\@outlinecomments{}

\gdef\@draftdate{} \gdef\@draftversion{} \gdef\@draftreviewers{}
\gdef\@draftcomments{}

\gdef\@internaldate{} \gdef\@internalversion{} \gdef\@internalreviewers{}
\gdef\@internalcomments{}

\gdef\@candidatefinaldate{} \gdef\@candidatefinalversion{} \gdef\@candidatefinalreviewers{}
\gdef\@candidatefinalcomments{}

\def\reviewoutline#1#2#3#4{\gdef\@outlinedate{#1}
  \gdef\@outlineversion{#2} \gdef\@outlinereviewers{#3}
  \gdef\@outlinecomments{#4}}

\def\reviewdraft#1#2#3#4{\gdef\@draftdate{#1} \gdef\@draftversion{#2}
  \gdef\@draftreviewers{#3} \gdef\@draftcomments{#4}}

\def\reviewinternal#1#2#3#4{\gdef\@internaldate{#1} \gdef\@internalversion{#2}
  \gdef\@internalreviewers{#3} \gdef\@internalcomments{#4}}

\def\reviewcandidatefinal#1#2#3#4{\gdef\@candidatefinaldate{#1} \gdef\@candidatefinalversion{#2}
  \gdef\@candidatefinalreviewers{#3} \gdef\@candidatefinalcomments{#4}}

\newcommand{\reviewtable} {
  \section*{\color{learnpadBlue}{Document Reviews}}
  \begin{table}[h!]\centering
    \begin{tabular}{|>{\centering}m{0.09\textwidth}|m{0.13\textwidth}|m{0.06\textwidth}|m{0.18\textwidth}|m{0.34\textwidth}|}
      \hline 
      \tableformat{Release} & \centering \tableformat{Date} & \centering \tableformat{Ver.} & \centering \tableformat{Reviewers} & \centering \tableformat{Comments} \tabularnewline
      \hline
      \tableformat{ToC} & \@outlinedate &  \@outlineversion & \@outlinereviewers  & \@outlinecomments \tabularnewline
      \hline
      \tableformat{Draft} & \@draftdate &  \@draftversion & \@draftreviewers  & \@draftcomments \tabularnewline
      \hline
      \tableformat{Internal} & \@internaldate &  \@internalversion & \@internalreviewers  & \@internalcomments \tabularnewline
      \hline
      \tableformat{Candate Final} & \@candidatefinaldate &  \@candidatefinalversion & \@candidatefinalreviewers  & \@candidatefinalcomments \tabularnewline
      \hline
      % } {
    \end{tabular}
  \end{table}
}

% ---------------------------------------------------------------------------
% --- ACRONYM TABLE
% ---------------------------------------------------------------------------

\newcommand{\acronym}[2]{ \protect#1 & \protect#2 \tabularnewline \hline}
\newenvironment{acronyms} { 
\cleardoublepage
% \newpage
 \section*{\color{learnpadBlue}{Glossary, acronyms \& abbreviations}}
    \begin{center}
%     \begin{longtable}{|>{\centering}m{20mm}|m{132mm}|}
    \begin{xtabular}{|>{\centering}m{20mm}|m{132mm}|}
      \hline
      \tableformat{Item} & \tableformat{\centering Description} \tabularnewline
      \hline
    }
    {
    \end{xtabular}
%     \end{longtable}
    \end{center}
}

% ---------------------------------------------------------------------------
% --- STYLES FOR : TOC, ITEMIZED, ENUMERATE, CAPTIONS, ENDNOTES
% ---------------------------------------------------------------------------

\def\@mycontentsname{Table Of Contents}
\renewcommand\tableofcontents{%
    \cleardoublepage
%   \newpage
    \section*{\@mycontentsname}%
    {\color{learnpadBlue}
    \@starttoc{toc}%
    }
    \clearpage
}

\def\@mylisttablename{List Of Tables}
\renewcommand\listoftables{%
    \cleardoublepage
%   \newpage
    \section*{\@mylisttablename}%
    {\color{learnpadBlue}
    \@starttoc{lot}%
    }
    \addcontentsline{toc}{chapter}{\@mylisttablename}
    \clearpage
}

\def\@mylistfigurename{List Of Figures}
\renewcommand\listoffigures{%
    \cleardoublepage
%   \newpage
    \section*{\@mylistfigurename}%
    {\color{learnpadBlue}
    \@starttoc{lof}%
    }
    \addcontentsline{toc}{chapter}{\@mylistfigurename}
    \clearpage
}


\def\@mythelistlistingname{List of Listings}
\newcommand{\listoflistings}{
    \cleardoublepage
%     \newpage
    \section*{\@mythelistlistingname}%
    {\color{learnpadBlue}
    \@starttoc{lol}%
    }
  \addcontentsline{toc}{chapter}{\@mythelistlistingname}
    \clearpage
}

% redefinitions for itemize lists
\renewcommand{\labelitemi}{\color{learnpadBlue}$\bullet$}
\renewcommand{\labelitemii}{\color{learnpadBlue}$\bullet$}

% redefinition for enumerate lists
\renewcommand{\theenumi}{\arabic{enumi})}
\renewcommand{\labelenumi}{\color{learnpadBlue}\theenumi}

% redefinition for captions
\renewcommand{\theenumii}{\arabic{enumii})}
\renewcommand{\labelenumii}{\color{learnpadBlue}\theenumii}
\renewcommand{\captionfont}{\bfseries\color{learnpadBlue}}
% \renewcommand{\thetable}{\arabic{table}}

% this is an hack for the endnotes!
% \renewcommand{\notesname}{\color{black}\footnoterule}
\renewcommand{\enoteheading}{\vspace*\fill\footnoterule}

\hypersetup{linkcolor=learnpadBlue}
