\ProvidesClass{diaryformat}[beta]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type
\pagestyle{empty} % Suppress page numbers
\usepackage[a4paper, total={6in, 10in}]{geometry}
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage[utf8]{inputenc}
\usepackage{forloop}
\usepackage{setspace}
\usepackage{pgffor}
\usepackage{float}


%----------------------------------------------------------------------------------------
%	Variable names
%----------------------------------------------------------------------------------------

\def \projectName#1{\def\@nameOfProject{#1}}
\def \@nameOfProject {}

\def \guideName#1{\def\@nameOfGuide{#1}}
\def \@nameOfGuide {}

\newcounter{membercnt}
\newcommand{\addGrpMember}[2]{%
  \stepcounter{membercnt}%
  \expandafter\def\csname @memname[\themembercnt]\endcsname{#1}
  \expandafter\def\csname @memroll[\themembercnt]\endcsname{#2}
}

\newcounter{rr}
\def\xwhilenum #1\do{\@whilesw{\ifnum #1}\fi }

%----------------------------------------------------------------------------------------
%	PRINT THE INFO TABLE
%----------------------------------------------------------------------------------------

\let \ori@document=\document
\renewcommand{\document}
{	\ori@document  % Begin document
    \renewcommand{\arraystretch}{1.25}
    \begin{table}[!ht]
        \centering
        \begin{tabular}{|m{0.25\textwidth}|m{0.6916\textwidth}|}
            \hline
            \multicolumn{2}{|c|}{\textbf{Evaluation By Guide}} \\ \hline
             Project Title & \@nameOfProject \\ \hline
             Name of Supervisor & \@nameOfGuide \\ \hline
             \multicolumn{2}{|l|}{Group Members} \\ \hline
             Roll No & Name \\ \hline
             \setcounter{rr}{0}%
             \xwhilenum{\themembercnt>\value{rr}}\do {%
                \stepcounter{rr}%
                 \csname @memroll[\therr]\endcsname & \csname @memname[\therr]\endcsname \\ \hline  
             }
        \end{tabular}
    \end{table}
	\renewcommand{\arraystretch}{1}
}


%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{workDone}[2] % 2 input argument - start and end date
{	\smallskip
	\renewcommand{\arraystretch}{1.25}
    \begin{table}[H]
        \begin{tabular}{|m{0.3333\textwidth}|m{0.15\textwidth}|m{0.4296\textwidth}|}
            \hline
            \textbf{Summary of Work Done} & \textbf{Duration} & #1 to #2 \\ \hline
        \end{tabular}
        \begin{tabular}{|p{0.9703\textwidth}|}
        	\renewcommand{\arraystretch}{1}
}
{       
			\renewcommand{\arraystretch}{1.25}
	        \\ \hline
	        \multicolumn{1}{|c|}{\textbf{Supervisors Remarks}} \\ \hline
	        \\[1in]
        \end{tabular}
	    \renewcommand{\arraystretch}{2}
	    \begin{tabular}{|m{0.221\textwidth}|m{0.221\textwidth}|m{0.221\textwidth}|m{0.221\textwidth}|}
	    	\hline
	    	\textbf{Marks (10)} &  & \textbf{Signature} &  \\ \hline
	    \end{tabular}
    \end{table}
	\renewcommand{\arraystretch}{1}
}