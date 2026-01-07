import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svfoods/common/widgets/custom_button.dart';
import 'package:svfoods/provider/user_provider.dart';
import 'package:svfoods/services/profile_service.dart';
import 'package:svfoods/utils/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileService profileService = ProfileService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 1)),
                  child: Text(
                    user.name[0],
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
                Text(
                  user.name,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: CustomButton(
                buttonName: "Log Out",
                onTap: () async {
                  await profileService.logOutUser(context: context);
                }),
          )
        ],
      ),
    );
  }
}
