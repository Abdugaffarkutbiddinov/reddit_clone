class ApiConfig {
  static const BASE_API_URL = String.fromEnvironment(
    'BASE_API_URL',
    defaultValue: 'https://www.reddit.com/',
  );

}
