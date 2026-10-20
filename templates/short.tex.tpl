\documentclass[9pt,a4paper,ragged2e,withhyper]{altacv}

\geometry{left=1cm,right=1cm,top=0.9cm,bottom=0.9cm,columnsep=0.6cm}
\usepackage{paracol}
% Fully ragged right margin: no hyphenation and no overfull lines.
\setlength{\RaggedRightRightskip}{0pt plus 1fil}

\iftutex
  \setmainfont{Roboto Slab}
  \setsansfont{Lato}
  \renewcommand{\familydefault}{\sfdefault}
\else
  \usepackage[rm]{roboto}
  \usepackage[defaultsans]{lato}
  \renewcommand{\familydefault}{\sfdefault}
\fi

\definecolor{SlateGrey}{HTML}{2E2E2E}
\definecolor{LightGrey}{HTML}{666666}
\definecolor{DarkPastelRed}{HTML}{450808}
\definecolor{PastelRed}{HTML}{8F0D0D}
\definecolor{GoldenEarth}{HTML}{E7D192}
\colorlet{name}{black}
\colorlet{tagline}{PastelRed}
\colorlet{heading}{DarkPastelRed}
\colorlet{headingrule}{GoldenEarth}
\colorlet{subheading}{PastelRed}
\colorlet{accent}{PastelRed}
\colorlet{emphasis}{SlateGrey}
\colorlet{body}{LightGrey}

\renewcommand{\namefont}{\Huge\rmfamily\bfseries}
\renewcommand{\personalinfofont}{\footnotesize}
\renewcommand{\cvsectionfont}{\Large\rmfamily\bfseries}
\renewcommand{\cvsubsectionfont}{\large\bfseries}
\renewcommand{\cvItemMarker}{ {\small\textbullet} }

% Compact two-line variant of \cvevent: position + period, employer + location.
\newcommand{\cvshortevent}[4]{%
  {\color{emphasis}\bfseries #1}\hfill%
  \ifstrequal{#3}{}{}{\mbox{\small\cvDateMarker~#3}}\par
  {\color{accent}\bfseries #2}\hfill%
  \ifstrequal{#4}{}{}{\mbox{\small\cvLocationMarker~#4}}\par
  \smallskip
}

% Tighter divider than altacv's: the dashed rule takes no full text line.
\renewcommand{\divider}{%
  \par\nointerlineskip\vspace{3pt}%
  \noindent\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}%
  \par\nointerlineskip\vspace{6pt}%
}

\begin{document}
\RaggedRight
\name{ {{- .Personal.Name -}} }
\tagline{ {{- .Personal.Title -}} }
\photoR{2.5cm}{me}

\personalinfo{%
  \email{ {{- .Personal.Email -}} }
  \phone{ {{- .Personal.Phone -}} }
  \location{ {{- .Personal.Location -}} }
  \homepage{ {{- .Personal.Website -}} }
  {{- range .Social}}{{if eq .Name "GitHub"}}
  \github{ {{- .Username -}} }
  {{- end}}{{end}}
  {{- range .Social}}{{if eq .Name "LinkedIn"}}
  \linkedin{ {{- .Username -}} }
  {{- end}}{{end}}
}

\makecvheader

\columnratio{0.64}

\begin{paracol}{2}
\cvsection{Experience}
{{- range $i, $exp := .Experience}}
\cvshortevent{ {{- $exp.Position -}} }{ {{- $exp.Company -}} }{ {{- $exp.Period -}} }{ {{- $exp.Location -}} }
{{- if $exp.Stack}}
{\small\textit{ {{- join $exp.Stack ", " -}} }\par}
{{- end}}
{{- if $exp.Bullets}}
\begin{itemize}
{{- range $exp.Bullets}}
\item {{if .Project}}\textbf{ {{- .Project -}} } -- {{end}}{{.Text}}
{{- end}}
\end{itemize}
{{- end}}
{{- if ne $i (sub (len $.Experience) 1)}}

\divider
{{- end}}
{{- end}}

\switchcolumn

\cvsection{Summary}
\raggedright
{{.Summary}}

\cvsection{Skills}
{{- range .Skills}}
{{- if .Items}}
\textbf{\color{emphasis} {{- .Name -}} }: {{join .Items ", "}}\par\smallskip
{{- end}}
{{- end}}

\cvsection{Education}
{{- range $i, $edu := .Education}}
\cvshortevent{ {{- $edu.Degree -}} }{ {{- $edu.Institution -}} }{ {{- $edu.Period -}} }{}
{{- if ne $i (sub (len $.Education) 1)}}

\divider
{{- end}}
{{- end}}

\cvsection{Selected projects}
{{- range $i, $proj := .Projects}}
\textbf{\color{emphasis} {{- if and $proj.URL (ne $proj.URL "#") -}} \href{ {{- $proj.URL -}} }{ {{- $proj.Title -}} } {{- else -}} {{$proj.Title}} {{- end -}} }{{- if $proj.Technologies.Languages}} -- \textit{ {{- join $proj.Technologies.Languages ", " -}} }{{end}}\\
{{$proj.Content}}
{{- if ne $i (sub (len $.Projects) 1)}}

\medskip
{{- end}}
{{- end}}

\cvsection{Languages}
{{- range .Languages}}
{{.Name}}: {{.Level}}\\
{{- end}}

\end{paracol}

\vfill

{\footnotesize {{.Consent}}}

\end{document}
