#!/bin/bash

TOKEN="<BOT_TOKEN>"
CHAT_ID="<CHAT_ID>"
LOG_FILE="/var/log/auth.log"

tail -Fn0 "$LOG_FILE" | grep --line-buffered "Failed password" | while read line; do

    # 1. Extraer la IP (busca patrón numérico)
    IP=$(echo "$line" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")

    # 2. Extraer el Usuario
    if echo "$line" | grep -q "invalid user"; then
        USER=$(echo "$line" | awk -F'invalid user ' '{print $2}' | awk '{print $1}')
        TYPE="❌ Usuario Inexistente"
    else
        USER=$(echo "$line" | awk -F'for ' '{print $2}' | awk '{print $1}')
        TYPE="⚠️ Contraseña Incorrecta"
    fi

    # 3. Obtener bandera del país
    # Usamos ip-api.com que es gratis y rápido
    COUNTRY=$(curl -s "http://ip-api.com/line/$IP?fields=countryCode")

    # 4. Formatear mensaje
    MESSAGE="🕵️ *INTRUSO DETECTADO* 🕵️%0A%0A👤 *Usuario:* \`$USER\`%0A🖥 *IP:* \`$IP\` ($COUNTRY)%0A🔍 *Tipo:* $TYPE%0A%0A_Monitorizando en tiempo real..._"

    # 5. Enviar a Telegram
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d chat_id=$CHAT_ID \
        -d text="$MESSAGE" \
        -d parse_mode="Markdown" > /dev/null

done
