$(document).ready(function() {
    var phone = $('.phone');
    $('#canvas').attr({
        width: phone.width() / 1.32 + 'px',
        height: phone.height() / 1.45 + 'px'
    });
});
