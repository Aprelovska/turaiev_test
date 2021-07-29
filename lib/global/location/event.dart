part of 'bloc.dart';

abstract class LocationEvent {
  const LocationEvent();
}

class UpdateLocationEvent extends LocationEvent {
  const UpdateLocationEvent({
    required this.location,
  });

  final Location location;
}