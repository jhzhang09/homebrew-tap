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

---

### 4. Serval (`serval`)

Lightweight native SSH, SFTP, Telnet, Serial, and terminal client with end-to-end encrypted vault, dual-pane SFTP, ZMODEM, multi-provider AI Agent, and WebDAV / S3 / local sync ([jhzhang09/serval](https://github.com/jhzhang09/serval)).

Install via Homebrew Cask:

```bash
brew install --cask jhzhang09/tap/serval
```

Or tap first:

```bash
brew tap jhzhang09/tap
brew install --cask serval
```

Upgrade to the latest release:

```bash
brew upgrade --cask serval
```

> **Requirements & CLI:**
> - Requires **macOS 13 (Ventura) or later** (Universal binary for Apple Silicon & Intel).
> - Installs `/Applications/Serval.app` and links the `serval` launcher command into Homebrew's `bin` directory.

> **macOS Gatekeeper Note:**
> Releases are ad-hoc signed and not notarized with an Apple Developer account.
> The cask automatically clears the quarantine attribute during installation. If macOS still blocks it on first launch, run:
> ```bash
> xattr -dr com.apple.quarantine /Applications/Serval.app
> ```
> Or choose **System Settings → Privacy & Security → Open Anyway** after the first launch attempt.

---

### 5. Godwit (`godwit`)

Open-source, AI-native desktop email client with native hardware-backed S/MIME support ([jhzhang09/godwit](https://github.com/jhzhang09/godwit)).

Install via Homebrew Cask:

```bash
brew install --cask jhzhang09/tap/godwit
```

Or tap first:

```bash
brew tap jhzhang09/tap
brew install --cask godwit
```

Upgrade to the latest release:

```bash
brew upgrade --cask godwit
```

> **Requirements & CLI:**
> - Requires **macOS 12 (Monterey) or later** (separate native builds for Apple Silicon `arm64` and Intel `amd64`).
> - Installs `/Applications/Godwit.app` and links the `godwit` command (`godwit mcp`, `godwit call`, `godwit --headless`) into Homebrew's `bin` directory.
> - Also supports in-app self-updates signed with this fork's update key.

> **macOS Gatekeeper Note:**
> Releases are ad-hoc signed and not notarized with an Apple Developer account.
> The cask automatically clears the quarantine attribute during installation. If macOS still blocks it on first launch, run:
> ```bash
> xattr -dr com.apple.quarantine /Applications/Godwit.app
> ```
> Or choose **System Settings → Privacy & Security → Open Anyway** after the first launch attempt.
