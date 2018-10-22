$(function () {
    $('body.landing-page').scrollspy({target: '#navbar', offset: 50});

    $('[data-toggle="tooltip"]').tooltip();

    $('#join.modal').on('shown.bs.modal', function () {
        let modal = $(this);
        modal.find('input#subscriber_name').trigger('focus');
    })
});
