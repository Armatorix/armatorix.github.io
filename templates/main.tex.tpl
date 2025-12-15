\documentclass[10pt,a4paper,ragged2e,withhyper]{altacv}

\geometry{left=1cm,right=1cm,top=1cm,bottom=1cm,columnsep=0.5cm}
\usepackage{paracol}

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
\renewcommand{\cvsectionfont}{\LARGE\rmfamily\bfseries}
\renewcommand{\cvsubsectionfont}{\large\bfseries}
\renewcommand{\cvItemMarker}{ {\small\textbullet} }
\renewcommand{\cvRatingMarker}{\faCircle}

\input{pubs-num.tex}
\addbibresource{sample.bib}

\begin{document}
\name{ {{- .Personal.Name -}} }
\tagline{ {{- .Personal.Title -}} }
\photoR{2.8cm}{me}

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
  {{- range .Social}}{{if eq .Name "X"}}
  \twitter{ {{- .Username -}} }
  {{- end}}{{end}}
  {{- range .Social}}{{if eq .Name "StackOverflow"}}
  \printinfo{\faStackOverflow}{ {{- .Title -}} }[{{.URL}}]
  {{- end}}{{end}}
  {{- range .Social}}{{if eq .Name "HackerRank"}}
  \printinfo{\faCode}{ {{- .Title -}} }[{{.URL}}]
  {{- end}}{{end}}
  {{- range .Social}}{{if eq .Name "Codewars"}}
  \printinfo{\faCode}{ {{- .Title -}} }[{{.URL}}]
  {{- end}}{{end}}
  {{- range .Social}}{{if eq .Name "Thingiverse"}}
  \printinfo{\faCube}{ {{- .Title -}} }[{{.URL}}]
  {{- end}}{{end}}
}

\makecvheader

\columnratio{0.6}

\begin{paracol}{2}
\cvsection{Experience}
{{- range $i, $exp := .Experience}}
\cvevent{ {{- $exp.Position -}} }{ {{- $exp.Company -}} }{ {{- $exp.Period -}} }{ {{- $exp.Location -}} }
{{- if $exp.Projects}}
{{- range $exp.Projects}}
{{- if .Name}}
\textbf{ {{- .Name -}} }
{{- if .Technologies}} -- \textit{ {{- join .Technologies ", " -}} }{{end}}
{{- end}}
\begin{itemize}
{{- range .Responsibilities}}
\item {{.}}
{{- end}}
\end{itemize}
{{- end}}
{{- end}}
{{- if ne $i (sub (len $.Experience) 1)}}

\divider
{{- end}}
{{- end}}

\switchcolumn

\cvsection{Summary}
\raggedright
{{newlineSentences .Summary.Description}}

\cvsection{Education}
{{- range $i, $edu := .Education}}
\cvevent{ {{- $edu.Degree -}} }{ {{- $edu.Institution -}} }{ {{- $edu.Period -}} }{}
{{- if $edu.Thesis}}
\begin{itemize}
\item Thesis: {{$edu.Thesis.Topic}}
\end{itemize}
{{- end}}
{{- if ne $i (sub (len $.Education) 1)}}

\divider
{{- end}}
{{- end}}


\cvsubsection{Cloud \& DevOps}
\cvtag{AWS}
\cvtag{GCP}
\cvtag{Docker}
\cvtag{Kubernetes}
\cvtag{Terraform}
\cvtag{Ansible}
\cvtag{Chef}

\medskip

\cvsubsection{Databases}
\cvtag{Scylla}
\cvtag{MySQL}
\cvtag{PostgreSQL}
\cvtag{MongoDB}
\cvtag{Elasticsearch}

\medskip

\cvsubsection{Tools}
\cvtag{DataDog}
\cvtag{Prometheus}
\cvtag{Grafana}
\cvtag{Docker Swarm}

\cvsection{Languages}
{{- range .Languages}}
{{.Name}}: {{.Level}}\\
{{- end}}

\cvsection{Interests}
{{- range .Interests}}
\cvtag{ {{- .Name -}} }
{{- end}}

\end{paracol}

\cvsection{Projects}
{{- range $i, $proj := .Projects}}
{{- if lt $i 6}}
\textbf{ {{- $proj.Title -}} }{{- if $proj.Technologies.Languages}} -- \textit{ {{- join $proj.Technologies.Languages ", " -}} }{{end}}

{{$proj.Content}}
{{- if ne $i 5}}

\medskip
{{- end}}
{{- end}}
{{- end}}

\medskip

\vfill

{\footnotesize {{.Consent}}}

\end{document}
