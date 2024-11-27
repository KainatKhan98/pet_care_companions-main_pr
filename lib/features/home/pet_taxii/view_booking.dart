import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet/features/home/pet_taxii/taxidatamodel.dart';
class BookingHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking History')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('bookings').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var bookings = snapshot.data!.docs.map((doc) {
            return Booking.fromMap(doc.id, doc.data() as Map<String, dynamic>);
          }).toList();
          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              var booking = bookings[index];
              return ListTile(
                title: Text(booking.serviceName),
                subtitle: Text('${booking.pickupLocation} -> ${booking.dropOffLocation}'),
              );
            },
          );
        },
      ),
    );
  }
}
