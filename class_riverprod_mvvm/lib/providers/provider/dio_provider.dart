import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Http 통신을 위한 Dio 인스턴스를 굳이 매번 생성할 필요가 없다.
/// 그래서 싱글톤 인스턴스를 생성해서 애플리케이션 전역에서 재사용 하기로 한다.

// 전역에서 재사용 가능한 Dio 싱글톤 인스턴스를 제공 합니다.
final dioProvider = Provider<Dio>( (ref) {
  return _dioInstance;
} );

// final Dio _dioInstance = new Dio();
// _dioInstance는 이 파일 안에서만 사용할 수 있는 private 변수입니다.
final Dio _dioInstance = Dio(
  BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com', // API의 기본 URL 설정
    connectTimeout: const Duration(seconds: 5), // 연결 시간 초과
    receiveTimeout: const Duration(seconds: 3), // 응답 시간 초과
    validateStatus: (status) => true, // 모든 상태 코드를 허용하면 예외를 발생시키지 않음 중요!!
    headers: {
      'Content-Type' : 'application/json', // 요청 헤더 설정 
      // 필요한 경우 'Authorization' : Be.... 토큰 값
    }

  )
); // new 생략 가능
