import 'package:flutter/material.dart';
import 'package:my_astro/widgets/remedy_item_card.dart';

import '../../constant/app_constant.dart';

class MurtiScreen extends StatefulWidget {
  const MurtiScreen({super.key});

  @override
  State<MurtiScreen> createState() => _VipEPoojaScreenState();
}

class _VipEPoojaScreenState extends State<MurtiScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Murti") ,
      actions: [
        Icon(Icons.shopping_cart_outlined) ,
        SizedBox(width: 12,),
        Icon(Icons.search) ,
        SizedBox(width: 12,)

      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  final murtiData = AppConstant.murtiData[index];
                  return RemedyItemCard(
                    imagePath: murtiData['imagePath'],
                    title: murtiData['murtiName'],
                    price: murtiData['price'],
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
