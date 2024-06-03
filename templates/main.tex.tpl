\documentclass[a4paper]{article}

\usepackage{latexsym}
\usepackage[empty]{fullpage}    
\usepackage{titlesec}
\usepackage{marvosym}
\usepackage[usenames,dvipsnames]{color}
\usepackage{verbatim}
\usepackage{enumitem}
\usepackage[pdftex]{hyperref}
\usepackage{fancyhdr}
\usepackage{fontawesome}
\usepackage[utf8]{inputenc}
\usepackage[left=2cm, right=4.25cm, top=3cm]{geometry}
\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Adjust margins
\addtolength{\oddsidemargin}{-0in}
\addtolength{\evensidemargin}{0in}
\addtolength{\textwidth}{1in}
\addtolength{\topmargin}{0in}
\addtolength{\textheight}{0in}

\urlstyle{same}


% Sections formatting
\titleformat{\section}{
  \vspace{-4pt}\scshape\raggedright\large
}{}{0em}{}[\color{black}\titlerule \vspace{-4pt}]

%-------------------------
% Custom commands
\newcommand{\resumeItem}[2]{
  \item\small{
    \textbf{#1}{: #2 \vspace{-2pt}}
  }
}

\newcommand{\resumeSubheading}[4]{
  \vspace{-1pt}\item
    \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
      \textbf{#1} & #2 \\
      \textit{\small#3} & \textit{\small #4} \\
    \end{tabular*}
}

\newcommand{\resumeSubItem}[2]{\resumeItem{#1}{#2}\vspace{-4pt}}

\renewcommand{\labelitemii}{$\circ$}

\newcommand{\resumeSubHeadingListStart}{\begin{itemize}[leftmargin=*]}
\newcommand{\resumeSubHeadingListEnd}{\end{itemize}}
\newcommand{\resumeItemListStart}{\begin{itemize}}
\newcommand{\resumeItemListEnd}{\end{itemize}\vspace{-5pt}}

%-------------------------------------------
%%%%%%  CV STARTS HERE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%


\begin{document}

%----------HEADING-----------------
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
  \textbf{\LARGE Wojciech Sokołowski} & \href{mailto:sokolwojtek1@gmail.com}{sokolwojtek1@gmail.com}\\
  & \faMobile\hspace{.16667em}+48 725 205 367 \\ 
  & armatorix @ 
   \href{https://gophers.slack.com/}{Gophers \faSlack}
   \href{https://github.com/Armatorix}{\faGithub}
   \href{https://www.linkedin.com/in/Armatorix}{\faLinkedin} \\
  & \href{https://me.wsokol.dev/}{me.wsokol.dev}
  
  
\end{tabular*}


%-----------EXPERIENCE-----------------
\section{Experience}

% 
% Rift
% 
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
\\
\end{tabular*}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \textbf{rift} & Remote \\
    \subitem Senior Backend Engineer &  Mar. 2023 - now \\ \\
    \subitem \textbf{Scheduling} & \textit{Go, React} \\
    \subitem Providing platform core - scheduling algorithm \\
    \subitem Working as full-stack: frontend, backend and ops \\
    \subitem \textbf{Platform} & \textit{Go, React} \\
    \subitem Providing limits-friendly integrations with Hubspot/Salesforce/Zapier \\
    \subitem Provide app deployment in GKE cluster \\
    \subitem Setup Caddy as custom loadbalancer \\

\end{tabular*}


% 
% Smallpdf
% 
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
\\
\end{tabular*}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \textbf{Smallpdf} & Remote \\
    \subitem Senior Backend Engineer &  Feb. 2022 - Mar. 2023 \\ \\
    \subitem \textbf{eSign tool} & \textit{Go} \\
    \subitem Introducing Golang best practices \\
    \subitem Providing eventsourcing based service \\
    \subitem Introducing Datadog tracing and service monitoring \\
\end{tabular*}

% 
% IQVIA
% 
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
\\
\end{tabular*}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \textbf{IQVIA} & Remote \\
    \subitem Software Developer &  Jun. 2021 - Jul. 2021 \\ \\
    \subitem \textbf{NDA} & \textit{Go} \\
    \subitem Fixing golang repositories \\
    \subitem Adding coding standards with golangci-lint in gitlab pipelines \\
    \subitem Working on elasticsearch based service \\
    \subitem Doing security upgrades \\
    \subitem Introducing application monitoring \\
\end{tabular*}

% 
% Nomtek
% 
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
\\
\end{tabular*}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \textbf{Nomtek} & Remote/Wrocław, Poland \\
    \subitem Software Developer &  Oct. 2019 - Jun. 2021 \\ \\
    \subitem \textbf{NDA} & \textit{Go, Java, Python}\\
    \subitem Develop \textbf{Golang}: REST APIs, data processors, job scripts, mobile push service & \textit{Bash, Chef, Terraform}\\
    \subitem Develop  \textbf{Java}: data importer, REST APIs  \\
    \subitem Develop  \textbf{Python}: data logs analyzer/processor based on Datadog API \\
    \subitem Using \textbf{AWS services}: Lambda, EC2 boxes, Fargate, Batch, SNS, SQS, S3 & \textit{AWS}\\
    \subitem Integrating login with Apple in Golang service \\
    \subitem Maintain Scylla cluster & \textit{Scylla, MySQL}\\
    \subitem Improve monitoring (tracing, logging, metrics, alerts) & \textit{DataDog}\\
    \subitem Maintain stack with \textbf{Chef} and infrastracture with \textbf{Terraform} \\
    \subitem Improve database indexes and queries with performance upgrades of 4x\\
    \subitem Provide on-call service \\
    \subitem Work in multi-timezone/multicultural environment\\
\end{tabular*}

%  
% OPERA
% 

\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
\\
\end{tabular*}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \textbf{Opera Software AS} & Remote/Wrocław, Poland \\
    \subitem Software Developer &  Jun. 2018 - Oct. 2019 \\ \\
    \subitem \textbf{\href{https://www.opera.com/computer/features/free-vpn}{VPN}} & \textit{Go, Python}\\
    \subitem Develop \textbf{Golang}: security and performance patches to VPN, caching library \\
    \subitem Develop \textbf{Python}: deployment tools \\
    \subitem Investigating security/performance/networking incidents & \textit{Docker, Ansible}\\
    \subitem Doing system and cluster upgrades with service 0-downtime & \textit{Docker Swarm} \\
    \subitem Data analyzing and improving Linux system/network performance \\
    \subitem Maintain Docker swarm cluster \\ \\
   \subitem \textbf{Monitoring and alerting system} & \textit{Bash}\\
    \subitem Bootstrap Prometheus based alert system for company services & \textit{Docker, Ansible}\\
    \subitem Providing CI/CD gitlab integration for deployment in multiple enviroments & \textit{Grafana}  \\
    \subitem Integrating monitoring with company services & \textit{Prometheus, Alertmanager} \\
    \subitem Tutoring other employees on alert creations 
\end{tabular*}
% 
% IMPEL
% 
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
\\
\end{tabular*}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \textbf{Intel Corporation} & Gdańsk, Poland\\
    \subitem Software Developer Intern in Cloud Computing & Jul. 2017 - Sep. 2017\\ \\
    \subitem \textbf{Dmidecode plugin} & \textit{Go}\\
    \subitem Develop \textbf{Golang}: dmidecode plugin based on \href{https://linux.die.net/man/8/dmidecode}{dmidecode} tool \\ \\
    \subitem \textbf{Snap metric catalog} & \textit{Python} \\
    \subitem Develop \textbf{Python}: Github repos parser and data processor \\
    \subitem Leading a 3-person project & \textit{Docker}\\ \\
    \subitem \textbf{\href{https://github.com/intelsdi-x/snap}{Snap Telemetry}} & \textit{Python, Go, Bash}\\
    \subitem Develop \textbf{Golang}: integration and unit tests, patching bugs & \textit{Docker}\\
    \subitem Testing plugins on various Linux distributions\\
\\
\end{tabular*}
 
\pagebreak
%-----------PROJECTS-----------------
\section{Projects}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}

    \textbf{\href{https://ai-mma.dev/}{AI MMA}} & \textit{React,Go} \\
      \subitem Service with ML predictions for MMA fights & \textit{Fly.io}\\ \\

    \textbf{\href{https://smallpaf.wsokol.dev/}{SmallPAF (Planning Async Format)}} & \textit{React,Go} \\
      \subitem Tool for async ticket estimations & \textit{Fly.io}\\ \\

      
    \textbf{\href{https://github.com/Armatorix/hearing}{Hearing app}} & \textit{React} \\
      \subitem Simple tool that helps verify frequency range of hearing & \textit{Fly.io}\\ \\

    \textbf{Chess.com updater} & \textit{HTML,jQuery} \\
      \subitem Simple service with users live stats for OBS usage & \textit{Heroku}\\ \\

    \textbf{\href{http://wagapp.pl/}{Wagapp}} & \textit{React, Go}\\
      \subitem Web app for car weight & \textit{PostgresDB}\\
      \subitem Project hosted on Cloud Run & \textit{Docker compose}\\
      \subitem Simple CRUD, integrated with przelewy24.pl and Auth0 & \textit{GCP}\\ \\

    \textbf{\href{https://github.com/Armatorix/WeatherSystem}{Temperature monitoring system}} & \textit{C}\\
      \subitem Wireless temperature monitoring with Raspberry Pi and ESP8266+BME280 & \textit{Prometheus, Grafana}\\
      \subitem Prometheus with Pushgateway as main services & \textit{Docker compose, Ansible} \\ \\
     
      
    \textbf{Simple imperative language compilers} & \textit{C}, \textit{Flex},  \textit{Bison}\\
      \subitem University project of compiler that generates machine code \\
      \subitem First that I created was 4$^{th}$ in terms of performance on the yearbook \\
      \subitem Wrote already 4 of them for different specifications\\ \\

      
\end{tabular*}

\newpage

\section{Languages}
  \resumeSubHeadingListStart
    \resumeSubItem{English}{intermediate}
    
    \resumeSubItem{Polish}{native}
     
  \resumeSubHeadingListEnd

%-----------EDUCATION-----------------
\section{Education}
\begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \textbf{Wrocław University of Science and Technology} & 2014 -- 2018\\
      \subitem Bachelor of Engineering in Computer Science & \\
      \subitem Faculty of Fundamental Problems of Technology & \\
      \subitem Thesis topic: \textit{Position Based Messenger} & \textit{Java, NodeJS, Express, MongoDB}\\

\end{tabular*}


\section{Summary}

Favourite languages: \textit{C, Golang, Prolog, Python} (in descending order).
Used to program almost everything in \textit{C} while studying.
Daily using VS Code + Windows (WSL2), previously Ubuntu user (14.04-20.04).
Love to have consistency across stacks and up-to-date systems.
In free time playing
\href{https://www.chess.com/member/armatorix}{Chess}
solving algorithm problems on Codeforces (previously \href{https://www.codewars.com/users/Armatorix}{Codewars} and \href{https://www.hackerrank.com/sokolwojtek1/hackos}{Hackerrank}).

\vspace{7mm}
\small\centering{I hereby give consent for my personal data included in my application to be processed for the purposes of the recruitment process under the Personal Data Protection Act as of 29 August 1997, consolidated text: Journal of Laws 2016, item 922 as amended.}
\end{document}
