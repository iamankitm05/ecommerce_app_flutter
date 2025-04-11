import 'dart:typed_data';

import 'package:ecommerce/core/utils/image_picker_util.dart';
import 'package:ecommerce/data/models/user/user.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.user)
    : email = TextEditingController(text: user.email),
      firstName = TextEditingController(text: user.firstName),
      lastName = TextEditingController(text: user.lastName),
      _photoURL = user.photoURL,
      super(ProfileNotEditable());

  final User user;
  final TextEditingController email;
  final TextEditingController firstName;
  final TextEditingController lastName;
  String _photoURL;
  String get photoURL => _photoURL;

  @override
  Future<void> close() {
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    return super.close();
  }

  void makeProfileEditable() {
    emit(ProfileEditable());
  }

  void makeProfileNotEditable() {
    // Reset form fields
    // ...
    emit(ProfileNotEditable());
  }

  void selectProfilePicture() async {
    try {
      final image = await ImagePickerUtil().pickImageAsBytes(
        source: ImageSource.gallery,
      );

      emit(ProfilePictureSelected(image));
    } catch (_) {}
  }
}
