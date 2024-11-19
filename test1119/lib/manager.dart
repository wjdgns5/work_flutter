import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amigo Admin', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
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
                  Text('amigo', style: TextStyle(color: Colors.white, fontSize: 24)),
                  SizedBox(height: 8),
                  Text('ADMIN', style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.orange),
              title: Text('대시보드'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.orange),
              title: Text('회원 관리'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.article, color: Colors.orange),
              title: Text('게시글 관리'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.orange),
              title: Text('결제 관리'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.campaign, color: Colors.orange),
              title: Text('광고 관리'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.announcement, color: Colors.orange),
              title: Text('공지 관리'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.report, color: Colors.orange),
              title: Text('신고 관리'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, color: Colors.orange),
              title: Text('통계'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 유저 수, 가입자 수, 하루 방문 수, 총 매출 금액
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDashboardCard('유저 수', '11명', Icons.person, Colors.purple),
                _buildDashboardCard('가입자 수', '13명', Icons.how_to_reg, Colors.orange),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDashboardCard('하루 방문 수', '0명', Icons.public, Colors.blue),
                _buildDashboardCard('총 매출 금액', '₩511,000', Icons.attach_money, Colors.green),
              ],
            ),
            SizedBox(height: 16),

            // 가장 인기 많은 상품 TOP 3 - 좌우로 끝까지 확장
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildPopularProducts(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // 성별 및 나이 분포 차트
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildPieChart('남녀 성비')),
                  SizedBox(width: 16),
                  Expanded(child: _buildBarChart('나이 분포')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 대시보드 카드 생성
  Widget _buildDashboardCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 8),
              Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  // 가장 인기 많은 상품 TOP 3
  Widget _buildPopularProducts() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('가장 인기 많은 상품 TOP 3', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('1. 정장 바지', style: TextStyle(fontSize: 14)),
            Text('2. 폭풍간지재킷', style: TextStyle(fontSize: 14)),
            Text('3. 돌핀팬츠', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  // 성별 및 나이 분포 차트
  Widget _buildPieChart(String title) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: Center(
                child: Icon(Icons.pie_chart, size: 100, color: Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(String title) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: Center(
                child: Icon(Icons.bar_chart, size: 100, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}