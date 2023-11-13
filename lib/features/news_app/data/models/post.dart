import 'package:test_app/features/news_app/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    int? id,
    String? title,
    String? description,
    String? image,
    String? dated,
  }) : super(
          id: id,
          title: title,
          description: description,
          image: image,
          dated: dated,
        );

  factory PostModel.fromJson(Map<String, dynamic> map) {
    var t = PostModel(
      id: 0,
      title: map["title"] ?? "",
      description: map['description'] ?? "",
      image: map['image'] ?? "",
      dated: map['dated'] ?? "",
    );
    print(t.title);
    return t;
  }
}
