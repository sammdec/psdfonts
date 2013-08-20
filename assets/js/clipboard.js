$(document).ready(function(){
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
});
