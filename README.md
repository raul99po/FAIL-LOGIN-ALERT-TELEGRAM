🛡️ SSH Fail Login Alert via Telegram
Este script de Bash proporciona una capa de seguridad adicional para servidores Linux mediante la monitorización en tiempo real de intentos fallidos de inicio de sesión por SSH. Cuando se detecta un fallo, el script extrae automáticamente la IP, el usuario y la ubicación geográfica del atacante, enviando una alerta instantánea a un bot de Telegram.

✨ Características Principales
🔍 Monitorización Proactiva: Utiliza tail -F para analizar /var/log/auth.log sin consumir apenas recursos.

🧠 Análisis Inteligente: Diferencia entre intentos con contraseña incorrecta (usuario existente) y usuarios inexistentes (ataques de fuerza bruta comunes).

🌍 Geolocalización: Integra una consulta rápida a la API de ip-api para identificar el código de país del intruso.

📱 Alertas con Formato: Notificaciones claras en Telegram utilizando Markdown para mejorar la legibilidad del operador.

🛠️ Requisitos Técnicos
Sistema operativo Linux (Debian/Ubuntu recomendado).

Acceso de lectura a /var/log/auth.log (generalmente requiere privilegios de sudo).

Dependencias básicas: curl, awk, grep.

Un bot de Telegram configurado.

🚀 Instalación y Configuración
Clonar el repositorio:

Bash
git clone https://github.com/raul99po/FAIL-LOGIN-ALERT-TELEGRAM.git
cd FAIL-LOGIN-ALERT-TELEGRAM
Configurar credenciales:
Edita el script e introduce tu TOKEN y CHAT_ID obtenidos de @BotFather.

Asignar permisos de ejecución:

Bash
chmod +x fail-login-notifier.sh
Ejecución en segundo plano:
Para asegurar que la monitorización sea constante (24x7), se recomienda ejecutarlo como un servicio de systemd o mediante nohup:

Bash
sudo nohup ./fail-login-notifier.sh &
📋 Ejemplo de Alerta
Cuando el script detecta un intruso, recibirás un mensaje como este:

🕵️ INTRUSO DETECTADO 🕵️

👤 Usuario: admin
🖥 IP: 192.168.1.45 (ES)
🔍 Tipo: ❌ Usuario Inexistente

Monitorizando en tiempo real...

🔐 Seguridad y Buenas Prácticas
[!IMPORTANT]
Recordatorio de Seguridad: Para entornos de producción, es altamente recomendable no dejar las credenciales hardcodeadas en el script. Se sugiere el uso de un archivo .env o variables de entorno del sistema para proteger el BOT_TOKEN y el CHAT_ID.
