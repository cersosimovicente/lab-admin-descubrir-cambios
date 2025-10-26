#  Informe del Laboratorio: Descubriendo Cambios en el Sistema

**Alumno:**  
**Fecha:**  
**Sistema Operativo:**  

---

##  Tareas de análisis

### 1. Usuarios
- ¿Qué usuarios nuevos aparecen?
- ¿Tienen directorio home?
- ¿Cuál está bloqueado?

---

### 2. Archivos y permisos
- Identificá archivos con permisos inusuales o propietarios incorrectos.  
  Ejemplo de comandos usados:  
  ```bash
  find /opt/lab_exercise -ls
  ls -la /opt/lab_exercise
  ```
### 3. Cron jobs
- ¿Qué cron jobs se encuentran activos?
- ¿Qué acción realizan?
- ¿Dónde dejan rastros?
  
### 4. Configuración del sistema
- ¿Qué cambios se observan en /etc/hosts?
- ¿Qué efecto tendrían sobre la resolución de nombres?

### 5. Atributos especiales
- ¿Qué archivo tiene atributo immutable?
- ¿Qué sucede si intentás modificarlo o eliminarlo?

### 6. Archivos de sistema
- ¿Qué hace /usr/local/bin/trampa?
- ¿Qué archivos genera?

### 7. Conclusiones
- ¿Qué impacto tendrían estos cambios en un sistema real?
- ¿Qué medidas preventivas o de monitoreo propondrías?

