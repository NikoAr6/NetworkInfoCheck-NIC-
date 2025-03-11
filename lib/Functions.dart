import 'package:flutter/material.dart';

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
  final wifiName = 'Wlan309-95A';

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
                  wifiName.toString(),
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

