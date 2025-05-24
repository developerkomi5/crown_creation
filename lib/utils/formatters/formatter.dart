import 'package:intl/intl.dart';

class KFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy')
        .format(date); //customize date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10 digit IN phone number format: (91) XXXXX-XXXXX
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    //Add More custom phone number format logic if needed
    return phoneNumber;
  }
}
