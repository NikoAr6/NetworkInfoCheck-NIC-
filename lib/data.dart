// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object data.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class RuOmpDeviceinfoFeatures extends DBusRemoteObject {
  RuOmpDeviceinfoFeatures(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes ru.omp.deviceinfo.Features.getDeviceModel()
  Future<String> callgetDeviceModel({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('ru.omp.deviceinfo.Features', 'getDeviceModel', [], replySignature: DBusSignature('s'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asString();
  }

  /// Invokes ru.omp.deviceinfo.Features.hasWlan()
  Future<bool> callhasWlan({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('ru.omp.deviceinfo.Features', 'hasWlan', [], replySignature: DBusSignature('b'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asBoolean();
  }

  /// Invokes ru.omp.deviceinfo.SIM.getSimCardsInfo()
  Future<String> callgetSimCardsInfo({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('ru.omp.deviceinfo.SIM', 'getSimCardsInfo', [], replySignature: DBusSignature('s'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asString();
  }
}
