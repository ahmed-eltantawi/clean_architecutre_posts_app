import 'package:equatable/equatable.dart';

/// This is the entity class for Posts
/// Having the important and useful fields of the Post
/// [id], [title], [body]
class PostEntity extends Equatable {
  final int id;
  final String title;
  final String body;

  const PostEntity({required this.id, required this.title, required this.body});

  @override
  /// The fields that will be used to compare the Post
  List<Object?> get props => [id, title, body];
}
