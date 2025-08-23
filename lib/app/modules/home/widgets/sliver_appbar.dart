import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hrms_app/app/data/models/users/user_model.dart';

import '../../../core/constants/app_constants.dart';

class SliverAppBarWidget extends StatelessWidget {
  final UserModel user;
  const SliverAppBarWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: 120,
      toolbarHeight: 110,
      backgroundColor: Colors.grey[100],
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: user.profileImage,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => CircleAvatar(
                        radius: 27,
                        backgroundColor: const Color(0xFF9CB70B),
                        child: Text(
                          user.name[0].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      errorListener: (value) {
                        print("Home Profile image failed to load");
                      },
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user.designation.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    SvgPicture.asset(AppConstants.bellSvg),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
