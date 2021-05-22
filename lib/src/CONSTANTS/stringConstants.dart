const SOMETHING_WENT_WRONG = "Something went wrong!";
const UNAUTHORIZED_USER = "false";
const NO_INTERNET = "No internet !";
const RUPEES = "\u{20B9}";

extension CapExtension on String {
  //first letter only
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  //all letter in string
  String get allInCaps => this.toUpperCase();
  //all letter in string
  String get allInLower => this.toLowerCase();
  //first letter for each word in a string
  String get capitalizeFirstofEach => this
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
}
