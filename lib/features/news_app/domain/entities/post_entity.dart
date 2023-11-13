import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final String? dated;

  const PostEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.dated
  });

  @override
  List<Object?> get props{
    return [
      id,
      title,
      description,
      image,
      dated,
    ];
  }
}
