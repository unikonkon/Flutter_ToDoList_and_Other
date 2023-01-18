import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String title;
  final String titledata;
  bool? isDone;
  bool? isDeleted;

  Data({
    required this.title,
    required this.titledata,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }
  Data copyWith({
    String? title,
    String? titledata,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Data(
      title: title ?? this.title,
      titledata: titledata ?? this.titledata,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'titledata': titledata,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      title: map['title'] ?? '',
      titledata: map['titledata'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        titledata,
        isDone,
        isDeleted,
      ];
}
