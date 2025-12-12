import 'package:flutter_riverpod/flutter_riverpod.dart';

// This is the provider. It's a global variable that we can read and update.
// - `StateProvider<int>` means it's a provider that holds a simple, changeable
//   state (in this case, an integer).
// - `(ref)` is a function that gives you access to other providers. We don't need it yet.
// - `=> 0` sets the initial value of our state to 0. This means the app will
//   start with the first tab selected.
final navigationIndexProvider = StateProvider<int>((ref) => 0);
