import 'package:flutter/material.dart';

// Entry point of the Flutter application.
void main() {
  runApp(MyApp());
}

// MyApp is the main widget that starts the application.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// _MyAppState is the state for MyApp that handles the logic and UI.
class _MyAppState extends State<MyApp> {
  // Variable to keep track of the selected index in the bottom navigation bar.
  int _selectedIndex = 0; 
  // Variable to keep track of the like button's state.
  bool _isLiked = false; 

  // Function to handle tapping on a bottom navigation bar item.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Placeholder for navigation logic, possibly using Navigator.push.
  }

  // Function to toggle the like button's state.
  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
    // Placeholder for additional functionality when the like button is pressed.
  }

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root widget of the application.
    return MaterialApp(
      title: 'Display Image Example',
      home: Scaffold(
        // AppBar at the top of the application screen.
        appBar: AppBar(
          title: Text('Flappy Bird'),
        ),
        // Body of the Scaffold, containing a fullscreen image.
        body: Container(
          decoration: const BoxDecoration(
            // DecorationImage allows the image to cover the entire container.
            image: DecorationImage(
              image: AssetImage('assets/flappybirdgamestart.jpg'), // Path to the background image.
              fit: BoxFit.cover, // Ensures the image covers the whole container.
            ),
          ),
        ),
        // BottomAppBar contains the bottom navigation bar with icon buttons.
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // IconButtons are used as clickable items in the bottom bar.
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.leaderboard),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(Icons.gamepad),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
        // FloatingActionButton is used here as a like button.
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleLike,
          tooltip: 'Like',
          // Icon changes based on whether the item is liked or not.
          child: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border,
          ),
        ),
        // Positioning the FloatingActionButton in the center of the BottomAppBar.
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
