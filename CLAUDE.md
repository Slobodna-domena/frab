# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

frab is a Ruby on Rails conference management system: it collects talk submissions (the "Call for Participation" / CfP), manages events and speakers through a review/acceptance workflow, and produces public schedules. This repository is a **long-lived fork** based on a 2021 version of upstream frab and intentionally never merged with upstream `main` (see README "Current FORK Status"). Do not attempt to rebase/merge against upstream frab. The app targets Ruby 2.7.6 and Rails 6.1.

## Commands

```bash
bin/setup                       # install gems (skips mysql/postgresql drivers), copy db config, db:setup
rails server                    # run dev server at http://localhost:3000 (login admin@example.org / test123)

bundle exec rails test          # run unit/model/controller/integration tests (test/, minitest)
bundle exec rails test:system   # run Capybara/Selenium browser system tests (test/system/)
bundle exec rails test test/models/event_test.rb            # single file
bundle exec rails test test/models/event_test.rb:42         # single test by line number

bundle exec rubocop             # lint (config in .rubocop.yml, TargetRubyVersion 2.7)
bundle exec i18n-tasks health   # check locale completeness/usage
rails -D                        # list all rake tasks with descriptions
```

CI (`.github/workflows/ci.yaml`) runs the full suite against sqlite, mysql, and postgresql on Ruby 2.7 and 3.0, with `config.eager_load = true` forced on. It also exercises migration rollback (`db:rollback STEP=5` then `db:migrate`), so keep migrations reversible.

## Configuration

Settings come from environment variables loaded via dotenv. `.env.development`, `.env.test` are committed; use `.env.local` for local overrides and `.env.production` in production (template: `env.production`). Most config keys are prefixed `FRAB_*` (host, currency, locale, admin emails) plus `SMTP_*`, `LDAP_*`, and OAuth (`GOOGLE_CLIENT_ID`/`SECRET`). Database is chosen by gem group — `bin/setup` installs without mysql/postgresql; the live DB is selected by `config/database.yml` (copied from `.template`). `FRAB_EMAILS_OF_ADMINS` auto-promotes matching emails to global admin on user creation.

## Architecture

**Multi-tenant by conference.** Nearly everything is scoped to a `Conference` (which can have a parent for sub-conferences/devrooms). The "current conference" is resolved in `ApplicationController` from either the `:conference_acronym` URL segment or the session, and exposed as `@conference`. Most management routes live under `scope path: '/:conference_acronym'` in `config/routes.rb`.

**Three route/controller worlds** (see `config/routes.rb`):
- `public/` namespace — anonymous, published schedule, speaker pages, feedback, iCal/PDF/QR exports.
- `cfp/` namespace — authenticated *submitters* manage their own person profile, availability, and event submissions (accept/withdraw/confirm).
- Top-level crew/management controllers — organizers and reviewers manage events, people, the schedule grid, conference settings, statistics, mail notifications.

**Authorization** uses Pundit. `BaseConferenceController` requires login + non-submitter and enforces `after_action :verify_authorized`. `ApplicationController` exposes helpers like `authorize @conference, :orga?/:manage?/:read?`. Roles are two-layered:
- `User#role` is global: `submitter`, `crew`, or `admin`.
- Crew users get a per-conference role via `ConferenceUser` (`orga`, `coordinator`, `reviewer`, etc.). Check methods live on `User`: `is_orga_of?`, `is_manager_of?` (orga|coordinator), `any_crew?`, `reviews_conferences`. A user may hold only one role per conference.

**Event lifecycle is a state machine** (`app/models/concerns/event_state.rb`, using the `transitions` gem): `new → review → accepting/unconfirmed → confirmed → scheduled`, plus `withdrawn`/`rejecting`/`rejected`/`canceled`. Acceptance/rejection either notify submitters immediately or queue them when `conference.bulk_notification_enabled` (the `accepting`/`rejecting` intermediate states are the "queued, not yet notified" states; the `notify` event flushes them). Transitions trigger ticket creation and mail/notification side effects — don't set `state` directly; drive it through events (`accept`, `confirm`, `withdraw`, `notify`, …).

**Translations.** Model fields (event title/subtitle/abstract/description, person bio, track name) are translated with the `mobility` gem using `column_fallback: true`: the default locale (`I18n.default_locale`, English) is stored in the model's own column, other locales in separate tables. UI text is in `config/locales/` (de en es fr it pt-BR ru zh). UI locale is chosen by `?locale=` param, then `Accept-Language`, then English.

**Background work** uses `sucker_punch` (in-process; tests run it inline). Mail templates and bulk speaker notifications are first-class features (`MailTemplate`, `Notification`, `lib/tasks/bulk_mailer.rake`).

**Other integrations:** ticket servers (OTRS/RT/Redmine via `TicketServer`/`Ticket`), file attachments via `kt-paperclip` (needs ImageMagick + `file`), schedule PDF/booklet generation via `prawn`, change history via `paper_trail`, search/filtering via `ransack`.

## Conventions

- Views are HAML; stylesheets are SCSS; some JS is CoffeeScript (legacy asset pipeline / Sprockets, not Webpacker).
- Model logic is sometimes split into `app/models/concerns/` and prepended modules in `lib/` (e.g. `EventModule`, `DayModule`, `PersonModule` are `prepend`ed). Check both when changing model behavior.
- Tests use minitest + `factory_bot` (factories in `test/factories/`) alongside some fixtures. System tests use Capybara + Selenium.
- Rake tasks for ops/migration live in `lib/tasks/` (import/export conferences, static schedule export, video import, paperclip migration, scrubbing).
