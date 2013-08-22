$(document).ready(function(){

    function fadeInName(name) {
        $('#js-file-name').empty();
        $('#js-file-name').text(name);
        $('.upload-form__file-actions').show(0,function(){
            $(this).addClass('fade-in');
        });
    };

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
        fadeInName(fileName);
        GoSquared.DefaultTracker.TrackEvent('Upload method',{type: web});
    });

    $('#js-file-dropbox').click(function(e){
        e.preventDefault();
        Dropbox.choose({
            linkType: "direct",
            multiselect: false,
            extensions: ['.psd'],
            success: function(files) {
                realFileField.html(realFileField.html());
                $('#js-dropbox-field').val(files[0].link);
                fadeInName(files[0].name);
                GoSquared.DefaultTracker.TrackEvent('Upload method',{type: dropbox});
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
        })
    },
    rules: {
        psd: {
            required: function(element) {
                return $('#js-dropbox-field').val().length == 0;
            },
            extension: 'psd'
        }
    },
    messages: {
        psd: {
            required: "You need to choose a psd"
        }
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

        GoSquared.DefaultTracker.TrackEvent('Start over');
    });


    $('.font-list__buy-font').click(function(){
        var fontName = $(this).data('font-name');
        GoSquared.DefaultTracker.TrackEvent('Buy link clicked',{name: fontName});
    });
});


