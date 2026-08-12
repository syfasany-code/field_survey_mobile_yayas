import 'package:field_survey_mobile_yayas/services/api_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String token;

  const ProfilePage({super.key, required this.token});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? profile;

  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final result = await ApiService.getProfile(widget.token);

      print("PROFILE RESULT: $result"); // DEBUG

      setState(() {
        profile = result; // 🔥 FIX DI SINI (BUKAN result['data'])
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  // 🔥 FIX ANTI NULL ERROR
  String getValue(String key) {
    try {
      final value = profile?[key];
      return value?.toString() ?? '-';
    } catch (e) {
      return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil'), centerTitle: true),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(error!, textAlign: TextAlign.center),
              ),
            )
          : profile == null
          ? const Center(child: Text('Data profil tidak ditemukan'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    getValue('name'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '@${getValue('username')}',
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  _profileItem(
                    icon: Icons.email,
                    title: 'Email',
                    value: getValue('email'),
                  ),

                  _profileItem(
                    icon: Icons.phone,
                    title: 'No. HP',
                    value: getValue('phone'),
                  ),

                  _profileItem(
                    icon: Icons.wc,
                    title: 'Jenis Kelamin',
                    value: getValue('gender'),
                  ),

                  _profileItem(
                    icon: Icons.image,
                    title: 'Foto',
                    value: getValue('photo'),
                  ),

                  _profileItem(
                    icon: Icons.location_city,
                    title: 'Tempat Lahir',
                    value: getValue('birth_place'),
                  ),

                  _profileItem(
                    icon: Icons.calendar_month,
                    title: 'Tanggal Lahir',
                    value: getValue('birth_date'),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _profileItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
