$(document).ready(function(){
    // This blocks the button default event and fires the field input but allows for styling.

    var realFileField = $('#js-file-field');
    var errorWrap = $('.errors-box');

    $('#js-file-btn').click(function(e){
        e.preventDefault();
        realFileField.click();
        errorWrap.removeClass('fade-in').hide();
    });

    realFileField.change(function(){
        var filePath = $(this).val();
        var fileName = filePath.substr(filePath.lastIndexOf('\\')+1);

        $('#js-file-name').text(fileName);
        $('.upload-form__file-actions').show(0,function(){
            $(this).addClass('fade-in');
        });
    });

   formValidator = new FormValidator('psd-form', [{
    name: 'psd',
    display: '.psd',
    rules: 'required|is_file_type[psd]',
    }], function(errors, evt) {

        if (errors.length > 0) {
            if (evt){
                evt.preventDefault();
            } else if (event) {
                event.returnValue = false;
            }
            
            var errorString = '';

            for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
                errorString += '<p class="errors-box__message">' + errors[i].message + '</p>';
            }

            errorWrap.html(errorString).show(0,function(){
                $(this).addClass('fade-in');
            });

            // This stops the form from firing if there are errors
            if (evt && evt.preventDefault) {
                evt.preventDefault();
            } else if (event) {
                event.returnValue = false;
            };
        } else {
            GoSquared.DefaultTracker.TrackEvent('Upload Success');
        };
    });

    formValidator.setMessage('required', 'You must choose a %s file');
    formValidator.setMessage('is_file_type', 'The file must be a %s');

    var clipButton = $('#js-copy-btn');
    var clip = new ZeroClipboard( clipButton, {
        moviePath: '/assets/zero-clipboard.swf',
        hoverClass: 'clipboard-is-hover'
    });

    clip.on('complete', function(client, args) {
        var originalText = clipButton.text();
        var copiedText = clipButton.data('copy-text');

        clipButton.text(copiedText).addClass('attn-grab');
        setTimeout(function(){
            clipButton.removeClass('attn-grab');
        },6000);

        GoSquared.DefaultTracker.TrackEvent('Start over');
    });

    $('.font-list__buy-font').click(function(){
        var fontName = $(this).data('font-name');
        GoSquared.DefaultTracker.TrackEvent('Buy link clicked',{name: fontName});
        console.log(fontName);
    });
});


