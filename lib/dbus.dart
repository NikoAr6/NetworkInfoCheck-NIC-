import 'package:flutter/material.dart';
import 'package:dbus/dbus.dart';
import 'package:nic/data.dart';
import 'package:get_ip_address/get_ip_address.dart';

// пробные функции
Future device() async{
    final client = DBusClient.session();
    final features = RuOmpDeviceinfoFeatures(client, 'ru.omp.deviceinfo', DBusObjectPath('/ru/omp/deviceinfo/Features'),);
    final model = features.callgetDeviceModel();
    return model.toString();

}

// Future wlan() async{
//     final client = DBusClient.session();
//     final features = RuOmpDeviceinfoFeatures(client, 'ru.omp.deviceinfo', DBusObjectPath('/ru/omp/deviceinfo/Features'),);
//     final wlan = await features.hasWlan(bool &hasWlan);

//     return wlan.toString();
// }

Future ip_adress() async {
  String rez;
  try {
    /// Initialize Ip Address
    var ipAddress = IpAddress(type: RequestType.json);

    /// IP адрес получение
    dynamic data = await ipAddress.getIpAddress();
    rez = data.toString();
  } on IpAddressException catch (exception) {
    /// Сообщение об ошибке
    rez = 'exception.message';
  }
  return rez;
}

Future sim() async{
    final client = DBusClient.session();
    final features = RuOmpDeviceinfoFeatures(client, 'ru.omp.deviceinfo', DBusObjectPath('/ru/omp/deviceinfo/SIM'),);
    final sim = await features.callgetSimCardsInfo();

    return sim.toString();
    
}
