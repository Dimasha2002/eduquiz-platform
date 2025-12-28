# 🚀 QUICK START GUIDE

## Prerequisites Checklist
- [x] Node.js installed (v16+)
- [x] MongoDB Atlas account created
- [ ] Gmail app password (for email verification)

## Step 1: MongoDB Atlas Setup ⚡

The MongoDB connection string is already configured in `backend/.env`:
```
mongodb+srv://quiz:m1v8olczyZf1jUOf@cluster0.xzzteh8.mongodb.net/eduquiz
```

**IMPORTANT:** You need to ensure:
1. The database user `quiz` exists in MongoDB Atlas
2. The password `m1v8olczyZf1jUOf` is correct
3. Network access allows connections from your IP (or 0.0.0.0/0 for testing)

### To Fix Authentication Issues:
1. Go to MongoDB Atlas → Database Access
2. Check if user `quiz` exists with password `m1v8olczyZf1jUOf`
3. If not, create a new user or update `.env` with correct credentials
4. Go to Network Access → Add IP Address → Allow from Anywhere (for testing)

## Step 2: Email Configuration (Optional but Recommended)

For email verification to work, update `backend/.env`:

```env
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_16_character_app_password
```

### How to Get Gmail App Password:
1. Go to https://myaccount.google.com/security
2. Enable 2-Step Verification
3. Search for "App passwords"
4. Select "Mail" and "Other"
5. Generate password
6. Copy the 16-character password to `.env`

**Note:** Email verification is optional. Users can still use the app without it.

## Step 3: Install Dependencies

### Backend:
```bash
cd backend
npm install
```

### Frontend:
```bash
cd frontend
npm install
```

## Step 4: Start the Application

### Terminal 1 - Backend:
```bash
cd backend
npm run dev
```
✅ Backend runs on `http://localhost:5000`

### Terminal 2 - Frontend:
```bash
cd frontend
npm run dev
```
✅ Frontend runs on `http://localhost:5173`

## Step 5: Open Application

Open browser and go to: `http://localhost:5173`

## 🎯 Testing the Application

### Test as Teacher:
1. Click "Register"
2. Fill form:
   - Name: John Teacher
   - Email: teacher@test.com
   - Password: test123
   - Role: Teacher
   - Subjects: Mathematics, Science
3. Click Register
4. Login and create a module
5. Create a quiz with questions

### Test as Student:
1. Open incognito/new browser
2. Register:
   - Name: Jane Student
   - Email: student@test.com
   - Password: test123
   - Role: Student
3. Browse modules
4. Enroll in a module
5. Take a quiz

## 📋 Common Issues & Solutions

### Issue 1: MongoDB Authentication Failed
**Error:** `bad auth : authentication failed`

**Solution:**
1. Go to MongoDB Atlas
2. Database Access → Edit user `quiz`
3. Reset password to `m1v8olczyZf1jUOf`
4. Or update `.env` with new credentials

### Issue 2: Network Error / Cannot Connect
**Error:** CORS or network errors

**Solution:**
1. Check backend is running on port 5000
2. Check `frontend/.env` has `VITE_API_URL=http://localhost:5000/api`
3. Restart both servers

### Issue 3: Email Not Sending
**Error:** Email verification fails

**Solution:**
- Don't worry! Users can still login and use the app
- Update EMAIL_USER and EMAIL_PASS in `backend/.env` later
- The `isVerified` field won't block functionality

### Issue 4: Port Already in Use
**Error:** Port 5000 or 5173 already in use

**Solution:**
```bash
# Windows - Kill process on port
netstat -ano | findstr :5000
taskkill /PID <process_id> /F
```

## 🎨 Application Features

### ✅ Implemented Features:
- User registration and login (Teacher/Student)
- Email verification system
- Teacher: Create modules and quizzes
- Teacher: Add single/multiple choice questions
- Student: Browse and enroll in modules
- Student: Take quizzes with timer
- Student: View instant results and scores
- Quiz retake functionality
- Responsive design with Tailwind CSS
- Red, yellow, white color theme
- Protected routes based on user role
- All data stored in MongoDB Atlas

## 🔐 Sample Credentials

After you create users, you can use:

**Teacher Account:**
- Email: teacher@test.com
- Password: test123

**Student Account:**
- Email: student@test.com
- Password: test123

## 📊 Database Collections

The app will automatically create these collections in MongoDB:
- `users` - Teachers and students
- `modules` - Course modules
- `quizzes` - Quizzes with questions
- `enrollments` - Student enrollments
- `attempts` - Quiz attempts and scores

## 🚀 Deployment Ready

The application is ready for deployment to:
- **Backend:** Heroku, Railway, Render, or AWS
- **Frontend:** Vercel, Netlify, or GitHub Pages
- **Database:** MongoDB Atlas (already cloud-based)

## 📞 Need Help?

1. Check MongoDB Atlas connection
2. Verify both servers are running
3. Check browser console for errors
4. Check terminal for backend errors
5. Review README.md for detailed documentation

---

**Happy Coding! 🎉**

Your full-stack EduQuiz application is ready to use!
