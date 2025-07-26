package model;

public class Book {
	
	    private int id;
	    private String title;
	    private String author;
	    private boolean isIssued;
	    private String  Name;
	    
	   
	    
		public String getName() {
			return Name;
		}
		public void setName(String name) {
			Name = name;
		}
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public boolean isIssued() {
			return isIssued;
		}
		public void setIssued(boolean isIssued) {
			this.isIssued = isIssued;
		}

	   
	}


