import 'package:event_management_mobile/core/configs/configs.dart';
import 'package:event_management_mobile/core/utils/extensions.dart';
import 'package:event_management_mobile/feature/event_booking/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EventDetails extends StatelessWidget {
  final Event event;
  const EventDetails(
    this.event, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(Configs.baseUrl + event.imageName),
            const SizedBox(
              height: 10,
            ),
            Text(event.description),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Event Venue",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(event.address)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                                '${event.startdate.date.monthName} ${event.startdate.date.day}'),
                            const Text(' - '),
                            Text(
                                '${event.enddate.date.monthName} ${event.enddate.date.day}')
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Center(
                      child: Text(
                    'Ticket',
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.discount_outlined),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                event.ticket.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text('Rs. ${event.ticket.price}')
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Purchase'))
                    ],
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
