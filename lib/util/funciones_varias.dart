import 'package:intl/intl.dart';

class FuncionesVarias {
  FuncionesVarias._();

  static String getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat("d 'de' MMMM yyyy", 'es_ES');
    String formattedDate = formatter.format(now);

    formattedDate = formattedDate.replaceFirst(
      formattedDate.substring(
          formattedDate.indexOf('de') + 3, formattedDate.indexOf('de') + 4),
      formattedDate
          .substring(
              formattedDate.indexOf('de') + 3, formattedDate.indexOf('de') + 4)
          .toUpperCase(),
    );

    return formattedDate;
  }
}
