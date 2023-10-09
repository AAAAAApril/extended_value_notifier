import 'package:flutter/foundation.dart';

typedef AsyncTVNotifier<T, D> = AsyncTransformableValueNotifier<T, D>;

///异步转换[T]到[D]
class AsyncTransformableValueNotifier<T, D> extends ValueNotifier<D> {
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
    disposed = true;
    source.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<T> source;
  final Future<D> Function(T value) transformer;

  @protected
  bool disposed = false;

  @override
  set value(D newValue) {
    if (!disposed) {
      super.value = newValue;
    }
  }

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
class AsyncTransformableValueNotifier2<A, B, R> extends ValueNotifier<R> {
  AsyncTransformableValueNotifier2(
    this.sourceA,
    this.sourceB, {
    required R defValue,
    required this.transformer,
  }) : super(defValue) {
    sourceA.addListener(onSourceValueChanged);
    sourceB.addListener(onSourceValueChanged);
    onSourceValueChanged();
  }

  @override
  void dispose() {
    disposed = true;
    sourceA.removeListener(onSourceValueChanged);
    sourceB.removeListener(onSourceValueChanged);
    super.dispose();
  }

  final ValueListenable<A> sourceA;
  final ValueListenable<B> sourceB;
  final Future<R> Function(
    A valueA,
    B valueB,
  ) transformer;

  @protected
  bool disposed = false;

  @override
  set value(R newValue) {
    if (!disposed) {
      super.value = newValue;
    }
  }

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
class AsyncTransformableValueNotifier3<A, B, C, R> extends ValueNotifier<R> {
  AsyncTransformableValueNotifier3(
    this.sourceA,
    this.sourceB,
    this.sourceC, {
    required R defValue,
    required this.transformer,
  }) : super(defValue) {
    sourceA.addListener(onSourceValueChanged);
    sourceB.addListener(onSourceValueChanged);
    sourceC.addListener(onSourceValueChanged);
    onSourceValueChanged();
  }

  @override
  void dispose() {
    disposed = true;
    sourceA.removeListener(onSourceValueChanged);
    sourceB.removeListener(onSourceValueChanged);
    sourceC.removeListener(onSourceValueChanged);
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

  @protected
  bool disposed = false;

  @override
  set value(R newValue) {
    if (!disposed) {
      super.value = newValue;
    }
  }

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
class AsyncTransformableValueNotifier4<A, B, C, D, R> extends ValueNotifier<R> {
  AsyncTransformableValueNotifier4(
    this.sourceA,
    this.sourceB,
    this.sourceC,
    this.sourceD, {
    required R defValue,
    required this.transformer,
  }) : super(defValue) {
    sourceA.addListener(onSourceValueChanged);
    sourceB.addListener(onSourceValueChanged);
    sourceC.addListener(onSourceValueChanged);
    sourceD.addListener(onSourceValueChanged);
    onSourceValueChanged();
  }

  @override
  void dispose() {
    disposed = true;
    sourceA.removeListener(onSourceValueChanged);
    sourceB.removeListener(onSourceValueChanged);
    sourceC.removeListener(onSourceValueChanged);
    sourceD.removeListener(onSourceValueChanged);
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

  @protected
  bool disposed = false;

  @override
  set value(R newValue) {
    if (!disposed) {
      super.value = newValue;
    }
  }

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
