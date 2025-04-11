part of 'profile_cubit.dart';

@freezed
sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

final class ProfileNotEditable extends ProfileState {
  const ProfileNotEditable();
}

final class ProfileEditable extends ProfileState {
  const ProfileEditable();
}

final class ProfilePictureSelected extends ProfileEditable {
  final Uint8List profilePictureData;

  const ProfilePictureSelected(this.profilePictureData);

  @override
  List<Object?> get props => [profilePictureData];
}
