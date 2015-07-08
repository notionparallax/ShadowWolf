from model import Model
import view
from controller import Beowulf
import os

conn_string = "DRIVER={FreeTDS};SERVER=%s;UID=%s;PWD=%s;DATABASE=%s;Port=1433" % \
        (os.environ['MSSQL_SERVER']
        ,os.environ['MSSQL_UID']
        ,os.environ['MSSQL_PWD']
        ,os.environ['MSSQL_DB']
        ) 
model = Model(conn_string)

beowulf = Beowulf(model, view)
beowulf.run()
