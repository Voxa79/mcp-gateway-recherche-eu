# MCP Gateway - Recherche EU/Wallonie
# Script d'arrêt pour Windows (PowerShell)

Write-Host "🛑 Arrêt du MCP Gateway - Recherche EU/Wallonie" -ForegroundColor Yellow
Write-Host ""

# Vérifier si Podman est installé
$podman = Get-Command podman -ErrorAction SilentlyContinue
$docker = Get-Command docker -ErrorAction SilentlyContinue

if ($podman) {
    & podman-compose down
} elseif ($docker) {
    & docker-compose -f podman-compose.yml down
} else {
    Write-Host "❌ Ni Podman ni Docker n'est installé!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✅ MCP Gateway arrêté" -ForegroundColor Green
