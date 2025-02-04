import 'dart:convert';
import 'dart:io';

import 'package:crypton/crypton.dart';
import 'package:path/path.dart';

void main(List<String> arguments) {
  var Name = arguments[0];
  var privateKey = getSecret(Name);
  privateKey = privateKey.trim();
  var key = RSAPrivateKey.fromString(privateKey);
  var challenge = stdin.readLineSync();
  challenge = challenge.trim();
  var signature =
      base64.encode(key.createSHA256Signature(utf8.encode(challenge)));
  stdout.write(signature);
  stdout.write('\n');
}

String getSecret(String filename) {
  var pathToFile = join(dirname(Platform.script.toFilePath()), filename);
  var contents = File(pathToFile).readAsStringSync();
  return (contents);
}
