// Model class representing user data
import 'package:crowncreation/utils/formatters/formatter.dart';

class UserModel {
  // keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // constructor for UserModel.
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // helper function to get the full name.
  String get fullName => '$firstName $lastName';

  // helper function to format phone number.
  String get formattedPhoneNo => KFormatter.formatPhoneNumber(phoneNumber);

  // static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");
}
