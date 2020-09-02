import 'package:intl/intl.dart';

extension NumberParsing on num {
  String toCurrency() {
    var formatter = NumberFormat("#,###");
    return formatter.format(this);
  }
}
