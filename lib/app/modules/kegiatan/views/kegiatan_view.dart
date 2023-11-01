import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kegiatan_controller.dart';

class KegiatanView extends GetView<KegiatanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KegiatanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KegiatanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
