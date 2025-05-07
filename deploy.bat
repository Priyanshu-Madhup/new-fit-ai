@echo off
REM FitAi Vercel Deployment Script

echo ===================================
echo       FitAi Vercel Deployment
echo ===================================
echo.
echo This script will deploy your FitAi app to Vercel with cache purging.
echo.

REM Check if vercel CLI is installed
where vercel >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Vercel CLI not found. Installing...
    npm install -g vercel
)

echo.
echo Step 1: Build project...
echo.

REM Add build steps here if needed

echo.
echo Step 2: Deploying to Vercel (with cache purge)...
echo.

REM Deploy with cache purging enabled
vercel deploy --prod --force

echo.
echo Deployment complete! 
echo Your site should now have consistent navbar styling across all pages.
echo.

echo Remember to check that:
echo 1. The green pill hover effect works on all pages
echo 2. The active page is properly highlighted
echo 3. Mobile navigation works correctly
echo.

pause
