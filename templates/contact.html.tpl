<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>{{.Personal.Name}} | contact card</title>

    <meta name="description" content="Scan the QR code to save the contact details of {{.Personal.Name}} on your phone.">
    <meta name="author" content="{{.Personal.Name}}">
    <meta name="theme-color" content="#2c6a2b" media="(prefers-color-scheme: light)">
    <meta name="theme-color" content="#1d4a1e" media="(prefers-color-scheme: dark)">

    <link rel="canonical" href="https://{{.Personal.Website}}/contact.html">

    <meta property="og:type" content="profile">
    <meta property="og:url" content="https://{{.Personal.Website}}/contact.html">
    <meta property="og:title" content="{{.Personal.Name}} | contact card">
    <meta property="og:description" content="Scan the QR code to save the contact details of {{.Personal.Name}} on your phone.">
    <meta property="og:image" content="https://{{.Personal.Website}}/assets/img/me.jpg">

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

    <link
        href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,500;12..96,700&family=JetBrains+Mono:wght@400;500&family=Public+Sans:wght@400;600;700&display=swap"
        rel="stylesheet">

    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">

    <link href="assets/css/site.css" rel="stylesheet">
</head>

<body class="card-page">

    <header class="topbar">
        <div class="wrap">
            <a class="brand" href="./"><b>~/</b>wsokol.dev</a>
            <nav class="nav" aria-label="Site">
                <a href="./"><i class="ri-arrow-left-line" aria-hidden="true"></i> Home</a>
                <a href="./godev_wsokolowski_short.pdf">CV</a>
            </nav>
            <button class="theme-toggle" type="button" aria-label="Switch between light and dark theme">
                <i class="ri-contrast-2-line" aria-hidden="true"></i>
            </button>
        </div>
    </header>

    <main class="hero">
        <div class="wrap">
            <div class="card-grid">
                <div class="qr" role="img" aria-label="QR code with the contact details of {{.Personal.Name}}">{{.QR}}</div>
                <div>
                    <p class="eyebrow">Scan to save my contact</p>
                    <h1>{{.Personal.Name}}</h1>
                    <p class="lede">{{.Personal.Title}} &middot; {{.Personal.Location}}</p>
                    <ul class="card-lines">
                        <li><i class="ri-phone-line" aria-hidden="true"></i><a href="tel:{{.Personal.Phone | nospace}}">{{.Personal.Phone}}</a></li>
                        <li><i class="ri-mail-line" aria-hidden="true"></i><a href="mailto:{{.Personal.Email}}">{{.Personal.Email}}</a></li>
                        <li><i class="ri-global-line" aria-hidden="true"></i><a href="https://{{.Personal.Website}}/">{{.Personal.Website}}</a></li>
                    </ul>
                    <p class="card-hint">Point your phone camera at the code. It holds the contact itself, so it works without a connection.</p>
                    <div class="hero-actions">
                        <a class="btn primary" href="./contact.vcf" type="text/vcard"><i class="ri-user-add-line" aria-hidden="true"></i>Save contact</a>
                    </div>
                </div>
            </div>
        </div>
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
