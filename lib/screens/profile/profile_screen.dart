import 'package:flutter/material.dart';
import 'package:flutter_dating_app/models/models.dart';

import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ProfileScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'PROFILE',
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      user.imageUrls[0],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      user.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithIcon(title: 'Biography', icon: Icons.edit),
                Text(
                  user.bio,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                const TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                    itemCount: user.imageUrls.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 125,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(user.imageUrls[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const TitleWithIcon(title: 'Location', icon: Icons.edit),
                Text(
                  'Los Vegas, USA',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                const TitleWithIcon(title: 'Interests', icon: Icons.edit),
                Row(
                  children: const [
                    CustomTextContainer(text: 'MUSIC'),
                    CustomTextContainer(text: 'FOOTBALL'),
                    CustomTextContainer(text: 'ART'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
