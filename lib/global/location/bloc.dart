import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turaiev_test/global/location/util.dart';

part 'event.dart';
part 'state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({
    LocationState initialState = const LocationState(),
  }) : super(initialState);

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    switch(event.runtimeType) {
      case UpdateLocationEvent: {
        yield* _mapUpdateLocationEvent(event as UpdateLocationEvent);
      }
    }
  }

  Stream<LocationState> _mapUpdateLocationEvent(UpdateLocationEvent event) async* {
    yield state.copyWith(location: event.location);
  }
}