# Homebrew Tap (`jhzhang09/tap`)

Official Homebrew Tap repository maintained by [@jhzhang09](https://github.com/jhzhang09).

## Packages

### 1. GoCompare Desktop App (GUI)

Native, cross-platform file and folder comparison tool ([jhzhang09/gocompare](https://github.com/jhzhang09/gocompare)).

Install via Homebrew Cask:

```bash
brew install --cask jhzhang09/tap/gocompare
```

Or tap first:

```bash
brew tap jhzhang09/tap
brew install --cask gocompare
```

> **macOS Gatekeeper Note:**
> Releases are ad-hoc signed and not notarized with an Apple Developer account.
> The cask automatically clears the quarantine attribute during installation. If macOS still blocks it on first launch, run:
> ```bash
> xattr -dr com.apple.quarantine /Applications/GoCompare.app
> ```
> Or right-click **GoCompare.app** in Finder and choose **Open**.

---

### 2. GoCompare Command Line Tool (CLI)

Install via Homebrew Formula:

```bash
brew install jhzhang09/tap/gocompare-cli
```

Or tap first:

```bash
brew tap jhzhang09/tap
brew install gocompare-cli
```

Verify the installation:

```bash
gocompare-cli --version
```

---

### 3. TendyronTokenMac (`tendyron-token`)

macOS native **CryptoTokenKit (CTK)** smart card extension, **CCID** driver, and management host app (`TendyronTokenHost.app`) for Tendyron OA Key (`VID 0x1780 / PID 0x0410`).

Install via Homebrew Cask:

```bash
brew install --cask jhzhang09/tap/tendyron-token
```

Or tap first:

```bash
brew tap jhzhang09/tap
brew install --cask tendyron-token
```

> **Architecture & macOS Selection:**
> - **macOS 27.0+ (`arm64`)**: automatically installs `TendyronTokenMac-<version>-macos27-arm64.pkg`
> - **macOS 12.0–26 (`arm64` / `x86_64`) or Intel Macs**: automatically installs `TendyronTokenMac-<version>-macos12-universal.pkg`
>
> The cask runs the macOS command-line `installer` and clears the quarantine attribute on `/Applications/TendyronTokenHost.app` after installation.
