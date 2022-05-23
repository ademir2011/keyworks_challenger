class DataFormatUtils {
  static final months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  static String formatDMYh(DateTime date) {
    return '${date.day} de ${months[date.month]} de ${date.year}, ${date.hour}:${date.minute}';
  }
}
