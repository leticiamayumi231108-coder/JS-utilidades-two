$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$backend = Join-Path $root "backend"
$frontend = Join-Path $root "frontend"

Write-Host ""
Write-Host "=== SISTEMA PAPELARIA ===" -ForegroundColor Cyan

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw "Docker nao encontrado. Instale e abra o Docker Desktop."
}
if (-not (Get-Command node -ErrorAction SilentlyContinue) -or
    -not (Get-Command npm -ErrorAction SilentlyContinue)) {
    throw "Node.js e npm nao encontrados. Instale Node.js 22.12 ou superior."
}

if (-not (Test-Path (Join-Path $backend ".env"))) {
    Copy-Item (Join-Path $backend ".env.example") (Join-Path $backend ".env")
    Write-Host "Arquivo backend\.env criado. Revise as credenciais se necessario."
}

Write-Host "`nIniciando banco de dados e API..." -ForegroundColor Yellow
Push-Location $backend
try {
    docker compose up --build -d
} finally {
    Pop-Location
}

if (-not (Test-Path (Join-Path $frontend "node_modules"))) {
    Write-Host "`nInstalando dependencias do Angular..." -ForegroundColor Yellow
    Push-Location $frontend
    try {
        npm ci
        if ($LASTEXITCODE -ne 0) { throw "Falha ao instalar dependencias do frontend." }
    } finally {
        Pop-Location
    }
}

Write-Host "`nAPI: http://localhost:8080" -ForegroundColor Green
Write-Host "Swagger: http://localhost:8080/swagger-ui/index.html" -ForegroundColor Green
Write-Host "Frontend: http://localhost:4200" -ForegroundColor Green
Write-Host "`nIniciando Angular. Para encerrar, pressione Ctrl+C." -ForegroundColor Yellow
Push-Location $frontend
try {
    npm start
} finally {
    Pop-Location
}
