import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';

/// This is the model class for Posts
/// It extends the [PostEntity]
class PostModel extends PostEntity {
  const new({required super.id, required super.title, required super.body});

  /// Turn Json to [PostModel]
  factory PostModel.formJson(Map<String, dynamic> json) {
    return PostModel(id: json["id"], title: json["title"], body: json["body"]);
  }

  /// Turn [PostModel] to Json
  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "body": body};
  }
}
