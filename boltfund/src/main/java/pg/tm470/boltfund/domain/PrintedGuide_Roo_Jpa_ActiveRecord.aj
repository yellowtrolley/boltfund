// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pg.tm470.boltfund.domain.PrintedGuide;

privileged aspect PrintedGuide_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PrintedGuide.entityManager;
    
    public static final EntityManager PrintedGuide.entityManager() {
        EntityManager em = new PrintedGuide().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PrintedGuide.countPrintedGuides() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PrintedGuide o", Long.class).getSingleResult();
    }
    
    public static List<PrintedGuide> PrintedGuide.findAllPrintedGuides() {
        return entityManager().createQuery("SELECT o FROM PrintedGuide o", PrintedGuide.class).getResultList();
    }
    
    public static PrintedGuide PrintedGuide.findPrintedGuide(Long id) {
        if (id == null) return null;
        return entityManager().find(PrintedGuide.class, id);
    }
    
    public static List<PrintedGuide> PrintedGuide.findPrintedGuideEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PrintedGuide o", PrintedGuide.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PrintedGuide.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PrintedGuide.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PrintedGuide attached = PrintedGuide.findPrintedGuide(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PrintedGuide.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PrintedGuide.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PrintedGuide PrintedGuide.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PrintedGuide merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
