class MplusSoft {
  CurrentBookings? currentBookings;
  List<Package>? packages;

  MplusSoft({
     this.currentBookings,
     this.packages,
  });

}

class CurrentBookings {
  String packageLabel;
  String fromDate;
  String fromTime;
  String toDate;
  String toTime;

  CurrentBookings({
    required this.packageLabel,
    required this.fromDate,
    required this.fromTime,
    required this.toDate,
    required this.toTime,
  });

}

class Package {
  int id;
  String packageName;
  int price;
  String description;

  Package({
    required this.id,
    required this.packageName,
    required this.price,
    required this.description,
  });

}
