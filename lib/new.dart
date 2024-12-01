import 'package:flutter/material.dart';
import 'package:pet/main.dart';

import 'constants/colors.dart';
import 'constants/sizes.dart';



class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> doctors = [
      {
        'name': 'Dr. John Doe',
        'image': 'https://example.com/doctor_image.jpg',
        'specialization': 'Veterinarian',
        'ratings': 4.5,
        'services': ['Vaccination', 'Consultation', 'Check-up'],
      },
      {
        'name': 'Dr. Jane Smith',
        'image': 'https://example.com/doctor_image2.jpg',
        'specialization': 'Vet',
        'ratings': 4.8,
        'services': ['Consultation', 'Surgery'],
      },
      {
        'name': 'Dr. Alice Brown',
        'image': 'https://example.com/doctor_image3.jpg',
        'specialization': 'Veterinarian',
        'ratings': 4.2,
        'services': ['Vaccination', 'Check-up'],
      },
    ];

    // Selected service
    String selectedService = 'Vaccination'; // You can make this dynamic based on user selection

    // Filter doctors based on selected service
    List<Map<String, dynamic>> filteredDoctors = doctors.where((doctor) {
      return doctor['services'].contains(selectedService);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Doctor Profiles',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),

      ),
      body: Column(
        children: [
          Text(
            'Available Doctors',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          filteredDoctors.isEmpty
              ? Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('No doctors available for the selected service.'),
            ),
          )
              : Container(
                height: 200,
                width: 200,
                child: ListView.builder(
                  itemCount: filteredDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = filteredDoctors[index];
                    return DoctorProfileCard(
                      doctorName: doctor['name'],
                      doctorImage: doctor['image'],
                      specialization: doctor['specialization'],
                      ratings: doctor['ratings'],
                      services: doctor['services'],
                      onProfileTap: () {
                        // Handle profile tap action (e.g., navigate to detailed profile page)
                      },
                    );
                  },
                ),
              ),

        ],
      ),
    );
  }
}


class DoctorProfileCard extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final String specialization;
  final double ratings;
  final List<String> services;
  final VoidCallback onProfileTap;

  const DoctorProfileCard({
    super.key,
    required this.doctorName,
    required this.doctorImage,
    required this.specialization,
    required this.ratings,
    required this.services,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProfileTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.s),
        padding: EdgeInsets.all(Sizes.s),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.s),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                doctorImage,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 70,
                    height: 70,
                    color: Colors.grey[200],
                    child: Icon(Icons.person, color: Colors.grey, size: 40),
                  );
                },
              ),
            ),
            SizedBox(width: Sizes.m),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  specialization,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      ratings.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Services: ${services.join(', ')}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}