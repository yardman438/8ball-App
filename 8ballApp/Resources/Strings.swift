// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Cancel
  internal static let alertCancel = L10n.tr("Localizable", "alert-cancel")
  /// Save
  internal static let alertSave = L10n.tr("Localizable", "alert-save")
  /// Enter your answer
  internal static let alertTitle = L10n.tr("Localizable", "alert-title")
  /// from API
  internal static let fromAPI = L10n.tr("Localizable", "fromAPI")
  /// cell
  internal static let identifier = L10n.tr("Localizable", "identifier")
  /// I don't think so...
  internal static let idontthinkso = L10n.tr("Localizable", "idontthinkso")
  /// I think it's yes!
  internal static let ithinkitsyes = L10n.tr("Localizable", "ithinkitsyes")
  /// Just do it!
  internal static let justdoit = L10n.tr("Localizable", "justdoit")
  /// Maybe don't
  internal static let maybedont = L10n.tr("Localizable", "maybedont")
  /// No.
  internal static let no = L10n.tr("Localizable", "no")
  /// Shake it again.
  internal static let shakeitagain = L10n.tr("Localizable", "shakeitagain")
  /// This is gonna happen
  internal static let thisisgonnahappen = L10n.tr("Localizable", "thisisgonnahappen")
  /// Yes, you can do it!
  internal static let yesyoucandoit = L10n.tr("Localizable", "yesyoucandoit")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
