# Repo Migration Script

## Introduction / Backgoround
I used JetBrains Spaces for all my repos.  With them shuttdown that service I had to migrate a lot of repo's out.  I wrote this script so that I could take the locally downloaded version and migrate it to another Git Repo (Azure DevOps).

This script will read the location repo from your clone.  Then upload to the url of the repo you provide.  This will include the check in history and branches.

This script will also make sure that "master" is set to "main". I did this because all new repo's I create in Azure DevOps use "main" instad of "master"

## How To
1) Copy script into a .bat file
2) Run as Admin
3) Copy the location of your repo you want to migrate.  Again, this needs to be a local clone on your machine.
4) Copy the url of the repo you want to send the repo to.  For Azure DevOps this is the url in the navigation bar, not the clone url.
5) Wait for it to complete
6) Verify branches, history and repo contents have migrated successfully.
