class Student
#this gets the input
<<<<<<< HEAD
attr_accessor :name, :grade
  attr_reader :id
=======
attr_accessor :name, :grade, :id

>>>>>>> ac5fab401286dbf871b6eb5a493582c2d5f6722c
	 def initialize(name, grade, id=nil)
  @id = id
  @name = name
	 @grade = grade
	end
<<<<<<< HEAD
	
=======
	def id
	  @id = id
	end
>>>>>>> ac5fab401286dbf871b6eb5a493582c2d5f6722c
	#this creats a save place. id is PRIMARY
	def self.create_table
	sql =  <<-SQL 
	CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        grade INTEGER)
 SQL
	 DB[:conn].execute(sql) 
	 end
  #delete saved stuff
def self.drop_table
    sql = <<-SQL
      DROP TABLE students
    SQL

    DB[:conn].execute(sql)  
  end
#saves
  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
        VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.grade)
   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end




  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end



end
	