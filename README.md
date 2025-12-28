# EduQuiz - Full-Stack Educational Quiz Platform

A modern full-stack web application for creating and taking quizzes with two user roles: Teachers and Students.

## Features

### Teacher Features
- ✅ Register and login with email verification
- ✅ Create and manage modules (courses)
- ✅ Create quizzes with multiple question types:
  - Single correct answer
  - Multiple correct answers
- ✅ View student enrollment and results
- ✅ Manage subjects they teach

### Student Features
- ✅ Register with email confirmation
- ✅ Browse available modules
- ✅ Enroll in modules
- ✅ View "My Courses"
- ✅ Take quizzes with:
  - Timer countdown
  - Instant score after submission
  - Question type indicators
- ✅ View quiz history and best scores
- ✅ Retake quizzes

### Technical Features
- ✅ JWT authentication with protected routes
- ✅ MongoDB Atlas for data storage
- ✅ Email verification (Nodemailer)
- ✅ RESTful API architecture
- ✅ Responsive design with Tailwind CSS
- ✅ Red, yellow, and white color theme
- ✅ No localStorage data - fully backend-driven

## Tech Stack

### Frontend
- React 19 with Vite
- React Router DOM for routing
- Tailwind CSS for styling
- Axios for API calls
- Context API for state management

### Backend
- Node.js with Express
- MongoDB with Mongoose
- JWT for authentication
- Bcrypt for password hashing
- Nodemailer for email verification
- Express Validator for input validation

## Project Structure

```
EduQuiz/
├── backend/
│   ├── config/
│   │   └── db.js              # MongoDB connection
│   ├── models/
│   │   ├── User.js            # User model (Teacher/Student)
│   │   ├── Module.js          # Course module model
│   │   ├── Quiz.js            # Quiz model with questions
│   │   ├── Enrollment.js      # Student enrollments
│   │   └── Attempt.js         # Quiz attempts and scores
│   ├── routes/
│   │   ├── auth.js            # Authentication routes
│   │   ├── modules.js         # Module CRUD routes
│   │   ├── quizzes.js         # Quiz CRUD routes
│   │   ├── enrollments.js     # Enrollment routes
│   │   └── attempts.js        # Quiz attempt routes
│   ├── middleware/
│   │   └── auth.js            # JWT authentication middleware
│   ├── utils/
│   │   ├── token.js           # Token generation utilities
│   │   └── email.js           # Email sending utilities
│   ├── .env                   # Environment variables
│   ├── server.js              # Express server
│   └── package.json
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   └── ProtectedRoute.jsx  # Route protection
│   │   ├── context/
│   │   │   └── AuthContext.jsx     # Authentication context
│   │   ├── pages/
│   │   │   ├── Login.jsx
│   │   │   ├── Register.jsx
│   │   │   ├── teacher/
│   │   │   │   ├── TeacherDashboard.jsx
│   │   │   │   └── ModuleDetail.jsx
│   │   │   └── student/
│   │   │       ├── StudentDashboard.jsx
│   │   │       ├── StudentModuleDetail.jsx
│   │   │       └── TakeQuiz.jsx
│   │   ├── services/
│   │   │   └── api.js              # API service layer
│   │   ├── App.jsx                 # Main app with routing
│   │   ├── main.jsx
│   │   └── index.css               # Tailwind styles
│   ├── .env
│   ├── tailwind.config.js
│   └── package.json
│
└── README.md
```

## Setup Instructions

### Prerequisites
- Node.js (v16 or higher)
- MongoDB Atlas account
- Gmail account for email verification (or other SMTP)

### Backend Setup

1. Navigate to backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure environment variables in `.env`:
   ```env
   PORT=5000
   MONGODB_URI=mongodb+srv://quiz:m1v8olczyZf1jUOf@cluster0.xzzteh8.mongodb.net/eduquiz?retryWrites=true&w=majority&appName=Cluster0
   JWT_SECRET=your_jwt_secret_key_here_change_in_production
   JWT_EXPIRE=7d
   EMAIL_HOST=smtp.gmail.com
   EMAIL_PORT=587
   EMAIL_USER=your_email@gmail.com
   EMAIL_PASS=your_app_password
   CLIENT_URL=http://localhost:5173
   ```

   **Note for Email Setup:**
   - For Gmail, you need to create an "App Password":
     1. Go to Google Account settings
     2. Enable 2-Factor Authentication
     3. Go to Security → App passwords
     4. Generate a password for "Mail"
     5. Use that password in EMAIL_PASS

4. Start the backend server:
   ```bash
   npm run dev    # Development with nodemon
   # or
   npm start      # Production
   ```

   Server will run on `http://localhost:5000`

### Frontend Setup

1. Navigate to frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure environment variables in `.env`:
   ```env
   VITE_API_URL=http://localhost:5000/api
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

   Frontend will run on `http://localhost:5173`

## Usage Guide

### For Teachers

1. **Register** as a teacher:
   - Provide name, email, password
   - Select "Teacher" role
   - Add subjects you teach
   - Check email for verification link

2. **Create Modules**:
   - Click "Create Module" on dashboard
   - Fill in title, description, and subject
   - Module appears in your dashboard

3. **Create Quizzes**:
   - Click on a module
   - Click "Create Quiz"
   - Add quiz details (title, description, duration)
   - Add questions:
     - Enter question text
     - Choose single or multiple answer type
     - Add 4 options
     - Check correct answer(s)
     - Assign points
   - Submit quiz

### For Students

1. **Register** as a student:
   - Provide name, email, password
   - Select "Student" role
   - Check email for verification link

2. **Browse and Enroll**:
   - Browse available modules
   - Click "Enroll" on desired modules
   - Enrolled modules appear in "My Courses"

3. **Take Quizzes**:
   - Go to "My Courses"
   - Click on a module
   - Click "Start Quiz" on any quiz
   - Answer all questions within time limit
   - Submit to see instant results
   - View score, percentage, and detailed results

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/verify-email/:token` - Verify email
- `GET /api/auth/me` - Get current user

### Modules (Teachers)
- `GET /api/modules` - Get all modules
- `GET /api/modules/my-modules` - Get teacher's modules
- `GET /api/modules/:id` - Get single module
- `POST /api/modules` - Create module
- `PUT /api/modules/:id` - Update module
- `DELETE /api/modules/:id` - Delete module

### Quizzes
- `GET /api/quizzes/module/:moduleId` - Get module quizzes
- `GET /api/quizzes/:id` - Get single quiz
- `POST /api/quizzes` - Create quiz (teacher)
- `PUT /api/quizzes/:id` - Update quiz (teacher)
- `DELETE /api/quizzes/:id` - Delete quiz (teacher)

### Enrollments (Students)
- `GET /api/enrollments/my-courses` - Get enrolled courses
- `POST /api/enrollments` - Enroll in module
- `GET /api/enrollments/check/:moduleId` - Check enrollment
- `DELETE /api/enrollments/:moduleId` - Unenroll

### Attempts (Students)
- `GET /api/attempts/quiz/:quizId` - Get quiz attempts
- `GET /api/attempts/module/:moduleId` - Get module attempts
- `POST /api/attempts/start` - Start quiz attempt
- `POST /api/attempts/submit/:attemptId` - Submit quiz
- `GET /api/attempts/:attemptId` - Get attempt details

## Database Schema

### User
- name, email, password (hashed)
- role: 'student' | 'teacher'
- subjects (array) - for teachers
- isVerified, verificationToken

### Module
- title, description, subject
- teacher (ref: User)
- quizzes (array, ref: Quiz)
- enrolledStudents (array, ref: User)

### Quiz
- title, description, duration
- module (ref: Module)
- questions (embedded):
  - questionText
  - questionType: 'single' | 'multiple'
  - options (array)
  - correctAnswers (array of indices)
  - points
- totalPoints (auto-calculated)
- createdBy (ref: User)

### Enrollment
- student (ref: User)
- module (ref: Module)
- enrolledAt, status

### Attempt
- student (ref: User)
- quiz (ref: Quiz)
- module (ref: Module)
- answers (array):
  - questionId
  - selectedAnswers (array of indices)
  - isCorrect, pointsEarned
- score, percentage
- startedAt, submittedAt, timeTaken

## Color Theme

- **Primary (Red)**: #dc2626 (red-600)
- **Secondary (Yellow)**: #fbbf24 (yellow-400)
- **Background**: White and light grays
- **Accents**: Red for important actions, Yellow for highlights

## Deployment

### Backend Deployment (e.g., Heroku, Railway, Render)
1. Set environment variables on platform
2. Deploy backend code
3. Note the deployed backend URL

### Frontend Deployment (e.g., Vercel, Netlify)
1. Update `VITE_API_URL` to point to deployed backend
2. Build: `npm run build`
3. Deploy `dist` folder

### MongoDB Atlas
- Already configured with provided connection string
- Ensure IP whitelist allows connections from deployment platform
- Database: `eduquiz`

## Development Notes

- Frontend runs on port 5173 (Vite default)
- Backend runs on port 5000
- CORS is configured to allow frontend origin
- All passwords are hashed with bcrypt
- JWT tokens expire in 7 days by default
- Email verification tokens are unique per user

## Future Enhancements

- Add quiz categories and difficulty levels
- Implement real-time leaderboards
- Add file upload for questions (images)
- Create detailed analytics dashboard for teachers
- Add quiz scheduling and deadlines
- Implement social features (comments, discussions)
- Add export functionality for results
- Mobile app version

## Troubleshooting

**Database Connection Issues:**
- Check MongoDB Atlas IP whitelist
- Verify connection string in `.env`
- Ensure network allows MongoDB port 27017

**Email Not Sending:**
- Verify Gmail app password is correct
- Check if 2FA is enabled on Gmail
- Try using a different SMTP provider

**CORS Errors:**
- Ensure `CLIENT_URL` in backend `.env` matches frontend URL
- Check if backend server is running

**Authentication Issues:**
- Clear browser localStorage and cookies
- Check if JWT_SECRET is set in backend `.env`
- Verify token is being sent in request headers

## License

MIT License - Free to use for educational purposes

## Support

For issues or questions, please create an issue in the repository.

---

**Built with ❤️ using MERN Stack**
