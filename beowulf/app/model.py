import pypyodbc

class Model(object):
    def __init__(self, conn_string=None):
        self.conn_string = conn_string or "Driver=SQLITEY;Database=/ShadowWolf/beowulf/test.db"

    def conn(self):
        return pypyodbc.connect(self.conn_string)

    def execute(self, query, args=[], save_result=True):
        results = None
        with self.conn() as conn:
            cursor = conn.cursor()
            cursor.execute(query,args)
            if save_result: results = cursor.fetchall()
        return results

    def getlogins(self, project_number):
        return self.execute("""
            SELECT resourceid, SUM(actualhours)
            FROM ProjResourceDimension prd
                JOIN ProjFact pf on prd.SYSResourceID = pf.SYSResourceID
                JOIN ProjProjectOutlineDimension ppod on pf.SYSProjectOutlineID = ppod.SYSProjectOutlineID
            WHERE projectcode = ?
            AND actualhours <> 0
            GROUP BY resourceid
            """, [project_number])

    def getprojectnumbers(self, login):
        #return self.execute("""
        #    SELECT projectcode, SUM(actualhours)
        #    FROM ProjResourceDimension prd
        #        JOIN ProjFact pf on prd.SYSResourceID = pf.SYSResourceID
        #        JOIN ProjProjectOutlineDimension ppod on pf.SYSProjectOutlineID = ppod.SYSProjectOutlineID
        #    WHERE resourceid = ?
        #    AND actualhours <> 0
        #    GROUP BY projectcode
        #    """, [login])
        return self.execute("""
            SELECT projectcode, SUM(actualhours)
            FROM ProjResourceDimension prd
                JOIN ProjFact pf on prd.SYSResourceID = pf.SYSResourceID
                JOIN ProjProjectOutlineDimension ppod on pf.SYSProjectOutlineID = ppod.SYSProjectOutlineID
            WHERE resourceid = ?
            AND actualhours <> 0
            GROUP BY projectcode
            ORDER BY projectcode
            """, [login])
