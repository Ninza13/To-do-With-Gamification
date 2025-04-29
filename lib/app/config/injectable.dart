import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/app/config/injectable.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initLocator',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  locator.$initLocator();
}
