// SPDX-FileCopyrightText: Copyright 2024 Open Mobile Platform LLC <community@omp.ru>
// SPDX-License-Identifier: BSD-3-Clause
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_plus_aurora/aurora_device_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuroraDeviceInfo? _deviceInfo;
  late bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    setState(() {
      _loading = true;
    });

    //  Get data
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      final deviceInfo = await deviceInfoPlugin.linuxInfo as AuroraDeviceInfo;
      setState(() {
        _deviceInfo = deviceInfo;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error retrieving data.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device info plus'),
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Get current device information from within the Flutter application.'),
                    const Divider(height: 32.0),
                    if (_error != null) Text(_error!),
                    if (_error == null)
                      Column(
                        children: [
                          Text(
                            'Device Full Name: ${_deviceInfo!.prettyName.toUpperCase()}',
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            'Check Has Wlan: ${_deviceInfo!.hasWlan.toString().toUpperCase()}',
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            'Screen Resolution: ${_deviceInfo!.screenResolution}',
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            'RAM Free Size: ${_deviceInfo!.ramFreeSize}',
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: _getData,
                            child: const Text('Update Data'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
