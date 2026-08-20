import 'package:clean_architecutre_posts_app/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const new({required super.id, required super.title, required super.body});

  factory PostModel.formJson(Map<String, dynamic> json) {
    return PostModel(id: json["id"], title: json["title"], body: json["body"]);
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "body": body};
  }
}
