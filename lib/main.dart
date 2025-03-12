import 'package:flutter/material.dart';
import 'package:nic/data.dart';
import 'package:dbus/dbus.dart';
import 'package:get_ip_address/get_ip_address.dart';
//import 'package:flutter_vector_icons/flutter_vector_icons.dart';  // Добавляем зависимость для иконок
//import 'dart:math' as math; // Import для чисел, чтобы можно было по стандарту отформатировать

import 'Functions.dart';
import 'speedtestpage.dart';
import 'dbus.dart';

void main() {
  runApp(NIC());
}

class NIC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Отключаем баннер Debug
        title: 'NetworkInfoCheck',

      home: NetworkInfoScreen(),
    );
  }
}

// ГЛАВНЫЙ ЭКРАН //
class NetworkInfoScreen extends StatelessWidget {
  final String title;
  final nameDevise = device();
  final modelOfDevise = 'SM-A556E/DS';
  final IP_OfDevise = ip_adress();
  final MAC_OfDevise = 'D2:80:CB:50:03:78';
  final ProviderOfDevise = 'Tele2';
  final conectionType = 'Mobile, LTE';

  NetworkInfoScreen({Key? key, this.title = 'NetworkInfoCheck'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // Фиксируем высоту AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF3E5165),
          flexibleSpace: Align(               // Центрируем по вертикали
            alignment: Alignment.bottomLeft,  // Клеим к низу
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
                  InfoRow(label: 'Имя устройства', value: nameDevise.toString(), icon: Icons.phone_android),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'Модель', value: modelOfDevise.toString()),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'IP адрес', value: IP_OfDevise.toString(), hasTrailingIcon: true, onTrailingIconTap: () {  
                    // Добавляем обработчик нажатия на три точки
                    // Например скорость передачи пакетов к любому ip
                    },),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'MAC-адрес', value: MAC_OfDevise.toString(), hasTrailingIcon: true, onTrailingIconTap: () {  
                    // Добавляем обработчик нажатия на три точки
                    },),
                  Divider(color: Colors.grey[300]),
                  InfoRow(label: 'Провайдер', value: ProviderOfDevise.toString()),
                ],
              ),
              SizedBox(height: 20),
              InfoSection(
                title: 'Интернет',
                children: [
                  InfoRow(label: 'Тип соединения', value: conectionType.toString()),
                  Divider(color: Colors.grey[300]),
                  ClickableInfoRow(label: 'Локальная сеть',
                    onTap: () { // Переход на страницу «Локальная сеть»
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocalNetworkPage()),
                        );
                      },),
                  Divider(color: Colors.grey[300]),
                  ClickableInfoRow(label: 'Проверить скорость интернета',
                    onTap: () { // Переход на страницу "Проверить скорость интернета"
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


