// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import pg.tm470.boltfund.domain.Rating;

privileged aspect Rating_Roo_JavaBean {
    
    public String Rating.getName() {
        return this.name;
    }
    
    public void Rating.setName(String name) {
        this.name = name;
    }
    
    public Double Rating.getScore() {
        return this.score;
    }
    
    public void Rating.setScore(Double score) {
        this.score = score;
    }
    
    public String Rating.getDescription() {
        return this.description;
    }
    
    public void Rating.setDescription(String description) {
        this.description = description;
    }
    
}