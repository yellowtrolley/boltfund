// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pg.tm470.boltfund.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pg.tm470.boltfund.domain.Route;

privileged aspect Route_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Route.entityManager;
    
    public static final EntityManager Route.entityManager() {
        EntityManager em = new Route().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Route.countRoutes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Route o", Long.class).getSingleResult();
    }
    
    public static List<Route> Route.findAllRoutes() {
        return entityManager().createQuery("SELECT o FROM Route o", Route.class).getResultList();
    }
    
    public static Route Route.findRoute(Long id) {
        if (id == null) return null;
        return entityManager().find(Route.class, id);
    }
    
    public static List<Route> Route.findRouteEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Route o", Route.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Route.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Route.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Route attached = Route.findRoute(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Route.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Route.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Route Route.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Route merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
