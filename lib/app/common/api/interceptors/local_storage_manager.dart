import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class BaseLocalSource {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ));
}
