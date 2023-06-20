import 'dart:async';
import 'package:build/build.dart';

class ListBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final content = await buildStep.readAsString(inputId);
    final numbers = content.split(' ');

    final sb = StringBuffer()..write('const numbers = [ ');
    for (var number in numbers) {
      sb.write('$number ,');
    }
    sb.write('];');

    final outputId = inputId.changeExtension('.dart');
    await buildStep.writeAsString(outputId, sb.toString());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.txt': ['.dart']
      };
}
