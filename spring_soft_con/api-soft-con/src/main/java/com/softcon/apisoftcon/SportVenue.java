package com.softcon.apisoftcon;

public class SportVenue {
    private  long id;
    private String name;
    private String location;

    public SportVenue() {
    }

    public SportVenue( long id, String name, String location ) {
        this.id = id;
        this.name = name;
        this.location = location;
       
    }

    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
