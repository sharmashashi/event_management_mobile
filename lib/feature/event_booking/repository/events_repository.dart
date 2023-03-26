import 'package:event_management_mobile/feature/event_booking/models/event.dart';

abstract class EventsRepository {
  String get path;
  String get allEventsPath;
  Future<List<Event>> getEvents({required String address});
  Future<List<Event>> getAllEvents();
}
