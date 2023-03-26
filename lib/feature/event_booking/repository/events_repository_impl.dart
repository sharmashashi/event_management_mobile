import 'package:event_management_mobile/core/configs/configs.dart';
import 'package:event_management_mobile/core/service/http_service.dart';
import 'package:event_management_mobile/feature/event_booking/models/event.dart';
import 'package:event_management_mobile/feature/event_booking/repository/events_repository.dart';

class EventsRepositoryImpl implements EventsRepository {
  final HttpService httpService;
  EventsRepositoryImpl(this.httpService);
  @override
  Future<List<Event>> getEvents({required String address}) async {
    final Map<String, dynamic> queryParameters = {'address': address};
    final json = await httpService.get(Configs.baseUrl + path,
        queryParameters: queryParameters);

    return eventFromJson(json);
  }

  @override
  String get path => '/event';
  @override
  String get allEventsPath => '/allEvents';

  @override
  Future<List<Event>> getAllEvents() async {
    final json = await httpService.get(
      Configs.baseUrl + allEventsPath,
    );

    return eventFromJson(json);
  }
}
