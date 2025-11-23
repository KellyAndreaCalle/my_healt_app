# My Health App 🏥

Una aplicación modular desarrollada en Flutter que incluye varias herramientas de utilidad para la salud y datos personales. Este proyecto utiliza `go_router` para la navegación y Material.

## 📱 Funcionalidades

La aplicación cuenta con un menú lateral (Drawer) y una pantalla de inicio con acceso directo a:

* **🎂 Calculadora de Edad:** Permite seleccionar una fecha de nacimiento y calcula la edad exacta en años.
* **⚖️ Calculadora de BMI (IMC):** Calcula el Índice de Masa Corporal basándose en el peso (kg) y altura (cm), indicando si el usuario tiene bajo peso, peso normal, sobrepeso u obesidad.
* **🔮 Calculadora Zodiacal:** Determina el signo del zodiaco según la fecha de nacimiento y muestra un mensaje personalizado.

## 🛠️ Requisitos Previos

Para ejecutar este proyecto necesitas:

* [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
* Un emulador de Android/iOS o un dispositivo físico conectado.
* VS Code o Android Studio.

## 🚀 Cómo ejecutar el proyecto

Sigue estos pasos para probar la aplicación en tu máquina:

1.  **Clonar el repositorio:**
    ```bash
    git clone git push -u origin main
    ```

2.  **Entrar a la carpeta del proyecto:**
    ```bash
    cd my_health_app
    ```

3.  **Instalar las dependencias:**
    Es importante ejecutar este comando para descargar librerías como `go_router`.
    ```bash
    flutter pub get
    ```

4.  **Ejecutar la aplicación:**
    ```bash
    flutter run
    ```

## 📁 Estructura del Proyecto

* `lib/main.dart`: Punto de entrada y configuración de rutas.
* `lib/src/feature/widgets`: Componentes reutilizables como el `MyHealthAppDrawer`.
* `lib/screens`: Contiene las pantallas de `HomeScreen`, `BmiScreen`, `AgeScreen` y `ZodiacScreen`.

---
Desarrollado con 💙 usando Flutter.