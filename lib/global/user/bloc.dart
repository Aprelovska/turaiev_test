import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    UserState initialState = const UserState(),
  }) : super(initialState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    switch(event.runtimeType) {
    }
  }
}