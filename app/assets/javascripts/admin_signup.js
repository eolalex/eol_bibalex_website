$(document).on("click", "#input", ValidateForm);
var ValidateForm = function() {
	var username = document.getElementsByName("user[username]")[0].value,
	    email = document.getElementsByName("user[email]")[0].value,
	    password = document.getElementsByName("user[password]")[0].value,
	    passwordConfirmation = document.getElementsByName("user[password_confirmation]")[0].value,
	    emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
	    passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./;

	if ((email != '') && !(emailRegex).test(email.toLowerCase())) {
		alert("Invalid Email Format");
		return false;
	}
	if ((password != '') && (password.length < 6)) {
		alert('Password too short! Must have at least 6 characters');
		return false;
	} else if ((password != '') && !(passwordRegex).test(password)) {
		alert("Password Complexity Requirement not met.\nPassword should contain at least 1 uppercase letter, 1 lowercase letter, one special character, and digits");
		return false;
	}
	if (password != passwordConfirmation) {
		alert("Password and Password Confirmation Do not Match");
		return false;
	}
	return true;
};

