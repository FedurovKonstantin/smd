import 'package:build/build.dart';
import 'package:diagnosticable_generator/diagnosticable_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder diagnosticableBuilder(BuilderOptions options) {
  return SharedPartBuilder([DiagnosticableGenerator()], 'diagnosticable');
}
