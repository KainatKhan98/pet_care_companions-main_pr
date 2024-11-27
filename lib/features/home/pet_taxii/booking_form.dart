import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet/constants/constants.dart'; // Ensure this includes `btnclr`

class BookingForm extends StatefulWidget {
  final String serviceName;

  BookingForm({required this.serviceName});

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropOffController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String? _selectedPetType;
  bool _isButtonActive = false;

  void _selectBookingDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _dateController.text = date.toLocal().toString().split(' ')[0];
        _updateButtonState();
      });
    }
  }

  void _updateButtonState() {
    setState(() {
      _isButtonActive = _formKey.currentState?.validate() ?? false;
    });
  }

  Future<void> _submitBooking() async {
    if (_formKey.currentState!.validate()) {
      if (_pickupController.text.trim().toLowerCase() ==
          _dropOffController.text.trim().toLowerCase()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pickup and Drop-off locations cannot be the same')),
        );
        return;
      }
      try {
        final bookingData = {
          'userName': _nameController.text,
          'contactNumber': _contactController.text,
          'petType': _selectedPetType,
          'pickupLocation': _pickupController.text,
          'dropOffLocation': _dropOffController.text,
          'petWeight': double.parse(_weightController.text),
          'bookingDate': _dateController.text,
          'serviceName': widget.serviceName,
          'createdAt': Timestamp.now(),
        };

        print("Booking Data: $bookingData"); // Debugging line

        // Store data in Firestore
        await FirebaseFirestore.instance.collection('bookings').add(bookingData);

        print("Data stored successfully"); // Debugging line
        _showConfirmationPopup();
      } catch (e) {
        print("Error while storing data: $e"); // Debugging line
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  void _showConfirmationPopup() {
    print("Popup triggered"); // Debugging line
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your transport has been booked successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the popup
                _resetForm(); // Reset the form
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _selectedPetType = null;
      _dateController.clear();
      _pickupController.clear();
      _dropOffController.clear();
      _weightController.clear();
      _isButtonActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book ${widget.serviceName}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: _updateButtonState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Your Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                      return 'Enter a valid contact number (10-15 digits)';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  value: _selectedPetType,
                  items: ['Cat', 'Dog', 'Rabbit']
                      .map((type) => DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPetType = value;
                      _updateButtonState();
                    });
                  },
                  decoration: InputDecoration(labelText: 'Pet Type'),
                  validator: (value) => value == null ? 'Please select a pet type' : null,
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(labelText: 'Pet Weight (kg)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your pet\'s weight';
                    }
                    if (double.tryParse(value) == null || double.parse(value) <= 0) {
                      return 'Please enter a valid weight';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: _pickupController,
                  decoration: InputDecoration(labelText: 'Pickup Location'),
                  validator: (value) => value!.isEmpty ? 'Please enter a pickup location' : null,
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: _dropOffController,
                  decoration: InputDecoration(labelText: 'Drop-off Location'),
                  validator: (value) => value!.isEmpty ? 'Please enter a drop-off location' : null,
                ),
                SizedBox(height: 16),

                GestureDetector(
                  onTap: _selectBookingDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(labelText: 'Booking Date'),
                      validator: (value) => value!.isEmpty ? 'Please select a booking date' : null,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _isButtonActive ? _submitBooking : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: _isButtonActive ? btnclr : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
