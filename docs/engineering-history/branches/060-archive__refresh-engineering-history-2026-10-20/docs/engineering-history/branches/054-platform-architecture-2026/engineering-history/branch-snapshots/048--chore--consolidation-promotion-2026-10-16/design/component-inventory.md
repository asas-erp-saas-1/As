# ASAS Component Inventory — Blueprint v1.6.1 Appendix U.5/U.6

> Canonical machine-readable design-system shadow. Appendix U wins on disagreement. One row = one contract-test case. Primitives never import from modules; features never re-implement primitives.

| Component | Variants | Required states | Keyboard / a11y contract |
|---|---|---|---|
| Button | primary, secondary, ghost, destructive, whatsapp | default, hover, focus-visible, active, disabled, loading | real button; ring; Enter/Space |
| IconButton | — | Button states | aria-label required |
| Input | — | default, hover, focus, disabled, error | label + describedby |
| Textarea | — | Input states | same as Input |
| MoneyInput | — | Input + formatted announce | integer centimes; no float |
| PhoneInput | — | Input states | tel; E.164 state; national display |
| Select | single | Input + skeleton | listbox; arrows; typeahead; Esc |
| Combobox | multi, async | Select + no matches/create | combobox roles; removable chips |
| Checkbox | — | checked, indeterminate, disabled | fieldset/legend when grouped |
| Radio | — | checked, disabled | fieldset/legend |
| Switch | — | on, off, disabled, loading | instant-effect only |
| DatePicker | single, range | open, both-calendars, hijri toggle | grid roles; Saturday week start |
| DataTable | comfortable, dense | loading, empty, error, data; virtualized >50 | row arrows; Enter; labeled selection |
| Card | — | skeleton, data | — |
| KpiTile | — | skeleton, error, data | dl semantics; drill-down link |
| Drawer | end, RTL-aware | open, closing | dialog, focus trap/restore, Esc |
| Modal | sm, md, lg, destructive | open, closing, submit-loading | dialog + initial focus |
| Toast | success, info, warning, error | enter, exit, paused, action | polite live region; errors persist; max 3 |
| Tabs | line, pill | default, active, hover | tablist/tab/tabpanel; arrows; URL state |
| Accordion | — | collapsed, expanded, disabled | button headers; aria-expanded |
| Stepper | horizontal, vertical | completed, current, blocked | ol semantics; current announced |
| Badge | status, count | data states | color + icon + label; never color alone |
| Chip | filter, info | removable | removal announced |
| Avatar | — | image, initials, empty | alt from name |
| Timeline | — | loading, empty, data | ordered list; relative + absolute time |
| EmptyState | first-run, filtered-empty, no-permission | state | heading + paragraph + primary action |
| ErrorState | inline, segment | state | role=alert when replacing; incident id + Retry |
| Skeleton | text, media, table-row | shimmer/static under reduced motion | aria-busy; shape parity |
| CommandPalette | — | open, typing, results-skeleton, no-results | combobox; arrows; Enter; Ctrl-K |
| FilterBar | — | applied chips, clear-all | facet labels; active count announced |
| Breadcrumbs | — | data | nav; current not a link |
| Pagination | — | data | 25/50/100; total visible |
| Upload | file, image | idle, dragging, uploading, success, error | progress; click-to-browse; drag never only path |
| EditorComposer | section, message | dirty, saving, saved-at, error | labeled toolbar; undo/redo |
| ConsentBanner | — | open, saved | dialog; granular purpose toggles |
| PaymentSimulator | — | computing, data | plan rules only; dl output |
| Gallery | — | loading, swipe, error | keyboard carousel; alt text |
| MapPoster | — | poster, loaded | click-to-load announced |
| CompareTable | — | loading, data <=3 units | table semantics |
| OfflineBar | — | offline, syncing, synced | sync status announced |
| SyncChip | — | pending, replaying, done | live status |
| Tooltip | — | open, hover-out, Esc-dismissed | describedby; delayed; never sole label |

## Universal component gate

Every component requires contract tests for required states, keyboard coverage, axe-clean accessibility, Arabic/French screenshot baselines, token-only styling, and no hard-coded physical-direction or off-scale spacing values. New components enter this inventory by proposal before implementation.