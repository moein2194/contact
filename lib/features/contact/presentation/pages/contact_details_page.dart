import 'package:contact/core/models/event_status.dart';
import 'package:contact/core/router/app_router.dart';
import 'package:contact/core/router/screen_arguments.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:contact/features/contact/presentation/widgets/contact_details_header.dart';
import 'package:contact/features/contact/presentation/widgets/contact_param.dart';
import 'package:contact/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                BlocConsumer<ContactBloc, ContactState>(
                    listenWhen: (previous, current) =>
                        previous.deleteContactStatus !=
                        current.deleteContactStatus,
                    buildWhen: (previous, current) =>
                        previous.deleteContactStatus !=
                        current.deleteContactStatus,
                    listener: (context, state) {
                      if (state.deleteContactStatus is EventCompleted) {
                        BlocProvider.of<HomeBloc>(context)
                            .add(RemoveContactFromList(id: contact!.id!));
                        AppRouter.pop();
                      }
                      if (state.deleteContactStatus is EventError) {
                        AppRouter.pop();
                      }
                    },
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () {
                          BlocProvider.of<ContactBloc>(context)
                              .add(DeleteContactEvent(contactId: contact!.id!));
                        },
                        child: state.deleteContactStatus is EventLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.error,
                                ),
                              )
                            : Text(
                                "delete",
                                style: theme.textTheme.bodyLarge!.apply(
                                  color: theme.colorScheme.error,
                                ),
                              ),
                      );
                    }),
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
                    onPressedEdit: () async {
                      ScreenArguments argument = await AppRouter.push(
                        RouterKey.editContact,
                        argument: contact,
                      );

                      if (argument.data == null) {
                          contact = argument.data;
                        setState(() {
                        });
                      }
                    },
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
