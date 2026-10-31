# Homebrew Tap for GoCompare

This is the official Homebrew Tap repository for [GoCompare](https://github.com/jhzhang09/gocompare), a native, cross-platform file and folder comparison tool written in Go.

## Installation

### 1. Desktop App (GUI)

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

### 2. Command Line Tool (CLI)

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
gocompare --version
```
