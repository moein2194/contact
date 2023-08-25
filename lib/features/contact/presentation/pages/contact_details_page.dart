import 'package:contact/core/router/app_router.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/presentation/widgets/contact_details_header.dart';
import 'package:contact/features/contact/presentation/widgets/contact_param.dart';
import 'package:flutter/material.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({super.key});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  ContactEntity? contact;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        var args = AppRouter.getArgument(context).data;
        if (args != null && contact == null) {
          contact = args;
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return contact == null
        ? const SizedBox()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  AppRouter.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: theme.colorScheme.tertiary,
                  size: 20,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "edit",
                    style: theme.textTheme.bodyLarge!.apply(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
              ],
            ),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactDetailsHeader(
                    contact: contact!,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ContactParam(
                          title: "Phone number",
                          details: contact!.phone,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ContactParam(
                          title: "Note",
                          details: contact!.notes,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
