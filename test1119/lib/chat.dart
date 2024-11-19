import 'package:flutter/material.dart';

import 'board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, String>> _messages = [
    {
      'sender': '상대',
      'message': '안녕하세요!',
      'time': '2024-11-18 10:00 AM',
    },
    {
      'sender': '나',
      'message': '반갑습니다 😊',
      'time': '2024-11-18 10:01 AM',
    },
  ]; // 초기 메시지 리스트

  void _sendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': '나', // 보낸 사람
          'message': messageText,
          'time': TimeOfDay.now().format(context),
        });
      });
      _messageController.clear(); // 입력창 비우기
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1:1 채팅', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        actions: [],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/chat/gojo.png'), // 프로필 이미지
                  ),
                  SizedBox(height: 8),
                  Text(
                    '고죠 사토루', // 닉네임
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.orange),
              title: Text('마이페이지'),
              onTap: () {
                // 마이페이지 이동 동작 추가
              },
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.orange),
              title: Text('등교하기'),
              onTap: () {
                // 등교하기 동작 추가
              },
            ),
            ListTile(
              leading: Icon(Icons.message, color: Colors.orange),
              title: Text('게시판'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AmigoPage()), // 게시판 페이지로 이동
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.orange),
              title: Text('포인트 충전하기'),
              onTap: () {
                // 포인트 충전하기 동작 추가
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.online_prediction, color: Colors.orange),
              title: Text('온라인 친구'),
              onTap: () {
                // 온라인 친구 동작 추가
              },
            ),
            ListTile(
              leading: Icon(Icons.offline_bolt, color: Colors.orange),
              title: Text('오프라인 친구'),
              onTap: () {
                // 오프라인 친구 동작 추가
              },
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('나가기'),
              onTap: () {
                // 나가기 동작 추가
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          // 채팅 화면
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        final isUserMessage = message['sender'] == '나';
                        return ListTile(
                          leading: isUserMessage ? null : CircleAvatar(child: Text('상대')),
                          trailing: isUserMessage ? CircleAvatar(child: Text('나')) : null,
                          title: Align(
                            alignment: isUserMessage
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(message['message']!),
                          ),
                          subtitle: Align(
                            alignment: isUserMessage
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(message['time']!),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: '메시지 입력',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.orange),
                        onPressed: _sendMessage, // 메시지 전송 동작
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
