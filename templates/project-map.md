# <Project name> — project map

Purpose: Which folder holds what in <Project>, where things start, and the key flows.
Audience: Claude and the owner.
Read when: Before searching code.
Owner: <Project> sessions.
Update rule: Same commit as any change that adds, moves, renames or deletes a file, or changes an entry point or flow (guard 1).
Related: `.claude/current-task.md` · `docs/ROADMAP.md`
Status: current
Last reviewed: DD-MM-YYYY

`PROJECT-MAP.md` at the project root. Folder level only — short, cheap to keep current.
A pointer, not proof: read it before searching code, then confirm in the code.

## Main folders

Each top-level folder that matters, one line on what lives there.

## Entry points

Where the app, build, tests and scripts start.

## Key flows

The few paths that matter most, as folder → folder.

## Not here

File-level detail — use search for that.

## Keeping it current — the seven guards

Copied into every project map from `templates/project-map.md` — an allowed copy until their final home is decided (`DOCUMENTATION-STANDARD.md` § *Allowed copies*).

1. **After a change.** Any change that adds, moves, renames or deletes a file, or changes
   an entry point or flow, updates the map **in the same commit**. Part of "Before calling
   anything done".
2. **Changes made outside Claude** (an edit by hand, a merge or pull, another tool). The map
   stores no commit ID. At session start, `git log -1 -- PROJECT-MAP.md` gives the last
   commit that changed it; list files added, deleted or renamed since. If any, refresh the
   map before relying on it.
3. **The code wins.** If the map and the code disagree, trust the code and fix the map now.
4. **Dead paths.** A listed path that does not exist is fixed on the spot.
5. **Across sessions.** The task file's Resume section says "Map updated: yes/no".
6. **Too detailed to keep up.** Folder level only.
7. **Warn-only commit check** (decided at rollout): if a commit adds, deletes or renames
   files and `PROJECT-MAP.md` is not in it, print a warning — never block. Add it to the
   project's existing hooks (e.g. husky), never alongside them.
