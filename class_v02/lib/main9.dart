import 'package:flutter/material.dart';

void main() {
  runApp(FeedbackFormApp());
}

// 한 파일안에 여러개의 클래스를 만들 수 있다.

class FeedbackFormApp extends StatelessWidget {
  const FeedbackFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: FeedbackForm(),
    );
  }
}

// 상태 변경 가능한 UI 선언
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>(); // 폼 상태를 추적하기 위한 글로벌 키
  int _rating = 0;
  bool _subscribe = false;
  String _name = '';
  String _email = '';
  String _comments = '';
  String _successMessage = '';
  double _satisfaction = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('FeedbackForm'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: SingleChildScrollView(
          // formField 터치시 소프트 키보드가 올라 옴. 여백 공간 적절히 줘야 함
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: '이름',
                      hintText: '홍길동',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    // 입력 값 검증
                    if (value == null || value.isEmpty) {
                      return '이름을 입력해주세요.';
                    } else {
                      // 정상적으로 입력 했다면
                      return null;
                    }
                  }, // end of validator
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: '이메일',
                      hintText: 'abc@naver.com',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    // 입력 값 검증
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력해주세요.';
                    } else {
                      // 정상적으로 입력 했다면
                      return null;
                    }
                  }, // end of validator
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  maxLines: 4, // 여러줄 입력가능

                  decoration: InputDecoration(
                      labelText: '코멘트',
                      hintText: '경험을 공유해주세요',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    // 입력 값 검증
                    if (value == null || value.isEmpty) {
                      return '코멘트를 입력해주세요.';
                    } else {
                      // 정상적으로 입력 했다면
                      return null;
                    }
                  }, // end of validator
                  onSaved: (value) {
                    _comments = value!;
                  },
                ),
                const SizedBox(height: 24),
                Text(
                  '우리 앱은 어떻게 평가하시겠습니까?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            // 버그는 추후 수정
                            // 선택한 점수로 설정
                            _rating = index + 1; // index는 0 부터 시작해서
                          });
                        },
                        color: Colors.deepPurple,
                        icon: Icon(
                            _rating > index ? Icons.star : Icons.star_border),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '고객 서비스 만족도는 어느 정도입니까?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Slider(
                  value: _satisfaction,
                  min: 0,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      print('value $value');
                      // _si = value;
                      _satisfaction = value;
                    });
                  },
                  divisions: 10,
                  // 슬라이더 구간 설정
                  label: '슬라이더 라벨값 설정 가능',
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('뉴스레터를 구독하시겠습니까?'),
                  value: _subscribe,
                  onChanged: (value) {
                    setState(() {
                      _subscribe = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // 통과
                      _formKey.currentState!.save(); // 실행
                      // 변수에 값 할당
                      setState(() {
                        _successMessage = '제출이 완료 되었습니다';
                      });
                    } else {
                      // 실패
                      setState(() {
                        _successMessage = '';
                      });
                    }
                  },
                  child: const Text('제출'),
                ),
                // 다트 문법 활용
                if (_successMessage.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      _successMessage,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
