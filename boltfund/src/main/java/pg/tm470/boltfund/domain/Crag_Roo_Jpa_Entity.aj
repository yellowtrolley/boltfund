// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pg.tm470.boltfund.domain.Crag;

privileged aspect Crag_Roo_Jpa_Entity {
    
    declare @type: Crag: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Crag.id;
    
    @Version
    @Column(name = "version")
    private Integer Crag.version;
    
    public Long Crag.getId() {
        return this.id;
    }
    
    public void Crag.setId(Long id) {
        this.id = id;
    }
    
    public Integer Crag.getVersion() {
        return this.version;
    }
    
    public void Crag.setVersion(Integer version) {
        this.version = version;
    }
    
}
