enum VALIDATION_TYPE {
  EMAIL,
  TEXT,
  PASSWORD,
  CONFIRM_PASSWORD,
}

RegExp eMailRegEx = new RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

String isRequired(String val, String fieldName) =>
    (val == null || val == '') ? '$fieldName is required' : null;

String checkPasswordLength(String val) =>
    (val.length < 6) ? 'Password must be 6 characters long' : null;

String checkFieldValidation(
    {String val,
    String fieldName,
    VALIDATION_TYPE fieldType,
    String password}) {
  String errorMsg;
  if (fieldType == VALIDATION_TYPE.TEXT) {
    errorMsg = isRequired(val, fieldName);
  }
  if (fieldType == VALIDATION_TYPE.EMAIL) {
    if (isRequired(val, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (!eMailRegEx.hasMatch(val)) {
      errorMsg = 'Please enter valid email';
    }
  }

  if (fieldType == VALIDATION_TYPE.PASSWORD) {
    if (isRequired(val, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (checkPasswordLength(val) != null) {
      errorMsg = checkPasswordLength(val);
    }
  }

  if (fieldType == VALIDATION_TYPE.CONFIRM_PASSWORD) {
    if (isRequired(val, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (checkPasswordLength(val) != null) {
      errorMsg = checkPasswordLength(val);
    } else if (password != val) {
      errorMsg = 'Confirm password must be identicale';
    }
  }

  return (errorMsg != null) ? errorMsg : null;
}
