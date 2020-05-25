from flask import Flask, render_template, url_for, flash, redirect, request, json , make_response, session
import mysql.connector
import os
import time


mydb = mysql.connector.connect(
   host="localhost",
   user="root",
   passwd="mysql",
   database="cmms"
   )
mycursor = mydb.cursor()

app = Flask(__name__)
app.secret_key = os.urandom(24)

@app.route('/', methods = ['POST', 'GET'])
def login():
   if request.method == 'POST':
      username=request.form ['username']
      password=request.form['password']
      q1 = "SELECT username FROM employee WHERE password = %s" % password
      mycursor.execute(q1)
      result = mycursor.fetchall()
      print(result)
      print(username)
      if not result:
         return render_template('sign_in.html')
      else:
         if result[0][0] == username:
            print("Signed In")
            return redirect("/wo")
         else:
            return render_template('sign_in.html')   
   else:  
      return render_template('sign_in.html')

@app.route('/wo',methods = ['POST', 'GET'])
def wo():
   if request.method == 'POST':
      id=request.form ['id']
      year = request.form['date']
      mycursor.execute("UPDATE wo SET state = 'done' WHERE id = %s" % id)
      mydb.commit()
      sql = "UPDATE wo SET actualDate = %s WHERE id = %s" 
      val = (year,id)
      mycursor.execute(sql, val)
      mydb.commit()

      q1 = "SELECT type FROM wo WHERE id = %s" % id
      mycursor.execute(q1)
      result = mycursor.fetchall()
      print(result)
      if not result:
         return render_template('wo.html')
      else:
         if result[0][0] == 'ppm':
            print("ppm")
            return redirect("/ppm.report")
         elif result[0][0] == 'incpection':
            print("inspection")
            return redirect("/inspection.report")
         elif result[0][0] == 'repair':
            print("repair")
            return redirect("/repair.report")
         else:
            return render_template('work_order.html')   

   else:
      q = "SELECT wo.id, type, description, plannedDate, priority, employee.employee_name, equipment.equipment_name, equipment.department, equipment.serial_number FROM wo \
            JOIN employee ON employee.id = wo.assigned_technician_id JOIN equipment ON equipment.id = wo.equipment_id WHERE state = 'active'"
      mycursor.execute(q)
      row_headers=[x[0] for x in mycursor.description] #this will extract row headers
      myresult = mycursor.fetchall()
      data={
         'message':"data retrieved",
         'rec':myresult,   
         'header':row_headers
      }
      return render_template('work_order.html',data=data)

@app.route('/completed.wo',methods = ['POST', 'GET'])
def completed_wo():
   if request.method == 'POST':
      return redirect('/wo')      
   else:
      q = "SELECT wo.id, type, description, plannedDate, actualDate, priority, employee.employee_name, equipment.equipment_name, equipment.department, equipment.serial_number FROM wo \
            JOIN employee ON employee.id = wo.assigned_technician_id JOIN equipment ON equipment.id = wo.equipment_id WHERE state = 'done'"
      mycursor.execute(q)
      row_headers=[x[0] for x in mycursor.description] #this will extract row headers
      myresult = mycursor.fetchall()
      data={
         'message':"data retrieved",
         'rec':myresult,   
         'header':row_headers
      }
      return render_template('completed_wo.html',data=data)

@app.route('/equipment',methods = ['POST', 'GET'])
def equipment():
   if request.method == 'POST':
      return render_template('sign_in.html')
   else:
      mycursor.execute("SELECT * FROM equipment")
      row_headers=[x[0] for x in mycursor.description] #this will extract row headers
      myresult = mycursor.fetchall()
      data={
         'message':"data retrieved",
         'rec':myresult,   
         'header':row_headers
      }
      return render_template('equipment.html',data=data)

@app.route('/ppm',methods = ['POST', 'GET'])
def ppm():
   if request.method == 'POST':
      return render_template('sign_in.html')
   else:
      q = "SELECT ppm.id, wo.actualDate, employee.employee_name, equipment.equipment_name, equipment.department, equipment.serial_number, chasis_housing, casters_brakes, AC_plug, \
           line_cord, circuitBreaker_fuse, tubes_hoses_bulbs, labeling, transducer, control_switch FROM ppm JOIN wo ON ppm.wo_id = \
           wo.id JOIN employee ON wo.assigned_technician_id = employee.id JOIN equipment ON wo.equipment_id = equipment.id"
      mycursor.execute(q)
      row_headers=[x[0] for x in mycursor.description] #this will extract row headers
      myresult = mycursor.fetchall()
      data={
         'message':"data retrieved",
         'rec':myresult,   
         'header':row_headers
      }
      return render_template('ppm.html',data=data)

@app.route('/inspection',methods = ['POST', 'GET'])
def inspection():
   if request.method == 'POST':
      return render_template('sign_in.html')
   else:
      q = "SELECT incpection.id, wo.actualDate, employee.employee_name, equipment.equipment_name, equipment.department, equipment.serial_number, physicalCondition, \
           batteryWells_batteries, cablePort, functionality FROM incpection JOIN wo ON incpection.wo_id = \
           wo.id JOIN employee ON wo.assigned_technician_id = employee.id JOIN equipment ON wo.equipment_id = equipment.id"
      mycursor.execute(q)
      row_headers=[x[0] for x in mycursor.description] #this will extract row headers
      myresult = mycursor.fetchall()
      data={
         'message':"data retrieved",
         'rec':myresult,   
         'header':row_headers
      }
      return render_template('inspection.html',data=data)

@app.route('/repair',methods = ['POST', 'GET'])
def repair():
   if request.method == 'POST':
      return render_template('sign_in.html')
   else:
      q = "SELECT repair.id, wo.actualDate, employee.employee_name, equipment.equipment_name, equipment.department, equipment.serial_number, malfunction, \
      status FROM repair JOIN wo ON repair.wo_id = wo.id JOIN employee ON wo.assigned_technician_id = \
      employee.id JOIN equipment ON wo.equipment_id = equipment.id"
      mycursor.execute(q)
      row_headers=[x[0] for x in mycursor.description] #this will extract row headers
      myresult = mycursor.fetchall()
      data={
         'message':"data retrieved",
         'rec':myresult,   
         'header':row_headers
      }
      return render_template('repair.html',data=data)

@app.route('/create.wo', methods = ['POST', 'GET'])
def create_wo():
   if request.method == 'POST': ##check if there is post data
      wo_type = request.form['type']
      description = request.form['description']
      year = request.form['date']
      priority = request.form['priority']
      tech_id = request.form['tech_id']
      equip_id = request.form['equip_id']

      sql = "INSERT INTO wo (type, description, plannedDate, priority, assigned_technician_id, equipment_id) VALUES (%s, %s, %s, %s, %s, %s)"
      val = (wo_type, description, year, priority, tech_id, equip_id)
      mycursor.execute(sql, val)
      mydb.commit()
      return redirect('/wo')
   else:
      return render_template('signUp_wo.html')

@app.route('/ppm.report', methods = ['POST', 'GET'])
def ppm_report():
   if request.method == 'POST': ##check if there is post data
      chasing = request.form['Chasing']
      casters = request.form['Casters']
      AcPlug = request.form['AcPlug']
      lineCord = request.form['lineCord']
      circuit = request.form['Circuit']
      tubes = request.form['Tubes']
      labeling = request.form['Labeling']
      transducers = request.form['Transducers']
      controlSwitches = request.form['ControlSwitches']
      id = request.form['id']

      sql = "INSERT INTO ppm ( chasis_housing, casters_brakes, AC_plug, line_cord, circuitBreaker_fuse, \
         tubes_hoses_bulbs, labeling, transducer, control_switch, wo_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
      val = (chasing, casters, AcPlug, lineCord, circuit, tubes, labeling, transducers, controlSwitches, id)
      mycursor.execute(sql, val)
      mydb.commit()
      return redirect('/ppm')
   else:
      return render_template('signUp_ppm.html')

@app.route('/inspection.report', methods = ['POST', 'GET'])
def inspection_report():
   if request.method == 'POST': ##check if there is post data
      physicalCondition = request.form['PhysicalCondition']
      battery = request.form['Battery']
      cable = request.form['Cable']
      functionality = request.form['Functionality']
      id = request.form['id']

      sql = "INSERT INTO incpection ( physicalCondition, batteryWells_batteries, cablePort, functionality, wo_id ) VALUES (%s, %s, %s, %s, %s)"
      val = (physicalCondition, battery, cable, functionality, id)
      mycursor.execute(sql, val)
      mydb.commit()
      return redirect('/inspection')
   else:
      return render_template('signUp_inspection.html')

@app.route('/repair.report', methods = ['POST', 'GET'])
def repair_report():
   if request.method == 'POST': ##check if there is post data
      malfunction = request.form['Malfunction']
      status = request.form['Status']
      id = request.form['id']

      sql = "INSERT INTO repair ( malfunction, status, wo_id ) VALUES (%s, %s, %s)"
      val = (malfunction, status, id)
      mycursor.execute(sql, val)
      mydb.commit()
      return redirect('/repair')
   else:
      return render_template('signUp_repair.html')

if __name__ == '__main__':
   app.run(debug=True)