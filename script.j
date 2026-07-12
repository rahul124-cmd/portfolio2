/* ==========================================================
   TYPING ANIMATION
========================================================== */

const roles = [
    "Artificial Intelligence Enthusiast",
    "Python Developer",
    "Problem Solver",
    "Software Engineering Student",
    "Lifelong Learner"
];

const typingText = document.querySelector(".typing-text");

let roleIndex = 0;
let charIndex = 0;
let deleting = false;

function typeEffect() {

    if (!typingText) return;

    const currentRole = roles[roleIndex];

    if (!deleting) {

        typingText.textContent = currentRole.substring(0, charIndex);
        charIndex++;

        if (charIndex > currentRole.length) {
            deleting = true;
            setTimeout(typeEffect, 1800);
            return;
        }

    } else {

        typingText.textContent = currentRole.substring(0, charIndex);
        charIndex--;

        if (charIndex < 0) {
            deleting = false;
            roleIndex = (roleIndex + 1) % roles.length;
        }

    }

    setTimeout(typeEffect, deleting ? 40 : 80);

}

typeEffect();

/* ==========================================================
   BACK TO TOP BUTTON
========================================================== */

const topBtn = document.getElementById("topBtn");

window.addEventListener("scroll", () => {

    if (window.scrollY > 500) {

        topBtn.classList.add("show");

    } else {

        topBtn.classList.remove("show");

    }

});

topBtn.addEventListener("click", () => {

    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });

});

/* ==========================================================
   SCROLL PROGRESS BAR
========================================================== */

const progressBar = document.getElementById("progress-bar");

window.addEventListener("scroll", () => {

    const scrollTop = document.documentElement.scrollTop;

    const scrollHeight =
        document.documentElement.scrollHeight -
        document.documentElement.clientHeight;

    const progress = (scrollTop / scrollHeight) * 100;

    progressBar.style.width = progress + "%";

});

/* ==========================================================
   ACTIVE NAVIGATION LINK
========================================================== */

const sections = document.querySelectorAll("section");
const navLinks = document.querySelectorAll(".nav-links a");

window.addEventListener("scroll", () => {

    let current = "";

    sections.forEach(section => {

        const sectionTop = section.offsetTop - 120;

        if (window.scrollY >= sectionTop) {

            current = section.getAttribute("id");

        }

    });

    navLinks.forEach(link => {

        link.classList.remove("active");

        if (link.getAttribute("href") === "#" + current) {

            link.classList.add("active");

        }

    });

});

/* ==========================================================
   SMOOTH SCROLL
========================================================== */

document.querySelectorAll('a[href^="#"]').forEach(anchor => {

    anchor.addEventListener("click", function(e) {

        e.preventDefault();

        const target = document.querySelector(this.getAttribute("href"));

        if (target) {

            target.scrollIntoView({

                behavior: "smooth"

            });

        }

    });

});

/* ==========================================================
   SCROLL REVEAL
========================================================== */

const revealElements = document.querySelectorAll(

    ".section, .skill-card, .course-card, .achievement-card, .why-card, .stat-card, .timeline-item, .leadership-card"

);

const observer = new IntersectionObserver(

(entries) => {

    entries.forEach(entry => {

        if (entry.isIntersecting) {

            entry.target.classList.add("show");

        }

    });

},

{

    threshold: 0.15

}

);

revealElements.forEach(element => {

    element.classList.add("hidden");

    observer.observe(element);

});

/* ==========================================================
   NAVBAR BACKGROUND ON SCROLL
========================================================== */

const header = document.querySelector("header");

window.addEventListener("scroll", () => {

    if (window.scrollY > 80) {

        header.style.background = "rgba(18,18,18,0.98)";
        header.style.boxShadow = "0 4px 12px rgba(0,0,0,.25)";

    } else {

        header.style.background = "rgba(24,24,24,.95)";
        header.style.boxShadow = "none";

    }

});

/* ==========================================================
   SIMPLE HOVER EFFECT FOR CARDS
========================================================== */

const cards = document.querySelectorAll(

    ".skill-card, .course-card, .achievement-card, .why-card, .stat-card, .tool-box"

);

cards.forEach(card => {

    card.addEventListener("mouseenter", () => {

        card.style.transition = ".3s";

    });

});

/* ==========================================================
   CONTACT FORM
========================================================== */

const form = document.querySelector(".contact-form form");

if(form){

form.addEventListener("submit",(e)=>{

    e.preventDefault();

    alert("Thank you for reaching out! This portfolio currently has a demo contact form.");

    form.reset();

});

}

/* ==========================================================
   CURRENT YEAR (Optional)
========================================================== */

const year = new Date().getFullYear();

const copyright = document.querySelector(".copyright");

if(copyright){

    copyright.innerHTML =
    `© ${year} Rahul Gopakumar <br>Designed & Developed with ❤️ using HTML, CSS & JavaScript.`;

}

/* ==========================================================
   END
========================================================== */