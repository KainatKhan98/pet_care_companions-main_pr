class Booking {
  String id;
  String userName;
  String contactNumber;
  String petType;
  String pickupLocation;
  String dropOffLocation;
  DateTime bookingDate;
  String serviceName;

  Booking({
    this.id = '',
    required this.userName,
    required this.contactNumber,
    required this.petType,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.bookingDate,
    required this.serviceName,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'contactNumber': contactNumber,
      'petType': petType,
      'pickupLocation': pickupLocation,
      'dropOffLocation': dropOffLocation,
      'bookingDate': bookingDate.toIso8601String(),
      'serviceName': serviceName,
    };
  }

  factory Booking.fromMap(String id, Map<String, dynamic> data) {
    return Booking(
      id: id,
      userName: data['userName'],
      contactNumber: data['contactNumber'],
      petType: data['petType'],
      pickupLocation: data['pickupLocation'],
      dropOffLocation: data['dropOffLocation'],
      bookingDate: DateTime.parse(data['bookingDate']),
      serviceName: data['serviceName'],
    );
  }
}
