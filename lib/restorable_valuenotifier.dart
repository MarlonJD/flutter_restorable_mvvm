import 'package:flutter/material.dart';

/// A restorable property that wraps a ValueNotifier<T>,
/// automatically persisting its state and notifying listeners.
class RestorableValueNotifier<T> extends RestorableProperty<T> {
  late final ValueNotifier<T> _notifier;

  /// Constructor takes an initial value.
  RestorableValueNotifier(T initialValue) {
    _notifier = ValueNotifier(initialValue);
  }

  /// Expose the ValueNotifier so widgets can listen for changes.
  ValueNotifier<T> get notifier => _notifier;

  /// Get the current value.
  T get value => _notifier.value;

  /// Set the value and notify listeners.
  set value(T newValue) {
    if (_notifier.value != newValue) {
      _notifier.value = newValue;
      notifyListeners();
    }
  }

  @override
  T createDefaultValue() => _notifier.value;

  void didUpdateValue(T? oldValue) {
    _notifier.value = value;
  }

  @override
  void initWithValue(T value) {
    _notifier.value = value;
  }

  @override
  Object toPrimitives() {
    return _notifier.value as Object;
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  T fromPrimitives(Object? data) {
    return data as T;
  }
}
