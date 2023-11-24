import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class RiverpodObserver extends ProviderObserver {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 1,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    logger.i('Provider ${provider.name} added with value:\n$value');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.i('Provider ${provider.name} updated \nfrom \n$previousValue \nto\n $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    logger.i('Provider ${provider.name} disposed');
    super.didDisposeProvider(provider, container);
  }
}
