// ===== NAVBAR SCROLL =====
window.addEventListener('scroll', () => {
    document.getElementById('navbar').classList.toggle('scrolled', window.scrollY > 30);
});

// ===== MOBILE MENU =====
function toggleMenu() {
    const h = document.getElementById('hamburger');
    const m = document.getElementById('mobileMenu');
    h.classList.toggle('active');
    m.classList.toggle('active');
    document.body.style.overflow = m.classList.contains('active') ? 'hidden' : '';
}

// Close mobile menu on link click
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.mobile-menu a, .mobile-link, .mobile-grid-item, .mobile-tools-btn').forEach(link => {
        link.addEventListener('click', () => {
            document.getElementById('hamburger').classList.remove('active');
            document.getElementById('mobileMenu').classList.remove('active');
            document.body.style.overflow = '';
        });
    });
});

// ===== MEGA DROPDOWN =====
function toggleDropdown(e) {
    e.stopPropagation();
    const dropdown = document.getElementById('navDropdown');
    dropdown.classList.toggle('open');
}

// Close dropdown on outside click
document.addEventListener('click', (e) => {
    const dropdown = document.getElementById('navDropdown');
    if (dropdown && !dropdown.contains(e.target)) {
        dropdown.classList.remove('open');
    }
});

// Close dropdown on Escape key
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        const dropdown = document.getElementById('navDropdown');
        if (dropdown) dropdown.classList.remove('open');
        // Also close mobile menu
        document.getElementById('hamburger')?.classList.remove('active');
        document.getElementById('mobileMenu')?.classList.remove('active');
        document.body.style.overflow = '';
    }
});

// ===== SCROLL REVEAL =====
const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
            revealObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

document.querySelectorAll('.reveal').forEach(el => revealObserver.observe(el));

// ===== ANIMATED COUNTER =====
function animateCounters() {
    document.querySelectorAll('[data-count]').forEach(el => {
        const target = parseInt(el.dataset.count);
        const suffix = el.dataset.suffix || '';
        const duration = 2000;
        const start = performance.now();
        function update(now) {
            const progress = Math.min((now - start) / duration, 1);
            const eased = 1 - Math.pow(1 - progress, 4);
            el.textContent = Math.floor(eased * target) + suffix;
            if (progress < 1) requestAnimationFrame(update);
        }
        requestAnimationFrame(update);
    });
}

const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            animateCounters();
            statsObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.3 });

const statsEl = document.querySelector('.stats-bar');
if (statsEl) statsObserver.observe(statsEl);

// ===== SMOOTH PARALLAX ON MOUSE (Desktop only) =====
if (window.innerWidth > 768) {
    let mouseX = 0, mouseY = 0, currentX = 0, currentY = 0;
    
    document.addEventListener('mousemove', (e) => {
        mouseX = (e.clientX / window.innerWidth - 0.5) * 20;
        mouseY = (e.clientY / window.innerHeight - 0.5) * 20;
    });

    function smoothParallax() {
        currentX += (mouseX - currentX) * 0.05;
        currentY += (mouseY - currentY) * 0.05;
        const orbs = document.querySelectorAll('.bg-canvas .orb');
        orbs.forEach((orb, i) => {
            const factor = (i + 1) * 0.35;
            orb.style.transform = `translate(${currentX * factor}px, ${currentY * factor}px)`;
        });
        requestAnimationFrame(smoothParallax);
    }
    smoothParallax();
}
