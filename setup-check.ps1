# EduQuiz Setup Verification Script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  EduQuiz Setup Verification" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$allGood = $true

# Check Node.js
Write-Host "Checking Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js installed: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js not found. Please install Node.js from https://nodejs.org" -ForegroundColor Red
    $allGood = $false
}

# Check npm
Write-Host "Checking npm..." -ForegroundColor Yellow
try {
    $npmVersion = npm --version
    Write-Host "✓ npm installed: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ npm not found" -ForegroundColor Red
    $allGood = $false
}

Write-Host ""
Write-Host "Checking backend..." -ForegroundColor Yellow

# Check backend package.json
if (Test-Path "backend\package.json") {
    Write-Host "✓ Backend package.json exists" -ForegroundColor Green
} else {
    Write-Host "✗ Backend package.json missing" -ForegroundColor Red
    $allGood = $false
}

# Check backend .env
if (Test-Path "backend\.env") {
    Write-Host "✓ Backend .env exists" -ForegroundColor Green
} else {
    Write-Host "⚠ Backend .env missing (copy from .env.example)" -ForegroundColor Yellow
}

# Check backend node_modules
if (Test-Path "backend\node_modules") {
    Write-Host "✓ Backend dependencies installed" -ForegroundColor Green
} else {
    Write-Host "⚠ Backend dependencies not installed (run 'npm install' in backend folder)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Checking frontend..." -ForegroundColor Yellow

# Check frontend package.json
if (Test-Path "frontend\package.json") {
    Write-Host "✓ Frontend package.json exists" -ForegroundColor Green
} else {
    Write-Host "✗ Frontend package.json missing" -ForegroundColor Red
    $allGood = $false
}

# Check frontend .env
if (Test-Path "frontend\.env") {
    Write-Host "✓ Frontend .env exists" -ForegroundColor Green
} else {
    Write-Host "⚠ Frontend .env missing (copy from .env.example)" -ForegroundColor Yellow
}

# Check frontend node_modules
if (Test-Path "frontend\node_modules") {
    Write-Host "✓ Frontend dependencies installed" -ForegroundColor Green
} else {
    Write-Host "⚠ Frontend dependencies not installed (run 'npm install' in frontend folder)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan

if ($allGood) {
    Write-Host "✓ All critical checks passed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Review backend\.env for MongoDB credentials"
    Write-Host "2. Open two terminals:"
    Write-Host "   Terminal 1: cd backend && npm run dev"
    Write-Host "   Terminal 2: cd frontend && npm run dev"
    Write-Host "3. Open http://localhost:5173 in your browser"
} else {
    Write-Host "✗ Some critical checks failed. Please fix the issues above." -ForegroundColor Red
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "For detailed setup instructions, see QUICKSTART.md" -ForegroundColor Cyan
