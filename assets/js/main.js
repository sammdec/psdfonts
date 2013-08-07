new FormValidator('psd-form', [{
	name: 'psd',
	display: 'PSD file',
	rules: 'required'
}], function(errors, evt) {
    if (errors.length > 0) {
        // Show the errors
        var errorString = '';

        for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
            errorString += errors[i].message + '<br />';
        }

        el.innerHtml = errorString;
    }

    if (evt && evt.preventDefault) {
    	event.preventDefault();
    } else if (event) {
        event.returnValue = false;
    }
});