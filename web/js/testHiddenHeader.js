let menuBtn = document.querySelector('.nav-bar--extra');
let menu = document.querySelector('.nav-bar__extra--content');
let menuBtnEx = document.querySelector('.nav-bar__extra--icon');
let menuOverlay = document.querySelector('.nav-bar--overlay');
menuBtn.addEventListener('click', () => {
    menu.classList.remove('hidden');
});
menuBtnEx.addEventListener('click', () => {
    menu.classList.add('hidden');
});
menuOverlay.addEventListener('click', () => {
    menu.classList.add('hidden');
});
