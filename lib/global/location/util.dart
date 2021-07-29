enum Location {
  en,
  ru,
}

extension LocationUtil on Location {
  static const defaultLocation = Location.en;

  String get name {
    switch(this) {
      case Location.en: return 'EN';
      case Location.ru: return 'RU';
    }
  }
}