<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>{{.Personal.Name}} | {{.Personal.Title}}</title>

    <!-- Primary Meta Tags -->
    <meta name="title" content="{{.Personal.Name}} | {{.Personal.Title}}">
    <meta name="description" content="{{.Personal.Name}} - {{.Personal.Title}} based in {{.Personal.Location}}. {{.Personal.Tagline}}">
    <meta name="keywords" content="{{.Personal.Name}}, Armatorix, golang, go developer, software engineer, solutions engineer, fintech, agrotech, Ploryn, farm management, backend developer, distributed systems, Poland">
    <meta name="author" content="{{.Personal.Name}}">
    <meta name="robots" content="index, follow, max-image-preview:large">
    <meta name="googlebot" content="index, follow">
    <meta name="language" content="English">
    <meta name="theme-color" content="#2c6a2b" media="(prefers-color-scheme: light)">
    <meta name="theme-color" content="#1d4a1e" media="(prefers-color-scheme: dark)">

    <!-- Canonical URL -->
    <link rel="canonical" href="https://{{.Personal.Website}}/">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://{{.Personal.Website}}/">
    <meta property="og:title" content="{{.Personal.Name}} | {{.Personal.Title}}">
    <meta property="og:description" content="{{.Personal.Name}} - {{.Personal.Title}} based in {{.Personal.Location}}. {{.Personal.Tagline}}">
    <meta property="og:image" content="https://{{.Personal.Website}}/assets/img/me.jpg">
    <meta property="og:image:alt" content="{{.Personal.Name}} - {{.Personal.Title}}">
    <meta property="og:image:type" content="image/jpeg">
    <meta property="og:site_name" content="{{.Personal.Name}}">
    <meta property="og:locale" content="en_US">

    <!-- Twitter -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:url" content="https://{{.Personal.Website}}/">
    <meta name="twitter:title" content="{{.Personal.Name}} | {{.Personal.Title}}">
    <meta name="twitter:description" content="{{.Personal.Name}} - {{.Personal.Title}} based in {{.Personal.Location}}. {{.Personal.Tagline}}">
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
        "description": "{{.Personal.Tagline}}",
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

    <!-- Apply the saved theme before first paint -->
    <script>
        try {
            var t = localStorage.getItem('theme');
            if (t === 'light' || t === 'dark') document.documentElement.dataset.theme = t;
        } catch (e) {}
    </script>

    <link rel="icon" type="image/x-icon" class="js-site-favicon" href="assets/img/ico.png">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preload" as="image" href="assets/img/me.jpg" fetchpriority="high">

    <link
        href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,500;12..96,700&family=JetBrains+Mono:wght@400;500&family=Public+Sans:wght@400;600;700&display=swap"
        rel="stylesheet">

    <!-- Icon fonts -->
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">

    <link href="assets/css/site.css" rel="stylesheet">
</head>

<body>

    <header class="topbar">
        <div class="wrap">
            <a class="brand" href="#top"><b>~/</b>wsokol.dev</a>
            <nav class="nav" aria-label="Sections">
                <a href="#about">About</a>
                <a href="#experience">Experience</a>
                <a href="#projects">Projects</a>
                <a href="#contact">Contact</a>
                <a href="./godev_wsokolowski_short.pdf">CV</a>
            </nav>
            <button class="theme-toggle" type="button" aria-label="Switch between light and dark theme">
                <i class="ri-contrast-2-line" aria-hidden="true"></i>
            </button>
        </div>
    </header>

    <main id="top">

        <div class="hero">
            <div class="wrap">
                <div class="hero-grid">
                    <div>
                        <p class="eyebrow">{{.Personal.Title}} &middot; {{.Personal.Location}}</p>
                        <h1>{{.Personal.Name}}</h1>
                        <p class="motto">{{.Personal.Description}}</p>
                        <p class="lede">{{.Personal.Tagline}}</p>
                        <div class="hero-actions">
                            <a class="btn primary" href="mailto:{{.Personal.Email}}"><i class="ri-mail-line" aria-hidden="true"></i>Get in touch</a>
                            <a class="btn" href="./godev_wsokolowski_short.pdf"><i class="ri-file-download-line" aria-hidden="true"></i>One-page CV</a>
                            <a class="btn" href="./godev_wsokolowski.pdf"><i class="ri-file-download-line" aria-hidden="true"></i>Full CV</a>
                        </div>
                    </div>
                    <img class="portrait" src="assets/img/me.jpg" alt="Portrait of {{.Personal.Name}}" width="2111" height="2160" fetchpriority="high" decoding="async">
                </div>
            </div>
            <div class="rows" aria-hidden="true"></div>
        </div>

        <section id="about">
            <div class="wrap">
                <div class="section-head">
                    <h2>Four fields I work</h2>
                </div>
                <div class="plots">
                    {{range .Roles}}
                    <div class="plot">
                        <p class="since">{{.Since}}</p>
                        <h3>{{.Title}}</h3>
                        <p>{{.Text}}</p>
                    </div>
                    {{end}}
                </div>
                <p class="about-text">{{.Summary.Description}}</p>
            </div>
        </section>

        <section id="experience">
            <div class="wrap">
                <div class="section-head">
                    <h2>Experience</h2>
                </div>
                <p class="group-label now"><span>Now</span></p>
                <div class="jobs">
                    {{range .Experience}}{{if current .Period}}{{template "job" .}}{{end}}{{end}}
                </div>
                <p class="group-label"><span>Before</span></p>
                <div class="jobs">
                    {{range .Experience}}{{if not (current .Period)}}{{template "job" .}}{{end}}{{end}}
                </div>
            </div>
        </section>

        <section id="background">
            <div class="wrap">
                <div class="section-head">
                    <h2>Background</h2>
                </div>
                <div class="facts">
                    <div>
                        <h3>Education</h3>
                        <ul>
                            {{range .Education}}
                            <li>
                                <strong>{{.Degree}}</strong>
                                <small>{{if .Faculty}}{{.Faculty}}, {{end}}{{.Institution}} &middot; {{.Period}}</small>
                                {{if .Thesis}}<small>Thesis: {{.Thesis.Topic}}</small>{{end}}
                            </li>
                            {{end}}
                        </ul>
                        <p class="aside">Used to do some Math. Also a <a href="https://lwiatko.org/o-konkursie">Taon</a>.</p>
                    </div>
                    <div>
                        <h3>Languages</h3>
                        <ul class="inline">
                            {{range .Languages}}
                            <li>{{.Name}}<span class="level">{{.Level}}</span></li>
                            {{end}}
                        </ul>
                        <p class="aside tech">{{join .Summary.FavoriteLanguages " &gt; "}}</p>
                    </div>
                    <div>
                        <h3>Off the clock</h3>
                        <ul class="inline">
                            {{range .Interests}}
                            <li><i class="{{.Icon}}" aria-hidden="true"></i>{{if .URL}}<a href="{{.URL}}">{{.Name}}</a>{{else}}{{.Name}}{{end}}</li>
                            {{end}}
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section id="projects">
            <div class="wrap">
                <div class="section-head">
                    <h2>Projects</h2>
                </div>
                {{range $p := .Projects}}{{if $p.Flagship}}
                <div class="flagship">
                    <div>
                        <p class="tech">{{join $p.Technologies.All " · "}}</p>
                        <h3>{{$p.Title}}</h3>
                        <p>{{$p.Content}}</p>
                    </div>
                    <a class="btn primary" href="{{$p.URL}}" rel="noopener" target="_blank">Visit<i class="ri-arrow-right-up-line" aria-hidden="true"></i></a>
                </div>
                {{end}}{{end}}
                <div class="project-list">
                    {{range $p := .Projects}}{{if not $p.Flagship}}
                    {{if and $p.URL (ne $p.URL "#")}}<a class="project-row" href="{{$p.URL}}" rel="noopener" target="_blank">{{else}}<div class="project-row">{{end}}
                        <h3>{{$p.Title}}</h3>
                        <p>{{$p.Content}}</p>
                        <span class="tech">{{join $p.Technologies.All " · "}}</span>
                        <span class="ext">{{if and $p.URL (ne $p.URL "#")}}<i class="ri-arrow-right-up-line" aria-hidden="true"></i>{{end}}</span>
                    {{if and $p.URL (ne $p.URL "#")}}</a>{{else}}</div>{{end}}
                    {{end}}{{end}}
                </div>
            </div>
        </section>

        <section id="contact">
            <div class="wrap">
                <div class="section-head">
                    <h2>Contact</h2>
                </div>
                <div class="contact">
                    <div>
                        <dl>
                            <dt>Email</dt>
                            <dd class="big"><a href="mailto:{{.Personal.Email}}">{{.Personal.Email}}</a></dd>
                            <dt>Phone</dt>
                            <dd><a href="tel:{{.Personal.Phone | nospace}}">{{.Personal.Phone}}</a></dd>
                            <dt>Location</dt>
                            <dd>{{.Personal.Location}}</dd>
                            <dt>Freelance</dt>
                            <dd>{{.Personal.Freelance}}</dd>
                        </dl>
                    </div>
                    <div>
                        <div class="socials">
                            {{range .Social}}
                            <a href="{{.URL}}" class="{{.Name | lower}}" title="{{.Title}}" rel="noopener me" target="_blank">{{if .Icon}}<i class="{{.Icon}}" aria-hidden="true"></i>{{else if .IconImage}}<img src="{{.IconImage}}" alt="" loading="lazy" decoding="async"{{if .IconStyle}} style="{{.IconStyle}}"{{end}}>{{end}}{{.Name}}</a>
                            {{end}}
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>

    <footer>
        <div class="wrap">{{.Personal.Name}} &middot; built from one JSON file with Go &middot; <a href="https://github.com/Armatorix/armatorix.github.io">source</a></div>
    </footer>

    <script>
        document.querySelector('.theme-toggle').addEventListener('click', function () {
            var root = document.documentElement;
            var dark = root.dataset.theme
                ? root.dataset.theme === 'dark'
                : window.matchMedia('(prefers-color-scheme: dark)').matches;
            root.dataset.theme = dark ? 'light' : 'dark';
            try { localStorage.setItem('theme', root.dataset.theme); } catch (e) {}
        });
    </script>

</body>

</html>

{{define "job"}}
                    <article class="job">
                        <div class="job-when">
                            <span class="period">{{.Period}}</span><br>
                            <span>{{.Location}}</span>
                        </div>
                        <div>
                            <h3>{{.Position}} <span>/ {{.Company}}</span></h3>
                            {{range $proj := .Projects}}
                            <div class="project">
                                <h4>{{if $proj.URL}}<a href="{{$proj.URL}}" rel="noopener" target="_blank">{{$proj.Name}}</a>{{else}}{{$proj.Name}}{{end}}</h4>
                                <p class="tech">{{join $proj.Stack " · "}}</p>
                                {{if $proj.Responsibilities}}
                                <ul class="duties">
                                    {{range $ri, $r := $proj.Responsibilities}}{{if lt $ri 4}}<li>{{$r}}</li>
                                    {{end}}{{end}}
                                </ul>
                                {{if gt (len $proj.Responsibilities) 4}}
                                <details class="more">
                                    <summary>+ {{len (slice $proj.Responsibilities 4)}} more</summary>
                                    <ul class="duties">
                                        {{range $ri, $r := $proj.Responsibilities}}{{if ge $ri 4}}<li>{{$r}}</li>
                                        {{end}}{{end}}
                                    </ul>
                                </details>
                                {{end}}
                                {{end}}
                            </div>
                            {{end}}
                        </div>
                    </article>
{{end}}
