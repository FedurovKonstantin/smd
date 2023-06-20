import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:diagnosticable_annotation/diagnosticable.dart';
import 'package:source_gen/source_gen.dart';
import 'package:dart_style/dart_style.dart';

class DiagnosticableGenerator
    extends GeneratorForAnnotation<DiagnosticableWidget> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError('It`s not a class');
    }

    final fields = element.fields;

    final codes = <Code>[];

    for (var field in fields) {
      codes.add(
        /// properties.add(DiagnosticsProperty(
        /// 'firstName',
        /// widget.firstName,
        /// ));
        refer('properties').property('add').call(
          [
            refer('DiagnosticsProperty').newInstance(
              [
                literalString(field.name),
                refer('widget').property(field.name),
              ],
            )
          ],
        ).statement,
      );
    }

    /// mixin _Diagnosticable on Widget
    final mixin = Mixin(
      (builder) => builder
        ..name = '_Diagnosticable'
        ..on = refer('Widget')
        ..methods.add(
          Method(
            (builder) => builder
              ..name = '_describe'
              ..returns = refer('void')
              ..requiredParameters.addAll([
                Parameter(
                  (b) => b
                    ..name = 'properties'
                    ..type = refer('DiagnosticPropertiesBuilder'),
                ),
                Parameter(
                  (b) => b
                    ..name = 'widget'
                    ..type = refer(element.displayName),
                ),
              ])
              ..body = Block.of(
                [
                  /// super.debugFillProperties(properties);
                  refer('super').property('debugFillProperties').call(
                    [refer('properties').expression],
                  ).statement,
                  ...codes,
                ],
              ),
          ),
        ),
    );

    final emitter = DartEmitter();

    final result = DartFormatter().format('${mixin.accept(emitter)}');

    return result;
  }
}
