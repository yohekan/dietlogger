import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'log_detail_screen.dart';  // 詳細画面をインポート
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDay = DateTime.now();

  // ダミーログデータ（ここは後でDBから取得）
  final List<Map<String, dynamic>> logs = [
    {'date': '2025-03-21', 'meal': 1500, 'workout': 500},
    {'date': '2025-03-20', 'meal': 1700, 'workout': 450},
    {'date': '2025-03-19', 'meal': 1600, 'workout': 400},
  ];

  @override
  Widget build(BuildContext context) {
    // 選択した日のログを取得
    final dailyLogs = logs.where((log) =>
        log['date'] == _selectedDay.toIso8601String().split('T')[0]).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        backgroundColor: Colors.green,
      ),
        body: Column(
          children: [
            SizedBox(
              height: 400,
              // カレンダー表示
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.sunday,
                locale: 'ja_JP',  // ← 日本語表示
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _selectedDay,
                headerVisible: true,
                availableCalendarFormats: const {
                  CalendarFormat.month: '月表示',
                },
                calendarFormat: CalendarFormat.month,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, _ ){
                    return _buildDay(date, isSelected: isSameDay(_selectedDay, date));
                  }
                ),
              ),
            ),
            const SizedBox(height: 10),
            // ログ一覧
            Expanded(
              child: dailyLogs.isEmpty
                  ? const Center(child: Text('この日の記録はありません'))
                  : ListView.builder(
                      itemCount: dailyLogs.length,
                      itemBuilder: (context, index) {
                        final log = dailyLogs[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text('日付: ${log['date']}'),
                            subtitle: Text(
                                '食事: ${log['meal']}kcal / 運動: ${log['workout']}kcal'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LogDetailScreen(date: log['date']),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
        bottomNavigationBar: const Footer(),  // フッターを追加
    );
  }
}

Widget _buildDay(DateTime date, {bool isSelected = false}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: isSelected ? Colors.blueAccent : Colors.transparent,  // 選択日の背景色
      borderRadius: BorderRadius.circular(8),
      boxShadow: isSelected
          ? [   // 🟢 選択時に影を追加
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]
          : [],
    ),
    alignment: Alignment.center,
    child: Text(
      '${date.day}',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : Colors.black87,  // 選択時は白文字
      ),
    ),
  );
}