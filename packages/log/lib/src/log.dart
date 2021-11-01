import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(methodCount: 0)
);

class Log {
  static debug({ required String tag, dynamic message }) {
    _logger.d("$tag:: $message");
  }

  static info({ required String tag, dynamic message }) {
    _logger.i("$tag:: $message");
  }

  static error({ required String tag, dynamic message }) {
    _logger.e("$tag:: $message");
  }

  static waring({ required String tag, dynamic message }) {
    _logger.w("$tag:: $message");
  }
}