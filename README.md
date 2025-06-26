# 🎯 Adivina el Número - Flutter Game

Una aplicación móvil desarrollada en Flutter que implementa el clásico juego de "Adivina el Número" con múltiples niveles de dificultad y funcionalidades avanzadas.

## 📱 Descripción del Juego

**Adivina el Número** es un juego interactivo donde el jugador debe adivinar un número secreto generado aleatoriamente. El juego incluye diferentes niveles de dificultad, seguimiento de intentos, historial de jugadas y una interfaz moderna con tema oscuro.

### 🎮 Características Principales

- **4 Niveles de Dificultad:**
  - 🟢 **Fácil**: Números del 1 al 10 (5 intentos)
  - 🟡 **Medio**: Números del 1 al 20 (8 intentos)
  - 🟠 **Avanzado**: Números del 1 al 100 (15 intentos)
  - 🔴 **Extremo**: Números del 1 al 1000 (25 intentos)

- **Sistema de Pistas Inteligente:**
  - Muestra números que son "Mayor que" el número secreto
  - Muestra números que son "Menor que" el número secreto
  - Historial completo de todas las jugadas con código de colores

- **Interfaz Moderna:**
  - Tema oscuro elegante
  - Slider interactivo para cambiar dificultad
  - Validación de entrada en tiempo real
  - Contador de intentos restantes

- **Funcionalidades Avanzadas:**
  - Reinicio automático al ganar
  - Historial global de todas las sesiones
  - Validación de rangos por dificultad
  - Gestión de estado optimizada

## 🏗️ Arquitectura del Proyecto

El proyecto sigue una arquitectura limpia con separación de responsabilidades:

```
lib/
├── main.dart                          # Punto de entrada de la aplicación
├── models/                            # Modelos de datos
│   ├── difficulty.dart               # Enum y configuración de dificultades
│   ├── game_state.dart              # Estado del juego y lógica de negocio
│   └── guess.dart                   # Modelo para representar cada intento
├── presentation/                     # Capa de presentación
│   ├── controllers/                 # Controladores de UI
│   │   └── input_number_controller.dart
│   ├── pages/                       # Páginas principales
│   │   └── game.dart               # Página principal del juego
│   └── widgets/                    # Widgets reutilizables
│       ├── column.dart             # Columna para mostrar números
│       ├── columns_section.dart    # Sección de las tres columnas
│       ├── input_number.dart       # Widget de entrada de números
│       └── slider_difficulty.dart  # Slider para cambiar dificultad
└── usecases/                       # Casos de uso y lógica de negocio
    └── game_use_case.dart         # Lógica principal del juego
```

## 🚀 Instalación y Configuración

### Prerrequisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.7.2)
- [Dart SDK](https://dart.dev/get-dart) (incluido con Flutter)
- Un editor de código (VS Code, Android Studio, IntelliJ)

### Pasos de Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone <url-del-repositorio>
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

## 📋 Dependencias

### Dependencias Principales
- `flutter`: Framework de desarrollo móvil
- `cupertino_icons`: Iconos estilo iOS

### Dependencias de Desarrollo
- `flutter_test`: Framework de testing para Flutter
- `flutter_lints`: Reglas de linting recomendadas

## 🎯 Cómo Jugar

1. **Selecciona la Dificultad:** Usa el slider en la parte inferior para elegir el nivel de dificultad
2. **Ingresa tu Número:** Escribe un número en el campo de entrada
3. **Envía tu Intento:** Presiona Enter o el botón de envío
4. **Observa las Pistas:** 
   - Los números aparecerán en las columnas correspondientes
   - Verde: Números correctos de sesiones anteriores
   - Rojo: Números incorrectos de sesiones anteriores
5. **Continúa Adivinando:** Usa las pistas para encontrar el número secreto
6. **¡Gana y Repite!:** Al acertar, el juego se reinicia automáticamente

## 🔧 Configuración de Desarrollo

### Ejecutar en Modo Debug
```bash
flutter run --debug
```

### Ejecutar Tests
```bash
flutter test
```

### Construir para Producción
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 📱 Plataformas Soportadas

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🏆 Funcionalidades Técnicas Destacadas

### Gestión de Estado
- Estado inmutable con copias para cada cambio
- Separación clara entre estado de UI y lógica de negocio
- Controladores especializados para entrada de datos

### Validación de Entrada
- Validación en tiempo real
- Restricción de caracteres (solo números)
- Validación de rangos según dificultad
- Mensajes de error contextuales

### Arquitectura Limpia
- Separación de modelos, casos de uso y presentación
- Widgets reutilizables y componibles
- Controladores especializados para lógica específica

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 👨‍💻 Autor

Desarrollado con ❤️ usando Flutter

## 📞 Soporte

Si tienes alguna pregunta o problema, por favor abre un [issue](../../issues) en GitHub.

---

**¡Disfruta jugando Adivina el Número!** 🎯🎮er_fluttter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
