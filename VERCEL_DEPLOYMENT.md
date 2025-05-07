# Deploying FitAi to Vercel

This guide will help you deploy the FitAi application to Vercel with proper environment variable configuration.

## Prerequisites

- A Vercel account
- Your API keys for:
  - TomTom Maps
  - Serper
  - Groq

## Deployment Steps

### 1. Ensure CSS Files Are Properly Handled

The application uses CSS files in both the root directory and the `css/` subdirectory. Make sure the `vercel.json` configuration includes both:

```json
"builds": [
  { "src": "*.html", "use": "@vercel/static" },
  { "src": "*.js", "use": "@vercel/static" },
  { "src": "*.css", "use": "@vercel/static" },
  { "src": "css/**/*.css", "use": "@vercel/static" },
  { "src": "*.png", "use": "@vercel/static" }
],
```

For extra reliability, critical navbar styles have been inlined in each HTML file to ensure consistent appearance across all pages.

### 2. Push Your Code to GitHub

First, push your code to a GitHub repository:

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/fitai.git
git push -u origin main
```

### 2. Connect Repository to Vercel

1. Log in to your Vercel account
2. Click "New Project"
3. Import your GitHub repository
4. Configure the project:
   - Framework Preset: Other
   - Root Directory: ./
   - Build Command: npm run build
   - Output Directory: ./

### 3. Add Environment Variables

Add the following environment variables in the Vercel dashboard under "Environment Variables":

| Name | Value |
|------|-------|
| `TOMTOM_API_KEY` | Your TomTom API key |
| `SERPER_API_KEY` | Your Serper API key |
| `GROQ_API_KEY` | Your Groq API key |

### 4. Deploy

Click "Deploy" and Vercel will build and deploy your application.

## Updating API Keys

If you need to update your API keys in the future:

1. Go to your Vercel project dashboard
2. Click on "Settings"
3. Navigate to "Environment Variables"
4. Edit the values as needed
5. Redeploy your application for the changes to take effect

## Troubleshooting

### API Issues
If your APIs aren't working after deployment:

1. Check if the environment variables are correctly set in the Vercel dashboard
2. Verify that the API keys are valid
3. Look at the browser console for any errors
4. Check the deployment logs in Vercel for any build or runtime issues

### CSS/Styling Issues
If you encounter styling issues like missing navbar hover effects:

1. **Clear your browser cache** - Sometimes browsers cache old CSS files. Try hard refreshing (Ctrl+F5 or Cmd+Shift+R).
2. **Verify CSS paths** - Check that all CSS path references are correct in the HTML files.
3. **Redeploy with cache bypass** - In the Vercel dashboard, you can redeploy with the "Clear Cache and Deploy" option.
4. **Check browser console** - Look for 404 errors that might indicate missing CSS files.

1. Check if the environment variables are correctly set in the Vercel dashboard
2. Verify that the API keys are valid
3. Look at the browser console for any errors
4. Check the deployment logs in Vercel for any build or runtime issues

## Local Development with Environment Variables

For local development, create a `.env` file based on the `.env.example` template:

```
# Copy the .env.example file
cp .env.example .env

# Edit the file with your actual API keys
nano .env
```

Note: The `.env` file is not used in production. Vercel uses the environment variables set in the dashboard.
