import 'package:flutter/material.dart';

import 'main.dart';
import 'graphs.dart';


class SpeedTestPage extends StatelessWidget {
  double downloadSpeed = 49.5123456789; // Загрузка
  double sendingSpeeg = 26.8123456789; // Отправка

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
      
      backgroundColor: Colors.grey[200], 
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container( 
            color: Colors.white, 
            padding: const EdgeInsets.only(top: 15, right: 5, left: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoCard('IP адрес', '176.59.119.128'),
                //VerticalDivider(color: Colors.grey[300]),
                _buildInfoCard('Местонахождение', 'Russia, Nizniy Novgorog'),
                //VerticalDivider(color: Colors.grey[300]),
                _buildInfoCard('Поставщик', 'Tele2'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            color: Colors.white, 
          ),
          
          
          SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(
                  children: [
                    Icon(Icons.arrow_downward, color: Colors.grey),
                    Text('Загрузка: ${downloadSpeed.toStringAsFixed(1)} kB/s', // Интегрируем переменную double
                    style: TextStyle(color: Colors.grey),
                  ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.grey),
                    Text('Отправка: ${sendingSpeeg.toStringAsFixed(1)} kB/s', // Интегрируем переменную double
                    style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 16, right: 5, left: 5, bottom: 15),
            child: Column( // Используем Column как дочерний виджет Container
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PingJitterCard(title: 'Пинг', value: '30.01', unit: 'Ms'), // graphs.dart
                      PingJitterCard(title: 'Jitter', value: '2.9', unit: 'Ms'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Center(
                    child: Text(
                      'T2 Mobile LLC, RU (2540 km)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
}