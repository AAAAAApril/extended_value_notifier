import 'package:flutter/foundation.dart';

typedef TVNotifier = TransformableValueNotifier;

///监听一个监听器，得到另一个值
class TransformableValueNotifier<A, R> extends ValueNotifier<R> {
  TransformableValueNotifier({
    required this.source,
    required this.transformer,
  }) : super(transformer(source.value)) {
    source.addListener(_onNewValue);
  }

  @override
  void dispose() {
    source.removeListener(_onNewValue);
    super.dispose();
  }

  final ValueListenable<A> source;
  final R Function(A value) transformer;

  void _onNewValue() {
    value = transformer.call(source.value);
  }
}

typedef TVNotifier2 = TransformableValueNotifier2;

///同时监听两个监听器，并转换其值
class TransformableValueNotifier2<A, B, R> extends ValueNotifier<R> {
  TransformableValueNotifier2({
    required this.sourceA,
    required this.sourceB,
    required this.transformer,
  }) : super(transformer(sourceA.value, sourceB.value)) {
    sourceA.addListener(_onNewValue);
    sourceB.addListener(_onNewValue);
  }

  @override
  void dispose() {
    sourceA.removeListener(_onNewValue);
    sourceB.removeListener(_onNewValue);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final R Function(A valueA, B valueB) transformer;

  void _onNewValue() {
    value = transformer.call(
      sourceA.value,
      sourceB.value,
    );
  }
}

typedef TVNotifier3 = TransformableValueNotifier3;

///同时监听三个监听器，并转换其值
class TransformableValueNotifier3<A, B, C, R> extends ValueNotifier<R> {
  TransformableValueNotifier3({
    required this.sourceA,
    required this.sourceB,
    required this.sourceC,
    required this.transformer,
  }) : super(transformer(sourceA.value, sourceB.value, sourceC.value)) {
    sourceA.addListener(_onNewValue);
    sourceB.addListener(_onNewValue);
    sourceC.addListener(_onNewValue);
  }

  @override
  void dispose() {
    sourceA.removeListener(_onNewValue);
    sourceB.removeListener(_onNewValue);
    sourceC.removeListener(_onNewValue);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final ValueListenable<C> sourceC;
  final R Function(A valueA, B valueB, C valueC) transformer;

  void _onNewValue() {
    value = transformer.call(
      sourceA.value,
      sourceB.value,
      sourceC.value,
    );
  }
}

typedef TVNotifier4 = TransformableValueNotifier4;

///同时监听四个监听器，并转换其值
class TransformableValueNotifier4<A, B, C, D, R> extends ValueNotifier<R> {
  TransformableValueNotifier4({
    required this.sourceA,
    required this.sourceB,
    required this.sourceC,
    required this.sourceD,
    required this.transformer,
  }) : super(transformer(
          sourceA.value,
          sourceB.value,
          sourceC.value,
          sourceD.value,
        )) {
    sourceA.addListener(_onNewValue);
    sourceB.addListener(_onNewValue);
    sourceC.addListener(_onNewValue);
    sourceD.addListener(_onNewValue);
  }

  @override
  void dispose() {
    sourceA.removeListener(_onNewValue);
    sourceB.removeListener(_onNewValue);
    sourceC.removeListener(_onNewValue);
    sourceD.removeListener(_onNewValue);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final ValueListenable<C> sourceC;
  final ValueListenable<D> sourceD;
  final R Function(
    A valueA,
    B valueB,
    C valueC,
    D valueD,
  ) transformer;

  void _onNewValue() {
    value = transformer.call(
      sourceA.value,
      sourceB.value,
      sourceC.value,
      sourceD.value,
    );
  }
}

extension TransformableValueListenableExt<T> on ValueListenable<T> {
  ValueNotifier<D> transform<D>({
    required D Function(T value) transformer,
  }) {
    return TransformableValueNotifier<T, D>(
      source: this,
      transformer: transformer,
    );
  }
}
