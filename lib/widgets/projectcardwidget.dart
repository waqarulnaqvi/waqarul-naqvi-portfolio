import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/skill_items.dart';
import '../utils/project_utils.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectUtils project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  // Initialize color list for hover effect on technologies
  final List<Color> _technologyColors = List.filled(
      technologyItems.length, CustomColor.whiteSecondary);

  // Initialize colors for hover effect on title, description, and link text
  Color _titleColor = CustomColor.whitePrimary;
  Color _descriptionColor = CustomColor.whitePrimary;
  Color _linkTextColor = CustomColor.whitePrimary;

  // Function to open the Play Store link
  void _launchPlayStoreLink(String url) async {
    final Uri playStoreUri = Uri.parse(url);
    if (await canLaunchUrl(playStoreUri)) {
      await launchUrl(playStoreUri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return InkWell(
      onTap: () {
        _launchPlayStoreLink(widget.project.playstoreLink.toString());
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        decoration: const BoxDecoration(
          color: CustomColor.bgLight1,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const SizedBox(height: 16),

        // Project Title and Play Store Link Section
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _titleColor =
                        CustomColor.yellowSecondary; // Change color on hover
                  });
                },
                onExit: (_) {
                  setState(() {
                    _titleColor =
                        CustomColor.whitePrimary; // Reset color on hover exit
                  });
                },
                child: Text(
                  widget.project.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: _titleColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _linkTextColor = CustomColor
                            .yellowSecondary; // Change color on hover
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _linkTextColor = CustomColor
                            .whitePrimary; // Reset color on hover exit
                      });
                    },
                    child: Text(
                      "Link:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _linkTextColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage('assets/images/playstore.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),

        // Project Image Section
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              widget.project.image,
              fit: BoxFit.cover,
              width: size.width,
              // height: 320,
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Project Description Section
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _descriptionColor =
                  CustomColor.yellowSecondary; // Change color on hover
            });
          },
          onExit: (_) {
            setState(() {
              _descriptionColor =
                  CustomColor.whitePrimary; // Reset color on hover exit
            });
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              widget.project.description,
              style: TextStyle(
                fontSize: 16,
                color: _descriptionColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

              const Text(
                "Platforms Used:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: CustomColor.whitePrimary,
                ),
              ),

              const SizedBox(height: 20),


        // ConstrainedBox(
        //   constraints: const BoxConstraints(maxWidth: 700),
        //   child:
        // ),

              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  for (int i = 0; i < technologyItems.length; i++)
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _technologyColors[i] =
                              CustomColor.yellowSecondary; // Change color on hover
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _technologyColors[i] = CustomColor
                              .whiteSecondary; // Reset color on hover exit
                        });
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        label: Text(
                          technologyItems[i]["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _technologyColors[i], // Apply hover color
                          ),
                        ),
                        avatar: Image.asset(
                          technologyItems[i]["img"],
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                              color: _technologyColors[i]), // Apply hover color to border
                        ),
                      ),
                    ),
                ],
              ),
        // Platforms Used Section with Hover Effect
        // ConstrainedBox(
        //   constraints: const BoxConstraints(maxWidth: 700),
        //   child:
        // ),
      ],
    ),)
    ,
    );
  }
}
