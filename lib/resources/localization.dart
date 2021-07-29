import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turaiev_test/global/location/bloc.dart';
import 'package:turaiev_test/global/location/util.dart';
import 'package:turaiev_test/global/log.dart';
import 'package:turaiev_test/resources/localizations/en.dart' as en;
import 'package:turaiev_test/resources/localizations/ru.dart' as ru;

enum TextId {
  settings,
  saved,
  followers,
  likes,
  following,
  outfits,
  publications,
}

extension LocalizationContext on BuildContext {
  String getText(TextId id) => Localization.byContextAndId(context: this, id: id);
}

class Localization {
  static const fallbackLocation = LocationUtil.defaultLocation;

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
    final location = context.read<LocationBloc>().state.location;
    return byLocationAndId(
      location: location,
      id: id,
    );
  }
}