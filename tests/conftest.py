# tests/conftest.py
import sys
from pathlib import Path

# Añade la ruta del directorio raíz del proyecto al sys.path
# Esto permite que los tests importen módulos desde el paquete principal.
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))