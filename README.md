#  Laboratorio: Descubriendo Cambios en el Sistema

###  Objetivo
Este trabajo práctico busca que el alumno **detecte y analice cambios realizados en un sistema Linux** a nivel de:
- usuarios y grupos,  
- archivos, permisos y propietarios,  
- tareas programadas (cron),  
- y configuraciones básicas del sistema.

El propósito es **ejercitar habilidades de administración** y diagnóstico usando comandos del sistema.

---

###  Contexto del laboratorio
El administrador del sistema ejecutó un script (`lab_changes.sh`) que aplicó una serie de modificaciones "misteriosas" al sistema.  
Tu tarea es descubrir **qué cambió, por qué podría ser un problema** y **cómo revertirlo**.

>  Este laboratorio se debe realizar **en una máquina virtual o entorno controlado**, **nunca en un sistema de producción**.

---

##  Archivos del repositorio

| Archivo | Descripción |
|----------|--------------|
| `lab_changes.sh` | Script que introduce los cambios en el sistema. |
| `lab_cleanup.sh` | Script que revierte los cambios. |
| `informe-alumno.md` | Plantilla que el alumno completa con sus hallazgos. |
| `README.md` | Guía del laboratorio y consignas. |

---

##  Ejecución del laboratorio

### 1. Preparación
Cloná el repositorio o descargá el zip:
```bash
git clone https://github.com/<tu-usuario>/lab-admin-descubrir-cambios.git
cd lab-admin-descubrir-cambios

| `lab_changes.sh` | Script que introduce los cambios en el sistema. |
| `lab_cleanup.sh` | Script que revierte los cambios. |
| `informe-alumno.md` | Plantilla que el alumno completa con sus hallazgos. |
| `README.md` | Guía del laboratorio y consignas. |
```
---

2. Ejecutar los cambios
```bash
sudo bash lab_changes.sh
```
Esto generará modificaciones en el sistema.
El script registrará todo en /var/log/lab_changes.log.

3. Investigar los cambios
Usá comandos de administración para descubrir qué sucedió.
Por ejemplo:


| Categoría                 | Comandos sugeridos                                                       |
| ------------------------- | ------------------------------------------------------------------------ |
| Usuarios y grupos         | `getent passwd`, `cat /etc/passwd`, `passwd -S usuario`, `ls /home`      |
| Archivos y permisos       | `find /opt/lab_exercise -ls`, `ls -la /opt/lab_exercise`, `stat archivo` |
| Cron jobs                 | `ls /etc/cron.d/`, `cat /etc/cron.d/lab_exercise`, `crontab -l`          |
| Configuración del sistema | `cat /etc/hosts`, `lsattr /opt/lab_exercise`                             |
| Otros                     | `file`, `id usuario`, `sudo -l`, `groups`, `ls -l /usr/local/bin/`       |


Completá tus observaciones en el archivo informe-alumno.md.

### Entrega
Subí a GitHub (o a la plataforma classroom) tu versión modificada del archivo informe-alumno.md, completada con tus respuestas.

### Preguntas guía
1. ¿Qué usuarios nuevos fueron creados? ¿Tienen home? ¿Están bloqueados?

2. ¿Qué archivos presentan permisos inusuales o propietarios incorrectos?

3. ¿Qué cron jobs se encuentran activos? ¿Qué acción realizan?

4. ¿Hay archivos con atributos especiales (immutable)? ¿Qué sucede si intentás borrarlos?

5. ¿Qué cambios existen en /etc/hosts?

6. ¿Qué hace el archivo /usr/local/bin/trampa?

7. ¿Qué riesgos o errores podrían generar estos cambios en un sistema real?

El script lab_cleanup.sh restaurará el sistema al estado anterior.
Podés revisar los registros en /var/log/lab_changes.log para confirmar las acciones ejecutadas.
