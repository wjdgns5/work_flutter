

// 새로운 개념 추가

import 'package:class_riverprod_mvvm/providers/provider/post_repository_provider.dart';
import 'package:class_riverprod_mvvm/repository/post_repository.dart';
import 'package:class_riverprod_mvvm/repository/post_repository_impl.dart';
import 'package:class_riverprod_mvvm/view_models/post_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/post.dart';

final postDetailViewModelProvider
  = StateNotifierProvider.family<PostDetailViewModel, AsyncValue<Post>, int>((ref, postId) {
// 1. postId 값은 family 를 통해 전달받은 외부 매개변수로, 특정 게시글을 식별하는데 사용된다.
 final postRepository = ref.read(postRepositoryProvider);
    return PostDetailViewModel(postRepository, postId);

});

