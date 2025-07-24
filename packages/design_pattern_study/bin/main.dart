import 'package:design_pattern_study/patterns/creational/abstract_factory.dart';

void main() {
  final patterns = [
    AbstractFactory(),
    // Builder(),
    // Singleton(),
    // etc.
  ];

  for (var pattern in patterns) {
    print('🔸 ${pattern.runtimeType}');
    final logs = pattern.runLogs();

    for (var log in logs) {
      print('${log.title}: ${log.message}');
    }

    print('────────────');
  }
}
