// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import pg.tm470.boltfund.domain.Location;

privileged aspect Location_Roo_JavaBean {
    
    public String Location.getAddress() {
        return this.address;
    }
    
    public void Location.setAddress(String address) {
        this.address = address;
    }
    
    public Float Location.getLatitude() {
        return this.latitude;
    }
    
    public void Location.setLatitude(Float latitude) {
        this.latitude = latitude;
    }
    
    public Float Location.getLongitude() {
        return this.longitude;
    }
    
    public void Location.setLongitude(Float longitude) {
        this.longitude = longitude;
    }
    
}