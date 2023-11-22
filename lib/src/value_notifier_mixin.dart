import 'package:flutter/foundation.dart';

import 'transformable_value_notifier.dart';

mixin ValueNotifierMixin<T> on ValueNotifier<T> {
  final Map<Function, ValueNotifierMixin<dynamic>> _notifiers = <Function, ValueNotifierMixin<dynamic>>{};

  @protected
  bool disposed = false;

  @override
  set value(newValue) {
    if (!disposed) {
      super.value = newValue;
    }
  }

  ValueNotifierMixin<D> transform<D>({
    required D Function(T value) transformer,
  }) {
    ValueNotifierMixin<D>? result = _notifiers[transformer] as ValueNotifierMixin<D>?;
    if (result == null) {
      result = TransformableValueNotifier<T, D>(
        source: this,
        transformer: transformer,
      );
      _notifiers[transformer] = result;
    }
    return result;
  }

  @override
  void dispose() {
    disposed = true;
    for (var element in _notifiers.values) {
      if (!element.disposed) {
        element.dispose();
      }
    }
    super.dispose();
  }
}
