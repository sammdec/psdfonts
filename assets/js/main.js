$(document).ready(function(){
    // This blocks the button default event and fires the field input but allows for styling.
    $('#js-file-btn').click(function(e){
        e.preventDefault();
        $('#js-file-field').click();
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


