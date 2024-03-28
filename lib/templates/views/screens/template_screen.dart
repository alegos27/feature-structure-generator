import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A template for creating a new Stateless Consumer Screen.
class MyStatelessConsumerScreen extends ConsumerWidget {
  const MyStatelessConsumerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}

/// A template for creating a new Stateful Consumer Screen.
class MyStatefulConsumerScreen extends StatefulWidget {
  const MyStatefulConsumerScreen({super.key});

  @override
  State<MyStatefulConsumerScreen> createState() => _MyStatefulConsumerScreenState();
}

class _MyStatefulConsumerScreenState extends State<MyStatefulConsumerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// A template for creating a new Stateless Screen.
class MyStatelessScreen extends StatelessWidget {
  const MyStatelessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// A template for creating a new Stateful Screen.
class MyStatefulScreen extends StatefulWidget {
  const MyStatefulScreen({super.key});

  @override
  State<MyStatefulScreen> createState() => _MyStatefulScreenState();
}

class _MyStatefulScreenState extends State<MyStatefulScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}