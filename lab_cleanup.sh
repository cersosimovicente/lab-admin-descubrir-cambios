#!/usr/bin/env bash
# lab_cleanup.sh
# Reversión de los cambios hechos por lab_changes.sh
set -euo pipefail

LOG=/var/log/lab_changes.log
LABDIR=/opt/lab_exercise
CRONFILE=/etc/cron.d/lab_exercise
HOSTS_MARK="# LAB_EXERCISE_ENTRIES"

echo "=== INICIO lab_cleanup.sh: $(date -Iseconds) ===" | tee -a "$LOG"

# Eliminar cron
[ -f "$CRONFILE" ] && rm -f "$CRONFILE"

# Restaurar hosts
if [ -f /etc/hosts.bak.lab ]; then
  mv /etc/hosts.bak.lab /etc/hosts
else
  awk -v mark="$HOSTS_MARK" 'BEGIN{del=0} {if ($0==mark){del=!del;next} if(!del)print}' /etc/hosts > /etc/hosts.tmp && mv /etc/hosts.tmp /etc/hosts
fi

# Quitar atributo immutable
if command -v chattr >/dev/null 2>&1 && [ -f "$LABDIR/immutable_note.txt" ]; then
  chattr -i "$LABDIR/immutable_note.txt" || true
fi

# Borrar archivos y usuarios
rm -rf "$LABDIR" /usr/local/bin/trampa /var/tmp/lab_cron_marker.txt /tmp/pista_trampa.txt
for u in alumno1 alumno2 nohome_user; do
  if id "$u" >/dev/null 2>&1; then
    userdel -r "$u" 2>/dev/null || userdel "$u" 2>/dev/null || true
  fi
done

echo "=== FIN lab_cleanup.sh ===" | tee -a "$LOG"

