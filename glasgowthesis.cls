% =============================================================================
% Glasgow University thesis format, following as closely as possible:
% http://theses.gla.ac.uk/gettingstarted/format.html#layout
% 
% =============================================================================
\NeedsTeXFormat{LaTeX2e}
% \ProvidesClass{thesis}[%
%  2009/01/09 Colin Perkins <csp@dcs.gla.ac.uk>. %
%  2009/09/16 Modified by Tim Storer <tws@dcs.gla.ac.uk> to support non %
%   pdf modes. %
%  2009/11/12 Modified by Karen Renaud for PhD thesis %
%  2011/03 Stephen Strowes <sds@dcs.gla.ac.uk> Heavily modified to match %
%   Glasgow thesis format.%
% ]
\ProvidesClass{glasgowthesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[12pt,a4paper]{book}

\usepackage{ifpdf}
\ifpdf
\usepackage[pdftex]{graphicx}
\else
\usepackage{graphicx}
\fi

% Fonts.
% Times New Roman for the body.
\usepackage{times}
% The guidelines state Arial for the headings. Really. Helvetica is
% close enough.
\usepackage{sectsty}
\usepackage{helvet}
\allsectionsfont{\sffamily}

% Set paragraph layout.
\setlength{\parindent}{0pt}
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}

% Set line spacing to one-and-a-half.
\usepackage{setspace}
\onehalfspacing

% Page margins. The University requires A4 (210 × 297 mm), with the following
% spacings:
% Top margin: 1.8cm
% Bottom margin: 1.8cm
% Left margin: 1.5cm
% Right margin: 1.5cm
% + 2.5cm gutter, making 4.0cm on the binding edge.
% 
% side margin is 1" + whatever is set here. 1" == 2.54cm. So to
% meet the 4.0cm of margin + gutter, set side margins to 1.46cm.
% The actual width of the body text should be 15.5cm
\oddsidemargin 1.46cm
\evensidemargin 1.46cm
\textwidth 15.5cm

% Top margin is also 1". Here, I have collapsed the top margin, and
% allowed the header to consume 1cm, with 0.8cm separating the header
% from the body.

%\topmargin -2.54cm
%\headheight 1.3cm
%\headsep 0.5cm

\topmargin -0.74cm
%\headheight 1.3cm
%\headsep 0.5cm

%\textheight 26.1cm
\textheight 24.3cm


% Specify page titles for well-known sections.
\renewcommand{\contentsname}{Table of Contents}

% Specify fancy header settings.
\usepackage{fancyhdr}
\fancyhf{}          % clear default settings

\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername\ \thechapter.\ #1}}{}}
\fancyhead[RE,LO]{\slshape \leftmark}  % put chapter heading on left (odd
                                       % pages)/right (even pages)
\fancyhead[RO,LE]{\thepage}            % put page number right (odd
                                       % pages)/right (even pages)
\renewcommand{\headrulewidth}{0pt}     % no headrule

% redefine "plain" to fix page numbering on first page of chapters
\fancypagestyle{plain} {
  \fancyhf{}                          % clear default settings
  \fancyhead[R]{\thepage}             % put page number right
  \renewcommand{\headrulewidth}{0pt}  % no headrule
}


% Title page layout.
\renewcommand\maketitle{
  \begin{titlepage}%
    % This will apply only in here. It's the only way I know to affect
    % the positioning of the title without reverting to minipages.
    \topmargin 2.54cm
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote \thanks
    \begin{center}
    {
       \textsc{\Huge
        \@title
      }
    }
    \vskip 6em%
    {
      \textsc{\LARGE
        \@author
      }
    }
    \vskip 3em%
    {
      \textsc{
        Submitted in fulfilment of the requirements for the degree of\\
        \emph{Doctor of Philosophy}
      }
    }
    \vskip 3em%
    {
      \textsc{\Large
        School of Computing Science
      }

      \textsc{\large
        College of Science and Engineering \\
        University of Glasgow
      }
    }
    \vskip 5em%
%    \includegraphics[trim=0.5cm 0.7cm 0.7cm 0.7cm]{graphics/crest_cs}
%    \vskip 8em
%    \vfill
    \textsc{\@date}
    \vskip 2em%
    {
      \textsc{\small
        \copyright~\@author
      }
    }
  \end{center}
  \end{titlepage}%
  %
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}



% \newenvironment{codelisting}
% {\begin{list}{}{\setlength{\leftmargin}{1em}}\item\scriptsize\bfseries}
% {\end{list}}

% \newcommand{\note}[1]{\emph{\textbf{Scribble:} #1}}
