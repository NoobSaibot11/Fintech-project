import 'dart:math';

class ClassroomCodeGenerator {
  static String generateCode() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const codeLength = 5;

    Random random = Random();
    String code = '';

    for (int i = 0; i < codeLength; i++) {
      code += characters[random.nextInt(characters.length)];
    }

    return code;
  }
}
