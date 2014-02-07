$(document).ready(function(){

    var dropboxBtn = $('#js-file-dropbox'),
        dropboxFile = $('#js-dropbox-field'),
        uploadForm = $('.upload-form'),
        flash = $('.js-flash'),
        clipButton = $('#js-copy-btn');;


    dropboxBtn.click(function(e){
        e.preventDefault();
        //GoSquared.DefaultTracker.TrackEvent('Upload method - Dropbox');
        Dropbox.choose({
            linkType: 'direct',
            multiselect: false,
            extensions: ['.psd'],
            success: function(files) {
                dropboxFile.val(files[0].link);
                dropboxBtn.addClass('added');
            }
        });
    });

    uploadForm.on('submit', function() {
        if(dropboxFile.val().length != 0) {
            $('.upload-form__btn--submit').html('uploading...').addClass('uploading');
        } else {
            $('.js-flash').fadeIn().delay(3000).fadeOut();
            return false;
        }
    });



    ZeroClipboard.config({ moviePath: '/ZeroClipboard.swf' });

    var clip = new ZeroClipboard(clipButton);

    clip.on('complete', function(client, args) {
        clipButton.html('copied!');
    });

    // Event for seeing if a user goes to buy a font
    $('.font-list__buy-font').click(function(){
        //_gs('event', 'Font buy link clicked');
    });
});


