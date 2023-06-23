import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  _buildPhotoButton(
                    imageUrl: 'https://images.pexels.com/photos/9954174/pexels-photo-9954174.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                    caption: 'Photo 1',
                    onPressed: () {
                      _showSnackBar(context, 'Clicked on Photo 1!');
                    },
                  ),
                  _buildPhotoButton(
                    imageUrl: 'https://images.pexels.com/photos/9954174/pexels-photo-9954174.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                    caption: 'Photo 2',
                    onPressed: () {
                      _showSnackBar(context, 'Clicked on Photo 2!');
                    },
                  ),
                  _buildPhotoButton(
                    imageUrl: 'https://images.pexels.com/photos/9954174/pexels-photo-9954174.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                    caption: 'Photo 3',
                    onPressed: () {
                      _showSnackBar(context, 'Clicked on Photo 3!');
                    },
                  ),
                  _buildPhotoButton(
                    imageUrl: 'https://images.pexels.com/photos/9954174/pexels-photo-9954174.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                    caption: 'Photo 4',
                    onPressed: () {
                      _showSnackBar(context, 'Clicked on Photo 4!');
                    },
                  ),
                  _buildPhotoButton(
                    imageUrl: 'https://images.pexels.com/photos/9954174/pexels-photo-9954174.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                    caption: 'Photo 5',
                    onPressed: () {
                      _showSnackBar(context, 'Clicked on Photo 5!');
                    },
                  ),
                  _buildPhotoButton(
                    imageUrl: 'https://images.pexels.com/photos/9954174/pexels-photo-9954174.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                    caption: 'Photo 6',
                    onPressed: () {
                      _showSnackBar(context, 'Clicked on Photo 6!');
                    },
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 1'),
                  subtitle: Text('Category 1'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 2'),
                  subtitle: Text('Category 2'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 3'),
                  subtitle: Text('Category 3'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSnackBar(context, 'Photos Uploaded Successfully!');
        },
        child: Icon(Icons.cloud_upload),
      ),
    );
  }

  Widget _buildPhotoButton({
    required String imageUrl,
    required String caption,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.network(
              imageUrl,
              width: 105.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              caption,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}


