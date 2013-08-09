new FormValidator('psd-form', [{
	name: 'psd',
	display: 'PSD file',
	rules: 'required'
}], function(errors, evt) {
    var errorWrap = $('.errors-box');
    if (errors.length > 0) {

        var errorString = '';

        for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
            errorString += errors[i].message + '<br />';
        }

        errorWrap.innerHTML = errorString;
    }

    if (evt && evt.preventDefault) {
    	evt.preventDefault();
    } else if (event) {
        event.returnValue = false;
    }
});