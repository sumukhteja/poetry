@echo off
:: Check if git is initialized
if not exist .git (
    echo [1/4] Initializing Git...
    git init
    git remote add origin https://github.com/sumukhteja/poetry.git
    git branch -M main
) else (
    echo [*] Repository already initialized.
)

:: Check for changes
git status --porcelain | findstr /R "^" > nul
if %errorlevel% equ 0 (
    echo [2/4] Changes detected. Adding files...
    git add .
    echo [3/4] Committing...
    git commit -m "sync: %date% %time%"
    echo [4/4] Pushing to GitHub...
    git push origin main
) else (
    echo [-] No changes to sync.
)
echo.
echo Sync Complete.
pause
