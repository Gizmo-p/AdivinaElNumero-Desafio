#  Adivina el Número - Desafió

Prueba técnica para crear y desarrollar un juego estilo "adivinar el número"

##  Descripción del Juego

**Descripción** El corazón de esta aplicación es un juego basado en el clásico desafío de "adivinar el número",
pero elevado a nuevos niveles de interactividad y complejidad. Los usuarios serán desafiados a
adivinar un número secreto dentro de un rango específico, con el número de intentos y la
dificultad ajustándose según el nivel seleccionado por el usuario.

###  Características Principales

- **4 Niveles de Dificultad:**
  -  **Fácil**: Números del 1 al 10 (5 intentos)
  -  **Medio**: Números del 1 al 20 (8 intentos)
  -  **Avanzado**: Números del 1 al 100 (15 intentos)
  -  **Extremo**: Números del 1 al 1000 (25 intentos)

- **Sistema de Pistas Inteligente:**
  - Muestra números que son "Mayor que" el número secreto
  - Muestra números que son "Menor que" el número secreto
  - Historial que muestra los números que fueron adivinados y el ultimo numero fallido de cada ronda (asi como se muestra en el video de ejemplo)

- **UI**
  - Tema oscuro 
  - Slider interactivo para cambiar dificultad
  - Validación de entrada en tiempo real
  - Contador de intentos restantes

- **Funcionalidades:**
  - Reinicio automático al ganar
  - Historial global de todas las sesiones
  - Validación por dificultad
  - Gestión de estado

## 🏗️ Arquitectura del Proyecto

```
lib/
├── main.dart                          # Punto de entrada de la aplicación
├── models/                            # Modelos de datos
│   ├── difficulty.dart               # Enum y configuración de dificultades
│   ├── game_state.dart              # Estado del juego y lógica
│   └── guess.dart                   # Modelo para representar cada intento
├── presentation/                     # presentación
│   ├── controllers/                 # Controladores de UI
│   │   └── input_number_controller.dart
│   ├── pages/                       # Páginas 
│   │   └── game.dart               # Página principal del juego
│   └── widgets/                    # Widgets 
│       ├── column.dart             # Columna para mostrar números
│       ├── columns_section.dart    # Sección de las tres columnas
│       ├── input_number.dart       # Widget de entrada de números
│       └── slider_difficulty.dart  # Slider para cambiar dificultad
└── usecases/                       # Casos de uso y lógica
    └── game_use_case.dart         # Lógica principal del juego
```

## 🚀 Instalación y Configuración

### Prerrequisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.7.2)
- [Dart SDK](https://dart.dev/get-dart) (incluido con Flutter)


### Pasos de Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone <https://github.com/Gizmo-p/AdivinaElNumero-Desafio.git>
   cd guess_the_number_fluttter
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Verificar la instalación de Flutter:**
   ```bash
   flutter doctor
   ```

4. **Ejecutar la aplicación:**
   ```bash
   flutter run
   ```


##  Cómo Jugar

1. **Selecciona la Dificultad:** Usa el slider en la parte inferior para elegir el nivel de dificultad
2. **Ingresa el Número:** Escribe un número en el campo de entrada
3. **Envía tu Intento:** Presiona Enter o el botón de envío
4. **Observa las Pistas:** 
   - Los números aparecerán en las columnas correspondientes
   - Verde: Números correctos de sesiones anteriores
   - Rojo: El último número fallido de la sesiones anteriores
6. **Repite:** Al acertar, el juego se reinicia automáticamente

## 🔧 Configuración de Desarrollo

### Ejecutar en Modo Debug
```bash
flutter run --debug
```
## Funcionalidades Técnicas 

### Validación de Entrada
- Validación en tiempo real
- Restricción de caracteres (solo números)
- Validación de rangos según dificultad
- Mensajes de error contextuales

---
