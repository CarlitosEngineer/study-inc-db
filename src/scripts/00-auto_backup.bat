@echo off
setlocal ENABLEDELAYEDEXPANSION

REM ---------------------------------------------------------
REM Configuración de la base de datos
REM ---------------------------------------------------------
set "SERVER=localhost"
set "DATABASE=study-inc-db"
set "PORT=5432"
set "USERNAME=postgres"

REM ✅ IMPORTANTE: ingresa tu contraseña al ejecutar
set /p "PASSWORD=Introduce la contraseña del usuario %USERNAME%: "

REM Ruta del binario de pg_dump
set "PGDUMP_PATH=C:\Program Files\PostgreSQL\17\bin\pg_dump.exe"

REM ✅ Ruta dinámica al directorio de backups
set "BACKUP_DIR=%USERPROFILE%\Documents\study-inc-db\src\backups"

REM ---------------------------------------------------------
REM Verificar que pg_dump exista
REM ---------------------------------------------------------
if not exist "%PGDUMP_PATH%" (
    echo ❌ ERROR: No se encontró pg_dump en "%PGDUMP_PATH%".
    pause
    exit /b 1
)

REM ---------------------------------------------------------
REM Obtener fecha y hora para el nombre del archivo
REM ---------------------------------------------------------
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set DATETIME=%%I
set "TIMESTAMP=%DATETIME:~0,8%_%DATETIME:~8,6%"

REM Nombre del archivo de respaldo
set "BACKUP_FILE=%BACKUP_DIR%\%DATABASE%_%TIMESTAMP%.backup"

REM ---------------------------------------------------------
REM Crear directorio si no existe
REM ---------------------------------------------------------
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
)

REM ---------------------------------------------------------
REM Generar backup
REM ---------------------------------------------------------
echo 📦 Generando copia de seguridad de la base de datos "%DATABASE%"...

set "PGPASSWORD=%PASSWORD%"
"%PGDUMP_PATH%" -h %SERVER% -p %PORT% -U %USERNAME% -F c -b -v -f "%BACKUP_FILE%" "%DATABASE%"
set "PGPASSWORD="

REM ---------------------------------------------------------
REM Verificación de éxito
REM ---------------------------------------------------------
if %ERRORLEVEL% neq 0 (
    echo ❌ Ocurrió un error al realizar la copia de seguridad.
) else (
    echo ✅ Copia de seguridad completada exitosamente:
    echo    Archivo: "%BACKUP_FILE%"
)

pause
exit /b
