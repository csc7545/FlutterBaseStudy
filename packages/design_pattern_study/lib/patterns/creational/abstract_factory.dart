import 'package:design_pattern_study/models/pattern_log.dart';

// 추상 클래스
abstract class Door {
  String description();
}

// 나무문
class WoodenDoor implements Door {
  @override
  String description() => "This is a wooden door.";
}

// 철문
class IronDoor implements Door {
  @override
  String description() => "This is a iron door.";
}

// 수리 전문가
abstract class DoorExpert {
  String description();
  String fix();
}

// 나무문 수리공
class Carpenter extends DoorExpert {
  @override
  String description() => "I am a carpenter.";

  @override
  String fix() => "I am fixing wooden doors.";
}

// 철문 수리공
class Welder implements DoorExpert {
  @override
  String description() => "I am a welder.";

  @override
  String fix() => "I am fixing iron doors.";
}

// 각기 다른 종류의 문과 수리공을 연결해주는 공장을 생성합니다
// 여기서는 인터페이스만 정의하고, 실제 구현은 서브클래스에서 합니다
abstract class DoorFactory {
  // 문 생성
  Door makeDoor();

  // 수리공 호출
  DoorExpert callDoorExpert();
}

class WoodenDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => WoodenDoor();

  @override
  DoorExpert callDoorExpert() => Carpenter();
}

class IronDoorFactory implements DoorFactory {
  @override
  Door makeDoor() => IronDoor();

  @override
  DoorExpert callDoorExpert() => Welder();
}

// 실제 실행 클래스
class AbstractFactory {
  List<PatternLog> runLogs() {
    final logs = <PatternLog>[];

    final woodenFactory = WoodenDoorFactory();
    final woodenDoor = woodenFactory.makeDoor();
    final carpenter = woodenFactory.callDoorExpert();

    final ironFactory = IronDoorFactory();
    final ironDoor = ironFactory.makeDoor();
    final welder = ironFactory.callDoorExpert();

    logs.add(
      PatternLog(title: "🪵 Wooden Door", message: woodenDoor.description()),
    );
    logs.add(
      PatternLog(title: "👷 Carpenter", message: carpenter.description()),
    );
    logs.add(PatternLog(title: "🔧 Fixing", message: carpenter.fix()));
    logs.add(const PatternLog(title: "——-", message: ""));

    logs.add(
      PatternLog(title: "🪨 Iron Door", message: ironDoor.description()),
    );
    logs.add(PatternLog(title: "👷 Welder", message: welder.description()));
    logs.add(PatternLog(title: "🔧 Fixing", message: welder.fix()));

    return logs;
  }
}
