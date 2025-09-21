# test-auth.ps1
# PowerShell script to test Node.js authentication API (register → login → profile)

$baseUrl = "http://localhost:3000/api/auth"

# ---------------- REGISTER ----------------
Write-Host "➡️ Registering user..."
$registerBody = @{
    username = "alice"
    password = "12345"
} | ConvertTo-Json

$registerResponse = Invoke-RestMethod -Method Post -Uri "$baseUrl/register" -Body $registerBody -ContentType "application/json"
Write-Host "Register Response: $($registerResponse | ConvertTo-Json)" -ForegroundColor Green

# ---------------- LOGIN ----------------
Write-Host "`n➡️ Logging in user..."
$loginBody = @{
    username = "alice"
    password = "12345"
} | ConvertTo-Json

$loginResponse = Invoke-RestMethod -Method Post -Uri "$baseUrl/login" -Body $loginBody -ContentType "application/json"
Write-Host "Login Response: $($loginResponse | ConvertTo-Json)" -ForegroundColor Green

# Extract JWT token
$token = $loginResponse.token
if (-not $token) {
    Write-Host "❌ Login failed, cannot continue to profile." -ForegroundColor Red
    exit
}

# ---------------- PROFILE ----------------
Write-Host "`n➡️ Accessing protected profile route..."
$headers = @{ Authorization = "Bearer $token" }
$profileResponse = Invoke-RestMethod -Method Get -Uri "$baseUrl/profile" -Headers $headers
Write-Host "Profile Response: $($profileResponse | ConvertTo-Json)" -ForegroundColor Green
