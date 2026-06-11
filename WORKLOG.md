# Worklog

## 2026-06-11

- Goal: Pre-deploy review and content/feature work on the research page ahead of pushing the site live to `rosikand.github.io`.
- Changes made:
  - Pre-deploy fixes: excluded internal docs (`DEPLOYMENT.md`, `EDITING.md`, `LOCAL_DEV.md`, `WORKLOG.md`) from the Jekyll build in `_config.yml`; set `published: false` on the two hidden drafts (`ways-to-make-money`, `template-post`) since `hidden: true` alone still generated their pages; changed `baseurl` from `"/newpw"` to `""` for the real-site deploy. (These are already committed.)
  - Research page: swapped layout so title is the bold top line with authors italic below; added ECCV 2024 CRISP paper and BIG-bench (TMLR 2023) entries to `_data/research.yml`; added a "Projects" section driven by new `_data/projects.yml` (Parallax, tinyrl), reusing the `.paper` card markup.
  - Toggles: `show_photo` in `_data/profile.yml` shows/hides the home-page profile photo (currently `true`); `research_thumbnails` in new `_data/settings.yml` shows/hides per-entry thumbnails on the research page (currently `false`). Each research/project entry has an `image:` field; dummy SVG placeholders live in `images/thumbnails/thumb-{1,2,3}.svg`.
  - Fixed six clear typos/grammar errors in `_posts/2026-05-17-notes-on-ai-landscape.md` (diligence, GPUs, world's best, merger, so-called/forward-deployed, footnote portcos + period).
- Decisions: Projects live as a subsection of the Research page (not a separate nav page) while the list is small. Author lists for huge-author papers abbreviated as "First three, et al. (incl. Rohan Sikand)".
- Current state: Working tree has uncommitted changes (`_data/*`, `research.html`, `index.html`, `assets/css/style.scss`, the landscape post, new `_data/settings.yml` and `images/thumbnails/`). Build verified clean via `GEM_HOME=vendor/ruby GEM_PATH=vendor/ruby JEKYLL_NO_BUNDLER_REQUIRE=true /usr/bin/ruby vendor/bin/jekyll build`.
- Next steps / open items:
  - Commit the working tree, then push. Before pushing: `origin` still points at `rosikand/newpw` — for the real site, point it at a repo named `rosikand.github.io` and set Pages source to GitHub Actions. Pushing the current `baseurl: ""` to `newpw` would break that test site.
  - Replace dummy thumbnail SVGs with real images (and flip `research_thumbnails` to `true` if desired).
  - Flagged-but-unfixed items in the AI landscape post (user chose to defer): incomplete sentences (Long Lake MD name, "Ying, Stanford PhD", Nathan Lambert fragment, duplicate Neolabs bullet, redundant holdco sentence), consistency nits (missing colon on Horizontal/AI infra bullet, bolded Fleet AI heading, dangling Decagon/Sierra colons), and facts to verify ("Judgement" vs "Judgment" Labs, Decagon/Sierra filed under Sales, "Ithaca Holdings" name).
  - Repo is public: unpublished drafts and these docs remain visible in the repo/git history even though they're off the website.
- Blockers: None.

## 2026-05-09

- Goal: Establish a repeatable way for future Codex sessions to resume work from repo-local context instead of relying on implicit memory.
- Changes made: Added a global Codex `session-handoff` skill at `/Users/vandnamd/.codex/skills/session-handoff/SKILL.md`; added this repo's `.codex-session/` ignore pattern; created this `WORKLOG.md`; created ignored symlink `.codex-session/latest.jsonl` pointing to the current repo's Codex session log.
- Decisions: Use `WORKLOG.md` as the primary durable handoff. Use `.codex-session/latest.jsonl` only as an ignored pointer to raw Codex logs. Do not commit raw logs by default because they may contain sensitive prompts, command output, file contents, paths, emails, or secrets.
- Commands/tests: Inspected `~/.codex/sessions`, `~/.codex/session_index.jsonl`, and `~/.codex/history.jsonl`; confirmed session JSONL files include `cwd`; checked `git status --short --branch` and `git log --oneline -5`; verified repo-matching logs with `rg -l '"cwd":"/Users/vandnamd/dev/new-pw-experiments/charlie"' ~/.codex/sessions`.
- Current state: The repo is a Jekyll personal website scaffold based on the copied `charlieoneill11.github.io-main` reference site. The top-level site still has placeholder content. Git status is clean relative to prior site work, but this handoff setup leaves `.gitignore` modified and `WORKLOG.md` untracked.
- Next steps: Commit or otherwise keep the handoff setup (`.gitignore` and `WORKLOG.md`) if desired. Then customize `_config.yml`, `index.html`, `research.html`, profile image, and posts; run `bundle exec jekyll serve --livereload` to preview.
- Blockers: None known.
