import 'package:contact/config/assets/images.dart';
import 'package:contact/core/network/app_url_launcher.dart';
import 'package:contact/core/router/app_router.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final ContactEntity contact;
  const ContactCard({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => AppRouter.push(
        RouterKey.contactDetails,
        argument: contact,
      ),
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.onSecondary,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onBackground.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: contact.picture != null && contact.picture!.isNotEmpty
                    ? FadeInImage(
                        placeholder: const AssetImage(AppImages.loading),
                        image: NetworkImage(
                          contact.picture!.first,
                        ),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        AppImages.avatar,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyLarge,
                    children: [
                      TextSpan(text: contact.firstName ?? ""),
                      TextSpan(text: contact.firstName != null ? " " : ""),
                      TextSpan(
                        text: contact.lastName ?? "",
                      ),
                    ],
                  ),
                ),
                contact.phone != null
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            contact.phone.toString(),
                            style: theme.textTheme.bodySmall!.apply(
                                color: theme.colorScheme.onPrimaryContainer
                                    .withOpacity(0.8)),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
            const Spacer(),
            contact.phone != null
                ? GestureDetector(
                    onTap: () => AppUrlLauncher.telUrl(tel: contact.phone!),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.phone_enabled_rounded,
                        color: theme.colorScheme.onSecondary,
                        size: 18,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
