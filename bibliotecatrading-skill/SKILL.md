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

