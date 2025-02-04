import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';
import 'drawer_tile.dart';

class DrawerMobile extends StatelessWidget {
  final Function(int) onNavItemTap;
  final double w;
  final double h;

  const DrawerMobile(
      {super.key,
      required this.onNavItemTap,
      required this.w,
      required this.h});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.white,
            CustomColor.hintDark,
          ])),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: 220,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [  CustomColor.bgLight1, CustomColor.bgLight2],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/waqarulicon.jpeg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: CustomColor.yellowPrimary, // Change the color as needed
                        width: 2, // Adjust the border width
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Waqarul Naqvi", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 22,color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < navIcons.length; i++)
              DrawerTile(
                  icon: navIcons[i],
                  title: navTitles[i],
                  onTap: () {
                    onNavItemTap(i);
                  }),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../constants/colors.dart';
// import '../constants/nav_items.dart';
//
// class DrawerMobile extends StatelessWidget {
//   const DrawerMobile({super.key, required this.onNavItemTap});
//
//   final Function(int) onNavItemTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: CustomColor.scaffoldBg,
//       child: ListView(
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: const Icon(Icons.close)),
//             ),
//           ),
//
//
//           for (int i = 0; i < navIcons.length; i++)
//             ListTile(
//               contentPadding: const EdgeInsets.symmetric(horizontal: 30),
//               leading: Icon(navIcons[i]),
//               title: Text(navTitles[i]),
//               titleTextStyle: const TextStyle(
//                   color: CustomColor.whitePrimary,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16),
//               onTap: () {
//                 onNavItemTap(i);
//               },
//             )
//         ],
//       ),
//     );
//   }
// }
//
