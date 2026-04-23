<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>{{.Personal.Name}} | {{.Personal.Title}}</title>

    <!-- Primary Meta Tags -->
    <meta name="title" content="{{.Personal.Name}} | {{.Personal.Title}}">
    <meta name="description" content="{{.Personal.Name}} - {{.Personal.Title}} based in {{.Personal.Location}}. {{.Personal.Description}}">
    <meta name="keywords" content="{{.Personal.Name}}, Armatorix, golang, go developer, software engineer, solutions engineer, cybersecurity, backend developer, distributed systems, Poland">
    <meta name="author" content="{{.Personal.Name}}">
    <meta name="robots" content="index, follow, max-image-preview:large">
    <meta name="googlebot" content="index, follow">
    <meta name="language" content="English">
    <meta name="theme-color" content="#000000">

    <!-- Canonical URL -->
    <link rel="canonical" href="https://{{.Personal.Website}}/">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://{{.Personal.Website}}/">
    <meta property="og:title" content="{{.Personal.Name}} | {{.Personal.Title}}">
    <meta property="og:description" content="{{.Personal.Name}} - {{.Personal.Title}} based in {{.Personal.Location}}. {{.Personal.Description}}">
    <meta property="og:image" content="https://{{.Personal.Website}}/assets/img/me.jpg">
    <meta property="og:image:alt" content="{{.Personal.Name}} - {{.Personal.Title}}">
    <meta property="og:image:type" content="image/jpeg">
    <meta property="og:site_name" content="{{.Personal.Name}}">
    <meta property="og:locale" content="en_US">

    <!-- Twitter -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:url" content="https://{{.Personal.Website}}/">
    <meta name="twitter:title" content="{{.Personal.Name}} | {{.Personal.Title}}">
    <meta name="twitter:description" content="{{.Personal.Name}} - {{.Personal.Title}} based in {{.Personal.Location}}. {{.Personal.Description}}">
    <meta name="twitter:image" content="https://{{.Personal.Website}}/assets/img/me.jpg">
    <meta name="twitter:image:alt" content="{{.Personal.Name}} - {{.Personal.Title}}">
    {{range .Social}}{{if eq .Name "X"}}<meta name="twitter:creator" content="@{{.Username}}">
    <meta name="twitter:site" content="@{{.Username}}">
    {{end}}{{end}}

    <!-- JSON-LD Structured Data -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "Person",
        "name": "{{.Personal.Name}}",
        "jobTitle": "{{.Personal.Title}}",
        "description": "{{.Personal.Description}}",
        "email": "mailto:{{.Personal.Email}}",
        "telephone": "{{.Personal.Phone}}",
        "url": "https://{{.Personal.Website}}/",
        "image": "https://{{.Personal.Website}}/assets/img/me.jpg",
        "address": {
            "@type": "PostalAddress",
            "addressLocality": "{{.Personal.Location}}"
        },
        "sameAs": [{{range $i, $s := .Social}}{{if $i}},{{end}}
            "{{$s.URL}}"{{end}}
        ]
    }
    </script>

    <link rel="icon" type="image/x-icon" class="js-site-favicon" href="assets/img/ico.png">

    <!-- Preconnect for external resources -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://cdnjs.cloudflare.com" crossorigin>

    <!-- Preload LCP image -->
    <link rel="preload" as="image" href="assets/img/me.jpg" fetchpriority="high">

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300;400;500;600;700&family=Share+Tech+Mono&display=swap"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

</head>

<body class="main">

    <!-- ======= Header ======= -->
    <header id="header">
        <div class="container">

            <h1><a href="index.html">{{.Personal.Name}}</a></h1>
            <h2>I'm a <span class="typed-text">{{.Personal.Title}}</span> from Poland</h2>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link active" href="">Home</a></li>
                    <li><a class="nav-link" href="#resume">Resume</a></li>
                    <li><a class="nav-link" href="./godev_wsokolowski.pdf"><i class="bi bi-file-pdf"></i>PDF</a></li>
                    <li><a class="nav-link" href="#about">About</a></li>
                    <li><a class="nav-link" href="#projects">Projects</a></li>
                    <li><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
            </nav><!-- .navbar -->
            
            <i class="bi bi-list mobile-nav-toggle"></i>

            <div class="social-links">
                {{range .Social}}
                {{if .Icon}}
                <a href="{{.URL}}" class="{{.Name | lower}}" data-placement="top" title="{{.Title}}" rel="noopener me" target="_blank"><i class="{{.Icon}}"></i></a>
                {{else if .IconImage}}
                <a href="{{.URL}}" class="{{.Name | lower}}" data-toggle="tooltip" data-placement="top" title="{{.Title}}" rel="noopener me" target="_blank"><img src="{{.IconImage}}" height="{{.IconHeight}}" alt="{{.Title}}" loading="lazy" decoding="async"{{if .IconStyle}} style="{{.IconStyle}}"{{end}}></a>
                {{end}}
                {{end}}
            </div>

        </div>
    </header><!-- End Header -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

        <!-- ======= About Me ======= -->
        <div class="about-me container">

            <div class="section-title">
                <h2>About</h2>
                <p>Learn more about me</p>
            </div>

            <div class="row">
                <div class="col-lg-4" data-aos="fade-right">
                    <img src="assets/img/me.jpg" class="img-fluid" alt="Portrait of {{.Personal.Name}}" width="2048" height="1536" fetchpriority="high" decoding="async">
                </div>
                <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
                    <h3>Problem solver / Golang developer</h3>
                    <p class="fst-italic">
                        {{.Personal.Description}}
                    </p>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul>
                                <li><i class="bi bi-chevron-right"></i> <strong>Degree:</strong> <span>Bachelor / <a
                                            href="https://lwiatko.org/o-konkursie">Taon</a></span></li>
                                <li><i class="bi bi-chevron-right"></i> <strong>Email:</strong>
                                    <span>{{.Personal.Email}}</span>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul>
                                <li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong>
                                    <span>{{.Personal.Freelance}}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <p>
                        Used to do some Math. </br>
                        Current <i class="ri-focus-3-line" style="color: #FFF;"></i>: {{.Personal.Focus}}.
                    </p>
                </div>
            </div>

        </div><!-- End About Me -->

        <!-- ======= Interests ======= -->
        <div class="interests container">

            <div class="section-title">
                <h2>Interests</h2>
            </div>

            <div class="row">
                {{range .Interests}}
                <div class="col-lg-3 col-md-4">
                    <div class="icon-box">
                        <i class="{{.Icon}}" style="color: skyblue;"></i>
                        <h3>{{.Name}}</h3>
                    </div>
                </div>
                {{end}}
            </div>

        </div><!-- End Interests -->

    </section><!-- End About Section -->

    <!-- ======= Resume Section ======= -->
    <section id="resume" class="resume">
        <div class="container">

            <div class="section-title">
                <h2>Resume</h2>
                <p>Check My Resume</p>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <h3 class="resume-title">Summary</h3>
                    <div class="resume-item pb-0">
                        <h4>{{.Personal.Name}}</h4>
                        <p><em>{{.Summary.Description}}</em></p>
                    </div>

                    <h3 class="resume-title">Education</h3>
                    {{range .Education}}
                    <div class="resume-item">
                        <h4>{{.Degree}}</h4>
                        <h5>{{.Period}}</h5>
                        <p><em>{{if .Faculty}}{{.Faculty}}, {{end}}{{.Institution}}</em></p>
                        {{if .Thesis}}
                        <p>Thesis topic: {{.Thesis.Topic}}
                            </br>
                            {{.Thesis.Description}}
                        </p>
                        {{end}}
                    </div>
                    {{end}}
                </div>

                <div class="col-lg-6">
                    <h3 class="resume-title">Professional Experience</h3>
                    {{range $ei, $exp := .Experience}}
                    <div class="resume-item">
                        <h4>{{$exp.Company}}</h4>
                        <h5>{{$exp.Period}}</h5>
                        <p><em>{{$exp.Location}}</em></p>
                        <p>
                        <dl class="list-group list-group-flush">
                            {{range $pi, $proj := $exp.Projects}}
                            <dt class="list-group-item"><a class="btn btn-success" data-bs-toggle="collapse"
                                    href="#project{{$ei}}{{$pi}}Collapse" role="button" aria-expanded="false"
                                    aria-controls="project{{$ei}}{{$pi}}Collapse">
                                    {{$proj.Name}}
                                </a>
                                <div class="collapse" id="project{{$ei}}{{$pi}}Collapse">
                                    {{if $proj.Technologies}}
                                    <p><strong>Technologies:</strong> {{range $ti, $tech := $proj.Technologies}}{{if $ti}}, {{end}}{{$tech}}{{end}}</p>
                                    {{end}}
                                    {{if $proj.Responsibilities}}
                                    <ul>
                                        {{range $proj.Responsibilities}}
                                        <li>{{.}}</li>
                                        {{end}}
                                    </ul>
                                    {{end}}
                                    {{if $proj.Tools}}
                                    <p><strong>Tools:</strong> {{range $ti, $tool := $proj.Tools}}{{if $ti}}, {{end}}{{$tool}}{{end}}</p>
                                    {{end}}
                                    {{if $proj.Databases}}
                                    <p><strong>Databases:</strong> {{range $di, $db := $proj.Databases}}{{if $di}}, {{end}}{{$db}}{{end}}</p>
                                    {{end}}
                                    {{if $proj.Cloud}}
                                    <p><strong>Cloud:</strong> {{$proj.Cloud}}</p>
                                    {{end}}
                                </div>
                            </dt>
                            {{end}}
                        </dl>
                        </p>
                    </div>
                    {{end}}
                </div>
            </div>

        </div>
    </section><!-- End Resume Section -->

    <!-- ======= Services Section ======= -->
    <section id="projects" class="projects">
        <div class="container">

            <div class="section-title">
                <h2>Projects</h2>
                <p>My projects</p>
            </div>
            <div class="row">
                {{range $i, $p := .Projects}}
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
                    <a href="{{$p.URL}}">
                        <div class="icon-box">
                            <div class="icon"><i class="{{$p.Icon}}"></i></div>
                            <h4>{{$p.Title}}</h4>
                            <p>{{$p.Content}}</p>
                        </div>
                    </a>
                </div>
                {{end}}
            </div>
        </div>
    </section><!-- End Services Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <div class="container">

            <div class="section-title">
                <h2>Contact</h2>
                <p>Contact Me</p>
            </div>

            <div class="row mt-2">

                <div class="col-md-6 d-flex align-items-stretch">
                    <div class="info-box">
                        <i class="bx bx-map"></i>
                        <h3>My Address</h3>
                        <p>{{.Personal.Location}}</p>
                    </div>
                </div>

                <div class="col-md-6 mt-4 mt-md-0 d-flex align-items-stretch">
                    <div class="info-box">
                        <i class="bx bx-share-alt"></i>
                        <h3>Social Profiles</h3>
                        <div class="social-links">
                            {{range .Social}}
                            {{if eq .Name "LinkedIn"}}
                            <a href="{{.URL}}" class="linkedin"><i class="{{.Icon}}"></i></a>
                            {{end}}
                            {{end}}
                        </div>
                    </div>
                </div>

                <div class="col-md-6 mt-4 d-flex align-items-stretch">
                    <div class="info-box">
                        <i class="bx bx-envelope"></i>
                        <h3>Email Me</h3>
                        <p>{{.Personal.Email}}</p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 d-flex align-items-stretch">
                    <div class="info-box">
                        <i class="bx bx-phone-call"></i>
                        <h3>Call Me</h3>
                        <p>{{.Personal.Phone}}</p>
                    </div>
                </div>
            </div>

        </div>
    </section><!-- End Contact Section -->

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js" defer></script>

    <!-- Matrix background effect -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.6/p5.js" defer></script>
    <script src="assets/js/matrix.js" defer></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js" defer></script>

</body>

</html>