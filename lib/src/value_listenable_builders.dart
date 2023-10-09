import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef VLBuilder2<A, B> = ValueListenableBuilder2<A, B>;

///同时监听两个数据观察者
class ValueListenableBuilder2<A, B> extends StatefulWidget {
  const ValueListenableBuilder2({
    super.key,
    required this.listenableA,
    required this.listenableB,
    required this.builder,
    this.child,
  });

  final ValueListenable<A> listenableA;
  final ValueListenable<B> listenableB;
  final Widget Function(BuildContext context, A valueA, B valueB, Widget? child) builder;
  final Widget? child;

  @override
  State<ValueListenableBuilder2<A, B>> createState() => _ValueListenableBuilder2State<A, B>();
}

class _ValueListenableBuilder2State<A, B> extends State<ValueListenableBuilder2<A, B>> {
  late A valueA;
  late B valueB;

  @override
  void initState() {
    super.initState();
    valueA = widget.listenableA.value;
    valueB = widget.listenableB.value;
    widget.listenableA.addListener(_onValueChanged);
    widget.listenableB.addListener(_onValueChanged);
  }

  @override
  void didUpdateWidget(covariant ValueListenableBuilder2<A, B> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.listenableA != widget.listenableA) {
      oldWidget.listenableA.removeListener(_onValueChanged);
      valueA = widget.listenableA.value;
      widget.listenableA.addListener(_onValueChanged);
    }
    if (oldWidget.listenableB != widget.listenableB) {
      oldWidget.listenableB.removeListener(_onValueChanged);
      valueB = widget.listenableB.value;
      widget.listenableB.addListener(_onValueChanged);
    }
  }

  @override
  void dispose() {
    widget.listenableA.removeListener(_onValueChanged);
    widget.listenableB.removeListener(_onValueChanged);
    super.dispose();
  }

  void _onValueChanged() {
    final A oldA = valueA;
    final B oldB = valueB;
    valueA = widget.listenableA.value;
    valueB = widget.listenableB.value;
    if ((oldA == valueA && oldB == valueB) || !mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context, valueA, valueB, widget.child);
  }
}

typedef VLBuilder3<A, B, C> = ValueListenableBuilder3<A, B, C>;

///同时监听三个数据观察者
class ValueListenableBuilder3<A, B, C> extends StatefulWidget {
  const ValueListenableBuilder3({
    super.key,
    required this.listenableA,
    required this.listenableB,
    required this.listenableC,
    required this.builder,
    this.child,
  });

  final ValueListenable<A> listenableA;
  final ValueListenable<B> listenableB;
  final ValueListenable<C> listenableC;
  final Widget Function(BuildContext context, A valueA, B valueB, C valueC, Widget? child) builder;
  final Widget? child;

  @override
  State<ValueListenableBuilder3<A, B, C>> createState() => _ValueListenableBuilder3State<A, B, C>();
}

class _ValueListenableBuilder3State<A, B, C> extends State<ValueListenableBuilder3<A, B, C>> {
  late A valueA;
  late B valueB;
  late C valueC;

  @override
  void initState() {
    super.initState();
    valueA = widget.listenableA.value;
    valueB = widget.listenableB.value;
    valueC = widget.listenableC.value;
    widget.listenableA.addListener(_onValueChanged);
    widget.listenableB.addListener(_onValueChanged);
    widget.listenableC.addListener(_onValueChanged);
  }

  @override
  void didUpdateWidget(covariant ValueListenableBuilder3<A, B, C> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.listenableA != widget.listenableA) {
      oldWidget.listenableA.removeListener(_onValueChanged);
      valueA = widget.listenableA.value;
      widget.listenableA.addListener(_onValueChanged);
    }
    if (oldWidget.listenableB != widget.listenableB) {
      oldWidget.listenableB.removeListener(_onValueChanged);
      valueB = widget.listenableB.value;
      widget.listenableB.addListener(_onValueChanged);
    }
    if (oldWidget.listenableC != widget.listenableC) {
      oldWidget.listenableC.removeListener(_onValueChanged);
      valueC = widget.listenableC.value;
      widget.listenableC.addListener(_onValueChanged);
    }
  }

  @override
  void dispose() {
    widget.listenableA.removeListener(_onValueChanged);
    widget.listenableB.removeListener(_onValueChanged);
    widget.listenableC.removeListener(_onValueChanged);
    super.dispose();
  }

  void _onValueChanged() {
    final A oldA = valueA;
    final B oldB = valueB;
    final C oldC = valueC;
    valueA = widget.listenableA.value;
    valueB = widget.listenableB.value;
    valueC = widget.listenableC.value;
    if ((oldA == valueA && oldB == valueB && oldC == valueC) || !mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context, valueA, valueB, valueC, widget.child);
  }
}

typedef VLBuilder4<A, B, C, D> = ValueListenableBuilder4<A, B, C, D>;

///同时监听四个数据观察者
class ValueListenableBuilder4<A, B, C, D> extends StatefulWidget {
  const ValueListenableBuilder4({
    super.key,
    required this.listenableA,
    required this.listenableB,
    required this.listenableC,
    required this.listenableD,
    required this.builder,
    this.child,
  });

  final ValueListenable<A> listenableA;
  final ValueListenable<B> listenableB;
  final ValueListenable<C> listenableC;
  final ValueListenable<D> listenableD;
  final Widget Function(BuildContext context, A valueA, B valueB, C valueC, D valueD, Widget? child) builder;
  final Widget? child;

  @override
  State<ValueListenableBuilder4<A, B, C, D>> createState() => _ValueListenableBuilder4State<A, B, C, D>();
}

class _ValueListenableBuilder4State<A, B, C, D> extends State<ValueListenableBuilder4<A, B, C, D>> {
  late A valueA;
  late B valueB;
  late C valueC;
  late D valueD;

  @override
  void initState() {
    super.initState();
    valueA = widget.listenableA.value;
    valueB = widget.listenableB.value;
    valueC = widget.listenableC.value;
    valueD = widget.listenableD.value;
    widget.listenableA.addListener(_onValueChanged);
    widget.listenableB.addListener(_onValueChanged);
    widget.listenableC.addListener(_onValueChanged);
    widget.listenableD.addListener(_onValueChanged);
  }

  @override
  void didUpdateWidget(covariant ValueListenableBuilder4<A, B, C, D> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.listenableA != widget.listenableA) {
      oldWidget.listenableA.removeListener(_onValueChanged);
      valueA = widget.listenableA.value;
      widget.listenableA.addListener(_onValueChanged);
    }
    if (oldWidget.listenableB != widget.listenableB) {
      oldWidget.listenableB.removeListener(_onValueChanged);
      valueB = widget.listenableB.value;
      widget.listenableB.addListener(_onValueChanged);
    }
    if (oldWidget.listenableC != widget.listenableC) {
      oldWidget.listenableC.removeListener(_onValueChanged);
      valueC = widget.listenableC.value;
      widget.listenableC.addListener(_onValueChanged);
    }
    if (oldWidget.listenableD != widget.listenableD) {
      oldWidget.listenableD.removeListener(_onValueChanged);
      valueD = widget.listenableD.value;
      widget.listenableD.addListener(_onValueChanged);
    }
  }

  @override
  void dispose() {
    widget.listenableA.removeListener(_onValueChanged);
    widget.listenableB.removeListener(_onValueChanged);
    widget.listenableC.removeListener(_onValueChanged);
    widget.listenableD.removeListener(_onValueChanged);
    super.dispose();
  }

  void _onValueChanged() {
    final A oldA = valueA;
    final B oldB = valueB;
    final C oldC = valueC;
    final D oldD = valueD;
    valueA = widget.listenableA.value;
    valueB = widget.listenableB.value;
    valueC = widget.listenableC.value;
    valueD = widget.listenableD.value;
    if ((oldA == valueA && oldB == valueB && oldC == valueC && oldD == valueD) || !mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context, valueA, valueB, valueC, valueD, widget.child);
  }
}
