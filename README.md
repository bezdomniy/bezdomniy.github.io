# Ilia thoughts

Hugo source for https://blog.iliathoughts.com, using the [LoveIt](https://github.com/dillonzq/LoveIt) theme (git submodule).

Pushing to `main` builds the site and deploys it to GitHub Pages
(`.github/workflows/hugo.yml`). Built output is never committed.

## Setup

```sh
git clone --recurse-submodules https://github.com/bezdomniy/bezdomniy.github.io.git
cd bezdomniy.github.io
mise install          # installs the pinned Hugo (0.125.3, see mise.toml)
```

Hugo is pinned because LoveIt no longer builds on current Hugo releases.

## Writing

```sh
hugo new posts/my-post.md    # created with draft: true
hugo server -D               # preview with drafts at http://localhost:1313
```

Set `draft: false` (or delete the line) when ready, then commit and push.
Note: this repo is public, so committed drafts are visible on GitHub (they are not built into the site).

## rust_particles app

The app at `/js/rust_particles/` is a prebuilt WASM bundle from
[rust_particles](https://github.com/bezdomniy/rust_particles):

```sh
(cd ../rust_particles && trunk build --release)
scripts/update-rust-particles.sh
```
