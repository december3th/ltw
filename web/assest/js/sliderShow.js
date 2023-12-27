const sliderWrapper = document.querySelector('.slider-wrapper');
const slides = document.querySelectorAll('.slide');
const slideWidth = slides[0].clientWidth;
let currentIndex = 0;
let direction = 1; // 1: forward, -1: backward

function startSlider() {
    setInterval(() => {
        currentIndex += direction;
        sliderWrapper.style.transition = 'transform 1s ease-in-out';
        sliderWrapper.style.transform = `translateX(-${currentIndex * slideWidth}px)`;

        if (currentIndex >= slides.length - 1) {
            direction = -1;
        } else if (currentIndex <= 0) {
            direction = 1;
        }
    }, 3500);
}

startSlider();