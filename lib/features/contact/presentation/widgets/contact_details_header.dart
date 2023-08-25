import 'package:contact/config/assets/images.dart';
import 'package:contact/config/enums.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/presentation/widgets/conversation_icon_button.dart';
import 'package:flutter/material.dart';

class ContactDetailsHeader extends StatelessWidget {
  final ContactEntity contact;
  final VoidCallback? onPressedEdit;
  const ContactDetailsHeader({
    super.key,
    required this.contact,
    this.onPressedEdit,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.maxFinite,
      height: width * 0.75,
      margin: const EdgeInsets.all(12),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.colorScheme.background,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.shadow.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
                bottom: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.headlineSmall,
                      children: [
                        TextSpan(text: contact.firstName ?? ""),
                        TextSpan(text: contact.firstName != null ? " " : ""),
                        TextSpan(
                          text: contact.lastName ?? "",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  contact.email != null
                      ? Text(
                          contact.email!,
                          style: theme.textTheme.bodySmall!.apply(
                            color: theme.colorScheme.tertiary,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      contact.email != null
                          ? Row(
                              children: [
                                ConversationIconButton(
                                  conversationType: ConversationType.email,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: width / 8,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      contact.phone != null
                          ? Row(
                              children: [
                                ConversationIconButton(
                                  conversationType: ConversationType.message,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: width / 8,
                                ),
                                ConversationIconButton(
                                  conversationType: ConversationType.call,
                                  onPressed: () {},
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onPressedEdit,
                  icon: Icon(
                    Icons.edit,
                    color: theme.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: contact.picture != null && contact.picture!.isNotEmpty
                    ? FadeInImage(
                        placeholder: const AssetImage(AppImages.loading),
                        image: NetworkImage(contact.picture!.first),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(AppImages.avatar),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
