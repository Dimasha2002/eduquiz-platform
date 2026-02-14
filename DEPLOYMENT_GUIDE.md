# EduQuiz Deployment Guide

This guide explains how to deploy your EduQuiz application to production.

## Current Deployment Status

- **Frontend**: ✅ Deployed at `https://eduquiz-platform-frontend.onrender.com`
- **Backend**: ⚠️ Needs to be deployed

## Backend Deployment (Render)

### Step 1: Create Backend Service on Render

1. Go to [Render Dashboard](https://dashboard.render.com/)
2. Click "New +" → "Web Service"
3. Connect your GitHub repository
4. Configure the service:
   - **Name**: `eduquiz-platform-backend` (or your preferred name)
   - **Region**: Choose closest to your users
   - **Branch**: `main` (or your default branch)
   - **Root Directory**: `backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Free (or paid if needed)

### Step 2: Set Environment Variables on Render

In your backend service settings, add these environment variables:

```
NODE_ENV=production
PORT=5000
MONGODB_URI=mongodb+srv://eduquiz_user:nEg8YATecVkXd7KC@cluster0.xzzteh8.mongodb.net/eduquiz?retryWrites=true&w=majority&appName=Cluster0
JWT_SECRET=eduquiz_secret_key_2024_secure_random_string
JWT_EXPIRE=7d
CLIENT_URL=https://eduquiz-platform-frontend.onrender.com
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password
```

**Important Notes**:
- Replace `EMAIL_USER` and `EMAIL_PASS` with your actual Gmail credentials if you want email verification
- Email is optional - the app works without it
- The `CLIENT_URL` should match your frontend URL exactly

### Step 3: Deploy

1. Click "Create Web Service"
2. Wait for deployment to complete (5-10 minutes)
3. Note your backend URL (e.g., `https://eduquiz-platform-backend.onrender.com`)

### Step 4: Update Frontend Configuration

The frontend is already configured to auto-detect the backend URL! 

It uses this pattern:
- **Local development**: `http://localhost:5000/api`
- **Production**: `https://eduquiz-platform-backend.onrender.com/api`

**If your backend URL is different**, you have 2 options:

#### Option 1: Update the auto-detection (Recommended)
Edit `frontend/src/services/api.js` and change line 13:
```javascript
return 'https://your-actual-backend-url.onrender.com/api';
```

#### Option 2: Set environment variable on Render
In your frontend service on Render, add:
```
VITE_API_URL=https://your-actual-backend-url.onrender.com/api
```

### Step 5: Redeploy Frontend

Since you changed the API detection logic, you need to redeploy the frontend:

1. Go to your frontend service on Render
2. Click "Manual Deploy" → "Deploy latest commit"
3. Wait for deployment to complete

### Step 6: Test Your Production Site

1. Visit `https://eduquiz-platform-frontend.onrender.com`
2. Try to register a new account
3. Try to login
4. Verify everything works

## MongoDB Atlas Configuration

Make sure MongoDB Atlas is configured to accept connections:

1. Go to [MongoDB Atlas](https://cloud.mongodb.com/)
2. Select your cluster
3. Click "Network Access"
4. Add `0.0.0.0/0` to allow connections from anywhere (or add Render's IP ranges)

## Troubleshooting

### Frontend shows "Network error: Request failed with status code 404"

**Solution**: Backend is not deployed yet or URL is incorrect.
- Check if backend is deployed on Render
- Verify the backend URL in `frontend/src/services/api.js`
- Check browser console for the actual API URL being used

### CORS Errors

**Solution**: Update backend environment variables:
- Ensure `CLIENT_URL` matches your frontend URL exactly
- Ensure `NODE_ENV=production` on backend deployment

### MongoDB Connection Errors

**Solution**: 
- Check MongoDB Atlas network access settings
- Verify `MONGODB_URI` is correct in backend environment variables
- Check MongoDB Atlas is not paused (free tier sleeps after inactivity)

### Backend Returns 502 Bad Gateway

**Solution**: 
- Check backend logs on Render
- Verify all environment variables are set
- Check if MongoDB connection is working

## Local Development

To run locally after these changes:

```bash
# Backend
cd backend
npm install
npm start

# Frontend (in another terminal)
cd frontend
npm install
npm run dev
```

The auto-detection will use localhost URLs automatically.

## Quick Reference

| Environment | Frontend URL | Backend URL |
|------------|-------------|------------|
| **Local** | http://localhost:5173 | http://localhost:5000 |
| **Production** | https://eduquiz-platform-frontend.onrender.com | https://eduquiz-platform-backend.onrender.com |

## Next Steps

1. ✅ Deploy backend to Render
2. ✅ Set all environment variables
3. ✅ Update API URL if needed
4. ✅ Redeploy frontend
5. ✅ Test production site
6. 🎉 Your app is live!
