// custom exception class to handle various firebase-related errors.
class KFirebaseException implements Exception {
  // the error code associated with the exception.
  final String code;

  // constructor that takes an error code.
  KFirebaseException(this.code);

  // get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The wmail address is already registered. Please use a different email.';
      case 'wrong-password':
        return 'Incorrect Password. Please check your password and try again.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not allowed':
        return 'This operation is not allowed. Contact Support for assistance.';
      case 'invalid-credentials':
        return 'The supplied credentials is malformed or has expired.';
      case 'invalid-verifiation-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';
      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
