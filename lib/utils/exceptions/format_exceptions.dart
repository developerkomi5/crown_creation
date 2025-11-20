// custom exception class to handle various format-related errors.
class KFormatException implements Exception {
  // the associated error message.
  final String message;

  // Default constructor with generic error message.
  const KFormatException([
    this.message =
        'An unexpected format error occurred. Please check your input.',
  ]);

  // create a format exception from a specific error message.
  factory KFormatException.fromMessage(String message) {
    return KFormatException(message);
  }

  // get the corresponding error message.
  String get formattedMessage => message;

  // create a format exception from specific error code.
  factory KFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const KFormatException(
          'The email address format is invalid. Please enter a valid email.',
        );
      case 'invalid-phone-number-format':
        return const KFormatException(
          'The Provided phone number is invalid. Please enter a valid number',
        );
      case 'invalid-date-format':
        return const KFormatException(
          'The date format is invalid. Please enter a valid date.',
        );
      case 'invalid-url-format':
        return const KFormatException(
          'The URL format is invalid. Please enter a valid URL.',
        );
      case 'invalid-credit-card-format':
        return const KFormatException(
          'The credit card format is invalid. Please enter a valid credit card number.',
        );
      case 'invalid-numeric-format':
        return const KFormatException(
          'The input should be valid numeric format.',
        );
      default:
        return const KFormatException(
          'An unexpected Firebase error occurred. Please try again.',
        );
    }
  }
}
