import 'dart:convert';

List<Event> eventFromJson(String str) => List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
    Event({
        required this.id,
        required this.name,
        required this.description,
        required this.address,
        required this.startdate,
        required this.enddate,
        required this.imageName,
        required this.updatedAt,
        required this.ticket,
    });

    final int id;
    final String name;
    final String description;
    final String address;
    final Enddate startdate;
    final Enddate enddate;
    final String imageName;
    final Enddate updatedAt;
    final Ticket ticket;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        startdate: Enddate.fromJson(json["startdate"]),
        enddate: Enddate.fromJson(json["enddate"]),
        imageName: json["imageName"],
        updatedAt: Enddate.fromJson(json["updatedAt"]),
        ticket: Ticket.fromJson(json["ticket"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "startdate": startdate.toJson(),
        "enddate": enddate.toJson(),
        "imageName": imageName,
        "updatedAt": updatedAt.toJson(),
        "ticket": ticket.toJson(),
    };
}

class Enddate {
    Enddate({
        required this.date,
        required this.timezoneType,
        required this.timezone,
    });

    final DateTime date;
    final int timezoneType;
    final String timezone;

    factory Enddate.fromJson(Map<String, dynamic> json) => Enddate(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
    };
}

class Ticket {
    Ticket({
        required this.id,
        required this.name,
        required this.price,
    });

    final int id;
    final String name;
    final int price;

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
    };
}
