//nav
$(window).scroll(function () {
    $('#scroll-color').toggleClass('scrolled', $(this).scrollTop() > 100);
})

var linkClicked = document.getElementsByClassName('nav-link');
var numClass = linkClicked.length;

for (var i = 0; i < numClass; i++) {
    linkClicked[i].addEventListener('click', function () {
        var onTheMoment = document.getElementsByClassName('active');
        onTheMoment[0].className = onTheMoment[0].className.replace(' active', '');
        this.className += ' active';
    }, false);
}

// random background
var bg = new Array();
bg[bg.length] = 'https://images.unsplash.com/5/unsplash-bonus.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
bg[bg.length] = 'https://images.unsplash.com/photo-1504630083234-14187a9df0f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
bg[bg.length] = 'https://images.unsplash.com/photo-1514163161321-f4f7c2a90296?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';

var obj = document.getElementById('bg-sub');
var size = Math.floor(Math.random()*(bg.length));
j = (isNaN(size)) ? 0 : size;
obj.style.backgroundImage = 'linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('+ bg[size] + ')';