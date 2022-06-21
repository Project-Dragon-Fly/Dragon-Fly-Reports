\ProvidesClass{reportFormat}[beta]

\LoadClass[12pt,letterpaper]{article} % Font size and paper type
\pagestyle{empty} % Suppress page numbers
\usepackage[a4paper]{geometry}
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage[utf8]{inputenc}
\usepackage{forloop}
\usepackage{setspace}
\usepackage{pgffor}
\usepackage{float}
\usepackage{fullpage}
\usepackage{hyperref}
\hypersetup{
	colorlinks=true, %set true if you want colored links
	linktoc=all,     %set to all if you want both sections and subsections linked
	linkcolor=black,  %choose some color if you want links to stand out
    urlcolor=black
}


%----------------------------------------------------------------------------------------
%	Variable names
%----------------------------------------------------------------------------------------

\def \projectName#1{\def\@nameOfProject{#1}}
\def \@nameOfProject {}

\def \guideName#1{\def\@nameOfGuide{#1}}
\def \@nameOfGuide {}

\newcommand{\setTimePeriod}[2]{
	\def\@startPeriod{#1} 
	\def\@endPeriod{#2}
}

\def \@startPeriod {} 
\def \@endPeriod {}

\newcounter{membercnt}
\newcommand{\addGrpMember}[2]{%
	\stepcounter{membercnt}%
	\expandafter\def\csname @memname[\themembercnt]\endcsname{#1}
	\expandafter\def\csname @memroll[\themembercnt]\endcsname{#2}
}

\newcounter{rr}
\def\xwhilenum #1\do{\@whilesw{\ifnum #1}\fi }


\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

%----------------------------------------------------------------------------------------
%	PRINT THE INFO TABLE
%----------------------------------------------------------------------------------------

\let \ori@document=\document
\renewcommand{\document}
{	\ori@document  % Begin document
	\renewcommand{\arraystretch}{1.25}
	\setstretch{1.50}
	\begin{center}
		\textbf{\Large \@nameOfProject} \\
		Project Report \\
		\@startPeriod \space - \@endPeriod \\
		Supervisor : \space \@nameOfGuide
	\end{center}
	\begin{table}[!ht]
		\centering
		\begin{tabular}{|P{0.47\textwidth} P{0.47\textwidth}|}
			\hline
			\multicolumn{2}{|c|}{Group Members} \\ \hline
			\setcounter{rr}{0}%
			\xwhilenum{\themembercnt>\value{rr}}\do {%
				\stepcounter{rr}%
				\csname @memname[\therr]\endcsname \space (\csname @memroll[\therr]\endcsname )& 
				\stepcounter{rr}%
				\csname @memname[\therr]\endcsname \space (\csname @memroll[\therr]\endcsname ) \\ \hline  
			}
		\end{tabular}
	\end{table}
	\renewcommand{\arraystretch}{1}
	\setstretch{1.25}
}