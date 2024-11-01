abstract class RegExpPatterns{
  static const String specialCharactersPattern=r'[~!@#$%^&*()_+`{}|<>?;:./,=\-\[\]]';
  static const String digitPattern=r'\d';
  static const String digit2Pattern=r'[0-9]';
  static const String emptyPattern=' ';
  static const String spacePattern=r'\s';
  static const String twoSpacePattern=r'\s\s';
  static const String upperCasePattern=r'[A-Z]';
  static const String lowerCasePattern=r'[a-z]';
  static const String egyptPhonePrefixPattern='[0][1-9]';
  static const String doubleNumberPattern= r'^\d+(\.\d+)?$';
  static const String atLeast3alphabeticPattern= r'([a-zA-Z].*?){3,}';
}