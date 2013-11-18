// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pg.tm470.boltfund.domain.PriceRange;

privileged aspect PriceRange_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PriceRange.entityManager;
    
    public static final EntityManager PriceRange.entityManager() {
        EntityManager em = new PriceRange().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PriceRange.countPriceRanges() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PriceRange o", Long.class).getSingleResult();
    }
    
    public static List<PriceRange> PriceRange.findAllPriceRanges() {
        return entityManager().createQuery("SELECT o FROM PriceRange o", PriceRange.class).getResultList();
    }
    
    public static PriceRange PriceRange.findPriceRange(Long id) {
        if (id == null) return null;
        return entityManager().find(PriceRange.class, id);
    }
    
    public static List<PriceRange> PriceRange.findPriceRangeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PriceRange o", PriceRange.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PriceRange.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PriceRange.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PriceRange attached = PriceRange.findPriceRange(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PriceRange.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PriceRange.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PriceRange PriceRange.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PriceRange merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
