import 'package:intl/intl.dart';

class FuncionesVarias {
  FuncionesVarias._();

  static String urlApi = 'https://api.openweathermap.org/data/2.5/weather?q=';
  static String apiKey = '2fd5254961627100db569f7cd90e5705';
  static String urlIcono = 'http://openweathermap.org/img/wn/';

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

  static String getUrl(String selectedCity) {
    return '$urlApi$selectedCity&APPID=$apiKey&units=imperial';
  }

  static String getIconUrl(String icon) {
    return '$urlIcono$icon@2x.png';
  }
}
