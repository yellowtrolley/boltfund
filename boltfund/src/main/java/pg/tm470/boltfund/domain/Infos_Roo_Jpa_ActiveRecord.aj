// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pg.tm470.boltfund.domain.Infos;

privileged aspect Infos_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Infos.entityManager;
    
    public static final EntityManager Infos.entityManager() {
        EntityManager em = new Infos() {
        }.entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Infos.countInfoses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Infos o", Long.class).getSingleResult();
    }
    
    public static List<Infos> Infos.findAllInfoses() {
        return entityManager().createQuery("SELECT o FROM Infos o", Infos.class).getResultList();
    }
    
    public static Infos Infos.findInfos(Long id) {
        if (id == null) return null;
        return entityManager().find(Infos.class, id);
    }
    
    public static List<Infos> Infos.findInfosEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Infos o", Infos.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Infos.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Infos.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Infos attached = Infos.findInfos(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Infos.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Infos.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Infos Infos.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Infos merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}