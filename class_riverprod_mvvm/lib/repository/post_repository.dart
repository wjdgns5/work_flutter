
import '../models/post.dart';

// Flutter에는 interface가 없다. 그래서 abstract를 사용한다.
abstract class PostRepository {

  // 모든 게시글 목록을 가져온다.
  Future<List<Post>> fetchPosts();
  // 새로운 게시글을 생성한다.
  Future<Post> createPost(Post post);  // post.toJson() 이랑 통신 할거
  // 기존 게시글을 수정한다.
  Future<Post> updatePost(Post post);

  // 특정 게시글을 삭제한다. 게시글 PK
  Future<void> deletePost(int id);

  // 특정 게시글 하나를 요청한다. 게시글 PK
  Future<Post> fetchPostById(int id);

}