package model;

public class Student {
	private int id ;
    private String enrollment ;
    private String name;
    private int year;
    private int semester;
    private String dept;
    private String course;
    private String email;
    private long mob;
    private String gender;


    // Getters and setters

    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
    
    public String getEnrollment() {
        return enrollment;
    }
   
	public void setEnrollment(String enrollment) {
        this.enrollment= enrollment;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }

    public int getSemester() {
        return semester;
    }
    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String getDept() {
        return dept;
    }
    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getCourse() {
        return course;
    }
    public void setCourse(String course) {
        this.course = course;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public long getMob() {
        return mob;
    }
    public void setMob(long mob) {
        this.mob = mob;
    }

    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
	
}
