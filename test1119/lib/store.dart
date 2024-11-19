import 'package:flutter/material.dart';
import 'dart:math';

import 'board.dart';
import 'chat.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AvatarGridPage(),
  ));
}

class AvatarGridPage extends StatefulWidget {
  @override
  _AvatarGridPageState createState() => _AvatarGridPageState();
}

class _AvatarGridPageState extends State<AvatarGridPage> {
  final List<Map<String, dynamic>> avatarData = [
    {'name': '아프로 헤어', 'type': 1, 'owned': false, 'image': 'assets/images/market/avatar1.png'},
    {'name': '우주해적', 'type': 1, 'owned': false, 'image': 'assets/images/market/avatar2.png'},
    {'name': '하츠네미쿠', 'type': 1, 'owned': false, 'image': 'assets/images/market/avatar3.png'},
    {'name': '운동화', 'type': 4, 'owned': false, 'image': 'assets/images/market/geto.png'},
    {'name': '롱 헤어', 'type': 1, 'owned': false, 'image': 'assets/images/market/gojo.png'},
    {'name': '정장 바지', 'type': 3, 'owned': false, 'image': 'assets/images/market/avatar1.png'},
    {'name': '폭풍간지재킷', 'type': 1, 'owned': false, 'image': 'assets/images/market/avatar2.png'},
    {'name': '탱크톱', 'type': 2, 'owned': false, 'image': 'assets/images/market/geto.png'},
    {'name': '돌핀팬츠', 'type': 3, 'owned': false, 'image': 'assets/images/market/gojo.png'},
    {'name': '캔버스화', 'type': 4, 'owned': false, 'image': 'assets/images/market/female_head.png'},
    {'name': '남자 기본 아바타', 'type': 1, 'owned': false, 'image': 'assets/images/market/male_body.png'},

    {'name': '여자 기본 아바타', 'type': 1, 'owned': false, 'image': 'assets/images/market/female_body.png'},
    {'name': '해적 모자', 'type': 5, 'owned': false, 'image': 'assets/images/market/avatar3.png'},
    {'name': '로봇 팔', 'type': 6, 'owned': false, 'image': 'assets/images/market/female_body.png'},
    {'name': '스포츠 점퍼', 'type': 1, 'owned': false, 'image': 'assets/images/market/femailDefault.png'},
    {'name': '캐주얼 팬츠', 'type': 3, 'owned': false, 'image': 'assets/images/market/gojo.png'},
    {'name': '클래식 슈즈', 'type': 4, 'owned': false, 'image': 'assets/images/market/avatar1.png'},
    {'name': '고글', 'type': 5, 'owned': false, 'image': 'assets/images/market/avatar3.png'},
    {'name': '우주복', 'type': 6, 'owned': false, 'image': 'assets/images/market/avatar2.png'},
    {'name': '산타 모자', 'type': 5, 'owned': false, 'image': 'assets/images/market/avatar1.png'},
    {'name': '동물 잠옷', 'type': 1, 'owned': false, 'image': 'assets/images/market/geto.png'},
    {'name': '힙합 모자', 'type': 5, 'owned': false, 'image': 'assets/images/market/female_head.png'},
    {'name': '캐주얼 셔츠', 'type': 2, 'owned': false, 'image': 'assets/images/market/logo3.png'},
    {'name': '스니커즈', 'type': 4, 'owned': false, 'image': 'assets/images/market/gojo.png'},
  ];


  int userPoints = 50000; // 사용자 포인트

  void _showPurchaseDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('구매 확인'),
        content: Text('${avatarData[index]['name']}을(를) 구매하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 다이얼로그 닫기
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                avatarData[index]['owned'] = true; // 아이템 구매 처리
              });
              Navigator.pop(context); // 다이얼로그 닫기
              _showSuccessMessage();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('구매가 완료되었습니다!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/market/logo3.png',
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 한 줄에 3개의 카드
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.65, // 카드 높이를 늘림
          ),
          itemCount: avatarData.length,
          itemBuilder: (context, index) {
            final avatar = avatarData[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          avatar['image'],
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(Icons.error, color: Colors.red),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      avatar['name'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Type: ${avatar['type']}',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Price: ${avatar['price']} points',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: avatar['owned']
                          ? null
                          : () {
                        _showPurchaseDialog(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: avatar['owned'] ? Colors.grey : Colors.white,
                        foregroundColor: avatar['owned'] ? Colors.white : Colors.brown,
                        side: BorderSide(color: Colors.brown),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(80, 30),
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                      child: Text(
                        avatar['owned'] ? 'Owned' : 'Add to Cart',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
