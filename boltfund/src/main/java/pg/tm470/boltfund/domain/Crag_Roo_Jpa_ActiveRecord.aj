// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pg.tm470.boltfund.domain.Crag;

privileged aspect Crag_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Crag.entityManager;
    
    public static final EntityManager Crag.entityManager() {
        EntityManager em = new Crag().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Crag.countCrags() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Crag o", Long.class).getSingleResult();
    }
    
    public static List<Crag> Crag.findAllCrags() {
        return entityManager().createQuery("SELECT o FROM Crag o", Crag.class).getResultList();
    }
    
    public static Crag Crag.findCrag(Long id) {
        if (id == null) return null;
        return entityManager().find(Crag.class, id);
    }
    
    public static List<Crag> Crag.findCragEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Crag o", Crag.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Crag.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Crag.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Crag attached = Crag.findCrag(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Crag.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Crag.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Crag Crag.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Crag merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
