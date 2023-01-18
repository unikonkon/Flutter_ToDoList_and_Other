part of 'personal_bloc.dart';

@immutable
abstract class PersonalEvent extends Equatable {
  const PersonalEvent();
  @override
  List<Object> get props => [];
}

class OnAddata extends PersonalEvent {
  final Data data;
  // final Data titledata;
  const OnAddata({
    required this.data,
    // required this.titledata,
  });
  @override
  List<Object> get props => [data];
}

// class OnDletedata extends PersonalEvent {
//   final Data data;
//   const OnDletedata({
//     required this.data,
//   });
//   @override
//   List<Object> get props => [data];
// }
