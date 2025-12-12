import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for managing the bottom navigation bar's selected index
///
/// This is a StateProvider that holds a simple integer representing which
/// tab is currently selected in the bottom navigation bar.
///
/// Usage:
/// - Read: `ref.watch(navigationIndexProvider)` to get the current index
/// - Update: `ref.read(navigationIndexProvider.notifier).state = newIndex`
///
/// Initial value is 0, meaning the app starts on the first tab (Home)
final navigationIndexProvider = StateProvider<int>((ref) => 0);
