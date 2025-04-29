import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart' as base;
import 'package:to_do_app/app/provider/provider.dart';

class ProviderScope extends StatelessWidget {
  const ProviderScope({
    required this.child,
    this.providers = const [],
    super.key,
  });

  final Widget child;
  final List<BaseProvider> providers;

  @override
  Widget build(BuildContext context) {
    if (providers.isEmpty) {
      return child;
    }
    return base.MultiProvider(
      providers:
          providers.map((provider) {
            return base.ChangeNotifierProvider(create: (_) => provider);
          }).toList(),
      child: child,
    );
  }
}
