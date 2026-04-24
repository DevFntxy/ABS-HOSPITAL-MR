import subprocess
from datetime import datetime
import logging

# =============================
# 🔹 RESPALDO MONGODB
# =============================
def backup_mongo(db_name: str, collection: str):
    fecha = datetime.now().strftime("%Y%m%d_%H%M%S")
    carpeta = f"backup_mongo_{fecha}"

    comando = [
        "mongodump",
        "--db", db_name,
        "--collection", collection,
        "--out", carpeta
    ]

    try:
        subprocess.run(comando, check=True)
        logging.info(f"✅ Backup MongoDB creado: {carpeta}")
    except Exception as e:
        logging.error(f"❌ Error backup MongoDB: {e}")


# =============================
# 🔹 RESPALDO MYSQL
# =============================
def backup_mysql(user: str, password: str, db_name: str):
    fecha = datetime.now().strftime("%Y%m%d_%H%M%S")
    archivo = f"backup_mysql_{fecha}.sql"

    comando = f"mysqldump -u {user} -p{password} {db_name} > {archivo}"

    try:
        subprocess.run(comando, shell=True, check=True)
        logging.info(f"✅ Backup MySQL creado: {archivo}")
    except Exception as e:
        logging.error(f"❌ Error backup MySQL: {e}")