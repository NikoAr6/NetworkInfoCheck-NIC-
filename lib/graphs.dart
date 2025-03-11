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
    this.strokeWidth = 50.0,
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



// Для отображения Пинга или Jitter
class PingJitterCard extends StatefulWidget {  //  StatefulWidget для динамического обновления
  final String title;
  final String value; // String, чтобы отображать текст
  final String unit;

  PingJitterCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  _PingJitterCardState createState() => _PingJitterCardState();
}

class _PingJitterCardState extends State<PingJitterCard> {  
  double _percentage = 0.0; //  Начальный процент загрузки 
  //double _value = 0.0;  //  Изначальное значение _value 

  @override
  void initState() {
    super.initState();
    // Имитация загрузки или получение реальных данных
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _percentage = 75.0; //  значение процента.
        //_value = 30.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100, //  Размер круга
              height: 100,
              child: SemiCircularLoading( 
                percentage: _percentage,
                trackColor: Colors.grey[300]!,
                progressColor: Colors.blue,
                strokeWidth: 12.0, // Ширина индикатора
                size: 100.0, //  Размер индикатора 
              ),
            ),
            Column(
            children: [
              Transform.translate( // Смещаем Text вниз
                offset: Offset(0, 30), // Смещение по оси Y (вниз) на 5 пикселей
                child: Text(
                  widget.value,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Transform.translate( // Смещаем Text вниз
                offset: Offset(0, 30), // Смещение по оси Y (вниз) на 5 пикселей
                child: Text(
                  widget.unit,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          ],
        ),
      ],
    );
  }
}
