# Trengo Widget — Google Tag Manager Tag Template

A GTM tag template that loads the [Trengo](https://trengo.com) live chat widget with full support for widget events, contact/ticket data, page-level visibility control, and single-page application (SPA) routing.

## Features

- **Widget Loading** — Inject the Trengo embed script with a configurable widget key.
- **DataLayer Events** — Subscribe to all Trengo widget events (`on_ready`, `on_open`, `on_close`, `on_chat_started`, `on_chat_ended`, `on_status_online`, `on_status_offline`) and push them to the dataLayer with custom event names.
- **Contact Data** — Pre-fill contact email, name, and custom fields for logged-in visitors.
- **Ticket Data** — Pre-fill ticket custom fields that are saved on ticket creation.
- **Page Visibility** — Hide the widget on specific pages using URL path matching (contains, equals, starts with) while preserving active chat sessions.
- **SPA Support** — Notify Trengo of URL changes in single-page applications so the Greeter triggers correctly on new pages.

## Installation

### From the Community Template Gallery

1. In your GTM container, go to **Templates** → **Tag Templates** → **Search Gallery**.
2. Search for **Trengo Widget**.
3. Click **Add to workspace**.

### Manual Import

1. Download `template.tpl` from this repository.
2. In GTM, go to **Templates** → **Tag Templates** → **New**.
3. Click the three-dot menu (⋮) → **Import**.
4. Select the downloaded `template.tpl` file.
5. Review the permissions and click **Save**.

## Configuration

### Required

| Field | Description |
|---|---|
| **Widget Key** | Your Trengo widget key (found in Trengo under Settings → Web Widget → Installation). |

### Widget Events

Enable any combination of events. Each event pushes a dataLayer event:

| Event | DataLayer Event | Fires When |
|---|---|---|
| Widget Ready | `trengo.ready` | Widget is fully loaded and initialized |
| Widget Opened | `trengo.open` | Widget is opened by visitor or API |
| Widget Closed | `trengo.close` | Widget is closed by visitor or API |
| Chat Started | `trengo.chat_started` | Visitor starts a chat |
| Chat Ended | `trengo.chat_ended` | Agent or bot ends the chat |
| Chat Online | `trengo.status_online` | Agency becomes available |
| Chat Offline | `trengo.status_offline` | Agency becomes unavailable |

### Contact Data

Pre-fill the contact with known visitor information (e.g., for logged-in users):

- **Email** — Visitor's email address (supports GTM variables).
- **Name** — Visitor's name.
- **Custom Contact Fields** — Table of Field ID / Value pairs.

### Ticket Data

Pre-fill ticket custom fields (saved when the ticket is created, web chat only):

- **Custom Ticket Fields** — Table of Field ID / Value pairs.
- **Browser Language** — Optionally add browser language as a custom ticket field.

### Page Visibility

Hide the widget on specific pages:

1. Set visibility mode to **Hide on specific pages** or **Show only on specific pages**.
2. Add URL patterns with a match type: Contains, Equals, Starts with, Ends with, or Regular Expression.

The widget will still render if the visitor has an active chat session, even on hidden pages.

### Advanced Settings

- **Script URL** — Override the default embed script URL if needed.
- **Respect Do Not Track** — Skip loading if the visitor has DNT enabled (requires a GTM variable).

## Permissions

- **Inject Scripts** — To load `https://static.widget.trengo.eu/embed.js`.
- **Access Global Variables** — To read/write `window.Trengo` and `window.dataLayer`.
- **Logging** — Console logging in debug/preview mode.
- **Get URL** — To read the current page URL for visibility matching.

## Author

Created by [New North Digital](https://newnorth.digital)

## License

Apache 2.0 — see [LICENSE](LICENSE).
