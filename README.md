# Legal & Support pages · dletmeapps

Privacy policies and support pages for the iOS apps by Davy Ushaka Ishimwe, published with GitHub Pages at <https://xdavy.github.io/dletmeapps-legal/>.

Plain HTML and one stylesheet, no build step: GitHub Pages serves the files as they are (`.nojekyll`).

## Layout

- `index.html`: the list of apps. `404.html`: served for any unknown address.
- One folder per app (`letmereminder/`, `letmenotes/`, `running7277/`) with four pages: `privacy.html` and `support.html` in English, `privacy-fr.html` and `support-fr.html` in French. Each page links to its other language and to its sibling page.
- `style.css`: the only stylesheet. `scripts/check.sh`: the checks below.

## Page contract

- Well-formed XML: uppercase `<!DOCTYPE html>`, every tag closed, `&amp;` for ampersands. Checked with `xmllint --noout`.
- Every privacy page carries eight sections, by `id`, in this order: `updated`, `data`, `collection`, `purposes`, `third-parties`, `retention`, `consent`, `contact`.
- Every page shows the support address; support pages show the developer's name.
- Links are relative, never root-relative: the site lives under `/dletmeapps-legal/`. The 404 page is the one exception and uses absolute URLs.

## Adding an app

1. Create its folder with the four pages, written from what the app's code actually does.
2. Add the app to `index.html`.
3. Run `sh scripts/check.sh` from the repository root: it must print `OK`.
4. Point App Store Connect (Privacy Policy URL, Support URL) and the app's own privacy link at the new pages.

## Changing a page

Edit it here: these files are the only source of truth. On any material change, update the date in the `updated` paragraph.
