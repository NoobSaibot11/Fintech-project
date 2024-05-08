import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 120.0, // Set the desired height
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 10.0,right: 10.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter Transaction ID/Payee Name',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),
            ),
            // Display search results or other content based on _searchText
            Expanded(
              child: Center(
                child: _searchText.isEmpty
                    ? const Text('Search Transaction History')
                    : Text('Search Transaction history for: $_searchText'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}