import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.go("/");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hallo", style: TextStyle(fontSize: 18)),
            Text(
              "Selamat Datang di Field Survey",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildMenu(
                    context,
                    icon: Icons.assignment,
                    title: "Data Survey",
                    onTap: () {},
                  ),
                  _buildMenu(
                    context,
                    icon: Icons.add_circle,
                    title: "Tambah Survey",
                    onTap: () {},
                  ),
                  _buildMenu(
                    context,
                    icon: Icons.bar_chart,
                    title: "Laporan",
                    onTap: () {},
                  ),
                  _buildMenu(
                    context,
                    icon: Icons.person,
                    title: "Profil",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildMenu(BuildContext context,
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      );
    }
  }