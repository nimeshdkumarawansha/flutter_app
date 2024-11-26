import 'package:flutter/material.dart';
import '../widgets/contact_info.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/profile_stats.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const ProfileHeader(
                name: 'Nolimit Admin 1',
                imageUrl: 'assets/images/store/nolimit-logo.png',
                rating: 4.8,
                isAuthorized: true,
              ),
              const SizedBox(height: 20),
              _buildContactInfo(),
              const SizedBox(height: 20),
              const ProfileStats(
                walletAmount: 189420.00,
                orderCount: 231,
              ),
              const SizedBox(height: 20),
              _buildMenuItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          ContactInfoTile(
            icon: Icons.phone,
            text: '+94 777 1234 56',
          ),
          ContactInfoTile(
            icon: Icons.email,
            text: 'customercare@nolimit.lk',
          ),
          ContactInfoTile(
            icon: Icons.language,
            text: 'www.nolimit.lk',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.grid_view,
          title: 'My categories',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.payment,
          title: 'Payment methods',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.local_offer,
          title: 'Promotions',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.delete,
          title: 'Delete authorized member profile',
          isDestructive: true,
          onTap: () {},
        ),
      ],
    );
  }
}
