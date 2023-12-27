const slides = document.querySelector('.slide-show');
const prevBtn = document.querySelector('.slide-button--prev');
const nextBtn = document.querySelector('.slide-button--next');
const pagination = document.querySelectorAll('.slide-left--pagination-bullet');

let slideIndex = 0;

let interval = setInterval(() => {
    nextSlider();
}, 2000);

nextBtn.addEventListener('click', () => {
    clearInterval(interval);
    nextSlider();
    interval = setInterval(() => {
        nextSlider();
    }, 2000);
});

prevBtn.addEventListener('click', () => {
    clearInterval(interval);
    prevSlider();
    interval = setInterval(() => {
        nextSlider();
    }, 2000);
});

function nextSlider() {
    if (slideIndex === 3) {
        slideIndex = 0;
    } else {
        slideIndex++;
    }
    slides.style.transform = `translateX(-${slideIndex * 100}%)`;
    pagination.forEach((pagi, index) => {
        if (index === slideIndex) pagi.classList.add('active');
        else pagi.classList.remove('active');
    });
}

function prevSlider() {
    if (slideIndex === 0) {
        slideIndex = 3;
    } else {
        slideIndex--;
    }
    slides.style.transform = `translateX(-${slideIndex * 100}%)`;
}
