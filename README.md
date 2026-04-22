
# 📈 Scraper BCV – Tasas de Cambio

Este proyecto implementa un **scraper defensivo** para obtener las tasas de cambio publicadas por el Banco Central de Venezuela (BCV), con **validación de datos, logging estructurado y tolerancia a cambios en el HTML**.

Incluye pruebas automatizadas con `pytest` que simulan escenarios reales y cambios en la estructura del sitio, asegurando que el scraper siga funcionando y registre advertencias cuando falten datos.

---

## 📂 Estructura del proyecto

```
scraper-bcv/
.
├── LICENSE
├── pyproject.toml
├── README.md
├── requirements.txt
├── requirements-dev.txt
├── setup.cfg
├── src/
│   └── scraper_bcv/       # Paquete principal
│       ├── __init__.py
│       ├── __main__.py    # Punto de entrada: python -m scraper_bcv
│       ├── cli.py         # Módulo CLI para el scraper
│       ├── bcv_client.py  # Lógica principal del scraper
├── tests/                 # Pruebas unitarias y fixtures
│   ├── fixtures/
│   └── test_bcv_client.py
```

---

## 🚀 Instalación

### Desde GitHub
```bash
pip install git+https://github.com/fquivera/scraper-bcv.git
```

### Desde PyPI
```bash
pip install scraper-bcv
```

---

## 🛠 Uso como script

Una vez instalado, puedes ejecutarlo directamente:

```bash
python -m scraper_bcv
```

Opciones disponibles:
```bash
python -m scraper_bcv -m USD --log-level DEBUG --log-file logs/mi_log.log
```

---

## 📚 Uso como librería

```python
from scraper_bcv import BCVClient

client = BCVClient(log_file='logs/mi_app.log')
print(client.get_tasas())          # Todas las monedas
print(client.get_tasas('USD'))     # Solo USD
```

---

## 🧪 Pruebas

```bash
pytest -v
```

Incluye pruebas con HTML real y HTML modificado para validar resiliencia y logging.

---

## 📜 Logging

- Formato: `YYYY-MM-DD HH:MM:SS NIVEL Mensaje`
- Ejemplo:
  ```
  2025-09-04 18:00:00 INFO USD: 36,5000 Bs.S - Fecha: 04/09/2025
  ```

---

## 🔒 Diseño defensivo

- Sigue funcionando aunque falte una moneda.
- Registra advertencias en lugar de fallar silenciosamente.
- Valida y normaliza datos antes de procesarlos.
- Modular y testeable.

---

## ⚖️ Aviso Legal

Este software se proporciona únicamente con fines **educativos y técnicos**.
No constituye ni reemplaza la publicación oficial de tasas del Banco Central de Venezuela (BCV) ni de ninguna otra autoridad.
Los datos obtenidos son procesados automáticamente desde fuentes públicas y pueden no reflejar información actualizada, exacta o completa.

El autor **no asume responsabilidad** por el uso que terceros hagan de este software o de los datos que genere.
Es responsabilidad exclusiva del usuario verificar la exactitud y vigencia de la información antes de tomar decisiones basadas en ella, así como cumplir con la normativa legal vigente en su país.

Para información oficial sobre tasas de cambio, consulte siempre el portal del BCV:
[https://www.bcv.org.ve/](https://www.bcv.org.ve/)

---

## 📄 Licencia

Distribuido bajo la licencia MIT con aviso legal adicional.
Consulta el archivo [LICENSE](.LICENSE) para más detalles.

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas mediante **issues** o **pull requests**.

---

## 📬 Contacto

Desarrollado por Francisco Antonio Quivera González.
Abre un issue en el repositorio para dudas o sugerencias.

---
