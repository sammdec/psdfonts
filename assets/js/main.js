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
            if (evt){
                evt.preventDefault();
            } else if (event) {
                event.returnValue = false;
            }
            
            var errorString = '';

            for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
                errorString += '<p class="errors-box__message">' + errors[i].message + '<p>';
            }

            errorWrap.html(errorString);
            console.log(errors);
            setTimeout(function(){
                errorWrap.fadeOut('fast', function(){
                });
            },3000);
        };
    });
});


