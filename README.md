# homebrew-agman

Homebrew tap for [agman](https://github.com/memandip/agman) — agent manager: switchable
config profiles for AI coding agents (Claude Code, Codex CLI, Gemini CLI).

## How do I install these formulae?

```bash
brew install memandip/agman/agman
```

That first install also trusts the tap, so the short name works from then on:
`brew install agman`, `brew upgrade agman`.

To use the short name from the start, trust the tap explicitly first. Current Homebrew will
not resolve a bare formula name from an untrusted third-party tap:

```bash
brew tap memandip/agman
brew trust memandip/agman
brew install agman
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "memandip/agman"
brew "agman"
```

Upgrade with `brew upgrade agman`. Install the development version from `main` with
`brew install --HEAD memandip/agman/agman`.

## Formulae

| Formula | Description |
|---|---|
| `agman` | Switch complete config profiles for AI coding agents, the way `AWS_PROFILE` switches AWS accounts |

## Why there are no bottles

agman is a single Bash script with no dependencies, so "building from source" is a file copy
that finishes instantly. Bottling it would add a publish pipeline and a signing token for no
measurable install-time gain, so this tap intentionally ships without bottles and without the
`brew pr-pull` publish workflow. Formula changes are still validated by `brew test-bot` in CI.

## Contributing

Changes to `Formula/agman.rb` should arrive as a pull request so CI can validate them before
they land. [`brew test-bot`](.github/workflows/tests.yml) runs on every push and pull request:

- **every push** — `--only-tap-syntax`, which is `brew style` plus `brew audit` over the tap
- **pull requests** — `--only-formulae`, which installs and runs the formula's `test do` block
  on Linux and two macOS runners

To check a change locally before opening a PR:

```bash
brew style memandip/agman
brew audit --strict --online memandip/agman/agman
brew install --build-from-source memandip/agman/agman
brew test agman
```

Version bumps are normally opened automatically by the
[release workflow](https://github.com/memandip/agman/blob/main/.github/workflows/homebrew.yml)
in the main repository when a new agman release is published.

## Documentation

`brew help`, `man brew` or [Homebrew's documentation](https://docs.brew.sh).
For agman itself, see the [project README](https://github.com/memandip/agman#readme) and the
[landing page](https://memandip.github.io/agman).
