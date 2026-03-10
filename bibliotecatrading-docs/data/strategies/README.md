# README - data/strategies

Este directorio almacena estrategias de trading en formato JSON para que el docs_trader_bot pueda leerlas y convertirlas en decisiones automatizadas.

Formato de una estrategia (ejemplo):
- strategy_name: nombre descriptivo
- description: resumen de la estrategia
- timeframe: marco temporal de salida de las entradas (por ejemplo, 5m, 1h)
- market_type: spot/futures
- entry_conditions: lista de condiciones para abrir una posición larga
- exit_conditions: condiciones para salir (take_profit, stop_loss)
- indicators_needed: array de indicadores con nombres y parámetros
- notes: aclaraciones o ideas para mejoras

Proceso recomendado:
1) Mantener una colección de estrategias en data/strategies, cada una como un JSON válido.
2) El docs_trader_bot puede leer estas estrategias para generar resúmenes o para activar reglas en ejecución. 
3) Si implementas una API de indicadores, actualiza external_indicator_api en SKILL.md para que el bot obtenga datos en tiempo real.

Ejemplo de uso en el bot:
- Una consulta al docs_trader_bot con topic "Tendencia Altos y Bajos 5min" podría devolver un resumen y las condiciones clave, junto con referencias a la ruta del JSON de la estrategia.
