part of 'personal_bloc.dart';

// enum PostStatus { initial, success, failure }

class PersonalState extends Equatable {
  const PersonalState({
    this.allData = const <Data>[],
  });

  final List<Data> allData;

  PersonalState copyWith({
    List<Data>? allData,
  }) {
    return PersonalState(
      allData: allData ?? this.allData,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [allData];
}
