
// PostRepositoryImpl 인스턴스를 제공하는 Riverpod Provider 계열 입니다.

// 컨테이너에 넣는 코드
import 'package:class_riverprod_mvvm/providers/provider/dio_provider.dart';
import 'package:class_riverprod_mvvm/repository/post_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// (ref) {...} 익명 함수이며, ref는 Riverpod 에서 제공하는 통로를 담당하는 객체 입니다.
// ref를 통해 프로바이더 내에서 다른 프로바이더를 읽거나 라이프사이클을 관리할 수 있다.
final postRepositoryProvider = Provider<PostRepositoryImpl>( (ref) {

  // ref 객체를 통해 다른 Provider에 접근을 마음대로 할 수 있다.
  final dio = ref.read(dioProvider);
  // 의존성 주입 -> dio는 provider가 관리하고 있는 개체라 프로바이더를 통해서 가져왔다.
  return PostRepositoryImpl(dio);
});


