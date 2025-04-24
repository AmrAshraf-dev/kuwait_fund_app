part of 'contactus_cubit.dart';

abstract class ContactusState {
  final ContactusEntity? contactusEntity;

  ContactusState({this.contactusEntity});

 }

class ContactusInitialState extends ContactusState {
  ContactusInitialState() : super(contactusEntity: null);

   
}

class ContactusLoadingState extends ContactusState {
  ContactusLoadingState({super.contactusEntity});

  
}

class ContactusReadyState extends ContactusState {
  ContactusReadyState({required ContactusEntity contactusEntity})
      : super(contactusEntity: contactusEntity);

 
}

class ContactusErrorState extends ContactusState {
  final String? message;

  ContactusErrorState({this.message, super.contactusEntity});

  
}
