import 'package:contact/core/widgets/app_text_field.dart';
import 'package:contact/features/contact/data/models/contact_model.dart';
import 'package:contact/features/home/presentation/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, width * 0.3),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Hi, My Friend",
                        style: theme.textTheme.bodyMedium!.apply(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                AppTextField(
                  controller: searchController,
                  prefixIcon: Icons.search_sharp,
                  hintText: "Search",
                ),
              ],
            ),
          ),
        ),
        backgroundColor: theme.colorScheme.onSecondary,
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ContactCard(
              contact: ContactModel(
                firstName: "Moein",
                lastName: "Moradi",
                phone: "+989135961052",
                email: "flyman812@gmail.com",
                picture: [
                  "https://picsum.photos/200",
                ],
                notes:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 1,
          backgroundColor: theme.colorScheme.primary,
          child: Icon(
            Icons.add_rounded,
            color: theme.colorScheme.background,
          ),
        ),
      ),
    );
  }
}
