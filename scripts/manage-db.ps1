# ============================================
# 🔧 Configuración
# ============================================
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$env:PGPASSWORD = "12345"
$pgBinPath      = "C:\Program Files\PostgreSQL\17\bin"
$pgDumpPath     = "$pgBinPath\pg_dump.exe"
$psqlPath       = "$pgBinPath\psql.exe"
$backupDir      = "$HOME\Documents\study-inc-db\backups"
$database       = "study-inc-db"
$server         = "localhost"
$port           = 5432
$username       = "postgres"

# Crear carpeta de backups si no existe
if (!(Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
}

# Obtener timestamp
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupFile = "$backupDir\backup_$timestamp.sql"

# ============================================
# 🧭 Menú principal
# ============================================
function Show-Menu {
    Clear-Host
    Write-Host "==== PostgreSQL Backup Manager ===="
    Write-Host "[1] Realizar backup"
    Write-Host "[2] Restaurar desde archivo"
    Write-Host "[3] Conectarse a la base de datos"
    Write-Host "[4] Crear base de datos si no existe"
    Write-Host "[0] Salir"
    $choice = Read-Host "Selecciona una opción"
    switch ($choice) {
        "1" { Backup-Database }
        "2" { Restore-Database }
        "3" { Connect-Database }
        "4" { Create-Database }
        "0" { exit }
        default { Show-Menu }
    }
}

# ============================================
# 🎒 Funciones
# ============================================

function Backup-Database {
    Write-Host "[INFO] Realizando backup..."

    # Generar nombre del archivo con timestamp
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupFile = "$backupDir\backup_$timestamp.backup"

    & "$pgDumpPath" -h $server -p $port -U $username -F c -b -v -f "$backupFile" $database

    if ($?) {
        Write-Host "[OK] Backup completado: $backupFile"
    } else {
        Write-Host "[ERROR] Error durante el backup."
    }
    Pause
    Show-Menu
}

function Restore-Database {
    $path = Read-Host "Ruta completa del archivo .backup a restaurar"
    if (!(Test-Path $path)) {
        Write-Host "[ERROR] El archivo no existe."
        Pause
        Show-Menu
    }

    Write-Host "[INFO] Restaurando desde backup..."
    & "$pgBinPath\pg_restore.exe" -h $server -p $port -U $username -d $database -c "$path"
    if ($?) {
        Write-Host "[OK] Restauración completada desde: $path"
    } else {
        Write-Host "[ERROR] Error durante la restauración."
    }
    Pause
    Show-Menu
}

function Connect-Database {
    & "$psqlPath" -h $server -p $port -U $username -d $database
    Show-Menu
}

function Create-Database {
    & "$psqlPath" -h $server -p $port -U $username -c "CREATE DATABASE `"$database`";"
    if ($?) {
        Write-Host "[OK] Base de datos creada (o ya existía)."
    } else {
        Write-Host "[ERROR] Error al crear la base de datos."
    }
    Pause
    Show-Menu
}

# ============================================
# ▶️ Iniciar menú
# ============================================
Show-Menu
