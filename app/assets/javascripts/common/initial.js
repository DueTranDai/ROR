$(document).ready(function () {
    $('.submit-form').keypress(function (e) {
        if (e.which == 13) {
            $(this).closest('form').submit();
        }
    });

    $('.select2').select2();

    $('[data-toggle="tooltip"]').tooltip();
});