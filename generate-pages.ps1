# Generate modernized "Coming Soon" pages for all folders (except ISHU-TOOLS-PAGE)
# Each page uses shared styles.css and main.js from root

$pages = @(
    @{ Folder="ABOUT"; Title="About"; Icon="&#128100;"; Desc="Learn more about Ishu Kumar â€” the developer, creator, and builder behind this platform."; ActiveNav="About" },
    @{ Folder="BEU"; Title="BEU Portal"; Icon="&#127891;"; Desc="Bihar Engineering University resources, results, syllabus, and study materials â€” all in one place."; ActiveNav="BEU" },
    @{ Folder="BLOG"; Title="Blog"; Icon="&#128221;"; Desc="Insightful articles on tech, programming, career advice, and student life."; ActiveNav="Blog" },
    @{ Folder="COLLEGE DUKAN"; Title="College Dukan"; Icon="&#127978;"; Desc="Your one-stop student marketplace for notes, books, and campus essentials."; ActiveNav="CollegeDukan" },
    @{ Folder="CONTACT"; Title="Contact"; Icon="&#128222;"; Desc="Get in touch with Ishu Kumar for collaborations, queries, or just to say hello."; ActiveNav="Contact" },
    @{ Folder="CV"; Title="CV Builder"; Icon="&#128196;"; Desc="Create professional resumes and CVs with modern, ATS-friendly templates."; ActiveNav="CV" },
    @{ Folder="GAMES"; Title="Games"; Icon="&#127918;"; Desc="Play fun browser games to relax between study sessions. No downloads needed."; ActiveNav="Games" },
    @{ Folder="HOME-PAGE"; Title="Home"; Icon="&#127968;"; Desc="Welcome to ISHU â€” your digital hub for tools, resources, and more."; ActiveNav="Home" },
    @{ Folder="JOBS"; Title="Jobs & Careers"; Icon="&#128188;"; Desc="Find internships, fresher jobs, and career opportunities in tech and beyond."; ActiveNav="Jobs" },
    @{ Folder="NEWS"; Title="News"; Icon="&#128240;"; Desc="Stay updated with the latest tech, education, and industry news curated for you."; ActiveNav="News" },
    @{ Folder="RESOURCE"; Title="Resources"; Icon="&#128218;"; Desc="Curated learning resources, notes, PDFs, and reference materials for students."; ActiveNav="Resource" },
    @{ Folder="RESULT"; Title="Results"; Icon="&#128202;"; Desc="Check your exam results quickly with our fast and reliable result checker."; ActiveNav="Result" },
    @{ Folder="TEST"; Title="Test"; Icon="&#129514;"; Desc="Practice tests, mock exams, and quizzes to prepare for your upcoming exams."; ActiveNav="Test" }
)

$basePath = "c:\Users\MR.ROBOT\OneDrive - Park University\Desktop\WEBSITE"

foreach ($page in $pages) {
    $folder = $page.Folder
    $title = $page.Title
    $icon = $page.Icon
    $desc = $page.Desc
    $activeNav = $page.ActiveNav

    # Determine active states
    $homeActive = if ($activeNav -eq "Home") { ' class="active"' } else { '' }
    $aboutActive = if ($activeNav -eq "About") { ' class="active"' } else { '' }
    $blogActive = if ($activeNav -eq "Blog") { ' class="active"' } else { '' }
    $contactActive = if ($activeNav -eq "Contact") { ' class="active"' } else { '' }

    # For mobile menu
    $mHomeActive = if ($activeNav -eq "Home") { ' active' } else { '' }
    $mAboutActive = if ($activeNav -eq "About") { ' active' } else { '' }
    $mBlogActive = if ($activeNav -eq "Blog") { ' active' } else { '' }
    $mContactActive = if ($activeNav -eq "Contact") { ' active' } else { '' }

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISHU - $title | Coming Soon</title>
    <meta name="description" content="$desc">
    <meta name="author" content="Ishu Kumar">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/../styles.css">
    <style>
        .page-icon { font-size: 4rem; margin-bottom: 1.5rem; animation: fadeUp 0.7s ease 0.05s forwards; opacity: 0; }
        .hero .page-subtitle { font-size: clamp(1.2rem, 2.5vw, 1.75rem); font-weight: 300; color: #64748b; margin-bottom: 1.5rem; animation: fadeUp 0.7s ease 0.15s forwards; opacity: 0; }
        .hero .page-desc { font-size: clamp(1rem, 2vw, 1.15rem); color: #475569; line-height: 1.7; max-width: 500px; margin: 0 auto; animation: fadeUp 0.7s ease 0.2s forwards; opacity: 0; }
        .back-home { display: inline-flex; align-items: center; gap: 0.5rem; margin-top: 2.5rem; padding: 0.85rem 2rem; border-radius: 14px; background: rgba(99,102,241,0.08); border: 1px solid rgba(99,102,241,0.18); color: #a5b4fc; text-decoration: none; font-weight: 600; font-size: 0.9rem; transition: all 0.3s ease; animation: fadeUp 0.7s ease 0.3s forwards; opacity: 0; }
        .back-home:hover { background: rgba(99,102,241,0.15); transform: translateY(-2px); box-shadow: 0 4px 20px rgba(99,102,241,0.2); }
    </style>
</head>
<body>
    <div class="bg-canvas">
        <div class="orb"></div><div class="orb"></div><div class="orb"></div>
        <div class="grid-overlay"></div>
    </div>

    <nav class="navbar" id="navbar">
        <div class="nav-container">
            <a href="/" class="nav-logo">ISHU</a>
            <ul class="nav-links">
                <li><a href="/"$homeActive>Home</a></li>
                <li><a href="/ABOUT/"$aboutActive>About</a></li>
                <li><a href="/BLOG/"$blogActive>Blog</a></li>
                <li><a href="/CONTACT/"$contactActive>Contact</a></li>
                <li class="nav-dropdown" id="navDropdown">
                    <button class="nav-dropdown-btn" onclick="toggleDropdown(event)">
                        More <svg width="12" height="12" viewBox="0 0 12 12" fill="none"><path d="M3 4.5L6 7.5L9 4.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </button>
                    <div class="mega-dropdown" id="megaDropdown">
                        <div class="mega-grid">
                            <a href="/BEU/" class="mega-item"><span class="mega-icon">&#127891;</span><div><div class="mega-title">BEU Portal</div><div class="mega-desc">University resources</div></div></a>
                            <a href="/COLLEGE%20DUKAN/" class="mega-item"><span class="mega-icon">&#127978;</span><div><div class="mega-title">College Dukan</div><div class="mega-desc">Student marketplace</div></div></a>
                            <a href="/CV/" class="mega-item"><span class="mega-icon">&#128196;</span><div><div class="mega-title">CV Builder</div><div class="mega-desc">Create resumes</div></div></a>
                            <a href="/GAMES/" class="mega-item"><span class="mega-icon">&#127918;</span><div><div class="mega-title">Games</div><div class="mega-desc">Browser games</div></div></a>
                            <a href="/JOBS/" class="mega-item"><span class="mega-icon">&#128188;</span><div><div class="mega-title">Jobs</div><div class="mega-desc">Career opportunities</div></div></a>
                            <a href="/NEWS/" class="mega-item"><span class="mega-icon">&#128240;</span><div><div class="mega-title">News</div><div class="mega-desc">Latest updates</div></div></a>
                            <a href="/RESOURCE/" class="mega-item"><span class="mega-icon">&#128218;</span><div><div class="mega-title">Resources</div><div class="mega-desc">Study materials</div></div></a>
                            <a href="/RESULT/" class="mega-item"><span class="mega-icon">&#128202;</span><div><div class="mega-title">Results</div><div class="mega-desc">Exam results</div></div></a>
                            <a href="/TEST/" class="mega-item"><span class="mega-icon">&#129514;</span><div><div class="mega-title">Test</div><div class="mega-desc">Practice tests</div></div></a>
                        </div>
                    </div>
                </li>
            </ul>
            <div class="nav-right">
                <div class="nav-social">
                    <a href="https://www.linkedin.com/in/ishu-kumar-5a0940281/" target="_blank" rel="noopener" aria-label="LinkedIn" class="nav-social-icon"><svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg></a>
                    <a href="https://x.com/ISHU_IITP" target="_blank" rel="noopener" aria-label="X" class="nav-social-icon"><svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg></a>
                    <a href="https://www.youtube.com/@ishu-fun" target="_blank" rel="noopener" aria-label="YouTube" class="nav-social-icon"><svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.186a3.016 3.016 0 00-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 00.502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 002.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 002.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg></a>
                </div>
                <a href="https://ishutools.vercel.app/" class="nav-tools-btn">&#9889; Tools</a>
            </div>
            <div class="hamburger" id="hamburger" onclick="toggleMenu()">
                <span></span><span></span><span></span>
            </div>
        </div>
    </nav>

    <div class="mobile-menu" id="mobileMenu">
        <div class="mobile-menu-inner">
            <div class="mobile-section">
                <div class="mobile-section-label">Navigation</div>
                <a href="/" class="mobile-link$mHomeActive"><span class="mobile-link-icon">&#127968;</span> Home</a>
                <a href="/ABOUT/" class="mobile-link$mAboutActive"><span class="mobile-link-icon">&#128100;</span> About</a>
                <a href="/BLOG/" class="mobile-link$mBlogActive"><span class="mobile-link-icon">&#128221;</span> Blog</a>
                <a href="/CONTACT/" class="mobile-link$mContactActive"><span class="mobile-link-icon">&#128222;</span> Contact</a>
            </div>
            <div class="mobile-section">
                <div class="mobile-section-label">Platform</div>
                <div class="mobile-grid">
                    <a href="/BEU/" class="mobile-grid-item"><span>&#127891;</span> BEU</a>
                    <a href="/COLLEGE%20DUKAN/" class="mobile-grid-item"><span>&#127978;</span> Dukan</a>
                    <a href="/CV/" class="mobile-grid-item"><span>&#128196;</span> CV</a>
                    <a href="/GAMES/" class="mobile-grid-item"><span>&#127918;</span> Games</a>
                    <a href="/JOBS/" class="mobile-grid-item"><span>&#128188;</span> Jobs</a>
                    <a href="/NEWS/" class="mobile-grid-item"><span>&#128240;</span> News</a>
                    <a href="/RESOURCE/" class="mobile-grid-item"><span>&#128218;</span> Resource</a>
                    <a href="/RESULT/" class="mobile-grid-item"><span>&#128202;</span> Result</a>
                    <a href="/TEST/" class="mobile-grid-item"><span>&#129514;</span> Test</a>
                </div>
            </div>
            <a href="https://ishutools.vercel.app/" class="mobile-tools-btn">&#9889; Explore 1200+ Tools</a>
            <div class="mobile-social">
                <a href="https://www.linkedin.com/in/ishu-kumar-5a0940281/" target="_blank" rel="noopener" class="mobile-social-icon">in</a>
                <a href="https://www.instagram.com/ishukr10" target="_blank" rel="noopener" class="mobile-social-icon">&#128247;</a>
                <a href="https://www.youtube.com/@ishu-fun" target="_blank" rel="noopener" class="mobile-social-icon">&#9654;</a>
                <a href="https://x.com/ISHU_IITP" target="_blank" rel="noopener" class="mobile-social-icon">&#120143;</a>
            </div>
        </div>
    </div>

    <main class="hero" id="hero">
        <div class="hero-inner" style="text-align:center;">
            <div class="badge"><span class="pulse-dot"></span> Under Development</div>
            <div class="page-icon">$icon</div>
            <h1><span class="text-gradient">$title</span></h1>
            <p class="page-subtitle">Coming Soon</p>
            <p class="page-desc">$desc</p>
            <a href="/" class="back-home">&larr; Back to Home</a>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-links">
            <a href="/">Home</a>
            <a href="/ABOUT/">About</a>
            <a href="/CONTACT/">Contact</a>
            <a href="https://ishutools.vercel.app/">Tools</a>
        </div>
        <p class="footer-text">&copy; 2026 ISHU. Crafted with &#10084;&#65039; by Ishu Kumar. All rights reserved.</p>
    </footer>

    <script src="/../main.js"></script>
    <script>
        function toggleDropdown(e) {
            e.stopPropagation();
            document.getElementById('navDropdown').classList.toggle('open');
        }
        document.addEventListener('click', function(e) {
            var dd = document.getElementById('navDropdown');
            if (dd && !dd.contains(e.target)) dd.classList.remove('open');
        });
    </script>
</body>
</html>
"@

    $targetPath = Join-Path $basePath "$folder\index.html"
    $html | Out-File -FilePath $targetPath -Encoding utf8 -Force
    Write-Host "Generated: $targetPath"
}

Write-Host "`nAll pages generated successfully!"
