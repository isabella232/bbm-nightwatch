$(function () {
    $('body.landing-page').scrollspy({target: '#navbar', offset: 50});

    $('a[href^="#"]').click(function (event) {
        event.preventDefault();
        var anchor = $(this).attr('href');
        document.querySelector(anchor).scrollIntoView({block: 'start', behavior: 'smooth'});
    });

    $('.carousel[data-type="multi"] .item').each(function () {
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        for (var i = 0; i < 1; i++) {
            next = next.next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }

            next.children(':first-child').clone().appendTo($(this));
        }
    });

    $('[data-toggle="tooltip"]').tooltip();
});
