@echo off
setlocal

set /p OLD_REPO=Enter full path to the old repo:
set /p AZURE_REPO_URL=Enter Azure DevOps repo URL:

set "REMOTE_NAME=azure"

echo:
echo --- Migrating Git Repo ---
echo From: %OLD_REPO%
echo To:   %AZURE_REPO_URL%
echo:

:: Go to the old repo
cd /d %OLD_REPO%

:: Remove existing remote if needed
git remote remove %REMOTE_NAME% 2>nul

:: Add Azure DevOps remote
git remote add %REMOTE_NAME% %AZURE_REPO_URL%

:: Rename master to main if it exists
git show-ref --verify --quiet refs/heads/master
if %errorlevel%==0 (
    echo Renaming 'master' branch to 'main'...
    git branch -m master main
)

:: Push all branches and tags
echo Pushing all branches to Azure...
git push %REMOTE_NAME% --all --force

echo Pushing all tags to Azure...
git push %REMOTE_NAME% --tags --force

:: Set 'main' as the upstream if needed
git push --set-upstream %REMOTE_NAME% main 2>nul

echo:
echo ✅ Migration complete!
endlocal
