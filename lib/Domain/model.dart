import 'package:freezed_annotation/freezed_annotation.dart';
part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class ResuultModel with _$ResuultModel{
  const factory ResuultModel({
    required List<Results>? results,

  }) = _ResuultModel;

  factory ResuultModel.fromJson(Map<String, dynamic> json) => _$ResuultModelFromJson(json);
}

@freezed
class Results with _$Results{
  const factory Results({
    @JsonKey(name: 'gender') required String? gender,
    required Name? name,
    required Location? location,
    @JsonKey(name: 'email') required String? email,
    required Dob?dob,
    @JsonKey(name: 'phone') required String? phoneNumber,
    required Picture? picture,






  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
}
@freezed
class Name with _$Name{
  const factory Name({
    @JsonKey(name: 'first') required String? firstName,
    @JsonKey(name: 'last') required String? lastName,

  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
@freezed
class Location with _$Location{
  const factory Location({
    required Street?street,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}@freezed
class Street with _$Street{
  const factory Street({
    @JsonKey(name: 'number') required int? streetNumber,
    @JsonKey(name: 'name') required String? streetName,

  }) = _Street;

  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);
}
@freezed
class Dob with _$Dob{
  const factory Dob({
    @JsonKey(name: 'date') required String? date,

  }) = _Dob;

  factory Dob.fromJson(Map<String, dynamic> json) => _$DobFromJson(json);
}
@freezed
class Picture with _$Picture{
  const factory Picture({
    @JsonKey(name: 'large') required String? large,
    @JsonKey(name: 'medium') required String? medium,
    @JsonKey(name: 'thumbnail') required String? thumbnail,

  }) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
}