import 'package:flutter/foundation.dart';

import 'value_notifier_mixin.dart';

typedef AsyncTVNotifier<T, D> = AsyncTransformableValueNotifier<T, D>;

///异步转换[T]到[D]
class AsyncTransformableValueNotifier<T, D> extends ValueNotifier<D> with ValueNotifierMixin<D> {
  AsyncTransformableValueNotifier(
    this.source, {
    required D defValue,
    required this.transformer,
  }) : super(defValue) {
    source.addListener(onSourceValueChanged);
    onSourceValueChanged();
  }

  @override
  void dispose() {
    source.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<T> source;
  final Future<D> Function(T value) transformer;

  @protected
  void onSourceValueChanged() {
    final old = source.value;
    transformer.call(old).then<void>((result) {
      if (source.value == old) {
        value = result;
      }
    }).catchError((_) {
      //ignore
    });
  }
}

typedef AsyncTVNotifier2<A, B, R> = AsyncTransformableValueNotifier2<A, B, R>;

///异步转换[A]、[B]到[R]
class AsyncTransformableValueNotifier2<A, B, R> extends ValueNotifier<R> with ValueNotifierMixin<R> {
  AsyncTransformableValueNotifier2(
    this.sourceA,
    this.sourceB, {
    required R defValue,
    required this.transformer,
  }) : super(defValue) {
    _listenable.addListener(onSourceValueChanged);
    onSourceValueChanged();
  }

  @override
  void dispose() {
    _listenable.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final Future<R> Function(
    A valueA,
    B valueB,
  ) transformer;

  late final Listenable _listenable = Listenable.merge([sourceA, sourceB]);

  @protected
  void onSourceValueChanged() {
    final oldA = sourceA.value;
    final oldB = sourceB.value;
    transformer.call(oldA, oldB).then<void>((result) {
      if (sourceA.value == oldA && sourceB.value == oldB) {
        value = result;
      }
    }).catchError((_) {
      //ignore
    });
  }
}

typedef AsyncTVNotifier3<A, B, C, R> = AsyncTransformableValueNotifier3<A, B, C, R>;

///异步转换[A]、[B]、[C]到[R]
class AsyncTransformableValueNotifier3<A, B, C, R> extends ValueNotifier<R> with ValueNotifierMixin<R> {
  AsyncTransformableValueNotifier3(
    this.sourceA,
    this.sourceB,
    this.sourceC, {
    required R defValue,
    required this.transformer,
  }) : super(defValue) {
    _listenable.addListener(onSourceValueChanged);
    onSourceValueChanged();
  }

  @override
  void dispose() {
    _listenable.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final ValueListenable<C> sourceC;
  final Future<R> Function(
    A valueA,
    B valueB,
    C valueC,
  ) transformer;

  late final Listenable _listenable = Listenable.merge([sourceA, sourceB, sourceC]);

  @protected
  void onSourceValueChanged() {
    final oldA = sourceA.value;
    final oldB = sourceB.value;
    final oldC = sourceC.value;
    transformer.call(oldA, oldB, oldC).then<void>((result) {
      if (sourceA.value == oldA && sourceB.value == oldB && sourceC.value == oldC) {
        value = result;
      }
    }).catchError((_) {
      //ignore
    });
  }
}

typedef AsyncTVNotifier4<A, B, C, D, R> = AsyncTransformableValueNotifier4<A, B, C, D, R>;

///异步转换[A]、[B]、[C]、[D]到[R]
class AsyncTransformableValueNotifier4<A, B, C, D, R> extends ValueNotifier<R> with ValueNotifierMixin<R> {
  AsyncTransformableValueNotifier4(
    this.sourceA,
    this.sourceB,
    this.sourceC,
    this.sourceD, {
    required R defValue,
    required this.transformer,
  }) : super(defValue) {
    _listenable.addListener(onSourceValueChanged);
    onSourceValueChanged();
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
  final Future<R> Function(
    A valueA,
    B valueB,
    C valueC,
    D valueD,
  ) transformer;

  late final Listenable _listenable = Listenable.merge([sourceA, sourceB, sourceC, sourceD]);

  @protected
  void onSourceValueChanged() {
    final oldA = sourceA.value;
    final oldB = sourceB.value;
    final oldC = sourceC.value;
    final oldD = sourceD.value;
    transformer.call(oldA, oldB, oldC, oldD).then<void>((result) {
      if (sourceA.value == oldA && sourceB.value == oldB && sourceC.value == oldC && sourceD.value == oldD) {
        value = result;
      }
    }).catchError((_) {
      //ignore
    });
  }
}
