import 'package:flutter/material.dart';

class SelectFieldPositionModal extends StatefulWidget {
  const SelectFieldPositionModal({super.key});

  @override
  State<SelectFieldPositionModal> createState() => _SelectFieldPositionModalState();
}

class _SelectFieldPositionModalState extends State<SelectFieldPositionModal> {
  String? _selectedPosition;
  final List<String> _positions = ['Forward', 'Midfielder', 'Defender', 'Goalkeeper'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // More circular border for the modal
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Make the modal wider
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Select Field Position',
                style: TextStyle(
                  color: Color(0xFF0A3767), // Dark blue title color
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // Slightly smaller font size
                ),
              ),
            ),
            const SizedBox(height: 20), // Reduced spacing
            const Text(
              'Field Position',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14, // Slightly smaller font size
              ),
            ),
            const SizedBox(height: 6), // Reduced spacing
            DropdownButtonFormField<String>(
              value: _selectedPosition,
              items: _positions.map((String position) {
                return DropdownMenuItem<String>(
                  value: position,
                  child: Text(position),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPosition = newValue;
                });
              },
              decoration: InputDecoration(
                hintText: 'Select Field Position',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // More circular border for the dropdown
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Reduced height
              ),
            ),
            const SizedBox(height: 20), // Reduced spacing
            ElevatedButton(
              onPressed: () {
                if (_selectedPosition != null) {
                  Navigator.of(context).pop(_selectedPosition);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A3767),
                padding: const EdgeInsets.symmetric(vertical: 12), // Reduced height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // More circular border for the button
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Slightly smaller font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}