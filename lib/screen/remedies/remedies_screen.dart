import 'package:flutter/material.dart';
import 'package:my_astro/screen/remedies/murti_screen.dart';
import 'package:my_astro/screen/remedies/vip_e_pooja_screen.dart';
import '../../constant/app_constant.dart';
import '../../widgets/remedies_carousel_slider.dart';

class RemediesScreen extends StatefulWidget {
  const RemediesScreen({super.key});

  @override
  State<RemediesScreen> createState() => _RemediesScreenState();
}

class _RemediesScreenState extends State<RemediesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: _appBar(size),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const RemediesCarouselSlider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppConstant.remediesData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    final remediesData = AppConstant.remediesData[index];
                    return _remediesCard(
                      imagePath: remediesData['image'],
                      title: remediesData['title'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.menu, size: 27),
            const SizedBox(width: 8),
            const Text("AstroRemedy", style: TextStyle(fontSize: 18)),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent.shade100.withAlpha(60),
                border: Border.all(width: 1, color: Colors.pinkAccent),
                borderRadius: BorderRadius.circular(21),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.restart_alt, size: 18),
                    SizedBox(width: 4),
                    Text("Orders", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.shopping_cart_outlined, size: 27),
            const SizedBox(width: 12),
            const Icon(Icons.search, size: 27),
          ],
        ),
      ),
    );
  }

  Widget _remediesCard({required String imagePath, required String title}) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case "VIP E-Pooja":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => VipEPoojaScreen()),
            );
          case "Murti":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MurtiScreen()),
            );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(imagePath, fit: BoxFit.cover),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(1.0, 2.0),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
