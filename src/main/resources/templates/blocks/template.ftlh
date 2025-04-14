<#macro template user=null>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="icon" type="image/png" href="static/images/favicon.png">

        <!-- Bootstrap CSS -->
        <#--    Bootstrap CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
        <style>
            body {
                background: linear-gradient(0deg, #e0e0e0, #343a40);
                min-height: 100vh;
                padding-top: 0;
            }
            .content-wrapper {
                margin: 20px 0;
                padding: 20px;
            }
            .navbar-nav .nav-link {
                font-size: 1.2rem;
                padding: 0.5rem 1.2rem;
                margin: 0 0.2rem;
                transition: all 0.3s ease;
                position: relative;
            }
            .navbar-nav .nav-link:hover {
                transform: translateY(-2px);
            }
            .navbar-nav .nav-link.active {
                font-weight: 500;
                border-bottom: 2px solid #ffffff;
                padding-bottom: 3px;
            }
            .navbar-dark .navbar-nav .nav-link {
                color: rgba(255, 255, 255, 0.9);
            }
            .navbar-dark .navbar-nav .nav-link:hover {
                color: #ffffff;
            }
            .navbar-dark .navbar-nav .nav-link.active {
                color: #ffffff;
            }
            .navbar {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1030;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            }
        </style>

        <title>Text Stylization Addon</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <#-- <a class="navbar-brand" href="/" style="font-size: 30px">Text Stylization</a> -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link <#if currentPage?? && currentPage == "home">active</#if>" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <#if currentPage?? && currentPage == "download">active</#if>" href="/download">Download</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <#if currentPage?? && currentPage == "tutorial">active</#if>" href="/tutorial">Tutorial</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <#if user?? && user.email??>
                            <button class="btn btn-light my-2 my-sm-0" type="button"
                                    onclick="window.location.href = '/profile'">
                                Profile
                            </button>
                        <#else>
                            <button class="btn btn-light my-2 my-sm-0" type="button"
                                    onclick="window.location.href = '/login'">
                                Login
                            </button>
                        </#if>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-0">
        <div class="content-wrapper">
            <#nested/>
        </div>
    </div>

    <footer class="bg-dark text-white mt-5 py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>Contact Me</h5>
                    <ul class="list-unstyled">
                        <li><i class="fab fa-telegram"></i> Telegram: <a href="https://t.me/eritsvet" class="text-white">@eritsvet</a></li>
                        <li><i class="fas fa-envelope"></i> Email: <a href="mailto:eritsvet@mail.ru" class="text-white">eritsvet@mail.ru</a></li>
                    </ul>
                </div>
                <div class="col-md-6 text-md-right">
                    <p class="mb-0">&copy; 2025 Text Stylization Addon. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </body>
    </html>
</#macro>