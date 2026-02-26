# 🛡️ SSH Fail Login Alert via Telegram

Este script de Bash proporciona una capa de seguridad adicional para servidores Linux mediante la monitorización en tiempo real de intentos fallidos de inicio de sesión por SSH. Cuando se detecta un fallo, el script extrae automáticamente la IP, el usuario y la ubicación geográfica del atacante, enviando una alerta instantánea a un bot de Telegram.

![GitHub](https://img.shields.io/badge/Version-1.0-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Características Principales

🔍 Monitorización Proactiva: Utiliza tail -F para analizar /var/log/auth.log sin consumir apenas recursos.
🧠 Análisis Inteligente: Diferencia entre intentos con contraseña incorrecta (usuario existente) y usuarios inexistentes (ataques de fuerza bruta comunes).
🌍 Geolocalización: Integra una consulta rápida a la API de ip-api para identificar el código de país del intruso.
📱 Alertas con Formato: Notificaciones claras en Telegram utilizando Markdown para mejorar la legibilidad del operador.

## 📦 Requisitos

- Sistema operativo Linux (Debian/Ubuntu recomendado).
- Acceso de lectura a /var/log/auth.log (generalmente requiere privilegios de sudo).
- Dependencias básicas: curl, awk, grep.
- Un bot de Telegram configurado.

## 🚀 Instalación

1. **Clona el repositorio**:
   ```bash
   git clone https://github.com/raul99po/FAIL-LOGIN-ALERT-TELEGRAM.git
   cd FAIL-LOGIN-ALERT-TELEGRAM
   
2. **Edita el script con tu BOT_TOKEN y CHAT_ID**:
   ```bash
   nano telegram_failed_login.sh

4. **Dale permisos de ejecución**:
   ```bash
   chmod +x telegram_failed_login.sh
   
6. **Ejecución en segundo plano:
   Para asegurar que la monitorización sea constante (24x7), se recomienda ejecutarlo como un servicio de systemd o mediante nohup:
   ```bash
   sudo nohup ./telegram_failed_login.sh &

# 🛠️ Cómo obtener tu BOT_TOKEN y CHAT_ID
1. **Crear un bot con @BotFather**
  Habla con @BotFather
  Envía /newbot y sigue los pasos.
  Guarda el TOKEN que te da.

2. **Obtener tu CHAT_ID**
Habla con tu bot (envía cualquier mensaje)
Luego ve a:
https://api.telegram.org/bot<BOT_TOKEN>/getUpdates
Busca tu id en "chat":{"id":XXXXXXXX}

# 📋 Ejemplo de Alerta
Cuando el script detecta un intruso, recibirás un mensaje como este:

🕵️ INTRUSO DETECTADO 🕵️

👤 Usuario: admin
🖥 IP: 192.168.1.45 (ES)
🔍 Tipo: ❌ Usuario Inexistente

Monitorizando en tiempo real...

## 🔐 Seguridad
No publiques tu BOT_TOKEN ni CHAT_ID en GitHub. Usa variables de entorno o un archivo .env si vas a subirlo públicamente.
