import 'package:flutter/material.dart';
import 'package:my_astro/widgets/remedy_item_card.dart';

import '../../constant/app_constant.dart';

class VipEPoojaScreen extends StatefulWidget {
  const VipEPoojaScreen({super.key});

  @override
  State<VipEPoojaScreen> createState() => _VipEPoojaScreenState();
}

class _VipEPoojaScreenState extends State<VipEPoojaScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("VIP E-Pooja")),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// --- poster --- ///
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "lib/assets/remedies/vip_pooja.webp",
                  height: size.height * 0.22,
                  fit: BoxFit.cover,
                  width: size.width,
                ),
              ),
            ),

            /// --- vip pooja --- ///
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppConstant.vipEPoojaData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final vipPoojaData = AppConstant.vipEPoojaData[index];
                  return RemedyItemCard(
                    imagePath: vipPoojaData['imagePath'],
                    title: vipPoojaData['poojaName'],
                    price: vipPoojaData['price'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
