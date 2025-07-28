import 'package:design_pattern_study/design_pattern.dart';
import 'package:design_pattern_study/models/pattern_log.dart';

class Burger {
  late final double _size;
  late final bool _cheese;
  late final bool _beef;
  late final bool _lettuce;
  late final bool _tomato;

  // 좋지 않은 예시: Burger(this._size, this._cheese, this._beef, this._lettuce, this._tomato);
  // 모든 속성을 생성자에 몰아넣어 가독성과 확장성이 떨어짐

  // 좋은 예시: 복잡한 속성 설정을 Builder로 위임하여 처리
  Burger(BurgerBuilder builder) {
    _size = builder._size;
    _cheese = builder._cheese;
    _beef = builder._beef;
    _lettuce = builder._lettuce;
    _tomato = builder._tomato;
  }

  String size() => '$_size';
  bool hasCheese() => _cheese;
  bool hasBeef() => _beef;
  bool hasLettuce() => _lettuce;
  bool hasTomato() => _tomato;
}

// Builder를 통해 여러 단계로 객체 속성을 설정하고,
// build()를 통해 최종 객체를 생성
// 설정 메서드들이 this를 반환하여 체이닝 가능
// 예: BurgerBuilder.addCheese().addBeef().build();
class BurgerBuilder {
  final double _size;
  bool _cheese = false;
  bool _beef = false;
  bool _lettuce = false;
  bool _tomato = false;

  BurgerBuilder(this._size);

  BurgerBuilder addCheese() {
    _cheese = true;
    return this;
  }

  BurgerBuilder addBeef() {
    _beef = true;
    return this;
  }

  BurgerBuilder addLettuce() {
    _lettuce = true;
    return this;
  }

  BurgerBuilder addTomato() {
    _tomato = true;
    return this;
  }

  Burger build() => Burger(this);
}

class Builder extends DesignPattern {
  @override
  List<PatternLog> runLogs() {
    final logs = <PatternLog>[];

    final burger = BurgerBuilder(15).addBeef().addCheese().addTomato().build();

    logs.add(PatternLog(title: "🍔 Size", message: burger.size()));
    logs.add(
        PatternLog(title: "🧀 Cheese", message: burger.hasCheese().toString()));
    logs.add(
        PatternLog(title: "🥩 Beef", message: burger.hasBeef().toString()));
    logs.add(PatternLog(
        title: "🥬 Lettuce", message: burger.hasLettuce().toString()));
    logs.add(
        PatternLog(title: "🍅 Tomato", message: burger.hasTomato().toString()));

    return logs;
  }
}
