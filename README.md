# Burnout5-Plugins

All plugins for my Burnout 5 Remake in one repo.

## Repository structure

Plugins are included through Git submodules.  
Some submodules may reference private repositories because certain plugins are still unfinished and not ready to be shared publicly.

## Submodules
Run `.\Update-Submodules.ps1` from the repo root to fetch and checkout the newest tracked commits for every submodule, including nested ones.
If a submodule has local changes, Git may stop the update until those changes are cleaned or stashed.
After an update, Git will still show the submodule pointers as modified in the parent repo until those SHAs are committed.
