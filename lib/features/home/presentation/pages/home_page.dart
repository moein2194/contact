import 'package:contact/core/router/app_router.dart';
import 'package:contact/core/widgets/app_text_field.dart';
import 'package:contact/core/widgets/default_loading.dart';
import 'package:contact/core/widgets/event_status_layout.dart';
import 'package:contact/features/contact/data/models/contact_model.dart';
import 'package:contact/features/contact/domain/entities/contact_entity.dart';
import 'package:contact/features/home/presentation/bloc/home_bloc.dart';
import 'package:contact/features/home/presentation/widgets/contact_card.dart';
import 'package:contact/features/home/presentation/widgets/error_contacts_listing_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getAllContacts();
    super.initState();
  }

  void getAllContacts() {
    BlocProvider.of<HomeBloc>(context).add(GetAllContactsEvent());
  }

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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return EventStatusLayout<List<ContactEntity>>(
              status: state.contactsListStatus,
              onCompletedStatus: (context, data) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    ContactEntity contact = data[index];
                    return ContactCard(
                      contact: ContactModel(
                        firstName: contact.firstName,
                        lastName: contact.lastName,
                        phone: contact.phone,
                        email: contact.email,
                        picture: contact.picture,
                        notes: contact.notes,
                      ),
                    );
                  },
                );
              },
              onErrorStatus: Center(
                child: ErrorCotactsListingLayout(
                  onPressedTryAgain: () {
                    getAllContacts();
                  },
                ),
              ),
              onInitialStatus: const SizedBox(),
              onLoadingStatus: const Center(
                child: DefaultLoading(),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppRouter.push(
              RouterKey.addContact,
            );
          },
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
