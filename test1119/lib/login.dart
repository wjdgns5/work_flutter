import 'package:flutter/material.dart';
import 'board.dart'; // 일반 사용자 페이지
import 'manager.dart'; // 관리자 페이지

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5E6E1), // 배경색 설정
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 상단 로고
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/login/logo3.png',
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // 아이디 입력 필드
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: '아이디',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                // 비밀번호 입력 필드
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                // 자동 로그인 체크박스
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      activeColor: Color(0xFFBA8475),
                    ),
                    Text(
                      '자동로그인',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // 아이디/비밀번호 찾기
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '회원가입 아이디/비밀번호 찾기',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // 로그인 버튼
                ElevatedButton(
                  onPressed: () {
                    // 관리자 진입 조건
                    if (idController.text == 'admin' && passwordController.text == 'admin123') {
                      // 관리자 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardPage()),
                      );
                    } else {
                      // 일반 사용자 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AmigoPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBA8475), // 버튼 색상
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // 소셜 로그인 옵션
                Column(
                  children: [
                    Text(
                      '다른 계정 로그인',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 카카오 로그인 버튼
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/login/kakaologin.png'),
                        ),
                        SizedBox(width: 16),
                        // 네이버 로그인 버튼
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/login/naverlogin.png'),
                        ),
                        SizedBox(width: 16),
                        // 구글 로그인 버튼
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/login/googlelogin.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
