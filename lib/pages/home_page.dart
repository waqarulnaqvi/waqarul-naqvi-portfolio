import 'package:flutter/material.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/skills.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../utils/project_utils.dart';
import '../widgets/contactsection.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/main_desktop.dart';
import '../widgets/projectcardwidget.dart';
import '../widgets/site_logo.dart';
import '../widgets/work.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  void _launchIcon(String url) async {
    final Uri playStoreUri = Uri.parse(url);
    if (await canLaunchUrl(playStoreUri)) {
      await launchUrl(playStoreUri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final w = screenSize.width;
    final h = screenSize.height;
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: CustomColor.scaffoldBg,
            endDrawer: constraints.maxWidth >= kMinDesktopWidth
                ? null
                : DrawerMobile(
                    w: w*0.75,
                    h: h,
                    onNavItemTap: (int navIndex) {
                      scrollToSection(navIndex);
                      scaffoldKey.currentState
                          ?.closeEndDrawer(); // Close drawer after navigation
                    },
                  ),
            appBar: AppBar(
                backgroundColor: constraints.maxWidth >= kMinDesktopWidth
                    ? CustomColor.scaffoldBg
                    : CustomColor.bgLight1,
                elevation: 0,
                title: constraints.maxWidth >= kMinDesktopWidth
                    ? HeaderDesktop(
                        onNavItemTap: (int navIndex) {
                          scrollToSection(navIndex);
                        },
                        onTap: () {
                          // _launchIcon(
                          // "https://www.linkedin.com/in/syed-waqarul-naqvi-android-developer");
                        },
                      )
                    : SiteLogo()
                // : HeaderMobile(
                //     onTap: () {
                //       _launchIcon(
                //           "https://www.linkedin.com/in/syed-waqarul-naqvi-android-developer");
                // },
                // onMenuTap: () {
                //   scaffoldKey.currentState
                //       ?.openEndDrawer(); // Open the drawer
                // },
                // ),
                ),
            body: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(key: navbarKeys.first),

                  // Main Section
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    MainDesktop(
                      screenSize: screenSize,
                      downloadCv: () {
                        _launchIcon(
                            "https://drive.google.com/file/d/1MNKsqnIxVId3iyRPyGWUtJtgodrC4gud/view?usp=drivesdk");
                      },
                    )
                  else
                    MainMobile(
                      screenSize: screenSize,
                      downloadCv: () {
                        _launchIcon(
                            "https://drive.google.com/file/d/1MNKsqnIxVId3iyRPyGWUtJtgodrC4gud/view?usp=drivesdk");
                      },
                    ),
                  // Work Section
                  Container(
                    width: screenSize.width,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: CustomColor.bgLight1,
                    child: const Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "What I can do",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        SizedBox(height: 50),
                        Work(),
                      ],
                    ),
                  ),

                  // Skills Section
                  Container(
                    key: navbarKeys[1],
                    width: screenSize.width,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: CustomColor.bgLight1,
                    child: const Column(
                      children: [
                        Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        SizedBox(height: 50),
                        Skills(),
                        // if (constraints.maxWidth >= kMedDesktopWidth)
                        //   const SkillsDesktop()
                        // else
                        //   const SkillsMobile(),
                      ],
                    ),
                  ),

                  // Projects Section
                  const SizedBox(height: 30),
                  Container(
                    key: navbarKeys[2],
                    width: screenSize.width,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    child: Column(
                      children: [
                        const Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 50),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 850),
                          child: Wrap(
                            spacing: 25,
                            runSpacing: 50,
                            children: [
                              for (int i = 0; i < projectutils.length; i++)
                                ProjectCardWidget(project: projectutils[i]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 30),

                  // Contact Section
                  ContactSection(key: navbarKeys[3]),

                  // Footer
                  // const Footer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
