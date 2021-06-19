class AnalyticsService {
  void logScreen(String screen, {Map<String, dynamic>? data}) {
    print('Screen: $screen');
  }

  void logEvent(String eventName, {Map<String, dynamic>? data}) {
    print('Event: $eventName data: $data');
  }
}
