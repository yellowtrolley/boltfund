// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pg.tm470.boltfund.domain.PrintedGuide;

privileged aspect PrintedGuide_Roo_Jpa_Entity {
    
    declare @type: PrintedGuide: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long PrintedGuide.id;
    
    @Version
    @Column(name = "version")
    private Integer PrintedGuide.version;
    
    public Long PrintedGuide.getId() {
        return this.id;
    }
    
    public void PrintedGuide.setId(Long id) {
        this.id = id;
    }
    
    public Integer PrintedGuide.getVersion() {
        return this.version;
    }
    
    public void PrintedGuide.setVersion(Integer version) {
        this.version = version;
    }
    
}
