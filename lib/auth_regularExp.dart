
class AuthValidator {
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$',
  );

  static final RegExp emailRegex = RegExp(
    r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
  );


}
