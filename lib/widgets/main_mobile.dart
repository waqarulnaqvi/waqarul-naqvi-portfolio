import 'package:flutter/material.dart';
import 'package:portfolio/widgets/typingeffect.dart';

import '../common/widgets/all_platform_links.dart';
import '../constants/colors.dart';
import '../styles/style.dart';

class MainMobile extends StatelessWidget {
  final screenSize ;
  void Function()? downloadCv;
  MainMobile({super.key,required this.screenSize,
  required this.downloadCv});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 30.0),
      height: screenSize.height,
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ShaderMask(
              //   shaderCallback: (bounds){
              //     return LinearGradient(
              //     colors: [
              //       CustomColor.scaffoldBg,
              //       CustomColor.scaffoldBg.withOpacity(0.6),
              //     ]
              //     ).createShader(bounds);
              //   },
              //   blendMode: BlendMode.srcATop,
              //   child: Image.asset("assets/images/waqarul.png",
              //       width:screenSize.width/1.5),
              // ),
              Image.asset("assets/images/waqarul.png",
                  width:screenSize.width/2,height: screenSize.height/1.5,),

              const SizedBox(height:10,),
              const Text(
                "Hi,",
                style: TextStyle(
                  fontSize: 22.0,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const Text(
                "I'm Waqarul Hasan Naqvi",
                style: TextStyle(
                  fontSize: 22.0,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const TypingEffect(
                text: "Mobile & Web Developer",
                fontSize: 22.0,
              ),
              // const Text("Hi,\nI'm Waqarul Hasan Naqvi\nA Mobile App Developer",
              //   style: TextStyle(
              //       fontSize: 22.0,
              //       height: 1.5,
              //       fontWeight: FontWeight.bold,
              //       color: CustomColor.whitePrimary
              //
              //   ),),
              const SizedBox(height: 15,),
              AllPlatformLinks(),
              const SizedBox(height: 15,),
              SizedBox(
                  width: 190,
                  child: ElevatedButton(onPressed: downloadCv,
                      style: kButtonStyle,
                      child: const Text("DOWNLOAD CV",
                        style: TextStyle(color: CustomColor.whitePrimary),))),
            ],
          ),

        ],
      ),
    );
  }
}
