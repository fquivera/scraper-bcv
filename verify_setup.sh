#!/bin/bash
# verify_setup.sh - Verificar que el entorno está correctamente configurado

echo "🔍 Verificando configuración del proyecto..."

# Colores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar entorno virtual
if [[ -n "$VIRTUAL_ENV" ]]; then
    echo -e "${GREEN}✅ Entorno virtual activo: $VIRTUAL_ENV${NC}"
else
    echo -e "${RED}❌ Entorno virtual no activo. Ejecuta: source venv/bin/activate${NC}"
    exit 1
fi

# Verificar instalación en modo desarrollo
if pip show scraper-bcv &> /dev/null; then
    echo -e "${GREEN}✅ Paquete instalado en modo desarrollo${NC}"
else
    echo -e "${YELLOW}⚠️  Paquete no instalado en modo desarrollo. Ejecuta: pip install -e .${NC}"
fi

# Verificar import del módulo
if python -c "from scraper_bcv import BCVClient" 2>/dev/null; then
    echo -e "${GREEN}✅ Módulo scraper_bcv importable correctamente${NC}"
else
    echo -e "${RED}❌ Error al importar scraper_bcv${NC}"
fi

# Verificar ejecución del módulo
if python -m scraper_bcv --help &>/dev/null; then
    echo -e "${GREEN}✅ Módulo ejecutable correctamente${NC}"
else
    echo -e "${YELLOW}⚠️  Error al ejecutar módulo (puede ser normal si requiere argumentos)${NC}"
fi

# Verificar pytest
if pytest --version &>/dev/null; then
    echo -e "${GREEN}✅ Pytest instalado correctamente${NC}"
    echo "   Ejecutando tests rápidamente..."
    pytest tests/ -v --tb=line 2>/dev/null && echo -e "${GREEN}   Tests ejecutados correctamente${NC}" || echo -e "${RED}   Error en los tests${NC}"
else
    echo -e "${RED}❌ Pytest no instalado${NC}"
fi

# Verificar pre-commit
if pre-commit --version &>/dev/null; then
    echo -e "${GREEN}✅ Pre-commit instalado${NC}"
    if [ -f ".git/hooks/pre-commit" ]; then
        echo -e "${GREEN}   Hooks de pre-commit instalados${NC}"
    else
        echo -e "${YELLOW}   ⚠️  Hooks no instalados. Ejecuta: pre-commit install${NC}"
    fi
else
    echo -e "${RED}❌ Pre-commit no instalado${NC}"
fi

echo ""
echo "📋 Resumen de acciones pendientes:"
echo "--------------------------------"
if ! pip show scraper-bcv &> /dev/null; then
    echo "• Instalar en modo desarrollo: pip install -e ."
fi
if [ ! -f ".git/hooks/pre-commit" ]; then
    echo "• Instalar hooks de pre-commit: pre-commit install && pre-commit install --hook-type commit-msg"
fi
