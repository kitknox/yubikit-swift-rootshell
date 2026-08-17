# YubiKit Swift SDK — rootshell fork

[![Swift 6.1](https://img.shields.io/badge/Swift-6.1-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2016%2B%20%7C%20macOS%2013%2B-blue.svg)](https://developer.apple.com)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Documentation](https://img.shields.io/badge/docs-DocC-blue.svg)](https://yubico.github.io/yubikit-swift/documentation/yubikit/)
[![License](https://img.shields.io/badge/License-Apache%202.0-lightgray.svg)](LICENSE)

Swift SDK for YubiKey integration on iOS and macOS.

This repository is the [rootshell](https://www.rootshell.com)-maintained fork
of [Yubico/yubikit-swift](https://github.com/Yubico/yubikit-swift), based on
upstream `v1.3.0`. It is maintained independently and does not automatically
track subsequent upstream changes.

The `YubiKit` module and product names remain unchanged. This fork is used by
rootshell but remains an independently usable Swift package. It is not an
official Yubico project and is not supported by Yubico.

## Fork changes

- Lightning/ExternalAccessory support is compiled out while rootshell's MFi
  approval is pending; NFC and USB-C support are unaffected.
- USB smart-card connection polling exits promptly when its task is cancelled.
- PIV PINs longer than eight bytes are rejected instead of triggering a range
  trap.

## Overview

YubiKit provides a native Swift interface with async/await for YubiKey hardware devices.

```swift
let connection = try await NFCSmartCardConnection()
// let connection = try await USBSmartCardConnection()
let session = try await OATHSession.makeSession(connection: connection)
let codes = try await session.calculateCredentialCodes()
```

## About

YubiKit uses a layered architecture where the connection layer handles communication via NFC, Lightning, and USB-C, while application-specific sessions are built on top of these connections. All APIs use modern Swift async/await concurrency patterns for clean, readable code.

### Supported Applications

**OATH** - Configure and use TOTP/HOTP credentials for two-factor authentication

**PIV** - Smart card functionality including X.509 certificate management, key generation (RSA, ECDSA, Curve25519), and cryptographic operations

**Management** - Read YubiKey metadata (serial number, firmware version) and configure device settings

**FIDO2/CTAP2** - WebAuthn credential creation, authentication, and device management

**Secure Channel Protocol** - SCP03 and SCP11 for encrypted communication

## Installation

### Swift Package Manager

```swift
.package(
    url: "https://github.com/kitknox/yubikit-swift-rootshell.git",
    exact: "1.3.1"
)
```

## Upstream documentation

- [Getting Started Guide](https://yubico.github.io/yubikit-swift/documentation/yubikit/gettingstarted)
- [API Documentation](https://yubico.github.io/yubikit-swift/documentation/yubikit/)
- [Configuration Guide](https://yubico.github.io/yubikit-swift/documentation/yubikit/gettingstarted#preparing-your-project)

## Sample Apps

Learn by example:

- **[OATHSample](Samples/OATHSample)** - SwiftUI authenticator app
- **[PIVTool](Samples/yubikit-piv-tool)** - Command-line PIV operations
- **[WebAuthnInterceptorSample](Samples/WebAuthnInterceptorSample)** - FIDO2/WebAuthn in WKWebView

## Requirements

- iOS 16.0+ / macOS 13.0+

## Security Notice

This SDK does not perform zeroization of sensitive data in memory. Cryptographic keys, PIN tokens, and other secrets are not securely erased when no longer in use. This is currently out of scope but may be addressed in a future release.

## Support

- [Fork issues](https://github.com/kitknox/yubikit-swift-rootshell/issues)
- [rootshell application issues](https://github.com/kitknox/rootshell/issues)
- [Developer Documentation](https://developers.yubico.com)

## License

Apache License 2.0. This fork preserves Yubico's copyright and the upstream
project history.
