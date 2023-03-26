import 'dart:developer';

import 'package:event_management_mobile/core/service/http_service_impl.dart';
import 'package:event_management_mobile/core/utils/extensions.dart';
import 'package:event_management_mobile/feature/event_booking/models/event.dart';
import 'package:event_management_mobile/feature/event_booking/repository/events_repository_impl.dart';
import 'package:event_management_mobile/feature/event_booking/views/event_details.dart';
import 'package:flutter/material.dart';

class EventListing extends StatefulWidget {
  const EventListing({super.key});

  @override
  State<EventListing> createState() => _EventListingState();
}

class _EventListingState extends State<EventListing> {
  List<Event> events = [];
  Widget dataState = const SizedBox();
  @override
  void initState() {
    _fetchEvent(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextField(
          onSubmitted: _fetchEvent,
          decoration: const InputDecoration(hintText: "Enter event address"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter With'),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2024));
                          _filterEvents(startDate: date);
                        },
                        child: const Text('Start Date')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2024));
                          _filterEvents(endDate: date);
                        },
                        child: const Text('End Date')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _fetchEvent(null);
                        },
                        child: const Text('Clear'))
                  ],
                )
              ],
            ),
            dataState,
            Expanded(
                child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (ctx, i) {
                      final event = events[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => EventDetails(event)));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      event.description,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(event.address)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  ///
  ///
  ///
  ///
  _filterEvents({DateTime? startDate, DateTime? endDate}) {
    setState(() {
      events = List.from(events.where((element) {
        bool val = false;
        if (startDate != null) {
          val = element.startdate.date.isEqualUptoDay(startDate);
        }
        if (endDate != null) {
          val = element.enddate.date.isEqualUptoDay(endDate);
        }
        return val;
      }));
    });
  }

  _fetchEvent(String? address) async {
    try {
      _setLoading();

      events = address == null
          ? await EventsRepositoryImpl(HttpServiceImpl()).getAllEvents()
          : await EventsRepositoryImpl(HttpServiceImpl())
              .getEvents(address: address);
      _removeLoading();
    } catch (e) {
      log(e.toString());
      _setError("Something went wrong!");
    }
  }

  _setError(String message) {
    setState(() {
      dataState = Center(
        child: Text(message),
      );
    });
  }

  _setLoading() {
    setState(() {
      dataState = const LinearProgressIndicator();
    });
  }

  _removeLoading() {
    setState(() {
      dataState = const SizedBox();
    });
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
