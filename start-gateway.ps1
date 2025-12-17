# MCP Gateway - Recherche EU/Wallonie
# Script de démarrage pour Windows (PowerShell)

Write-Host "🔬 MCP Gateway - Recherche EU/Wallonie" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Vérifier si Podman est installé
$podman = Get-Command podman -ErrorAction SilentlyContinue
$docker = Get-Command docker -ErrorAction SilentlyContinue

if ($podman) {
    Write-Host "✅ Podman détecté" -ForegroundColor Green
    $engine = "podman"
    $compose = "podman-compose"
} elseif ($docker) {
    Write-Host "✅ Docker détecté" -ForegroundColor Green
    $engine = "docker"
    $compose = "docker-compose"
} else {
    Write-Host "❌ Ni Podman ni Docker n'est installé!" -ForegroundColor Red
    Write-Host "Installez Podman Desktop: https://podman-desktop.io/" -ForegroundColor Yellow
    exit 1
}

# Vérifier le fichier .env
if (-not (Test-Path ".env")) {
    Write-Host "⚠️  Fichier .env non trouvé, copie de .env.example..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "📝 Éditez le fichier .env pour ajouter vos API keys" -ForegroundColor Yellow
}

# Démarrer le gateway
Write-Host ""
Write-Host "🚀 Démarrage du MCP Gateway (28 serveurs)..." -ForegroundColor Cyan
Write-Host ""

if ($engine -eq "podman") {
    & podman-compose up -d
} else {
    & docker-compose -f podman-compose.yml up -d
}

# Attendre que le gateway soit prêt
Write-Host ""
Write-Host "⏳ Attente du démarrage du gateway..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Vérifier le statut
Write-Host ""
Write-Host "📊 Statut des services:" -ForegroundColor Cyan
if ($engine -eq "podman") {
    & podman-compose ps
} else {
    & docker-compose -f podman-compose.yml ps
}

Write-Host ""
Write-Host "✅ MCP Gateway démarré!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Gateway URL: http://localhost:8080" -ForegroundColor Cyan
Write-Host "📖 Documentation: http://localhost:8080/docs" -ForegroundColor Cyan
Write-Host ""
Write-Host "Pour arrêter: .\stop-gateway.ps1" -ForegroundColor Yellow
