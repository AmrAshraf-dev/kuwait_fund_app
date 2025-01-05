part of 'contactus_cubit.dart';

abstract class ContactusState {
  final ContactusEntity? contactusEntity;

  ContactusState({this.contactusEntity});

  ContactusState copyWith({ContactusEntity? contactusEntity});
}

class ContactusInitialState extends ContactusState {
  ContactusInitialState() : super(contactusEntity: null);

  @override
  ContactusInitialState copyWith({ContactusEntity? contactusEntity}) {
    return ContactusInitialState();
  }
}

class ContactusLoadingState extends ContactusState {
  ContactusLoadingState({super.contactusEntity});

  @override
  ContactusLoadingState copyWith({ContactusEntity? contactusEntity}) {
    return ContactusLoadingState(
        contactusEntity: contactusEntity ?? this.contactusEntity);
  }
}

class ContactusReadyState extends ContactusState {
  ContactusReadyState({required ContactusEntity contactusEntity})
      : super(contactusEntity: contactusEntity);

  @override
  ContactusReadyState copyWith({ContactusEntity? contactusEntity}) {
    return ContactusReadyState(
        contactusEntity: contactusEntity ?? this.contactusEntity!);
  }
}

class ContactusErrorState extends ContactusState {
  final String? message;

  ContactusErrorState({this.message, super.contactusEntity});

  @override
  ContactusErrorState copyWith(
      {ContactusEntity? contactusEntity, String? message}) {
    return ContactusErrorState(
      message: message ?? this.message,
      contactusEntity: contactusEntity ?? this.contactusEntity,
    );
  }
}
