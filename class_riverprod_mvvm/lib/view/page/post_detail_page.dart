import 'package:class_riverprod_mvvm/providers/state_noti_provider/post_detail_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailPage extends StatelessWidget {
  final postId;

  const PostDetailPage({required this.postId, super.key});

  @override
  Widget build(BuildContext context) {
    print("여기는 상세보기 화면 입니다.");

    // 화면을 만들기 위해서 뷰 모델이 관리하는 상태(데이터)가 필요 하다.
    // postDetailViewModelProvider 에 패밀리 중에 하나를 가져 와야 한다.
    final postState = ref.watch(postDetailViewModelProvider(postId));
    // post <-- 데이터 타입이 뭘까? AsyncValue<Post> 객체 이다.

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세보기 화면'),
      ),
      body: postState.when(
        data: (post) => Padding(padding: EdgeInsets.all(16.0)),
        error: (e, stack) => Center(
          child: Column(
            children: [

            ],
          )
        ),
      ),
    );
  }
}
