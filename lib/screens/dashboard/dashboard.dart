// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               context.go("/");
//             },
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Hallo", style: TextStyle(fontSize: 18)),
//             Text(
//               "Selamat Datang di Field Survey",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),

//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 children: [
//                   _buildMenu(
//                     context,
//                     icon: Icons.assignment,
//                     title: "Data Survey",
//                     onTap: () {},
//                   ),
//                   _buildMenu(
//                     context,
//                     icon: Icons.add_circle,
//                     title: "Tambah Survey",
//                     onTap: () {},
//                   ),
//                   _buildMenu(
//                     context,
//                     icon: Icons.bar_chart,
//                     title: "Laporan",
//                     onTap: () {},
//                   ),
//                   _buildMenu(
//                     context,
//                     icon: Icons.person,
//                     title: "Profil",
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// Widget _buildMenu(BuildContext context,
//     {required IconData icon,
//     required String title,
//     required VoidCallback onTap}) {
//       return GestureDetector(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 40, color: Colors.blue),
//               SizedBox(height: 10),
//               Text(
//                 title,
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               )
//             ],
//           ),
//         ),
//       );
//     }
//   }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.go("/");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      /// BODY
      body: _buildBody(),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Survey",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Laporan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }

  /// SWITCH PAGE
  Widget _buildBody() {
    switch (currentIndex) {
      case 0:
        return _homePage();
      case 1:
        return const Center(child: Text("Survey Page"));
      case 2:
        return const Center(child: Text("Laporan Page"));
      case 3:
        return const Center(child: Text("Profil Page"));
      default:
        return _homePage();
    }
  }

  /// ================= HOME (SESUAI GAMBAR) =================
  Widget _homePage() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hallo", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 5),
          const Text(
            "Selamat Datang di Field Survey",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _menuCard(
                  icon: Icons.assignment,
                  title: "Data Survey",
                  onTap: () {
                    setState(() => currentIndex = 1);
                  },
                ),
                _menuCard(
                  icon: Icons.add_circle,
                  title: "Tambah Survey",
                  onTap: () {},
                ),
                _menuCard(
                  icon: Icons.bar_chart,
                  title: "Laporan",
                  onTap: () {
                    setState(() => currentIndex = 2);
                  },
                ),
                _menuCard(
                  icon: Icons.person,
                  title: "Profil",
                  onTap: () {
                    setState(() => currentIndex = 3);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ================= CARD MENU =================
  Widget _menuCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD6E4F0), // soft biru kayak gambar
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}