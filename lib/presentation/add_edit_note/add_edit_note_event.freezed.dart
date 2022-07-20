// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_edit_note_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddEditNoteEventTearOff {
  const _$AddEditNoteEventTearOff();

  ChangeColor changeColor(int color) {
    return ChangeColor(
      color,
    );
  }

  SavaNote saveNote(int? id, String title, String content) {
    return SavaNote(
      id,
      title,
      content,
    );
  }
}

/// @nodoc
const $AddEditNoteEvent = _$AddEditNoteEventTearOff();

/// @nodoc
mixin _$AddEditNoteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int color) changeColor,
    required TResult Function(int? id, String title, String content) saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SavaNote value) saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SavaNote value)? saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SavaNote value)? saveNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditNoteEventCopyWith<$Res> {
  factory $AddEditNoteEventCopyWith(
          AddEditNoteEvent value, $Res Function(AddEditNoteEvent) then) =
      _$AddEditNoteEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddEditNoteEventCopyWithImpl<$Res>
    implements $AddEditNoteEventCopyWith<$Res> {
  _$AddEditNoteEventCopyWithImpl(this._value, this._then);

  final AddEditNoteEvent _value;
  // ignore: unused_field
  final $Res Function(AddEditNoteEvent) _then;
}

/// @nodoc
abstract class $ChangeColorCopyWith<$Res> {
  factory $ChangeColorCopyWith(
          ChangeColor value, $Res Function(ChangeColor) then) =
      _$ChangeColorCopyWithImpl<$Res>;
  $Res call({int color});
}

/// @nodoc
class _$ChangeColorCopyWithImpl<$Res>
    extends _$AddEditNoteEventCopyWithImpl<$Res>
    implements $ChangeColorCopyWith<$Res> {
  _$ChangeColorCopyWithImpl(
      ChangeColor _value, $Res Function(ChangeColor) _then)
      : super(_value, (v) => _then(v as ChangeColor));

  @override
  ChangeColor get _value => super._value as ChangeColor;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(ChangeColor(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeColor implements ChangeColor {
  const _$ChangeColor(this.color);

  @override
  final int color;

  @override
  String toString() {
    return 'AddEditNoteEvent.changeColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeColor &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  $ChangeColorCopyWith<ChangeColor> get copyWith =>
      _$ChangeColorCopyWithImpl<ChangeColor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int color) changeColor,
    required TResult Function(int? id, String title, String content) saveNote,
  }) {
    return changeColor(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveNote,
  }) {
    return changeColor?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveNote,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SavaNote value) saveNote,
  }) {
    return changeColor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SavaNote value)? saveNote,
  }) {
    return changeColor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SavaNote value)? saveNote,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(this);
    }
    return orElse();
  }
}

abstract class ChangeColor implements AddEditNoteEvent {
  const factory ChangeColor(int color) = _$ChangeColor;

  int get color;
  @JsonKey(ignore: true)
  $ChangeColorCopyWith<ChangeColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavaNoteCopyWith<$Res> {
  factory $SavaNoteCopyWith(SavaNote value, $Res Function(SavaNote) then) =
      _$SavaNoteCopyWithImpl<$Res>;
  $Res call({int? id, String title, String content});
}

/// @nodoc
class _$SavaNoteCopyWithImpl<$Res> extends _$AddEditNoteEventCopyWithImpl<$Res>
    implements $SavaNoteCopyWith<$Res> {
  _$SavaNoteCopyWithImpl(SavaNote _value, $Res Function(SavaNote) _then)
      : super(_value, (v) => _then(v as SavaNote));

  @override
  SavaNote get _value => super._value as SavaNote;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(SavaNote(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SavaNote implements SavaNote {
  const _$SavaNote(this.id, this.title, this.content);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'AddEditNoteEvent.saveNote(id: $id, title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavaNote &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  $SavaNoteCopyWith<SavaNote> get copyWith =>
      _$SavaNoteCopyWithImpl<SavaNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int color) changeColor,
    required TResult Function(int? id, String title, String content) saveNote,
  }) {
    return saveNote(id, title, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveNote,
  }) {
    return saveNote?.call(id, title, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveNote,
    required TResult orElse(),
  }) {
    if (saveNote != null) {
      return saveNote(id, title, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SavaNote value) saveNote,
  }) {
    return saveNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SavaNote value)? saveNote,
  }) {
    return saveNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SavaNote value)? saveNote,
    required TResult orElse(),
  }) {
    if (saveNote != null) {
      return saveNote(this);
    }
    return orElse();
  }
}

abstract class SavaNote implements AddEditNoteEvent {
  const factory SavaNote(int? id, String title, String content) = _$SavaNote;

  int? get id;
  String get title;
  String get content;
  @JsonKey(ignore: true)
  $SavaNoteCopyWith<SavaNote> get copyWith =>
      throw _privateConstructorUsedError;
}
