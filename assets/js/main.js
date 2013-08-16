$(document).ready(function(){
    // This blocks the button default event and fires the field input but allows for styling.

    var realFileField = $('#js-file-field');

    $('#js-file-btn').click(function(e){
        e.preventDefault();
        realFileField.click();
    });

    realFileField.change(function(){
        var filePath = $(this).val();
        var fileName = filePath.substr(filePath.lastIndexOf('\\')+1);

        $('#js-file-name').html(fileName).addClass('fade-in');
        $('.start-again').addClass('fade-in');
    });

    new FormValidator('psd-form', [{
    name: 'psd',
    display: 'PSD file',
    rules: 'required'
    }], function(errors, evt) {
        var errorWrap = $('.errors-box');
        if (errors.length > 0) {

            var errorString = '';

            for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
                errorString += '<p class="errors-box__message">' + errors[i].message + '<p>';
            }

            errorWrap.html(errorString);
            setTimeout(function(){
                errorWrap.fadeOut('fast', function(){
                    errorWrap.empty();
                });
            },3000);
        }
        // This stops the form from firing if there are errors
        if (evt && evt.preventDefault) {
            evt.preventDefault();
        } else if (event) {
            event.returnValue = false;
        }
    });
});


