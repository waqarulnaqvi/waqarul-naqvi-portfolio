import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  // Lists to manage hover state for frameworks and languages
  final List<Color> _frameworkColors = List.filled(frameworkItems.length, CustomColor.whiteSecondary);
  final List<Color> _languageColors = List.filled(skillItems.length, CustomColor.whiteSecondary);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Frameworks Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Frameworks:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: frameworkItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    var framework = entry.value;
                    return MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _frameworkColors[index] = CustomColor.yellowSecondary; // Change color on hover
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _frameworkColors[index] = CustomColor.whiteSecondary; // Reset color on hover exit
                        });
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        label: Text(
                          framework["title"],
                          style: TextStyle(color: _frameworkColors[index]),
                        ),
                        avatar: Image.asset(
                          framework["img"],
                        ),
                        backgroundColor: Colors.black,
                        shape: StadiumBorder(
                          side: BorderSide(color: _frameworkColors[index]),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),

          // Languages Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Languages:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 15.0,
                  children: skillItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    var skill = entry.value;
                    return MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _languageColors[index] = CustomColor.yellowSecondary; // Change color on hover
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _languageColors[index] = CustomColor.whiteSecondary; // Reset color on hover exit
                        });
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        label: Text(
                          skill["title"],
                          style: TextStyle(color: _languageColors[index]),
                        ),
                        avatar: Image.asset(
                          skill["img"],
                        ),
                        backgroundColor: Colors.black,
                        shape: StadiumBorder(
                          side: BorderSide(color: _languageColors[index]),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// import '../constants/colors.dart';
// import '../constants/skill_items.dart';
//
// class Skills extends StatelessWidget {
//   const Skills({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints:const BoxConstraints(maxWidth: 600) ,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           //platforms
//           Row(
//         children: [
//           const Text(
//             "Frameworks:",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: CustomColor.whitePrimary,
//             ),
//           ),
//
//           const SizedBox(width: 20.0,),
//
//           Wrap(
//             spacing: 10.0,
//             runSpacing: 10.0,
//             children: [
//               for(int i=0;i<frameworkItems.length;i++)
//                 Chip(
//                   padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16.0),
//                   label: Text(frameworkItems[i]["title"],),
//                   avatar:Image.asset(frameworkItems[i]["img"],),
//                 )
//             ],
//           ),
//         ],
//           ),
//           const SizedBox(height: 20.0,),
//
// Row(
//     children: [
//           const Text(
//             "Languages:",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: CustomColor.whitePrimary,
//             ),
//           ),
//           const SizedBox(width: 20.0,),
//
//
//           //languages
//           Wrap(
//             spacing: 10.0,
//             runSpacing: 10.0,
//             children: [
//               for(int i=0;i<skillItems.length;i++)
//                 Chip(
//                   padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16.0),
//                   label: Text(skillItems[i]["title"],),
//                   avatar:Image.asset(skillItems[i]["img"],),
//                 )
//             ],
//           ),
//   ],),
//         ],
//       ),
//     );
//   }
// }
