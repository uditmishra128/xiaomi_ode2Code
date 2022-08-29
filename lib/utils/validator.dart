var regEx = RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
RegExp numReg = RegExp(r".*[0-9].*");
RegExp phoneNumReg =
    RegExp(r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$");
RegExp letterReg = RegExp(r".*[A-Za-z].*");

String? emailValidator(String? value) {
  if (!regEx.hasMatch(value!)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your name';
  }
  if (value.length > 30) {
    return 'Exceeded 30 characters';
  }
  return null;
}

String? commanValidator(String? value) {
  if (value!.isEmpty) {
    return 'Feild is require';
  }

  return null;
}

String? uNameValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your user name';
  }
  if (value.length > 15) {
    return 'Exceeded 15 characters';
  }
  return null;
}

String? passValidator(String? value) {
  if (value!.length < 10) {
    return 'can not have less than 10 characters';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (!phoneNumReg.hasMatch(value!)) {
    return 'Enter a valid phone number';
  } else if (value.length > 10) {
    return 'Enter a valid phone number';
  }
  return null;
}
