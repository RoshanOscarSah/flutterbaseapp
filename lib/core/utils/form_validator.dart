import '../utils/valid.dart';

String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return "Email is required";
  } else if (value.isValidEmail && value.length <= 254 && value.isNotEmpty) {
    return null;
  } else {
    return "Enter valid email with @ and .";
  }
}

String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return "Password is required";
  } else if (value.length <= 254 && value.length >= 8) {
    return null;
  } else {
    return "Enter atleast 8 character.";
  }
}

String? nameValidator(String? value) {
  if (value!.isEmpty) {
    return "This field is required";
  } else if (value.isValidName && value.length <= 100 && value.isNotEmpty) {
    return null;
  } else {
    return "Enter Letters only.";
  }
}

String? usernameValidator(String? value) {
  if (value!.isEmpty) {
    return "Username is required";
  } else if (value.isValidUsername && value.length <= 150 && value.isNotEmpty) {
    return null;
  } else {
    return "Enter Letters, digits and @ . + - _ only.";
  }
}

String? phoneValidator(String? value) {
  if (value!.isEmpty) {
    return "Phone number is required";
  } else if (value.isValidPhone && value.length == 10 && value.isNotEmpty) {
    return null;
  } else {
    return "Enter digits and - ( ) + only.";
  }
}
