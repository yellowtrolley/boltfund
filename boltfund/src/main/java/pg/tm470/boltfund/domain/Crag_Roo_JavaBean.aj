// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.Set;
import pg.tm470.boltfund.domain.Bolter;
import pg.tm470.boltfund.domain.Crag;
import pg.tm470.boltfund.domain.Infos;
import pg.tm470.boltfund.domain.Location;
import pg.tm470.boltfund.domain.PrintedGuide;
import pg.tm470.boltfund.domain.Rating;
import pg.tm470.boltfund.domain.Season;
import pg.tm470.boltfund.domain.Sector;

privileged aspect Crag_Roo_JavaBean {
    
    public String Crag.getName() {
        return this.name;
    }
    
    public void Crag.setName(String name) {
        this.name = name;
    }
    
    public String Crag.getDescription() {
        return this.description;
    }
    
    public void Crag.setDescription(String description) {
        this.description = description;
    }
    
    public String Crag.getNotes() {
        return this.notes;
    }
    
    public void Crag.setNotes(String notes) {
        this.notes = notes;
    }
    
    public String Crag.getAccess() {
        return this.access;
    }
    
    public void Crag.setAccess(String access) {
        this.access = access;
    }
    
    public String Crag.getRockType() {
        return this.rockType;
    }
    
    public void Crag.setRockType(String rockType) {
        this.rockType = rockType;
    }
    
    public Integer Crag.getHeight() {
        return this.height;
    }
    
    public void Crag.setHeight(Integer height) {
        this.height = height;
    }
    
    public Rating Crag.getRating() {
        return this.rating;
    }
    
    public void Crag.setRating(Rating rating) {
        this.rating = rating;
    }
    
    public Set<Season> Crag.getSeason() {
        return this.season;
    }
    
    public void Crag.setSeason(Set<Season> season) {
        this.season = season;
    }
    
    public Set<PrintedGuide> Crag.getGuides() {
        return this.guides;
    }
    
    public void Crag.setGuides(Set<PrintedGuide> guides) {
        this.guides = guides;
    }
    
    public Set<Infos> Crag.getInfos() {
        return this.infos;
    }
    
    public void Crag.setInfos(Set<Infos> infos) {
        this.infos = infos;
    }
    
    public Set<Sector> Crag.getSectors() {
        return this.sectors;
    }
    
    public void Crag.setSectors(Set<Sector> sectors) {
        this.sectors = sectors;
    }
    
    public Set<Bolter> Crag.getEditors() {
        return this.editors;
    }
    
    public void Crag.setEditors(Set<Bolter> editors) {
        this.editors = editors;
    }
    
    public Location Crag.getLocation() {
        return this.location;
    }
    
    public void Crag.setLocation(Location location) {
        this.location = location;
    }
    
}
