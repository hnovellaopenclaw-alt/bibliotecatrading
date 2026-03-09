#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="/home/ubuntu/.openclaw/workspace/bibliotecatrading-skill"
#Crear directorio base

mkdir -p "$BASE_DIR"
#1) SKILL.md (Anexo A)

cat > "${BASE_DIR}/SKILL.md" << 'EOF'
bibliotecatrading-skill
Overview

Este skill proporciona acceso a la documentación de la biblioteca de trading, facilita la toma de decisiones y sienta las bases para futuras integraciones con plataformas como Binance u otras estrategias de trading.
Propósito

    Servir como un punto centralizado para consultar información relevante sobre la biblioteca de trading.
    Ayudar en la generación y validación de configuraciones de skills.
    Orquestar y preparar la integración con herramientas externas y estrategias de trading.

Alcance Actual

    Consulta de documentación extraída de data/, memory/, tests/.
    Generación de borradores iniciales de SKILL.md.
    Verificación de la estructura de código y documentación.
    Sincronización y gestión básica de repositorios locales.

Plan de Expansión

    Integración con plataformas de trading (ej. Binance) para ejecución de operaciones.
    Orquestación con otros skills de estrategia de trading.
    Desarrollo de funcionalidades avanzadas de análisis y toma de decisiones.

Setup

Este skill está diseñado para ser versionado y administrado a través de Git.
Requisitos

    Acceso a la librería de trading (código fuente, documentación).
    Entorno de desarrollo con Git.
    Credenciales de acceso a repositorios remotos (SSH o HTTPS con token).

Generación/Actualización de SKILL.md

Para generar o actualizar SKILL.md y otros archivos relevantes (como README.md, data/, tests/, memory/), puedes seguir estos pasos:

    Navega al directorio del skill:
        cd /home/ubuntu/.openclaw/workspace/bibliotecatrading-skill/
    Ejecuta el comando de generación (ejemplo conceptual, necesitará ser implementado en un script o comando específico dentro del skill):
        openclaw skill bibliotecatrading generate --from-docs
        Este comando analizará la información disponible en data/, memory/ y tests/ para poblar o actualizar SKILL.md con:
        Sección Overview actualizada.
        Definición de Intents y Prompts basados en los casos de uso identificados.
        Estructura básica de Data Model, Tests, Examples, y Acceptance Criteria.

Intents

Los siguientes intents representan las acciones principales que este skill puede realizar:

    consultar_documentacion
    generar_borrador_skill
    validar_estructura
    sincronizar_remoto
    preparar_entrega_local

Prompts

Aquí se definen ejemplos de prompts que pueden ser utilizados para interactuar con este skill:
Prompt Principal

"Genera un borrador de SKILL.md para bibliotecatrading-skill basándote en la documentación y el estado actual de los directorios data/, memory/ y tests/."
Prompt de Validación

"Verifica que el archivo SKILL.md contenga las secciones principales: Overview, Setup, Intents, Prompts, Data Model, Tests, Examples, y Acceptance Criteria."
Prompt de Consulta de Documentación

"Explícame cómo configurar el entorno de pruebas para la biblioteca de trading."
Prompt de Integración Futura

"Prepara la estructura para integrar el bibliotecatrading-skill con la API de Binance para operaciones de trading en modo sandbox."
Data Model

Los datos de este skill se encuentran organizados en los siguientes directorios:

    data/
    memory/
    tests/

Tests

La sección de tests se encargará de validar:

    La correcta interpretación y generación de contenido para SKILL.md.
    La accesibilidad y coherencia de la documentación en data/.
    La funcionalidad de los intents definidos.
    La preparación adecuada para futuras integraciones.

Examples

Se incluirán ejemplos de uso del skill, como:

    Ejemplo de cómo consultar la documentación para un módulo específico
    Ejemplo de generación de un SKILL.md para una nueva funcionalidad
    Ejemplo de cómo preparar la integración con Binance

Acceptance Criteria

    El skill debe poder responder a consultas básicas sobre la documentación de la biblioteca de trading.
    La generación de SKILL.md debe ser coherente y basarse en la información disponible.
    El repositorio local debe poder sincronizarse exitosamente con un remoto Git configurado.
    El skill debe ser extensible para futuras integraciones de trading.
    Se debe poder acceder y consultar el contenido de data/, memory/, tests/ de forma efectiva.
    El código debe seguir las conventions de desarrollo y buenas prácticas.

Anexo A: Contenido completo de SKILL.md (draft)

    Incluye el texto completo mostrado arriba, tal como está, para revisión exhaustiva.

Notas finales

    Este draft está listo para pegar en tu repositorio local en la ruta mencionada.
    Una vez pegado, ejecuta el push seguro para conectarte al remoto y obtener el informe final con hash real, árbol de archivos, y verificación de SKILL.md en remoto.

EOF
#2) README.md (contenido mínimo)

cat > "${BASE_DIR}/README.md" << 'EOF'
Propósito del skill

    Proporcionar una fuente de verdad para la documentación de la biblioteca de trading y facilitar decisiones basadas en esa documentación.

Flujo de trabajo

    Estructura de carpetas: data/, memory/, tests/, SKILL.md
    Generación/actualización de SKILL.md a partir de data/, memory/ y tests/
    Sincronización con remoto (push)
EOF

#3) tree.txt (árbol de la carpeta)

ls -R > "${BASE_DIR}/tree.txt"
#4) health_check.sh

##cat  "${BASE_DIR}/health_check.sh"  'EOF'
#!/usr/bin/env bash
#set -euo pipefail
#echo "Health check: bibliotecatrading-skill"
#if [ -f SKILL.md ]; then
#echo "SKILL.md: OK"
#else
#echo "SKILL.md: MISSING"
#fi
#echo "Estructura base:"
#ls -R
#EOF
#chmod +x "${BASE_DIR}/health_check.sh"
#5) push_remote.sh (versión lista para pegar)

cat > "${BASE_DIR}/scripts/push_remote.sh" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

DIR="/home/ubuntu/.openclaw/workspace/bibliotecatrading-skill"
REPO_HTTPS="https://github.com/hnovellaopenclaw-alt/bibliotecatrading.git"
TOKEN_ENV="${GITHUB_TOKEN:-}"

if [ -z "$TOKEN_ENV" ]; then
echo "ERROR: GITHUB_TOKEN no definido en el entorno."
exit 1
fi

cd "$DIR"
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || git init
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_HTTPS"

if git ls-remote --exit-code --heads origin main >/dev/null 2>&1; then
git fetch origin main
git checkout main
else
git checkout -b main
fi

CREDENTIALS_FILE="$HOME/.git-credentials"
export GIT_ASKPASS=/bin/echo
mkdir -p "$(dirname "$CREDENTIALS_FILE")"
printf "https://%s:@github.com\n" "$TOKEN_ENV" > "$CREDENTIALS_FILE"
chmod 600 "$CREDENTIALS_FILE"

git config credential.helper store
git config user.name "OpenClaw Bot"
git config user.email "bot@openclaw.local"

git add .
git diff --cached --quiet || git commit -m "chore: initial local structure for bibliotecatrading-skill + draft SKILL.md"

git push -u origin main

rm -f "$CREDENTIALS_FILE"
unset GIT_ASKPASS
echo "Push completado."
EOF
#6) Instrucciones para mover a la ruta final si hiciste pruebas en /tmp

cat > "${BASE_DIR}/move_instructions.txt" << 'EOF'
Instrucciones para mover a la ruta final y hacer push:

    mv /tmp/bibliotecatrading-skill-temp /home/ubuntu/.openclaw/workspace/bibliotecatrading-skill
    sudo chown -R ubuntu:ubuntu /home/ubuntu/.openclaw/workspace/bibliotecatrading-skill
    chmod -R u+rwX /home/ubuntu/.openclaw/workspace/bibliotecatrading-skill
    Ejecutar: /home/ubuntu/.openclaw/workspace/bibliotecatrading-skill/scripts/push_remote.sh
EOF

echo "Script de setup generado. Ejecuta el script create_bibliotecatrading_skill.sh en tu entorno para crear todo en disco."
exit 0


