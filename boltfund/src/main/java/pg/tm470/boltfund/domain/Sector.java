package pg.tm470.boltfund.domain;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Sector {

    @Size(max = 20)
    private String name;

    @Size(max = 5000)
    private String description;

    @Size(max = 2000)
    private String notes;

    @Size(max = 5000)
    private String access;

    @ManyToOne
    private Crag crag;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sector")
    private Set<Route> routes = new HashSet<Route>();
    
    public static List<pg.tm470.boltfund.domain.Sector> findByExampleLike(pg.tm470.boltfund.domain.Sector c, int firstResult, int maxResults, String sortColumn, String sortDir) {
        EntityManager em = Sector.entityManager();
        Session session = (Session) em.getDelegate();
        Example example = Example.create(c).ignoreCase().enableLike(MatchMode.ANYWHERE);
        Criteria criteria = session.createCriteria(Sector.class).add(example).setFirstResult(firstResult).setMaxResults(maxResults).addOrder("desc".equals(sortDir) ? Order.desc(sortColumn) : Order.asc(sortColumn));
        return criteria.list();
    }

    public static long countByExampleLike(pg.tm470.boltfund.domain.Sector c) {
        EntityManager em = Sector.entityManager();
        Session session = (Session) em.getDelegate();
        Example example = Example.create(c).ignoreCase().enableLike(MatchMode.ANYWHERE);
        Criteria criteria = session.createCriteria(Sector.class).add(example).setProjection(Projections.rowCount());
        return (Long) criteria.uniqueResult();
    }
}
