import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A template for creating a new Stateless Consumer Widget.
class MyStatelessConsumerWidget extends ConsumerWidget {
  const MyStatelessConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}

/// A template for creating a new Stateful Consumer Widget.
class MyStatefulConsumerWidget extends StatefulWidget {
  const MyStatefulConsumerWidget({super.key});

  @override
  State<MyStatefulConsumerWidget> createState() => _MyStatefulConsumerWidgetState();
}

class _MyStatefulConsumerWidgetState extends State<MyStatefulConsumerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// A template for creating a new Stateless Widget.
class MyWidgetStateless extends StatelessWidget {
  const MyWidgetStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// A template for creating a new Stateful Widget.
class MyWidgetStateful extends StatefulWidget {
  const MyWidgetStateful({super.key});

  @override
  State<MyWidgetStateful> createState() => _MyWidgetStatefulState();
}

class _MyWidgetStatefulState extends State<MyWidgetStateful> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}