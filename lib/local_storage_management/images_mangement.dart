import 'package:flutter/services.dart';

class ImagesMangement {
  static Future<Uint8List> loadAssetAsBytes(String path) async {
    //la methode pour tester les chemain des image en bytes
    final byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    );
  }

  static Future<Uint8List> loadDefaultAssetAsBytes() async {
    return await loadAssetAsBytes('assets/icon.png');
  }
}
