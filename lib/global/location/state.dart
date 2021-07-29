part of 'bloc.dart';

class LocationState extends Equatable {
  const LocationState({
    this.location = LocationUtil.defaultLocation,
  });

  final Location location;

  @override
  List<Object?> get props => [location];

  LocationState copyWith({
    Location? location,
  }) => LocationState(
    location: location ?? this.location,
  );
}