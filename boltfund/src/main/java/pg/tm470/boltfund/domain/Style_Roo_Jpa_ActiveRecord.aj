// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pg.tm470.boltfund.domain.Style;

privileged aspect Style_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Style.entityManager;
    
    public static final EntityManager Style.entityManager() {
        EntityManager em = new Style().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Style.countStyles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Style o", Long.class).getSingleResult();
    }
    
    public static List<Style> Style.findAllStyles() {
        return entityManager().createQuery("SELECT o FROM Style o", Style.class).getResultList();
    }
    
    public static Style Style.findStyle(Long id) {
        if (id == null) return null;
        return entityManager().find(Style.class, id);
    }
    
    public static List<Style> Style.findStyleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Style o", Style.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Style.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Style.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Style attached = Style.findStyle(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Style.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Style.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Style Style.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Style merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}