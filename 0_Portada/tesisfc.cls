%%
%% This is file `tesisfc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tesisfc.dtx  (with options: `class')
%%
%%  This program is provided under the terms of the
%%  LaTeX Project Public License distributed from CTAN
%%  archives in directory macros/latex/base/lppl.txt.
%%
%% Author: Pablo Rosell (FC-UNAM)
%%         now at: pablo@ciencias.unam.mx
%%
%% New revision: Ricardo Rios (FC-UNAM)

\NeedsTeXFormat{LaTeX2e}
\def\fileversion{v.2.0}\def\filedate{2007/05/11}
\ProvidesClass{tesisfc}[\filedate\space\fileversion\space%
Diseno para tesis de licenciatura de la Facultad de Ciencias UNAM]%%

\LoadClass{book}
% CROP se deshabilita temporalmente hasta predefinir el tamaño
% de la hoja en la tesis
%\RequirePackage[letter,center]{crop}  % Efectos de cámara
\RequirePackage{geometry}             % Tamaño de hoja
\RequirePackage{fancyhdr}             % Encabezados y Pies
\RequirePackage{graphicx}             % Imágenes
\RequirePackage{ifpdf}                % Salida a PDF

\newcommand{\fuenteenc}[1]{\def\lamifuente{#1}}
\newcommand{\numenc}[1]{\def\laminum{#1}}
\fuenteenc{\small\scshape}     % Versales pequeñas
\numenc{\small}                % Pequeño
\newdimen\plecaenc
\plecaenc=0pt

% Para el texto del paquete CROP
%\newcommand{\infofont}[1]{\textsf{\footnotesize#1}}

\newcommand{\capfont}[1]{\def\lacapfont{#1}}
\newcommand{\captitfont}[1]{\def\lacaptitfont{#1}}
\newcommand{\secfont}[1]{\def\lasecfont{#1}}
\newcommand{\subsecfont}[1]{\def\lasubsecfont{#1}}
\capfont{\Large}               % Largo
\captitfont{\Large\bfseries}   % Largo, negritas
\secfont{\large\bfseries}      % largo, negritas
\subsecfont{\bfseries}         % Negritas

\newif\if@portada
\@portadafalse

\newcommand{\p@rtada}
  {\AtBeginDocument{\if@portada%
    \IfFileExists{portada.tex}
      {\frontmatter\input{portada}}
    {}\else\fi} % Insertar código de error
  }

%* -FINAL-
%* Asigna tamaño de hoja (para CROP)
%* Genera portada
%* Ajusta el tamaño de la hoja en PDF

%**
%** Crear opciones para tamaño de hoja
%** ej. oldthesissize

\DeclareOption{final}{%
%  \geometry{papersize={17cm,23cm},body={11.5cm,17cm},
%    left=66pt,top=2cm,offset={2cm,2.5cm}}
  \geometry{papersize={21.59cm,27.94cm},body={12.5cm,20cm},left=2.7cm,top=3.5cm}
  \@portadatrue\p@rtada%
  \ifpdf
    \AtBeginDocument{%
      \pdfpagewidth=21.59cm
      \pdfpageheight=27.94cm}
  \fi
}

\def\correccion{\renewcommand{\baselinestretch}{1.5}}

%* -BORRRADOR-
%* Mayor espacio en la hoja
%* Aumenta espacio entre líneas (1.5)
\DeclareOption{borrador}{%
  \geometry{papersize={8.5in,11in},body={5.5in,8in},
    left=1.5in,top=1.3in,twosideshift=0pt,offset={0pt,0pt}}%
%  \crop[off]%
  \setlength{\headwidth}{\textwidth}
  \addtolength{\headsep}{5mm}
  \@portadafalse\correccion%
  \AtBeginDocument{\frontmatter}
}

\newif\if@two
\DeclareOption{oneside}{\@twofalse\geometry{asymmetric}}
\DeclareOption{twoside}{\@twotrue\geometry{twoside}}
%\DeclareOption{cam}{\crop[cam]
%  \crop[font=infofont]}
%\DeclareOption{frame}{\crop[frame]
%  \crop[font=infofont]}
%\DeclareOption{nocrop}{\crop[off]}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Encabezados: El capítulo en las pares y la sección en las impares
%% alineados a los márgenes interiores.

\DeclareOption{capsec}{
  \AtBeginDocument{%
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
  \renewcommand{\sectionmark}[1]{\ifnum\c@section>0\markright{#1}\fi}
  \fancyhf{}%
  \if@two%
  \fancyhead[RE]{\lamifuente%
    \if@mainmatter\thechapter.\enspace\else\fi\nouppercase{\leftmark}}
  \fancyhead[LO]{\lamifuente%
    \if@mainmatter\ifnum\c@section<1
    \thechapter\else\thesection\fi.\enspace\else\fi\nouppercase{\rightmark}}
  \fancyhead[RO,LE]{\laminum \thepage}
  \else
  \fancyhead[LO,LE]{\lamifuente%
    \ifnum\c@chapter>0
    \thechapter.\enspace\fi
  \nouppercase{\leftmark}}
  \fancyhead[RO,RE]{\laminum \thepage}
  \fi
  \renewcommand{\headrulewidth}{\plecaenc}
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Encabezados: El capítulo en las pares y la sección en las impares,
%% centrados a la amsbook

\DeclareOption{amscapsec}{
  \AtBeginDocument{%
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
  \renewcommand{\sectionmark}[1]{\ifnum\c@section>0\markright{#1}\fi}
  \fancyhf{}%
  \if@two%
  \fancyhead[CE]{\lamifuente%
    \if@mainmatter\thechapter.\enspace\else\fi\nouppercase{\leftmark}}
  \fancyhead[CO]{\lamifuente%
    \if@mainmatter\ifnum\c@section<1
    \thechapter\else\thesection\fi.\enspace\else\fi\nouppercase{\rightmark}}
  \fancyhead[RO,LE]{\laminum \thepage}
  \else
  \fancyhead[CO,CE]{\lamifuente%
    \ifnum\c@chapter>0
    \thechapter.\enspace\fi\nouppercase{\leftmark}}
  \fancyhead[RO,RE]{\laminum \thepage}
  \fi
  \renewcommand{\headrulewidth}{\plecaenc}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Encabezados: El título de la tesis en las impares y los capítulos
%% en las pares

\DeclareOption{titcap}{
  \AtBeginDocument{
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{#1}{\eltitulo}}
  \renewcommand{\sectionmark}[1]{\markright{\eltitulo}}
  \fancyhf{}%
  \if@two
  \fancyhead[RE]{\lamifuente%
    \enspace\nouppercase{\rightmark}}
  \fancyhead[LO]{\lamifuente%
    \ifnum\c@chapter>0
    \thechapter.\enspace\fi\nouppercase{\leftmark}}
  \fancyhead[RO,LE]{\laminum \thepage}
  \else
  \fancyhead[LO,LE]{\lamifuente%
    \ifnum\c@chapter>0
    \thechapter.\enspace\fi\nouppercase{\leftmark}}
  \fancyhead[RO,RE]{\laminum \thepage}
  \fi
  \renewcommand{\headrulewidth}{\plecaenc}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Encabezados: Sólo el título de la tesis

\DeclareOption{solotit}{
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{\eltitulo}{\eltitulo}}
  \renewcommand{\sectionmark}[1]{\markright{\eltitulo}}
  \fancyhf{}%
  \if@two
    \fancyhead[RE]{\lamifuente\nouppercase{\rightmark}}
    \fancyhead[LO]{\lamifuente\nouppercase{\leftmark}}
    \fancyhead[RO,LE]{\laminum \thepage}
  \else
    \fancyhead[LO,LE]{\lamifuente\nouppercase{\leftmark}}
    \fancyhead[RO,RE]{\laminum \thepage}
  \fi
  \renewcommand{\headrulewidth}{\plecaenc}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Encabezados: Sin encabezado

\DeclareOption{sinenc}{
  \pagestyle{fancy}
  \fancyhf{}%
  \fancyfoot[CO,CE]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definiciones del estilo ``ams''. Imitación del amsbook

%\DeclareOption{ams}{%
%\if@mainmatter\else\setcounter{secnumdepth}{0}\fi
%  \def\@makechapterhead#1{%
%    \null\kern +15\p@%
%    {\parindent \z@ \centering \normalfont\lacapfont
%      \ifnum \c@secnumdepth >\m@ne
%      \if@mainmatter
%      \chaptername\quad \thechapter
%      \par\nobreak
%      \kern +15\p@
%      \else
%      \phantom{1}
%      \par\nobreak
%      \kern +15\p@
%      \fi
%      \fi
%      \interlinepenalty\@M
%      \normalfont\lacaptitfont {#1}\par\nobreak
%      \vskip 50\p@
%    }
%  }
%  \def\@schapter#1{%
%    \if@twocolumn
%    \@topnewpage[\@makeschapterhead{#1}]%
%    \else
%    \@makeschapterhead{#1}%
%    \fi}
%  \def\@makeschapterhead#1{%
%    \null\kern +15\p@%
%    {\parindent \z@ \centering \normalfont
%      \phantom{1}
%      \par\nobreak
%      \kern +15\p@
%      \normalfont\lacaptitfont {#1}\par\nobreak
%      \vskip 50\p@
%      \interlinepenalty\@M
%    }}
%  \renewcommand\section{\@startsection {section}{1}
%    {\ifnum\c@chapter<1
%      -1em\else\z@\fi}%
%    {-3.5ex \@plus -1ex \@minus -.2ex}
%    {2.3ex \@plus.2ex}
%    {\normalfont\lasecfont\centering}}
%  \renewcommand\subsection{\@startsection{subsection}{2}
%    {\ifnum\c@chapter<1
%      -1em\else\z@\fi}%
%    {-3.25ex\@plus -1ex \@minus -.2ex}%
%    {-1em}%
%    {\normalfont\lasubsecfont}}
%  \renewcommand{\thesection}{\ifnum\c@chapter<1{}%
%    \else\thechapter.\arabic{section}\fi}
%  \renewcommand{\thesubsection}{\ifnum\c@chapter<1{}%
%    \else\thesection.\arabic{subsection}\fi}
%  \capfont{\Large}
%  \captitfont{\Large\scshape}
%  \secfont{\large\scshape}
%  \subsecfont{\scshape}
%  \renewcommand\appendix{\par      %% Apéndices
%    \setcounter{chapter}{0}%
%    \setcounter{section}{0}%
%    \gdef\@chapapp{\appendixname}%
%    \gdef\thechapter{\@Alph\c@chapter}}
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definiciones del estilo ``temfis'' aka Temas de Física

%\DeclareOption{temfis}{%
%  \capfont{\Large\scshape}
%  \captitfont{\LARGE\scshape}
%  \secfont{\Large\scshape}
%  \subsecfont{\scshape}
%  \def\@makechapterhead#1{%
%    \null\kern +15\p@%
%    {\parindent \z@ \raggedright \normalfont\lacapfont
%      \ifnum \c@secnumdepth >\m@ne
%      \if@mainmatter
%      \chaptername\quad\thechapter
%      \par\nobreak
%      \kern +15\p@
%      \else
%      \lacapfont \phantom{1}
%      \par\nobreak
%      \kern +15\p@
%      \fi
%      \fi
%      \interlinepenalty\@M
%      \normalfont\lacaptitfont{#1}\par\nobreak
%      \vskip 50\p@
%    }
%  }
%  \def\@schapter#1{%
%    \if@twocolumn
%    \@topnewpage[\@makeschapterhead{#1}]%
%    \else
%    \@makeschapterhead{#1}%
%    \fi}
%  \def\@makeschapterhead#1{%
%    \null\kern +15\p@%
%    {\parindent \z@ \raggedright \normalfont
%      \lacapfont \phantom{1}
%      \par\nobreak
%      \kern +15\p@
%      \normalfont\lacaptitfont {#1}\par\nobreak
%      \vskip 50\p@
%      \interlinepenalty\@M
%    }}
%  \renewcommand\section{\@startsection {section}{1}{\z@}%
%    {-3.5ex \@plus -1ex \@minus -.2ex}
%    {2.3ex \@plus.2ex}
%    {\normalfont\lasecfont}}
%  \renewcommand\subsection{\@startsection{subsection}{2}{-1em}%
%    {-3.25ex\@plus -1ex \@minus -.2ex}%
%    {1.5ex \@plus .2ex}%
%    {\normalfont\lasubsecfont}}
%  \renewcommand\appendix{\par      %% Apéndices
%    \setcounter{chapter}{0}%
%    \setcounter{section}{0}%
%    \gdef\@chapapp{\appendixname}%
%    \gdef\thechapter{\@Alph\c@chapter}}
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definiciones del estilo ``nuevo''

%\DeclareOption{nuevo}{
%  \capfont{\Large\scshape}
%  \captitfont{\LARGE\scshape}
%  \secfont{\Large\scshape}
%  \subsecfont{\scshape}
%  \def\@makechapterhead#1{%
%    \null\kern +15\p@%
%    {\parindent \z@ \raggedleft \normalfont\lacapfont
%      \ifnum \c@secnumdepth >\m@ne
%        \if@mainmatter
%          \chaptername\quad\thechapter
%          \par\nobreak
%          \kern +15\p@
%        \else
%          \lacapfont \phantom{Cap\'{\i}tulo 1} %--'
%          \par\nobreak
%          \kern +15\p@
%        \fi
%      \fi
%      \interlinepenalty\@M
%      \normalfont\lacaptitfont {#1}\par\nobreak
%      \vskip 50\p@
%    }
%  }
%  \def\@schapter#1{%
%    \if@twocolumn
%      \@topnewpage[\@makeschapterhead{#1}]%
%    \else
%      \@makeschapterhead{#1}%
%    \fi}
%  \def\@makeschapterhead#1{%
%    \null\kern +15\p@%
%    {\parindent \z@ \raggedleft \normalfont
%      \lacapfont \phantom{1}
%      \par\nobreak
%      \kern +21\p@
%      \normalfont\lacaptitfont {#1}\par\nobreak
%      \vskip 50\p@
%    }}
%  \renewcommand\section{\@startsection {section}{1}{\z@}%
%    {-3.5ex \@plus -1ex \@minus -.2ex}
%    {2.3ex \@plus.2ex}
%    {\normalfont\lasecfont}}
%  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
%    {-3.25ex\@plus -1ex \@minus -.2ex}%
%    {1.5ex \@plus .2ex}%
%    {\normalfont\lasubsecfont}}
%  \renewcommand\appendix{\par     %% Apéndices
%    \setcounter{chapter}{0}%
%    \setcounter{section}{0}%
%    \gdef\@chapapp{\appendixname}%
%    \gdef\thechapter{\@Alph\c@chapter}}
%}

%****---------------------------------------------comm.by.RRP

\ExecuteOptions{twoside,final} %{cam,twoside,final}
\ProcessOptions

%% Ajusta la tabla de contenido a una columna cuando se ha indicado
%% que se usarán dos columnas
%\renewcommand\tableofcontents{%
%  \if@twocolumn \@restonecoltrue\onecolumn
%  \else \@restonecolfalse
%  \fi
%  \chapter*{\contentsname}
%  \@mkboth{\contentsname}{\contentsname}%
%  \@starttoc{toc}%
%  \if@restonecol\twocolumn\fi
%}

\renewenvironment{thebibliography}[1]
 {\chapter*{\bibname}
  \@mkboth{\bibname}{\bibname}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
 {\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}} %--'
  \endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Para asegurar que no ponga encabezados en las páginas blancas al
%% final de los capítulos que terminan en página impar.

\def\cleardoublepage{\clearpage
\if@twoside
  \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi
  \fi
\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Redefiniciones de nombre de titulares

\renewcommand{\contentsname}{Contenido}
\renewcommand{\bibname}{Bibliograf\'{\i}a} %--'
\renewcommand{\indexname}{\'Indice} %--'
\renewcommand{\figurename}{Figura}
\renewcommand{\tablename}{Tabla}
\renewcommand{\chaptername}{Cap\'{\i}tulo} %--'
\renewcommand{\appendixname}{Ap\'endice} %--'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comandos para la portada

\newcommand{\titulo}[1]{\def\eltitulo{#1}}
%* lacarrera corresponde al título otorgado -Matemático-
%* NO AL NOMBRE DE LA CARRERA -Matemáticas- --RRP
\newcommand{\carrera}[1]{\def\lacarrera{#1}}
\newcommand{\nombre}[1]{\def\elnombre{#1}}    %* Del alumno
\newcommand{\asesor}[1]{\def\elasesor{#1}}  %* De tesis
\newcommand{\fecha}[1]{\def\lafecha{#1}}

%******************************************************
%% Comandos para la hoja de firmas                  RRP

%* Se usa \titulo de los comandos para la portada
%* Se usa \nombre de los comandos para la portada
%* Se usa \director de los comandos para la portada

%* Número de cuenta
\newcommand{\alumnocta}[1]{\def\elalumnocta{#1}}
%* Jefe(a) de la División de Estudios Profesionales
\newcommand{\jefeDEP}[1]{\def\eljefeDEP{#1}}
%* Nombre de la carrera
\newcommand{\nomcarrera}[1]{\def\elnomcarrera{#1}}
%* Sinodal propietario A
\newcommand{\presidente}[1]{\def\elpresidente{#1}}
%* Sinodal suplente A
\newcommand{\suplentea}[1]{\def\elsuplentea{#1}}
%* Sinodal propietario B
\newcommand{\secretario}[1]{\def\elsecretario{#1}}
%* Sinodal suplente B
\newcommand{\suplenteb}[1]{\def\elsuplenteb{#1}}
%* Jefe(a) del Consejo Departamental de la carrera
\newcommand{\jefeCD}[1]{\def\eljefeCD{#1}}

%* Valores predefinidos para la portada
%* y hoja de firmas.

\titulo{El T\'{\i}tulo}  %--'
\carrera{La Carrera}
\nombre{El Nombre del Alumno}
\asesor{El Asesor de T\'esis}  %--'
\fecha{La fecha}

\alumnocta{99999999-9}
\jefeDEP{El Jefe(a) de la Divisi\'on de Estudios Profesionales}  %--'
\nomcarrera{El Nombre de la Carrera}
\presidente{El Presidente}
\suplentea{El Suplente A}
\secretario{El Secretario}
\suplenteb{El Suplente B}
\jefeCD{El Jefe(a) del Consejo Departamental de \lacarrera}

%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%

\endinput

%%
%% End of file `tesisfc.cls'.
