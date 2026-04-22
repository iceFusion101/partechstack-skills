# partechstack-skills

Claude skills for the partechstack publication workflow.

## Skills

- **partechstack-queue-review** — Review the partechstack publishing queue in Notion and recommend three articles for the next edition.

## Repository layout

Each skill lives in its own directory (e.g. `partechstack-queue-review/`) containing a `SKILL.md` manifest. The `.skill` zip files at the repo root are generated artifacts, rebuilt from the source directories.

## Building

```
./build.sh                        # rebuild every skill
./build.sh partechstack-queue-review   # rebuild one skill
```

## Installing a skill

Skills are distributed as `.skill` files (zip archives containing a `SKILL.md` manifest). Install by placing the unzipped contents into your Claude skills directory, or upload the `.skill` file directly where supported.
