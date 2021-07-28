import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turaiev_test/global/log.dart';
import 'package:turaiev_test/resources/locations/en.dart' as en;
import 'package:turaiev_test/resources/locations/ru.dart' as ru;

enum Location {
  en,
  ru,
}

extension on Location {
  String get name {
    switch(this) {
      case Location.en: return 'EN';
      case Location.ru: return 'RU';
    }
  }
}

enum TextId {
  profileScreenTitle,
}

class Localization {
  static const fallbackLocation = Location.en;

  static const Map<Location, Map<TextId, String>> _localizations = {
    Location.en: en.localization,
    Location.ru: ru.localization,
  };

  static String byLocationAndId({
    required Location location,
    required TextId id,
  }) {
    final loc = _localizations[location];
    if (loc == null) {
      Log.warning('${location.name} location is not implemented, falling back to ${fallbackLocation.name} location');
    }
    final localization = loc ?? _localizations[fallbackLocation] ?? (throw UnimplementedError('$fallbackLocation location is not implemented'));
    return localization[id] ?? (throw UnimplementedError('$id is not implemented'));
  }

  static String byContextAndId({
    required BuildContext context,
    required TextId id,
  }) {
    final location = context.read<Bloc>().state.location; // TODO somehow get localization
    return byLocationAndId(
      location: location,
      id: id,
    );
  }
}