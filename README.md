# Ilia thoughts

Hugo source for https://blog.iliathoughts.com, using the [FixIt](https://github.com/hugo-fixit/FixIt) theme (git submodule, pinned to a release tag).

Pushing to `main` builds the site and deploys it to GitHub Pages
(`.github/workflows/hugo.yml`). Built output is never committed.

## Setup

```sh
git clone --recurse-submodules https://github.com/bezdomniy/bezdomniy.github.io.git
cd bezdomniy.github.io
mise install          # installs the pinned Hugo (see mise.toml)
```

Hugo is pinned in `mise.toml` and the workflow so local and CI builds match; bump both together.

## Updating the theme

```sh
git -C themes/FixIt fetch --tags
git -C themes/FixIt checkout vX.Y.Z   # a release tag, see github.com/hugo-fixit/FixIt/releases
hugo server                          # check it still looks right
git commit -am "Update FixIt to vX.Y.Z"
```

## Writing

```sh
hugo new posts/my-post.md    # created with draft: true
hugo server -D               # preview with drafts at http://localhost:1313
```

Set `draft: false` (or delete the line) when ready, then commit and push.
Note: this repo is public, so committed drafts are visible on GitHub (they are not built into the site).

## rust_particles app

The app at `/rust_particles/` is not part of this repo. It is deployed by
[rust_particles](https://github.com/bezdomniy/rust_particles)' own GitHub Pages
workflow on every push to its `main`, and GitHub serves project sites under this
site's custom domain. `static/js/rust_particles/` only holds a redirect from the
old URL and a service worker that removes the old cached copy.
