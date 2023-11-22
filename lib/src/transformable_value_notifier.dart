import 'package:flutter/foundation.dart';

import 'value_notifier_mixin.dart';

typedef TVNotifier<A, R> = TransformableValueNotifier<A, R>;

///监听一个监听器，得到另一个值
class TransformableValueNotifier<A, R> extends ValueNotifier<R> with ValueNotifierMixin<R> {
  TransformableValueNotifier({
    required this.source,
    required this.transformer,
  }) : super(transformer(source.value)) {
    source.addListener(onSourceValueChanged);
  }

  @override
  void dispose() {
    source.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<A> source;
  final R Function(A value) transformer;

  @protected
  void onSourceValueChanged() {
    value = transformer.call(source.value);
  }
}

typedef TVNotifier2<A, B, R> = TransformableValueNotifier2<A, B, R>;

///同时监听两个监听器，并转换其值
class TransformableValueNotifier2<A, B, R> extends ValueNotifier<R> with ValueNotifierMixin<R> {
  TransformableValueNotifier2({
    required this.sourceA,
    required this.sourceB,
    required this.transformer,
  }) : super(transformer(sourceA.value, sourceB.value)) {
    _listenable.addListener(onSourceValueChanged);
  }

  @override
  void dispose() {
    _listenable.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final R Function(A valueA, B valueB) transformer;

  late final Listenable _listenable = Listenable.merge([sourceA, sourceB]);

  @protected
  void onSourceValueChanged() {
    value = transformer.call(
      sourceA.value,
      sourceB.value,
    );
  }
}

typedef TVNotifier3<A, B, C, R> = TransformableValueNotifier3<A, B, C, R>;

///同时监听三个监听器，并转换其值
class TransformableValueNotifier3<A, B, C, R> extends ValueNotifier<R> with ValueNotifierMixin<R> {
  TransformableValueNotifier3({
    required this.sourceA,
    required this.sourceB,
    required this.sourceC,
    required this.transformer,
  }) : super(transformer(sourceA.value, sourceB.value, sourceC.value)) {
    _listenable.addListener(onSourceValueChanged);
  }

  @override
  void dispose() {
    _listenable.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final ValueListenable<C> sourceC;
  final R Function(A valueA, B valueB, C valueC) transformer;

  late final Listenable _listenable = Listenable.merge([sourceA, sourceB, sourceC]);

  @protected
  void onSourceValueChanged() {
    value = transformer.call(
      sourceA.value,
      sourceB.value,
      sourceC.value,
    );
  }
}

typedef TVNotifier4<A, B, C, D, R> = TransformableValueNotifier4<A, B, C, D, R>;

///同时监听四个监听器，并转换其值
class TransformableValueNotifier4<A, B, C, D, R> extends ValueNotifier<R> with ValueNotifierMixin<R> {
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
    _listenable.addListener(onSourceValueChanged);
  }

  @override
  void dispose() {
    _listenable.removeListener(onSourceValueChanged);
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

  late final Listenable _listenable = Listenable.merge([sourceA, sourceB, sourceC, sourceD]);

  @protected
  void onSourceValueChanged() {
    value = transformer.call(
      sourceA.value,
      sourceB.value,
      sourceC.value,
      sourceD.value,
    );
  }
}
