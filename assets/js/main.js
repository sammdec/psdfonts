$(document).ready(function(){

    function fadeInName(name) {
        $('#js-file-name').empty();
        $('#js-file-name').text(name);
        $('.upload-form__file-actions').show(0,function(){
            $(this).addClass('fade-in');
        });
    };

    var errorWrap = $('.errors-box');

    $('#js-file-dropbox').click(function(e){
        e.preventDefault();
        GoSquared.DefaultTracker.TrackEvent('Upload method - Dropbox');
        Dropbox.choose({
            linkType: "direct",
            multiselect: false,
            extensions: ['.psd'],
            success: function(files) {
                $('#js-dropbox-field').val(files[0].link).valid();
                fadeInName(files[0].name);
            }
        });
    });

   $('.upload-form').validate({
    ignore: "",
    errorLabelContainer: '.errors-box',
    errorElement: 'p',
    errorClass: 'errors-box__message',
    highlight: function(element, errorClass, validClass) {
        $('.errors-box').show(0, function(){
            $(this).addClass('fade-in');
        });
    },
    rules: {
        dropbox_file: {
            required: true
        }
    },
    messages: {
        dropbox_file: {
            required: "You need to choose a psd"
        }
    },
    submitHandler: function(form) {
        form.submit();
        $('.upload-form__btn--submit').html('uploading <i></i>');
        GoSquared.DefaultTracker.TrackEvent('Start Upload');
    }
   });

   var clipButton = $('#js-copy-btn');
    var clip = new ZeroClipboard( clipButton, {
        moviePath: '/zero-clipboard.swf',
        hoverClass: 'clipboard-is-hover'
    });

    clip.on('complete', function(client, args) {
        var originalText = clipButton.text();
        var copiedText = clipButton.data('copy-text');

        clipButton.text(copiedText).addClass('attn-grab');
        setTimeout(function(){
            clipButton.removeClass('attn-grab');
        },6000);

        GoSquared.DefaultTracker.TrackEvent('Upload another');
    });


    $('.font-list__buy-font').click(function(){
        var fontName = $(this).data('font-name');
        GoSquared.DefaultTracker.TrackEvent('Buy link clicked',{name: fontName});
    });
});


