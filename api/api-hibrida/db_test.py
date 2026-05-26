import pymysql

conn = pymysql.connect(host='127.0.0.1', port=3307, user='root', password='12345678', database='hospital_matricula')
cursor = conn.cursor()

try:
    cursor.execute("CALL sp_poblar_pacientes(10, 'H', 18, 60, 'Vivo', 'Diabetico', 'Adultez')")
    error_result = cursor.fetchall()
    print("SP Result:", error_result)
    conn.commit()
    cursor.execute('SELECT COUNT(*) FROM tbb_personas')
    print('TOTAL PERSONAS:', cursor.fetchone()[0])
except Exception as e:
    print("Exception:", e)
finally:
    conn.close()
