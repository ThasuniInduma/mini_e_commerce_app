import 'package:intl/intl.dart';

final _formatter = NumberFormat.currency(
  locale: 'en_US',
  symbol: 'Rs. ',
  decimalDigits: 0,
);

String formatCurrency(double amount) => _formatter.format(amount);
