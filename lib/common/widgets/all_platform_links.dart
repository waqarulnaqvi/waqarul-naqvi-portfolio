import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AllPlatformLinks extends StatelessWidget {
  const AllPlatformLinks({super.key});

  void _launchIcon(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _launchIcon("https://github.com/waqarulnaqvi");
          },
          child: const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage("assets/images/githublogo.png"),
          ),
        ),
        InkWell(
          onTap: () {
            _launchIcon("https://www.linkedin.com/in/syed-waqarul-naqvi-android-developer");
          },
          child: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/linkedinlogo.png"),
          ),
        ),
        InkWell(
          onTap: () {
            _launchIcon("https://leetcode.com/waqarulnaqvi/");
          },
          child: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/leetcodelog.png"),
          ),
        ),
        InkWell(
          onTap: () {
            _launchIcon("https://play.google.com/store/apps/developer?id=Mysterious+Coder");
          },
          child: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/playstore.png"),
          ),
        ),
      ],
    );
  }
}
