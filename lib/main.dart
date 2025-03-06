import 'package:flutter/material.dart';
//import 'package:flutter_vector_icons/flutter_vector_icons.dart';  // Добавляем зависимость для иконок
import 'dart:math' as math; // Import для чисел, чтобы можно было по стандарту отформатировать

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Отключаем баннер Debug
        title: 'NetworkInfoCheck',
      home: NetworkInfoScreen(),
    );
  }
}

class NetworkInfoScreen extends StatelessWidget {
  final String title; //  Добавляем поле для переменной title

  const NetworkInfoScreen({Key? key, this.title = 'NetworkInfoCheck'}) // Добавляем title в конструктор
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Фиксируем высоту AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF3E5165),
          flexibleSpace: Align( // Центрируем по вертикали
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],  
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoSection(
                title: 'Данные телефона',
                children: [
                  InfoRow(label: 'Имя устройства', value: 'Galaxy A55 5G', icon: Icons.phone_android),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'Модель', value: 'SM-A556E/DS'),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'IP адрес', value: '176.59.119.128', hasTrailingIcon: true, onTrailingIconTap: () {  
                    // Добавляем обработчик нажатия на три точки
                    },),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'MAC-адрес', value: 'D2:80:CB:50:03:78', hasTrailingIcon: true, onTrailingIconTap: () {  
                    // Добавляем обработчик нажатия на три точки
                    },),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'Провайдер', value: 'Tele2'),
                ],
              ),
              SizedBox(height: 20),
              InfoSection(
                title: 'Интернет',
                children: [
                  InfoRow(label: 'Тип соединения', value: 'Mobile, LTE'),
                  Divider(color: Colors.grey[300]),
                  ClickableInfoRow(label: 'Локальная сеть',
                    onTap: () { // Добавляем обработчик нажатия для "Локальная сеть"
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocalNetworkPage()),
                        );
                      },),
                  Divider(color: Colors.grey[300]),
                  ClickableInfoRow(label: 'Проверить скорость интернета',
                    onTap: () { // Добавляем обработчик нажатия для "Проверить скорость интернета"
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SpeedTestPage()),
                        );
                      },),
                ],
              ),
              SizedBox(height: 20),
              GraphSection(), //Место для графика
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------//
//-----------------------------------------------------------//
//-----------------------------------------------------------//

// Создаем виджеты для страниц, на которые будем переходить
class LocalNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Локальная сеть')),
      body: Center(child: Text('Содержимое страницы "Локальная сеть"')),
    );
  }
}

//-----------------------------------------------------------//
//-----------------------------------------------------------//
//-----------------------------------------------------------//

class SpeedTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Фиксируем высоту AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF3E5165),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft, // Выравниваем содержимое по нижней границе
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0), // Отступы от низа и слева
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 15), // Отступ между стрелкой и текстом
                  Text(
                    'Тест скорости интернета',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoCard('IP адрес', '176.59.119.128'),
                _buildInfoCard('Местонахождение', 'Russia, Nizniy Novgorog'),
                _buildInfoCard('Поставщик', 'Tele2'),
              ],
            ),
            SizedBox(height: 20),
            // Placeholder for the graph.  Replace with your actual graph widget.
            Container(
              height: 200,
              color: Colors.grey[200], // Replace with your graph widget.
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_downward, color: Colors.grey),
                    Text('Загрузка: 49,5 kB/s', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.grey),
                    Text('Отправка: 26,8 kB/s', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPingJitterCard('Пинг', '30.01', 'Ms'),
                _buildPingJitterCard('Jitter', '2.9', 'Ms'),
              ],
            ),
            SizedBox(height: 10),
            Center(child: Text('T2 Mobile LLC, RU (2540 km)', style: TextStyle(color: Colors.grey))),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        Text(value),
      ],
    );
  }

  Widget _buildPingJitterCard(String title, String value, String unit) {
    return Column(
      children: [
        Text(title),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: 0.7, // Adjust value based on the actual value.  For example, value / 100
                strokeWidth: 8,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Column(
              children: [
                Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(unit, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


// Reusable widget for info sections
class InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoSection({Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
          ),
          SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

// Reusable widget for a row of information
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final bool hasTrailingIcon;
  final VoidCallback? onTrailingIconTap; // обработчик нажатия

  const InfoRow({
    Key? key,
    required this.label,
    required this.value,
    this.icon,
    this.hasTrailingIcon = false,
    this.onTrailingIconTap, // обработчик нажатия
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(icon, size: 24, color: Colors.grey[600]),
            ),
          if (hasTrailingIcon)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector( // Оборачиваем иконку в GestureDetector
                onTap: onTrailingIconTap, //  Вызываем обработчик при нажатии
                child: Icon(Icons.more_vert, size: 24, color: Colors.grey[600]),
              )
            ),
        ],
      ),
    );
  }
}

// Reusable Widget for clickable information rows
class ClickableInfoRow extends StatelessWidget {
  final String label;
  final VoidCallback? onTap; // обработчик нажатия

  const ClickableInfoRow({Key? key, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Вызываем переданный обработчик при нажатии
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}

// Placeholder для Графика.  Нужна сторонняя библиотека или CustomPaint для его реализации
class GraphSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white, // Белый фон для графика
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column( //  Используем Column для вертикального размещения
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Размещаем контент вверху и внизу
        children: [
          Expanded( //  Занимает все доступное пространство между верхом и низом
            child: Center( // Центрируем текст графика
              child: Text('Graph Placeholder'),
            ),
          ),
          
          Divider(color: Colors.grey[300]),
          
          Padding(  // Добавляем отступы для строки текста
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Центрируем строку текста горизонтально
              children: [
                SizedBox(width: 5), // Отступ между иконкой и текстом
                Text(
                  'Wlan309-95A',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





//Кружок
/*
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SemiCircularLoadingPainter extends CustomPainter {
  final double percentage; // Значение прогресса в процентах (0-100)
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;

  SemiCircularLoadingPainter({
    required this.percentage,
    required this.trackColor,
    required this.progressColor,
    this.strokeWidth = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height); // Центр полукруга (снизу)
    final radius = math.min(size.width, size.height) - strokeWidth; // Радиус с учетом толщины линии

    // 1. Рисуем "трек" (серый полукруг)
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Закругленные концы

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, // Начальная точка - слева (180 градусов)
      math.pi, // Длина дуги - 180 градусов (полукруг)
      false, // Соединять концы с центром? Нет.
      trackPaint,
    );

    // 2. Рисуем индикатор прогресса
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Закругленные концы

    // Переводим percentage (0-100) в долю от полукруга (pi)
    double arcAngle = math.pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, // Начальная точка - слева (180 градусов)
      arcAngle, // Длина дуги, зависящая от прогресса
      false, // Соединять концы с центром? Нет.
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(SemiCircularLoadingPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}

class SemiCircularLoading extends StatelessWidget {
  final double percentage;
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;
  final double size; // Размер виджета (диаметр полукруга)

  const SemiCircularLoading({
    Key? key,
    required this.percentage,
    this.trackColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.strokeWidth = 10.0,
    this.size = 100.0, // Default size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size/2, // Высота - половина ширины (полукруг)
      child: CustomPaint(
        painter: SemiCircularLoadingPainter(
          percentage: percentage,
          trackColor: trackColor,
          progressColor: progressColor,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _percentage = 0.0;

  @override
  void initState() {
    super.initState();
    // Имитация загрузки
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _percentage = 56.0; // Установите нужное значение процента
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Semi-Circular Loading Example')),
        body: Center(
          child: SemiCircularLoading(
            percentage: _percentage,
            trackColor: Colors.grey[300]!,
            progressColor: Colors.green,
            strokeWidth: 12.0,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
*/