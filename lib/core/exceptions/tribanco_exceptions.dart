import 'package:tricommon/common.dart';

enum ErrorShowMethod { toast, dialog, noShow, notification, customDialog }

abstract class TribancoException implements Exception {
  final String messageKey;
  final String? code;
  final dynamic error;
  final StackTrace? stackTrace;
  final ErrorShowMethod showMethod;
  final IllustrationType? illustration;
  final String? titleKey;
  final String? buttonKey;
  final bool showContactInfo;

  TribancoException({
    this.messageKey = ErrorsIds.unexpected,
    this.code,
    this.error,
    this.stackTrace,
    this.showMethod = ErrorShowMethod.toast,
    this.illustration,
    this.titleKey,
    this.buttonKey,
    this.showContactInfo = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TribancoException &&
        other.messageKey == messageKey &&
        other.code == code &&
        other.error == error &&
        other.stackTrace == stackTrace &&
        other.showMethod == showMethod &&
        other.illustration == illustration &&
        other.titleKey == titleKey &&
        other.buttonKey == buttonKey &&
        other.showContactInfo == showContactInfo;
  }

  @override
  int get hashCode {
    return messageKey.hashCode ^
        code.hashCode ^
        error.hashCode ^
        stackTrace.hashCode ^
        showMethod.hashCode ^
        illustration.hashCode ^
        titleKey.hashCode ^
        buttonKey.hashCode ^
        showContactInfo.hashCode;
  }
}

class NoConnectionException extends TribancoException {
  NoConnectionException({String? code})
      : super(
          messageKey: ErrorsIds.noConnectionExceptionMessage,
          code: code,
          showMethod: ErrorShowMethod.noShow,
          illustration: IllustrationType.noConnection,
          titleKey: ErrorsIds.noConnectionException,
          buttonKey: ErrorsIds.understoodButton,
        );
}

class TimeoutException extends TribancoException {
  TimeoutException()
      : super(
          messageKey: ErrorsIds.timeoutException,
        );
}

class FraudException extends TribancoException {
  FraudException()
      : super(
          titleKey: ErrorsIds.fraudExceptionTitle,
          messageKey: ErrorsIds.fraudException,
          buttonKey: ErrorsIds.continueButton,
          showMethod: ErrorShowMethod.dialog,
          showContactInfo: true,
        );
}

class CloudflareException extends TribancoException {
  CloudflareException()
      : super(
          titleKey: ErrorsIds.fraudExceptionTitle,
          messageKey: ErrorsIds.cloudflareException,
          buttonKey: ErrorsIds.continueButton,
          showMethod: ErrorShowMethod.dialog,
          showContactInfo: true,
        );
}

class ProfileException extends TribancoException {
  ProfileException()
      : super(
          messageKey: ErrorsIds.profileException,
          showMethod: ErrorShowMethod.dialog,
        );
}

class ServerException extends TribancoException {
  ServerException({required String? errorCode})
      : super(
          messageKey: ErrorsIds.serverException,
          code: errorCode,
        );
}

class MissingParamsException extends TribancoException {
  MissingParamsException({String? code})
      : super(
          messageKey: ErrorsIds.missingParamsException,
          code: code,
        );
}

class MissingFieldsException extends TribancoException {
  MissingFieldsException({String? code})
      : super(
          messageKey: ErrorsIds.missingFieldsException,
          code: code,
        );
}

class UserBlockedException extends TribancoException {
  UserBlockedException()
      : super(
          messageKey: ErrorsIds.userBlockedException,
        );
}

class EndpointNotFoundException extends TribancoException {
  EndpointNotFoundException()
      : super(
          messageKey: ErrorsIds.endpointNotFoundException,
        );
}

class FileSaverException extends TribancoException {
  FileSaverException() : super();
}

class UnableToGenerateReceipt extends TribancoException {
  UnableToGenerateReceipt()
      : super(
          messageKey: ErrorsIds.unableToGenerateReceipt,
        );
}

class UnableToExportWidgetException extends TribancoException {
  UnableToExportWidgetException()
      : super(
          messageKey: ErrorsIds.unableToExportWidget,
        );
}

class UnableToGetPDFException extends TribancoException {
  UnableToGetPDFException()
      : super(
          messageKey: ErrorsIds.unableToGetPDFException,
        );
}

class InvalidDateFormatException extends TribancoException {
  InvalidDateFormatException()
      : super(
          messageKey: ErrorsIds.invalidDateFormatException,
        );
}

class UrlLauncherException extends TribancoException {
  UrlLauncherException()
      : super(
          messageKey: ErrorsIds.urlLauncherException,
        );
}
