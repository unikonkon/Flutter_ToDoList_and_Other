import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_todolist/personal_data/data_model.dart';

import 'package:meta/meta.dart';

part 'personal_event.dart';
part 'personal_state.dart';

class PersonalBloc extends Bloc<PersonalEvent, PersonalState> {
  PersonalBloc() : super(const PersonalState()) {
    on<OnAddata>(_onAddData);
    // on<OnDletedata>(_onDletedata);
  }

  Future<void> _onAddData(
    OnAddata event,
    Emitter<PersonalState> emit,
  ) async {
    final state = this.state;
    emit(
      PersonalState(allData: List.from(state.allData)..add(event.data)),
    );
  }

  // Future<void> _onDletedata(
  //   OnDletedata event,
  //   Emitter<PersonalState> emit,
  // ) async {
  //   final state = this.state;
  //   emit(
  //     PersonalState(allData: List.from(state.allData)..remove(event.data)),
  //   );
  // }
}
