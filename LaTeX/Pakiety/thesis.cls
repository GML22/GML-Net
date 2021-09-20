\ProvidesClass{Pakiety/thesis}
\LoadClass[12pt, twoside]{mwart}

%--------------------------------------
% Define class parameters
%--------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=Pakiety/thesis.cls,
    prefix=thesis
}
\DeclareStringOption[2.5cm]{left}
\DeclareStringOption[2.5cm]{right}
\DeclareStringOption[2.5cm]{top}
\DeclareStringOption[2.5cm]{bottom}
\DeclareStringOption[6mm]{bindingoffset}
\DeclareBoolOption[false]{nohyphenation}
\ProcessKeyvalOptions*

%--------------------------------
% Common packages
%--------------------------------
\RequirePackage{amsmath}    % Basic mathematical typesetting
%\RequirePackage{amssymb}    % Advanced math symbols
\RequirePackage{amsthm}     % Theorems typesetting
\RequirePackage{array}      % Advanced table column formats
% Bibliography in biber
\RequirePackage[backend=biber, style=ieee, dashed=false]{biblatex}
 % Custom figure and table captions
\RequirePackage[font=small, labelfont=bf, labelsep=period, belowskip=0pt]{caption}
\RequirePackage{chngcntr}   % Per-section counters
\RequirePackage{enumitem}   % Itemize/enumrate
\RequirePackage{fancyhdr}   % Custom header/footer styles
\RequirePackage{fourier}    % Adobe Utopia font
\RequirePackage{graphicx}   % Enhanced images support
\RequirePackage{ifpdf}      % pdfTeX-specific options
\RequirePackage{listings}   % Code listings
\RequirePackage{longtable}  % Multi-page tables
\RequirePackage{multirow}   % Advanced table cells
\RequirePackage{setspace}   % Set space between lines
\RequirePackage{scrextend}  % Allows \addmargin environment
\RequirePackage{tocloft}    % Custom ToC/LoF/LoT
\RequirePackage{xurl}        % URL-sensitive line breaks
\RequirePackage{xkeyval}    % Keys and class parameters
\RequirePackage{xspace}     % Remove duplicated spaces
\RequirePackage{lscape}     % Pakiet do tabel na całą stronę

% Pakiety dodane przeze mnie
\newcommand{\upshapeI}[1]{\textrm{\upshape I}}
\RequirePackage[parfill]{parskip}
\RequirePackage[hang]{footmisc}
\RequirePackage[table]{xcolor}
\RequirePackage{makecell}

% Powoduje, że odstępy pomiędzy paragrafami są równe
\raggedbottom

\allowdisplaybreaks[1]

% Ustawienie marginesu dla przypisów
\setlength\footnotemargin{10pt}

% Ustawienie sekcji
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\setcounter{secnumdepth}{4} 
\urlstyle{rm}                                  

%--------------------------------------
% Formatowanie listingów
%--------------------------------------
\lstset{
breaklines=true,
breakatwhitespace=false,
basicstyle=\small,
tabsize=2, 
numbers=left, 
numberstyle=\small, 
numbersep=8pt, 
columns=fullflexible,
showspaces=false,   
showstringspaces=false,
extendedchars=true, 
frame=single,       
frameround=ffff,
aboveskip=1em,
firstnumber=1,
belowskip=1.4em,
xleftmargin=.05\textwidth, 
xrightmargin=.05\textwidth,
postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
caption=\mbox{}
}

% Zmiana nazwy z "Listing" na "Kod źródłowy"
\renewcommand\lstlistingname{\large Kod źródłowy}
\renewcommand\lstlistlistingname{\large Kod źródłowy}

% Ustawienie interlinii 1.15 w tekście i 1 w trybie matematycznym
\setstretch{1.2}
\AtBeginEnvironment{equation}{\leavevmode\singlespace\setstretch{0.9}}
\AfterEndEnvironment{equation}{\endsinglespace\setstretch{1.2}\vskip0.1\baselineskip\noindent\ignorespaces}
\AtBeginEnvironment{equation*}{\leavevmode\singlespace\setstretch{0.9}}
\AfterEndEnvironment{equation*}{\endsinglespace\setstretch{1.2}\vskip0.1\baselineskip\noindent\ignorespaces}
\counterwithin{figure}{section}
\counterwithin{table}{section}

%--------------------------------------
% PdfTeX specific configuration
%--------------------------------------
\ifpdf
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[
        protrusion=true,
        expansion=true
    ]{microtype}
\fi

%--------------------------------
% Produce clickable hyperlinks
% in ToC, LoF and LoT
%--------------------------------
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

%--------------------------------------
% Default margin is 2.5 cm
%--------------------------------------
\RequirePackage[
    a4paper,
    left=\thesisleft,
    right=\thesisright,
    top=\thesistop,
    bottom=\thesisbottom,
    bindingoffset=\thesisbindingoffset
]{geometry}

%--------------------------------
% Turn off hyphenation
%--------------------------------
\ifthesisnohyphenation
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
    \hbadness=10000
\fi

%--------------------------------
% Table of Contents setup
%--------------------------------
\setlength{\cftbeforesecskip}{2pt}
\renewcommand{\cftsecfont}{\bf\normalsize}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}

%--------------------------------
% List of Figures setup
%--------------------------------
\renewcommand*\l@figure{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoffigurestoc}{
    \listoffigures
    \addcontentsline{toc}{section}{\listfigurename}
}

%--------------------------------
% List of Tables setup
%--------------------------------
\renewcommand*\l@table{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoftablestoc}{
    \listoftables
    \addcontentsline{toc}{section}{\listtablename}
}

%--------------------------------
% Header & footer
%--------------------------------
\SetSectionFormatting{section}{0.5cm}{\FormatHangHeading{\Large}}{0.5cm}
\let\oldsection\section
\renewcommand{\section}{
	\thispagestyle{plain}
	\oldsection
}

\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}

\fancypagestyle{headings}{
	\fancyhead{}
	\renewcommand{\headrulewidth}{1pt}
	\fancyheadoffset{0cm}
	\fancyhead[RO]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyhead[LE]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyfoot{}
	\fancyfoot[LE,RO]{\thepage}
}
\pagestyle{headings}

\renewcommand{\sectionmark}[1]{
	\markboth{#1}{#1}
}

%--------------------------------
% Set default list style
%--------------------------------
\setlist[itemize,1]{topsep=2pt,label=\large$\bullet$, leftmargin=28pt}
\setlist[itemize,2]{topsep=2pt,leftmargin=18pt}
\setlist[itemize,3]{topsep=2pt,leftmargin=18pt}

\setlist[enumerate,1]{topsep=2pt,leftmargin=24pt}
\setlist[enumerate,2]{topsep=2pt,leftmargin=16pt}
\setlist[enumerate,3]{topsep=2pt,leftmargin=16pt}

%--------------------------------
% Wybór języka pracy
%--------------------------------
\newcommand{\langpol}{
    \newcommand{\@lang}{polish}
    \usepackage[polish]{babel}

	\newtheorem{theorem}{Twierdzenie}
	\newtheorem{lemma}{Lemat}
	\newtheorem{corollary}{Wniosek}
	\newtheorem{definition}{Definicja}
	\newtheorem{axiom}{Aksjomat}
	\newtheorem{assumption}{Założenie}

	\AtBeginDocument{
		\renewcommand{\listfigurename}{Spis rysunków}
		\renewcommand{\listtablename}{Spis tabel}
		\renewcommand{\tablename}{Tabela}
	}
}
\newcommand{\langeng}{
    \newcommand{\@lang}{english}
    \usepackage[english]{babel}

	\newtheorem{theorem}{Theorem}
	\newtheorem{lemma}{Lemma}
	\newtheorem{corollary}{Corollary}
	\newtheorem{definition}{Definition}
	\newtheorem{axiom}{Axiom}
	\newtheorem{assumption}{Assumption}

	\AtBeginDocument{
		\renewcommand{\listfigurename}{List of Figures}
		\renewcommand{\listtablename}{List of Tables}
		\renewcommand{\tablename}{Table}
	}
}

%--------------------------------
% Streszczenie po polsku
%--------------------------------
\newcommand{\streszczenie}{
    \thispagestyle{plain}
    \begin{center}\textbf{\large\@title}\end{center}
    \textbf{\\ Streszczenie.\xspace}
}
\newcommand{\slowakluczowe}{\vspace{0.5cm}\par\noindent \textbf{Słowa kluczowe: \xspace}}

%--------------------------------
% Streszczenie po angielsku
%--------------------------------
\renewcommand{\abstract}{
    \thispagestyle{plain}
    \begin{center}\textbf{\large\@engtitle}\end{center}
    \textbf{\\ Abstract.\xspace}
}
\newcommand{\keywords}{\vspace{0.5cm}\par\noindent \textbf{Keywords: \xspace}}

%--------------------------------
% Strona tytułowa - makra
%--------------------------------
\newcommand{\Thesis}{
    \newcommand{\ThesisType}{Master}
}
\newcommand{\instytut}[1]{
    \newcommand{\@instytut}{#1}
}
\newcommand{\kierunek}[1]{
    \newcommand{\@kierunek}{#1}
}

\newcommand{\promotor}[1]{
    \newcommand{\@promotor}{#1}
}
\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}

%--------------------------------
% Strona tytułowa
%--------------------------------
\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
    \linespread{1.15}

    \thispagestyle{empty}
    \pagenumbering{gobble}

    \begin{center}
        %\sffamily
        \ifnum \pdf@strcmp{\@lang}{polish} = 0
            \includegraphics[width=\textwidth]{Obrazy/header.png} \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{english} = 0
            \includegraphics[width=\textwidth]{Obrazy/header-eng.png} \\
        \fi
        \hfill \break
        \ifnum \pdf@strcmp{\@lang}{polish} = 0
            Instytut \@instytut \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{english} = 0
            Institute of \@instytut \\
        \fi
        \hfill \break
        \hfill \break
        \hfill \break
        \hfill \break
        \ifnum \pdf@strcmp{\ThesisType}{Engineer} = 0
            \ifnum \pdf@strcmp{\@lang}{polish} = 0
                \includegraphics[width=\textwidth]{Obrazy/title-inz.png} \\
            \fi
            \ifnum \pdf@strcmp{\@lang}{english} = 0
                \includegraphics[width=\textwidth]{Obrazy/title-inz-eng.png} \\
            \fi
        \fi
        \ifnum \pdf@strcmp{\ThesisType}{Master} = 0
            \ifnum \pdf@strcmp{\@lang}{polish} = 0
                \includegraphics[width=\textwidth]{Obrazy/title-mgr.png} \\
            \fi
            \ifnum \pdf@strcmp{\@lang}{english} = 0
                \includegraphics[width=\textwidth]{Obrazy/title-mgr-eng.png} \\
            \fi
        \fi
        \hfill \break
        \ifnum \pdf@strcmp{\@lang}{polish} = 0
            na~studiach: \@kierunek \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{english} = 0
            in~the~field~of~study \@kierunek \\
        \fi
        \hfill \break
        \hfill \break
        \Large
        \@title \\
        \hfill \break
        \hfill \break
        \LARGE
        \@author \\
        \normalsize
        \hfill \break
        \hfill \break
        \ifnum \pdf@strcmp{\@lang}{polish} = 0
            opiekun pracy dyplomowej \\
        \fi
        \ifnum \pdf@strcmp{\@lang}{english} = 0
            thesis supervisor \\
        \fi
        \large
        \@promotor \\
        \vfill
        \ifnum \pdf@strcmp{\@lang}{polish} = 0
            WARSZAWA \@date
        \fi
        \ifnum \pdf@strcmp{\@lang}{english} = 0
            WARSAW \@date
        \fi
    \end{center}

    \pagenumbering{arabic}
    \setcounter{page}{1}
}

%--------------------------------
% Pusta strona - makro
%--------------------------------
\newcommand{\blankpage}{
    \newpage
    \thispagestyle{empty}
    \
    \newpage
}

%--------------------------------
% Skrót (akronim) - makro
%--------------------------------
\newcommand{\acronymlist}{
    \ifnum \pdf@strcmp{\@lang}{polish} = 0
        \section*{Wykaz symboli i skrótów}
    \fi
    \ifnum \pdf@strcmp{\@lang}{english} = 0
        \section*{List of Symbols and Abbreviations}
    \fi
}
\newcommand{\acronym}[2]{
    \par\noindent\hspace{0.4em}
    {\textbf{#1} -- #2}
}

%--------------------------------
% Spis załączników - makra
%--------------------------------
\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{%
    \bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup
}

\newcommand{\@appendixtitle}{
    \ifnum \pdf@strcmp{\@lang}{polish} = 0
        Załącznik
    \fi
    \ifnum \pdf@strcmp{\@lang}{english} = 0
        Appendix
    \fi
}

\let\standardappendix\appendix
\renewcommand\appendix[1]{%
    \tocless\section{\hspace*{1.5em} #1}
    \addcontentsline{app}{subsection}{\hspace*{-1.1em}\arabic{section}.\hspace*{0.5em} #1}
}

\newcommand\listofappendicestoc{
    \ifnum \pdf@strcmp{\@lang}{polish} = 0
        \section*{Spis załączników}\@starttoc{app}
    \fi
    \ifnum \pdf@strcmp{\@lang}{english} = 0
        \section*{List of Appendices}\@starttoc{app}
    \fi

    \standardappendix
    \renewcommand{\thesection}{\@appendixtitle~\arabic{section}}
}
%--------------------------------
% Makra potrzebne do obsługi plików tworzonych na podstawie notatników Colaba .ipynb
%--------------------------------
\newcommand{\kernn}[1]{\kern#1pt}
\newcommand{\raisee}[2]{\raisebox{#1}{\ensuremath{#2}}}
\newcommand{\colorr}[2]{\textcolor{#1}{#2}}
\def\cell{}
\def\s#1{\vspace{5mm}\section{#1}}
\def\ss#1{\vspace{5mm}\subsection{#1}}
\def\sss#1{\vspace{5mm}\subsubsection{#1}}
\def\ssss#1{\vspace{5mm}\subsubsection{#1}}
\def\sssss#1{\vspace{5mm}\subsubsection{#1}}
\def\ssssss#1{\vspace{5mm}\subsubsection{#1}}
\def\sssssss#1{\vspace{5mm}\subsubsection{#1}}
%%%%%%%% STNN  %%%%%%
\newcommand{\mtiny}[1]{\mbox{\tiny\ensuremath{#1}}}
\newcommand{\mfootnotesize}[1]{\mbox{\footnotesize\ensuremath{#1}}}
\newcommand{\mscriptsize}[1]{\mbox{\scriptsize\ensuremath{#1}}}
\newcommand{\mlarge}[1]{\mbox{\large\ensuremath{#1}}}
\newcommand{\mlargee}[1]{\mbox{\Large\ensuremath{#1}}}
\newcommand{\mlargeee}[1]{\mbox{\LARGE\ensuremath{#1}}}
\newcommand{\mlargeeee}[1]{\mbox{\huge\ensuremath{#1}}}
\newcommand{\keraise}[3]{\kernn{#2}\raisee{#3pt}{\mtiny{#1}}}
\newcommand{\axstnn}[7]{\begin{array}{#7}\keraise{#1}{#2}{#3}\\\keraise{#4}{#5}{#6}\end{array}}
\newcommand{\bxstnn}[4]{\begin{array}[]{c}\mlargeeee{#1}\\[#4pt]\keraise{#2}{#3}{0}\end{array}}
\newcommand{\xconv}[5]{\kernn{-4}\axstnn{#4}{0}{0}{#3}{0}{0}{r}\kernn{-12}\bxstnn{\bb{C}}{#5}{8}{-18}
\kernn{-8}\axstnn{#2}{-2.5}{0}{#1}{-2.5}{0}{l}}
\newcommand{\xdense}[5]{\kernn{-6}\axstnn{#4}{0}{0}{#3}{0}{0}{r}\kernn{-14}
\bxstnn{\bb{F}}{#5}{16}{-17}\kernn{-17}\axstnn{#2}{5}{1}{#1}{2}{-1}{l}}
\newcommand{\xpool}[5]{\kernn{-6}\axstnn{#4}{0}{0}{#3}{0}{0}{r}\kernn{-10}
\bxstnn{\bb{P}}{#5}{5}{-15}\kernn{-15}\axstnn{#2}{0}{0}{#1}{0}{0}{l}}
\newcommand{\xinp}[5]{\kernn{-4}\axstnn{#4}{0}{0}{#3}{0}{0}{r}\kernn{-15}
\bxstnn{\cl{I}}{#5}{12}{-17}\kernn{-14}\axstnn{#2}{5}{1}{#1}{2}{-1}{l}}
\newcommand{\xdrop}[5]{\kernn{-2}\axstnn{#4}{0}{0}{#3}{0}{0}{r}\kernn{-15}
\bxstnn{\bb{D}}{#5}{2}{-17}\kernn{-18}\axstnn{#2}{0}{0}{#1}{5}{-1}{l}}
\newcommand{\xmerge}[5]{\kernn{-2}\axstnn{#4}{0}{0}{#3}{0}{0}{r}\kernn{-15}
\bxstnn{\bb{M}}{#5}{1}{-17}\kernn{-9.5}\axstnn{#2}{0}{0}{#1}{0}{-2}{l}}
\newcommand{\xgeneral}[5]{\kernn{-4}\axstnn{#4}{0}{0}{#3}{0}{0}{r}\kernn{-11}
\bxstnn{\bb{Q}}{#5}{0}{-18}\kernn{-9}\axstnn{#2}{-2.5}{0}{#1}{-2.5}{0}{l}}
\newcommand{\xunit}[3]{\kernn{-4}
\overset{#1}{\underset{\raisee{-1.5pt}{\mtiny{#2}}}{\bxstnn{\bb{U}}{#3}{2}{-18}}}}
\newcommand{\xunitdef}[3]{\xunit{#1}{#2}{}
\kernn{-4}\raisee{-2pt}{\ensuremath\longleftarrow\,\boxed{{#3}}}}
\newcommand{\xassign}[2]{{#1}\longleftarrow{#2}}
\newcommand{\xaggreg}[1]{\left\langle{#1}\right\rangle}
%%%%%%%%% OTHERS %%%%%%%%%
\newcommand{\xx}[2]{(#1)(#2)}
\newcommand{\bb}[1]{\mathbb{#1}}
\newcommand{\cl}[1]{\mathcal{#1}}
\newcommand{\tp}[1]{{#1}^{\intercal}}
\newcommand{\tr}[1]{\text{trace}\left[#1\right]}
\newcommand{\inv}[1]{\in\bb{R}^{#1}}
\newcommand{\inm}[2]{\in\bb{R}^{#1\times#2}}
\newcommand{\invc}[1]{\in\bb{C}^{#1}}
\newcommand{\inmc}[2]{\in\bb{C}^{#1\times#2}}
\def\ds{\displaystyle}
\def\ass{\leftarrow}
\def\od#1#2{\nabla_{#2}#1}
\def\tod#1#2{\tp{\nabla}_{#2}{#1}}
\def\cl#1{\mathcal{#1}}
\def\sp#1#2{\frac{\partial#1}{\partial#2}}
\def\spp#1#2#3{\frac{\partial^2{#1}}{\partial{#2}\partial{#3}}}
\def\eqd{\doteq}
\def\ra{\rightarrow}
\def\lra{\longrightarrow}
\def\ovra#1{\overset{#1}{\lra}}
\def\dra{\overset{\circ}{\lra}}
\def\xeq#1{\overset{#1}{=}}
\def\ov#1{\overline{#1}}
\def\dotp#1#2{\left\langle#1,#2\right\rangle}
\def\th#1{\ov{#1}^{\intercal}}
\def\rv#1{\widetilde{#1}}
\def\vars#1#2{\mathtt{var}_{#1}{\left[#2\right]}}
\def\pmodd#1{\kernn{-1mm}\pmod{#1}}
\def\pdt#1#2#3{\frac{\partial^2 #1}{\partial #2\partial #3}}
\def\diag#1{\mathtt{diag}\left[#1\right]}
\def\rank#1{\mathtt{rank}\left[#1\right]}
\def\tr#1{\mathtt{tr}\left[#1\right]}
\def\span#1{\mathtt{span}\left[#1\right]}
\def\var#1{\mathtt{var}\left[#1\right]}
\def\mbm#1{\mathbf{#1}}