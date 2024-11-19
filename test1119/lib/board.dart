import 'package:flutter/material.dart';
import 'package:test1119/store.dart';

import 'chat.dart';
import 'login.dart';
import 'manager.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AmigoPage(),
    ),
  );
}

class AmigoPage extends StatefulWidget {
  @override
  _AmigoPageState createState() => _AmigoPageState();
}

class _AmigoPageState extends State<AmigoPage> {
  int? _selectedPostIndex; // 게시글 선택 상태 관리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 상단 로고와 제목
            Row(
              children: [
                Image.asset(
                  'assets/images/board/logo3.png', // 로고 이미지 경로
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 8),
                Text(
                  'amigo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 로그아웃 버튼 클릭 시 login.dart로 이동
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false, // 이전의 모든 라우트를 제거
                    );
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white, // 배경색
                      backgroundImage: AssetImage('assets/images/board/gojo.png'), // 이미지 경로
                      onBackgroundImageError: (error, stackTrace) {
                        print("Error loading image: $error"); // 이미지 로드 오류 처리
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      '고조 사토루',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('마이페이지'),
                onTap: () {
                  Navigator.pop(context); // Drawer 닫기
                },
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Text('채팅'), // 채팅 추가
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()), // ChatPage로 이동
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.store),
                title: Text('상점'), // 상점 추가
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvatarGridPage()), // store.dart로 이동
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('등교하기'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.online_prediction),
                title: Text('온라인 친구'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.offline_bolt),
                title: Text('오프라인 친구'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 4, // 게시판 종류 4개
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    index == 0
                        ? "조회수가 많은 게시글"
                        : index == 1
                        ? "댓글이 많은 게시글"
                        : index == 2
                        ? "최신글"
                        : "하트가 많은 게시글",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  // 각 게시판 내 게시글 4개씩 표시
                  ListView.builder(
                    itemCount: 4, // 각 카테고리별 게시글 4개씩
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, postIndex) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedPostIndex = postIndex;
                          });
                        },
                        splashColor: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Text(
                            "• 제목: 게시글 ${postIndex + 1}\n  작성자: 사용자${postIndex + 1}\n  작성일: 11/18 16:29",
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade900,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Github: https://github.com/GreenAcademyTeam4/Amigo',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
