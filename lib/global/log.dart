enum LogType {
  info,
  error,
  warning,
}

extension on LogType {
  String get name {
    switch (this) {
      case LogType.info: return 'INFO';
      case LogType.error: return 'ERROR';
      case LogType.warning: return 'WARNING';
    }
  }
}

class Log {
  static void write(String str, {
    required LogType type,
  }) {
    print('[${DateTime.now()}] ${type.name}: $str');
  }

  static void info(String str) => write(str, type: LogType.info);

  static void error(String str) => write(str, type: LogType.error);

  static void warning(String str) => write(str, type: LogType.warning);
}