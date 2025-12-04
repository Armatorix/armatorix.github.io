<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>{{.Personal.Name}} | {{.Personal.Title}}</title>
    <meta content="{{.Personal.Name}} - {{.Personal.Title}}" name="description">
    <meta content="golang, software engineer, cybersecurity, developer, backend" name="keywords">

    <link rel="icon" type="image/x-icon" class="js-site-favicon" href="assets/img/ico.png">
    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300;400;500;600;700&family=Share+Tech+Mono&display=swap"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
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
                <a href="{{.URL}}" class="{{.Name | lower}}" data-placement="top" title="{{.Title}}"><i class="{{.Icon}}"></i></a>
                {{else if .IconImage}}
                <a href="{{.URL}}" class="{{.Name | lower}}" data-toggle="tooltip" data-placement="top" title="{{.Title}}"><img src="{{.IconImage}}" height="{{.IconHeight}}"{{if .IconStyle}} style="{{.IconStyle}}"{{end}}></a>
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
                    <img src="assets/img/me.jpg" class="img-fluid" alt="">
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
                {{if splitp $i}}
            </div>
            <div class="row">
                {{end}}
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

    <div class="credits">
        background based on <a href="https://github.com/emilyxxie/green_rain">emilyxxie</a>
    </div>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/purecounter/purecounter.js"></script>
    <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.6/p5.js"></script>
    <script src="assets/js/matrix.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</body>

</html>