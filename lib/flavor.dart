import 'package:flutter_dotenv/flutter_dotenv.dart';

enum FlavorStatus { prod, dev, staging }

class Flavor {
  final String baseURL;

  static final String _baseUrlProd = dotenv.get('BASE_URL_PROD');
  static final String _baseUrlDev = dotenv.get('BASE_URL_DEV');
  static final String _baseUrlStaging = dotenv.get('BASE_URL_STAGING');

  static final Flavor instance = Flavor.of();

  const Flavor._({required this.baseURL});

  factory Flavor.of() {
    String flavor = const String.fromEnvironment('FLAVOR');
    if (flavor == FlavorStatus.prod.name) {
      return Flavor._prod();
    } else if (flavor == FlavorStatus.staging.name) {
      return Flavor._staging();
    } else {
      return Flavor._dev();
    }
  }

  factory Flavor._prod() {
    return Flavor._(baseURL: _baseUrlProd);
  }

  factory Flavor._dev() {
    return Flavor._(baseURL: _baseUrlDev);
  }

  factory Flavor._staging() {
    return Flavor._(baseURL: _baseUrlStaging);
  }
}