import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({
    super.key,
    required this.username,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const String _maleImage =
      'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';

  static const String _femaleImage =
      'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

  String _profileImage = _maleImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.network(
                  _profileImage,
                  width: 165,
                  height: 165,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 165,
                      height: 165,
                      color: _profileImage == _maleImage
                          ? Colors.blue.shade100
                          : Colors.pink.shade100,
                      child: Icon(
                        _profileImage == _maleImage
                            ? Icons.male
                            : Icons.female,
                        size: 80,
                        color: _profileImage == _maleImage
                            ? Colors.blue
                            : Colors.pink,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.username,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _profileImage = _maleImage;
                      });
                    },
                    child: ClipOval(
                      child: Image.network(
                        _maleImage,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 64,
                            height: 64,
                            color: Colors.blue.shade100,
                            child: const Icon(
                              Icons.male,
                              size: 35,
                              color: Colors.blue,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _profileImage = _femaleImage;
                      });
                    },
                    child: ClipOval(
                      child: Image.network(
                        _femaleImage,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 64,
                            height: 64,
                            color: Colors.pink.shade100,
                            child: const Icon(
                              Icons.female,
                              size: 35,
                              color: Colors.pink,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}