# frab client manuals

Two English end-user documents for frab, plus everything needed to regenerate
them.

| File | What it is |
| --- | --- |
| `frab-quick-start.pdf` | **Start here.** 6 pages: running a conference in 12 steps, in the order you do them, plus a one-page checklist. |
| `frab-user-manual.pdf` | The full reference. ~60 pages, one chapter per area, 68 screenshots. |
| `frab-quick-start.html`, `frab-user-manual.html` | The sources. Plain HTML + CSS, no build step, no dependencies. |
| `screenshots/` | 75 PNGs at 2x, one per manual-relevant screen. Shared by both documents and reusable for slides, tickets or anything else. |
| `capture_screenshots.rb` | Drives a real browser against a running frab and re-shoots every screenshot. |
| `collect_ids.rb` | Writes `ids.json` - the record ids the capture script points at. |
| `build_pdf.sh` | Renders the HTML to PDF with headless Chrome. |

The quick start names the manual chapter behind each step, so the two are meant
to be handed over together.

The manual is written against the demo conference `demo2025`, created by
`rails demo:seed` (`lib/tasks/demo.rake`).

## Editing the text

Edit the HTML and run `./build_pdf.sh`. In the full manual, figure numbers are
written by hand in the shape `<b>Figure 5.4</b>`; if you insert a figure in the
middle of a chapter, renumber the ones after it.

In the quick start, a screenshot that is taller than it is wide should use
`<div class="shot crop">` - that crops it to its top instead of shrinking it
into an unreadable strip.

## Regenerating the screenshots

```bash
# 1. rebuild the demo data (drops and recreates demo2025, demo2026, rubyroom)
bundle exec rails demo:seed

# 2. note which records the screenshots should point at
bundle exec rails runner doc/manual/collect_ids.rb

# 3. start a server in another shell
bundle exec rails server -p 3010

# 4. shoot everything (~4 minutes)
FRAB_URL=http://127.0.0.1:3010 bundle exec ruby doc/manual/capture_screenshots.rb
```

Useful environment variables for step 4:

* `CHROMEDRIVER=/path/to/chromedriver` - needed on this machine, because the
  bundled `webdrivers` gem is too old to find a driver for current Chrome.
  Download the matching build from
  <https://googlechromelabs.github.io/chrome-for-testing/>.
* `ONLY=08-` - re-shoot only the screenshots whose name contains that string,
  which is much faster while iterating on a single chapter.

The script signs in as `orga@example.org`, `speaker2@example.org` and
`reviewer@example.org` (password `test123` in the demo data), takes a full-page
screenshot of each screen, and trims the empty area off the bottom with
ImageMagick.

## Building the PDFs

```bash
doc/manual/build_pdf.sh                                # both documents
doc/manual/build_pdf.sh frab-quick-start.html          # just one
doc/manual/build_pdf.sh frab-quick-start.html /tmp/out.pdf
```

The screenshots are downscaled to 1600px wide into a temporary copy first, so
the PDF stays around 15-20 MB instead of 60. Set `SCREENSHOT_WIDTH=2000` for a
higher-resolution print version.

## Requirements

* Google Chrome or Chromium (screenshots and PDF)
* a chromedriver matching that Chrome (screenshots)
* ImageMagick `convert` (trimming and downscaling)
* the app's own gems - `capybara` and `selenium-webdriver` from the `test` group
